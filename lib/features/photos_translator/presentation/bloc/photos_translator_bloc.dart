import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/create_folder.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/create_translations_file.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/end_photos_translations_file.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/translate_photo.dart';
part 'photos_translator_event.dart';
part 'photos_translator_state.dart';

class PhotosTranslatorBloc extends Bloc<PhotosTranslatorEvent, PhotosTranslatorState> {
  final CreateTranslationsFile createTranslationsFile;
  final TranslatePhoto translatePhoto;
  final EndPhotosTranslationsFile endPhotosTranslation;
  final CreateFolder createFolder;
  final List<CameraDescription> cameras;
  final CameraController Function(CameraDescription) getNewCameraController;
  late CameraController? cameraController;

  PhotosTranslatorBloc({
    required this.createTranslationsFile,
    required this.translatePhoto,
    required this.endPhotosTranslation,
    required this.createFolder,
    required this.cameras,
    required this.getNewCameraController
  }): super(OnPhotosTranslatorInitial()) {
    cameraController = null;
    on<PhotosTranslatorEvent>((event, emit) async {
      if(event is InitFileTypeSelectionEvent){
        _initFileTypeSelection(emit);
      }else if (event is InitTranslationsFileCreationEvent) {
        await _initTranslationsFile(emit);
      } else if (event is ChooseCameraEvent) {
        await _chooseCamera(emit, event);
      } else if (event is ChangeFileNameEvent) {
        _changeFileName(emit, event);
      }else if(event is SaveCurrentFileNameEvent){
        await _saveCurrentFileName(emit);
      }else if (event is AddPhotoTranslationEvent) {
        await _addPhotoTranslation(emit);
      }else if (event is EndTranslationsFileEvent) {
        await _endTranslationsFile(emit);
      }else if(event is InitFolderCreationEvent){
        _initFolderCreation(emit);
      }
    });
  }

  void _initFileTypeSelection(Emitter<PhotosTranslatorState> emit){
    emit(OnSelectingFileType());
  }

  Future<void> _initTranslationsFile(Emitter<PhotosTranslatorState> emit) async {
    emit(OnLoadingTranslations());
    if(cameraController == null){
      emit(OnSelectingCamera());
    }else{
      emit(const OnNamingTranslationsFile(name: '', canEnd: false));
    }
  }

  Future<void> _chooseCamera(Emitter<PhotosTranslatorState> emit, ChooseCameraEvent event) async {
    await cameraController?.dispose();
    cameraController = getNewCameraController(event.camera);
    await cameraController!.initialize();
    emit(const OnNamingTranslationsFile(name: '', canEnd: false));
  }

  void _changeFileName(Emitter<PhotosTranslatorState> emit, ChangeFileNameEvent event) {
    final newName = event.name;
    final canEnd = newName.isNotEmpty;
    if(state is OnNamingTranslationsFile){
      emit( OnNamingTranslationsFile(name: newName, canEnd: canEnd) );
    }else{
      emit( OnCreatingFolder(name: newName, canEnd: canEnd) );
    }
    
  }
  
  Future<void> _saveCurrentFileName(Emitter<PhotosTranslatorState> emit)async{
    final name = (state as OnCreatingAppFile).name;
    final stateIsTranslationsFiles = state is OnCreatingTranslationsFile;
    emit(OnLoadingTranslations());
    if(stateIsTranslationsFiles){
      final eitherId = await createTranslationsFile(name);
      eitherId.fold((_){

      }, (id){
        emit(OnInitializingTranslations(
          id: id, 
          name: name,
          canTranslate: true,
          canEnd: false, 
          cameraController: cameraController
        ));
      });
    }else{
      await createFolder(name);
      emit(OnAppFileCreationEnded());
    }
  }

  Future<void> _addPhotoTranslation(Emitter<PhotosTranslatorState> emit) async {
    final onCreatingState = (state as OnInitializingTranslations);
    emit(OnInitializingTranslations(
        id: onCreatingState.id,
        name: onCreatingState.name,
        canTranslate: false,
        canEnd: false,
        cameraController: onCreatingState.cameraController
      )
    );
    final picture = await onCreatingState.cameraController!.takePicture();
    emit(OnInitializingTranslations(
        id: onCreatingState.id,
        name: onCreatingState.name,
        canTranslate: true,
        canEnd: true,
        cameraController: onCreatingState.cameraController
      )
    );
    await translatePhoto(picture.path);
  }

  Future<void> _endTranslationsFile(Emitter<PhotosTranslatorState> emit) async {
    emit(OnLoadingTranslations());
    await endPhotosTranslation();
    emit( OnAppFileCreationEnded() );
  }

  void _initFolderCreation(Emitter<PhotosTranslatorState> emit){
    emit(const OnCreatingFolder(name: '', canEnd: false));
  }
}