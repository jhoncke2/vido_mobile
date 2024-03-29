import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vido/features/photos_translator/domain/entities/translation.dart';
import 'package:vido/features/photos_translator/domain/entities/translations_file.dart';
import 'package:vido/features/photos_translator/presentation/bloc/photos_translator_bloc.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/create_folder.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/create_translations_file.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/end_photos_translations_file.dart';
import 'package:vido/features/photos_translator/presentation/use_cases/translate_photo.dart';
import 'photos_translator_bloc_test.mocks.dart';

late PhotosTranslatorBloc photosTranslatorBloc;
late MockCreateTranslationsFile createTranslationsFile;
late MockTranslatePhoto translatePhoto;
late MockEndPhotosTranslationsFile endPhotosTranslation;
late MockCreateFolder createFolder;

late List<CameraDescription> tCameras;
late MockCameraController tCameraController;

@GenerateMocks([
  CreateTranslationsFile,
  TranslatePhoto,
  EndPhotosTranslationsFile,
  CreateFolder,
  CameraController,
  File
])
void main() {
  setUp(() {
    tCameraController = MockCameraController();
    tCameras = const [
      CameraDescription(
          name: 'c_1',
          lensDirection: CameraLensDirection.external,
          sensorOrientation: 0),
      CameraDescription(
          name: 'c_2',
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 1)
    ];
    createFolder = MockCreateFolder();
    endPhotosTranslation = MockEndPhotosTranslationsFile();
    translatePhoto = MockTranslatePhoto();
    createTranslationsFile = MockCreateTranslationsFile();
    photosTranslatorBloc = PhotosTranslatorBloc(
        createTranslationsFile: createTranslationsFile,
        translatePhoto: translatePhoto,
        endPhotosTranslation: endPhotosTranslation,
        createFolder: createFolder,
        cameras: tCameras,
        getNewCameraController: (CameraDescription camera) =>
            tCameraController);
  });

  test('should have the expected initialized elements', ()async{
    expect(photosTranslatorBloc.cameraController, null);
  });
  group('init file type selection', _testInitFileTypeSelectionGroup);
  group('init translations file creation', _testInitTranslationsFileCreationGroup);
  group('init folder creation', _testInitFolderCreationGroup);
  group('choose camera', _testChooseCameraGroup);
  group('change file name', _testChangeFileNameGroup);
  group('save file name', _testSaveFileNameGroup);
  group('add photo translation', _testAddPhotoTranslationGroup);
  group('end translations file creation', _testEndTranslationsFileCreationGroup);
}

void _testInitFileTypeSelectionGroup(){
  test('should emit the expected ordered states', ( )async{
    final expectedOrderedStates = [
      OnSelectingFileType()
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(InitFileTypeSelectionEvent());
  });
}

void _testInitTranslationsFileCreationGroup() {
  setUp(() {
    photosTranslatorBloc.emit(OnPhotosTranslatorInitial());
  });

  test('should emit the specified methods when camera controller is null', () async {
    photosTranslatorBloc.cameraController = null;
    final expectedOrderedStates = [
      OnLoadingTranslations(),
      OnSelectingCamera(),
    ];
    expectLater(
        photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(InitTranslationsFileCreationEvent());
  });
  
  test('shold emit the specified methods qwhen camedra controller already exists', ()async{
    photosTranslatorBloc.cameraController = tCameraController;
    final expectedOrderedStates = [
      OnLoadingTranslations(),
      const OnNamingTranslationsFile(name: '', canEnd: false),
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(InitTranslationsFileCreationEvent());
  });
}

void _testInitFolderCreationGroup(){
  test('should emit the expected ordered states', ()async{
    final expectedOrdedStates = [
      const OnCreatingFolder(name: '', canEnd: false)
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrdedStates));
    photosTranslatorBloc.add(InitFolderCreationEvent());
  });
}

void _testChooseCameraGroup() {
  late int tFileId;
  setUp(() {
    tFileId = 1001;
    when(tCameraController.cameraId).thenReturn(0);
    when(tCameraController.enableAudio).thenReturn(false);
    when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
    when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.high);
  });

  test('should emit the expected ordered states when the selected camera is the first', () async {
    when(tCameraController.description).thenReturn(tCameras.first);
    photosTranslatorBloc.emit(OnSelectingCamera());
    final expectedOrderedStates = [
      const OnNamingTranslationsFile(name: '', canEnd: false)
    ];
    when(tCameraController.description).thenReturn(tCameras.first);
    expectLater(
        photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(ChooseCameraEvent(camera: tCameras.first));
  });

  test('should call the specified methods and initialize the specified variables when the selected camera is the first', ()async{
    when(tCameraController.description).thenReturn(tCameras.first);
    photosTranslatorBloc.emit(OnSelectingCamera());
    photosTranslatorBloc.add(ChooseCameraEvent(camera: tCameras.last));
    await untilCalled(tCameraController.initialize());
    verify(tCameraController.initialize());
    expect(photosTranslatorBloc.cameraController!.description.name, tCameraController.description.name);
    expect(photosTranslatorBloc.cameraController!.enableAudio, tCameraController.enableAudio);
    expect(photosTranslatorBloc.cameraController!.imageFormatGroup, tCameraController.imageFormatGroup);
    expect(photosTranslatorBloc.cameraController!.resolutionPreset.name, tCameraController.resolutionPreset.name);
  });

  test('should emit the expected ordered states when the selected camera is the last', () async {
    when(tCameraController.description).thenReturn(tCameras.last);
    photosTranslatorBloc.emit(OnSelectingCamera());
    final expectedOrderedStates = [
      const OnNamingTranslationsFile(name: '', canEnd: false)
    ];
    when(tCameraController.description).thenReturn(tCameras.last);
    expectLater(
        photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(ChooseCameraEvent(camera: tCameras.last));
  });

  test('should call the specified methods and initialize the specified variables when the selected camera is the last', ()async{
    when(tCameraController.description).thenReturn(tCameras.last);
    photosTranslatorBloc.emit(OnSelectingCamera());
    photosTranslatorBloc.add(ChooseCameraEvent(camera: tCameras.last));
    await untilCalled(tCameraController.initialize());
    verify(tCameraController.initialize());
    expect(photosTranslatorBloc.cameraController!.description.name, tCameraController.description.name);
    expect(photosTranslatorBloc.cameraController!.enableAudio, tCameraController.enableAudio);
    expect(photosTranslatorBloc.cameraController!.imageFormatGroup, tCameraController.imageFormatGroup);
    expect(photosTranslatorBloc.cameraController!.resolutionPreset.name, tCameraController.resolutionPreset.name);
  });
}

void _testAddPhotoTranslationGroup() {
  late int tFileId;
  late MockCameraController tCameraController;
  late List<TranslationsFile> tUncompletedFiles;
  late XFile tPicture;
  setUp(() {
    tFileId = 1001;
    tCameraController = MockCameraController();
    when(tCameraController.cameraId).thenReturn(0);
    when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.max);
    when(tCameraController.enableAudio).thenReturn(false);
    when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
    tUncompletedFiles = const [
      TranslationsFile(id: 0, name: 'file_1', completed: false, translations: [
        Translation(id: 100, imgUrl: 'url_1', text: null),
        Translation(id: 101, imgUrl: 'url_2', text: 'texto_2'),
      ]),
      TranslationsFile(id: 1, name: 'file_2', completed: false, translations: [
        Translation(id: 100, imgUrl: 'url_1', text: null),
        Translation(id: 101, imgUrl: 'url_2', text: 'texto_2'),
      ]),
    ];
    tPicture = XFile('any_path');
    when(translatePhoto(any)).thenAnswer((_) async => const Right(null));
    when(tCameraController.takePicture()).thenAnswer((_) async => tPicture);
  });

  test('should call the specified methods when current state is OnCreating', () async {
    photosTranslatorBloc.emit(OnInitializingTranslations(
        id: tFileId,
        name: '',
        canTranslate: true,
        canEnd: false,
        cameraController: tCameraController
      )
    );
    photosTranslatorBloc.add(AddPhotoTranslationEvent());
    await untilCalled(translatePhoto(any));
    verify(translatePhoto(tPicture.path));
  });

  test(
      'should yield the expected ordered states when current state is OnCreating and it cant end',
      () async {
    photosTranslatorBloc.emit(OnInitializingTranslations(
        id: tFileId,
        name: '',
        canTranslate: true,
        canEnd: false,
        cameraController: tCameraController));
    final expectedOrderedStates = [
      OnInitializingTranslations(
        id: tFileId,
        name: '',
        canTranslate: false,
        canEnd: false,
        cameraController: tCameraController
      ),
      OnInitializingTranslations(
          id: tFileId,
          name: '',
          canTranslate: true,
          canEnd: true,
          cameraController: tCameraController)
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(AddPhotoTranslationEvent());
  });
  
  test(
      'should yield the expected ordered states when current state is OnCreating and it already can end',
      () async {
    photosTranslatorBloc.emit(OnInitializingTranslations(
        id: tFileId,
        name: '',
        canTranslate: true,
        canEnd: false,
        cameraController: tCameraController));
    final expectedOrderedStates = [
      OnInitializingTranslations(
        id: tFileId,
        name: '',
        canTranslate: false,
        canEnd: false,
        cameraController: tCameraController
      ),
      OnInitializingTranslations(
          id: tFileId,
          name: '',
          canTranslate: true,
          canEnd: true,
          cameraController: tCameraController)
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(AddPhotoTranslationEvent());
  });
}

void _testChangeFileNameGroup() {
  late String tNewName;

  group('when the state is OnCreatingTranslationsFile', (){
    late MockCameraController tCameraController;
    setUp(() {
      tCameraController = MockCameraController();
      when(tCameraController.cameraId).thenReturn(0);
      when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.max);
      when(tCameraController.enableAudio).thenReturn(false);
      when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
    });

    test('should yield the expected ordered states when file could end and now it cant', () {
      photosTranslatorBloc.emit(const OnNamingTranslationsFile(name: 'n', canEnd: true));
      tNewName = '';
      final expectedOrderedStates = [
        OnNamingTranslationsFile(name: tNewName, canEnd: false)
      ];
      expectLater(
          photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(ChangeFileNameEvent(tNewName));
    });

    test('should yield the expected ordered states when file could Not end and now it can', () {
      photosTranslatorBloc.emit(const OnNamingTranslationsFile(name: '', canEnd: false));
      tNewName = 'new_name_x';
      final expectedOrderedStates = [
        OnNamingTranslationsFile(name: tNewName, canEnd: true)
      ];
      expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(ChangeFileNameEvent(tNewName));
    });
  });

  group('when the state is OnCreatingTranslationsFile', (){
    setUp(() {
      when(tCameraController.cameraId).thenReturn(0);
      when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.max);
      when(tCameraController.enableAudio).thenReturn(false);
      when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
    });

    test('should yield the expected ordered states when file could end and now it cant', () {
      photosTranslatorBloc.emit(const OnCreatingFolder(name: 'n', canEnd: true));
      tNewName = '';
      final expectedOrderedStates = [
        OnCreatingFolder(name: tNewName, canEnd: false)
      ];
      expectLater(
          photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(ChangeFileNameEvent(tNewName));
    });

    test('should yield the expected ordered states when file could Not end and now it can', () {
      photosTranslatorBloc.emit(const OnCreatingFolder(name: '', canEnd: false));
      tNewName = 'new_name_x';
      final expectedOrderedStates = [
        OnCreatingFolder(name: tNewName, canEnd: true)
      ];
      expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(ChangeFileNameEvent(tNewName));
    });
  });
}

void _testSaveFileNameGroup(){
  late String tName;
  setUp((){
    tName = 't_name';
  });
  group('when state is OnCreatingTranslationsFile', (){
    late int tId;
    setUp((){
      tId = 1001;
      photosTranslatorBloc.cameraController = tCameraController;
      when(tCameraController.cameraId).thenReturn(0);
      when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.max);
      when(tCameraController.enableAudio).thenReturn(false);
      when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
      when(tCameraController.description).thenReturn(tCameras.first);
      photosTranslatorBloc.emit(OnNamingTranslationsFile(name: tName, canEnd: true));
      when(createTranslationsFile(any)).thenAnswer((_) async => Right(tId));
    });

    test('shold call the specified methods', ()async{
      photosTranslatorBloc.add(SaveCurrentFileNameEvent());
      await untilCalled(createTranslationsFile(any));
      verify(createTranslationsFile(tName));
      verifyNever(createFolder(any));
    });
    
    test('should yield the expected ordered states', ()async{
      final expectedOrderedStates = [
        OnLoadingTranslations(),
        OnInitializingTranslations(
          id: tId,
          name: tName,
          canTranslate: true,
          canEnd: false,
          cameraController: tCameraController
        )
      ];
      expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(SaveCurrentFileNameEvent());
    });
  });
  group('when state is OnCreatingFolder', (){
    setUp((){
      photosTranslatorBloc.emit(OnCreatingFolder(name: tName, canEnd: true));
      when(createFolder(any))
          .thenAnswer((_) async => const Right(null));
    });

    test('shold call the specified methods', ()async{
      photosTranslatorBloc.add(SaveCurrentFileNameEvent());
      await untilCalled(createFolder(any));
      verify(createFolder(tName));
      verifyNever(createTranslationsFile(any));
    });

    test('should yield the expected ordered states', ()async{
      final expectedOrderedStates = [
        OnLoadingTranslations(),
        OnAppFileCreationEnded()
      ];
      expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
      photosTranslatorBloc.add(SaveCurrentFileNameEvent());
    });
  });
}

void _testEndTranslationsFileCreationGroup() {
  late List<TranslationsFile> tUncompletedFiles;
  late MockCameraController tCameraController;
  late int tFileId;
  late String tFileName;
  setUp(() {
    tUncompletedFiles = const [
      TranslationsFile(id: 0, name: 'file_1', completed: false, translations: [
        Translation(id: 100, imgUrl: 'url_1', text: null),
        Translation(id: 101, imgUrl: 'url_2', text: 'texto_2'),
      ]),
      TranslationsFile(id: 1, name: 'file_2', completed: false, translations: [
        Translation(id: 102, imgUrl: 'url_1', text: null),
        Translation(id: 103, imgUrl: 'url_2', text: 'texto_2'),
      ]),
    ];
    tCameraController = MockCameraController();
    when(tCameraController.cameraId).thenReturn(0);
    when(tCameraController.resolutionPreset).thenReturn(ResolutionPreset.max);
    when(tCameraController.enableAudio).thenReturn(false);
    when(tCameraController.imageFormatGroup).thenReturn(ImageFormatGroup.jpeg);
    tFileId = 1000;
    tFileName = 'name_x';
    photosTranslatorBloc.emit(OnInitializingTranslations(
        id: tFileId,
        name: tFileName,
        canTranslate: true,
        canEnd: true,
        cameraController: tCameraController));
    when(endPhotosTranslation())
        .thenAnswer((_) async => const Right(null));
  });

  test('should call the specified methods', () async {
    photosTranslatorBloc.add(EndTranslationsFileEvent());
    await untilCalled(endPhotosTranslation());
    verify(endPhotosTranslation());
  });
  
  test('should yield the expected ordered states', () async {
    final expectedOrderedStates = [
      OnLoadingTranslations(),
      OnAppFileCreationEnded()
    ];
    expectLater(photosTranslatorBloc.stream, emitsInOrder(expectedOrderedStates));
    photosTranslatorBloc.add(EndTranslationsFileEvent());
  });
}