// Mocks generated by Mockito 5.3.0 from annotations
// in vido/test/features/photos_translator/presentation/bloc/photos_translator_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i17;
import 'dart:io' as _i6;
import 'dart:typed_data' as _i18;
import 'dart:ui' as _i15;

import 'package:camera/camera.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/services.dart' as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vido/features/photos_translator/domain/failures/photos_translator_failure.dart'
    as _i9;
import 'package:vido/features/photos_translator/presentation/use_cases/create_folder.dart'
    as _i12;
import 'package:vido/features/photos_translator/presentation/use_cases/create_pdf_file.dart'
    as _i14;
import 'package:vido/features/photos_translator/presentation/use_cases/create_translations_file.dart'
    as _i7;
import 'package:vido/features/photos_translator/presentation/use_cases/end_photos_translations_file.dart'
    as _i11;
import 'package:vido/features/photos_translator/presentation/use_cases/pick_pdf.dart'
    as _i13;
import 'package:vido/features/photos_translator/presentation/use_cases/translate_photo.dart'
    as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeCameraDescription_1 extends _i1.SmartFake
    implements _i3.CameraDescription {
  _FakeCameraDescription_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeCameraValue_2 extends _i1.SmartFake implements _i3.CameraValue {
  _FakeCameraValue_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeXFile_3 extends _i1.SmartFake implements _i3.XFile {
  _FakeXFile_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeWidget_4 extends _i1.SmartFake implements _i4.Widget {
  _FakeWidget_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeFile_5 extends _i1.SmartFake implements _i6.File {
  _FakeFile_5(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUri_6 extends _i1.SmartFake implements Uri {
  _FakeUri_6(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeDirectory_7 extends _i1.SmartFake implements _i6.Directory {
  _FakeDirectory_7(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeDateTime_8 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_8(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeRandomAccessFile_9 extends _i1.SmartFake
    implements _i6.RandomAccessFile {
  _FakeRandomAccessFile_9(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeIOSink_10 extends _i1.SmartFake implements _i6.IOSink {
  _FakeIOSink_10(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeFileStat_11 extends _i1.SmartFake implements _i6.FileStat {
  _FakeFileStat_11(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeFileSystemEntity_12 extends _i1.SmartFake
    implements _i6.FileSystemEntity {
  _FakeFileSystemEntity_12(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [CreateTranslationsFile].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateTranslationsFile extends _i1.Mock
    implements _i7.CreateTranslationsFile {
  MockCreateTranslationsFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, int>> call(String? name) =>
      (super.noSuchMethod(Invocation.method(#call, [name]),
          returnValue:
              _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, int>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, int>(
                      this, Invocation.method(#call, [name])))) as _i8
          .Future<_i2.Either<_i9.PhotosTranslatorFailure, int>>);
}

/// A class which mocks [TranslatePhoto].
///
/// See the documentation for Mockito's code generation for more information.
class MockTranslatePhoto extends _i1.Mock implements _i10.TranslatePhoto {
  MockTranslatePhoto() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>> call(
          String? photoUrl) =>
      (super.noSuchMethod(Invocation.method(#call, [photoUrl]),
          returnValue:
              _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, void>(
                      this, Invocation.method(#call, [photoUrl])))) as _i8
          .Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>);
}

/// A class which mocks [EndPhotosTranslationsFile].
///
/// See the documentation for Mockito's code generation for more information.
class MockEndPhotosTranslationsFile extends _i1.Mock
    implements _i11.EndPhotosTranslationsFile {
  MockEndPhotosTranslationsFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
          returnValue:
              _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, void>(
                      this, Invocation.method(#call, [])))) as _i8
          .Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>);
}

/// A class which mocks [CreateFolder].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateFolder extends _i1.Mock implements _i12.CreateFolder {
  MockCreateFolder() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>> call(
          String? name) =>
      (super.noSuchMethod(Invocation.method(#call, [name]),
          returnValue:
              _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, void>(
                      this, Invocation.method(#call, [name])))) as _i8
          .Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>);
}

/// A class which mocks [PickPdf].
///
/// See the documentation for Mockito's code generation for more information.
class MockPickPdf extends _i1.Mock implements _i13.PickPdf {
  MockPickPdf() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, _i6.File>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue: _i8.Future<
                      _i2.Either<_i9.PhotosTranslatorFailure, _i6.File>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, _i6.File>(
                      this, Invocation.method(#call, []))))
          as _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, _i6.File>>);
}

/// A class which mocks [CreatePdfFile].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreatePdfFile extends _i1.Mock implements _i14.CreatePdfFile {
  MockCreatePdfFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>> call(
          String? name, _i6.File? pdf) =>
      (super.noSuchMethod(Invocation.method(#call, [name, pdf]),
          returnValue:
              _i8.Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>.value(
                  _FakeEither_0<_i9.PhotosTranslatorFailure, void>(
                      this, Invocation.method(#call, [name, pdf])))) as _i8
          .Future<_i2.Either<_i9.PhotosTranslatorFailure, void>>);
}

/// A class which mocks [CameraController].
///
/// See the documentation for Mockito's code generation for more information.
class MockCameraController extends _i1.Mock implements _i3.CameraController {
  MockCameraController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CameraDescription get description => (super.noSuchMethod(
          Invocation.getter(#description),
          returnValue:
              _FakeCameraDescription_1(this, Invocation.getter(#description)))
      as _i3.CameraDescription);
  @override
  _i3.ResolutionPreset get resolutionPreset =>
      (super.noSuchMethod(Invocation.getter(#resolutionPreset),
          returnValue: _i3.ResolutionPreset.low) as _i3.ResolutionPreset);
  @override
  bool get enableAudio =>
      (super.noSuchMethod(Invocation.getter(#enableAudio), returnValue: false)
          as bool);
  @override
  int get cameraId =>
      (super.noSuchMethod(Invocation.getter(#cameraId), returnValue: 0) as int);
  @override
  _i3.CameraValue get value => (super.noSuchMethod(Invocation.getter(#value),
          returnValue: _FakeCameraValue_2(this, Invocation.getter(#value)))
      as _i3.CameraValue);
  @override
  set value(_i3.CameraValue? newValue) =>
      super.noSuchMethod(Invocation.setter(#value, newValue),
          returnValueForMissingStub: null);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void debugCheckIsDisposed() =>
      super.noSuchMethod(Invocation.method(#debugCheckIsDisposed, []),
          returnValueForMissingStub: null);
  @override
  _i8.Future<void> initialize() => (super.noSuchMethod(
      Invocation.method(#initialize, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> prepareForVideoRecording() => (super.noSuchMethod(
      Invocation.method(#prepareForVideoRecording, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> pausePreview() => (super.noSuchMethod(
      Invocation.method(#pausePreview, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> resumePreview() => (super.noSuchMethod(
      Invocation.method(#resumePreview, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i3.XFile> takePicture() =>
      (super.noSuchMethod(Invocation.method(#takePicture, []),
              returnValue: _i8.Future<_i3.XFile>.value(
                  _FakeXFile_3(this, Invocation.method(#takePicture, []))))
          as _i8.Future<_i3.XFile>);
  @override
  _i8.Future<void> startImageStream(_i3.onLatestImageAvailable? onAvailable) =>
      (super.noSuchMethod(Invocation.method(#startImageStream, [onAvailable]),
              returnValue: _i8.Future<void>.value(),
              returnValueForMissingStub: _i8.Future<void>.value())
          as _i8.Future<void>);
  @override
  _i8.Future<void> stopImageStream() => (super.noSuchMethod(
      Invocation.method(#stopImageStream, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> startVideoRecording() => (super.noSuchMethod(
      Invocation.method(#startVideoRecording, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i3.XFile> stopVideoRecording() => (super.noSuchMethod(
          Invocation.method(#stopVideoRecording, []),
          returnValue: _i8.Future<_i3.XFile>.value(
              _FakeXFile_3(this, Invocation.method(#stopVideoRecording, []))))
      as _i8.Future<_i3.XFile>);
  @override
  _i8.Future<void> pauseVideoRecording() => (super.noSuchMethod(
      Invocation.method(#pauseVideoRecording, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> resumeVideoRecording() => (super.noSuchMethod(
      Invocation.method(#resumeVideoRecording, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i4.Widget buildPreview() =>
      (super.noSuchMethod(Invocation.method(#buildPreview, []),
              returnValue:
                  _FakeWidget_4(this, Invocation.method(#buildPreview, [])))
          as _i4.Widget);
  @override
  _i8.Future<double> getMaxZoomLevel() =>
      (super.noSuchMethod(Invocation.method(#getMaxZoomLevel, []),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<double> getMinZoomLevel() =>
      (super.noSuchMethod(Invocation.method(#getMinZoomLevel, []),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<void> setZoomLevel(double? zoom) => (super.noSuchMethod(
      Invocation.method(#setZoomLevel, [zoom]),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setFlashMode(_i3.FlashMode? mode) => (super.noSuchMethod(
      Invocation.method(#setFlashMode, [mode]),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setExposureMode(_i3.ExposureMode? mode) =>
      (super.noSuchMethod(Invocation.method(#setExposureMode, [mode]),
              returnValue: _i8.Future<void>.value(),
              returnValueForMissingStub: _i8.Future<void>.value())
          as _i8.Future<void>);
  @override
  _i8.Future<void> setExposurePoint(_i15.Offset? point) => (super.noSuchMethod(
      Invocation.method(#setExposurePoint, [point]),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<double> getMinExposureOffset() =>
      (super.noSuchMethod(Invocation.method(#getMinExposureOffset, []),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<double> getMaxExposureOffset() =>
      (super.noSuchMethod(Invocation.method(#getMaxExposureOffset, []),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<double> getExposureOffsetStepSize() =>
      (super.noSuchMethod(Invocation.method(#getExposureOffsetStepSize, []),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<double> setExposureOffset(double? offset) =>
      (super.noSuchMethod(Invocation.method(#setExposureOffset, [offset]),
          returnValue: _i8.Future<double>.value(0.0)) as _i8.Future<double>);
  @override
  _i8.Future<void> lockCaptureOrientation(
          [_i16.DeviceOrientation? orientation]) =>
      (super.noSuchMethod(
              Invocation.method(#lockCaptureOrientation, [orientation]),
              returnValue: _i8.Future<void>.value(),
              returnValueForMissingStub: _i8.Future<void>.value())
          as _i8.Future<void>);
  @override
  _i8.Future<void> setFocusMode(_i3.FocusMode? mode) => (super.noSuchMethod(
      Invocation.method(#setFocusMode, [mode]),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> unlockCaptureOrientation() => (super.noSuchMethod(
      Invocation.method(#unlockCaptureOrientation, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setFocusPoint(_i15.Offset? point) => (super.noSuchMethod(
      Invocation.method(#setFocusPoint, [point]),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> dispose() => (super.noSuchMethod(
      Invocation.method(#dispose, []),
      returnValue: _i8.Future<void>.value(),
      returnValueForMissingStub: _i8.Future<void>.value()) as _i8.Future<void>);
  @override
  void removeListener(_i15.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void addListener(_i15.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [File].
///
/// See the documentation for Mockito's code generation for more information.
class MockFile extends _i1.Mock implements _i6.File {
  MockFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.File get absolute => (super.noSuchMethod(Invocation.getter(#absolute),
          returnValue: _FakeFile_5(this, Invocation.getter(#absolute)))
      as _i6.File);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  Uri get uri => (super.noSuchMethod(Invocation.getter(#uri),
      returnValue: _FakeUri_6(this, Invocation.getter(#uri))) as Uri);
  @override
  bool get isAbsolute =>
      (super.noSuchMethod(Invocation.getter(#isAbsolute), returnValue: false)
          as bool);
  @override
  _i6.Directory get parent => (super.noSuchMethod(Invocation.getter(#parent),
          returnValue: _FakeDirectory_7(this, Invocation.getter(#parent)))
      as _i6.Directory);
  @override
  _i8.Future<_i6.File> create({bool? recursive = false}) => (super.noSuchMethod(
          Invocation.method(#create, [], {#recursive: recursive}),
          returnValue: _i8.Future<_i6.File>.value(_FakeFile_5(
              this, Invocation.method(#create, [], {#recursive: recursive}))))
      as _i8.Future<_i6.File>);
  @override
  void createSync({bool? recursive = false}) => super.noSuchMethod(
      Invocation.method(#createSync, [], {#recursive: recursive}),
      returnValueForMissingStub: null);
  @override
  _i8.Future<_i6.File> rename(String? newPath) =>
      (super.noSuchMethod(Invocation.method(#rename, [newPath]),
              returnValue: _i8.Future<_i6.File>.value(
                  _FakeFile_5(this, Invocation.method(#rename, [newPath]))))
          as _i8.Future<_i6.File>);
  @override
  _i6.File renameSync(String? newPath) =>
      (super.noSuchMethod(Invocation.method(#renameSync, [newPath]),
              returnValue:
                  _FakeFile_5(this, Invocation.method(#renameSync, [newPath])))
          as _i6.File);
  @override
  _i8.Future<_i6.File> copy(String? newPath) =>
      (super.noSuchMethod(Invocation.method(#copy, [newPath]),
              returnValue: _i8.Future<_i6.File>.value(
                  _FakeFile_5(this, Invocation.method(#copy, [newPath]))))
          as _i8.Future<_i6.File>);
  @override
  _i6.File copySync(String? newPath) =>
      (super.noSuchMethod(Invocation.method(#copySync, [newPath]),
              returnValue:
                  _FakeFile_5(this, Invocation.method(#copySync, [newPath])))
          as _i6.File);
  @override
  _i8.Future<int> length() =>
      (super.noSuchMethod(Invocation.method(#length, []),
          returnValue: _i8.Future<int>.value(0)) as _i8.Future<int>);
  @override
  int lengthSync() =>
      (super.noSuchMethod(Invocation.method(#lengthSync, []), returnValue: 0)
          as int);
  @override
  _i8.Future<DateTime> lastAccessed() =>
      (super.noSuchMethod(Invocation.method(#lastAccessed, []),
              returnValue: _i8.Future<DateTime>.value(
                  _FakeDateTime_8(this, Invocation.method(#lastAccessed, []))))
          as _i8.Future<DateTime>);
  @override
  DateTime lastAccessedSync() => (super.noSuchMethod(
          Invocation.method(#lastAccessedSync, []),
          returnValue:
              _FakeDateTime_8(this, Invocation.method(#lastAccessedSync, [])))
      as DateTime);
  @override
  _i8.Future<dynamic> setLastAccessed(DateTime? time) =>
      (super.noSuchMethod(Invocation.method(#setLastAccessed, [time]),
          returnValue: _i8.Future<dynamic>.value()) as _i8.Future<dynamic>);
  @override
  void setLastAccessedSync(DateTime? time) =>
      super.noSuchMethod(Invocation.method(#setLastAccessedSync, [time]),
          returnValueForMissingStub: null);
  @override
  _i8.Future<DateTime> lastModified() =>
      (super.noSuchMethod(Invocation.method(#lastModified, []),
              returnValue: _i8.Future<DateTime>.value(
                  _FakeDateTime_8(this, Invocation.method(#lastModified, []))))
          as _i8.Future<DateTime>);
  @override
  DateTime lastModifiedSync() => (super.noSuchMethod(
          Invocation.method(#lastModifiedSync, []),
          returnValue:
              _FakeDateTime_8(this, Invocation.method(#lastModifiedSync, [])))
      as DateTime);
  @override
  _i8.Future<dynamic> setLastModified(DateTime? time) =>
      (super.noSuchMethod(Invocation.method(#setLastModified, [time]),
          returnValue: _i8.Future<dynamic>.value()) as _i8.Future<dynamic>);
  @override
  void setLastModifiedSync(DateTime? time) =>
      super.noSuchMethod(Invocation.method(#setLastModifiedSync, [time]),
          returnValueForMissingStub: null);
  @override
  _i8.Future<_i6.RandomAccessFile> open(
          {_i6.FileMode? mode = _i6.FileMode.read}) =>
      (super.noSuchMethod(Invocation.method(#open, [], {#mode: mode}),
              returnValue: _i8.Future<_i6.RandomAccessFile>.value(
                  _FakeRandomAccessFile_9(
                      this, Invocation.method(#open, [], {#mode: mode}))))
          as _i8.Future<_i6.RandomAccessFile>);
  @override
  _i6.RandomAccessFile openSync({_i6.FileMode? mode = _i6.FileMode.read}) =>
      (super.noSuchMethod(Invocation.method(#openSync, [], {#mode: mode}),
              returnValue: _FakeRandomAccessFile_9(
                  this, Invocation.method(#openSync, [], {#mode: mode})))
          as _i6.RandomAccessFile);
  @override
  _i8.Stream<List<int>> openRead([int? start, int? end]) =>
      (super.noSuchMethod(Invocation.method(#openRead, [start, end]),
          returnValue: _i8.Stream<List<int>>.empty()) as _i8.Stream<List<int>>);
  @override
  _i6.IOSink openWrite(
          {_i6.FileMode? mode = _i6.FileMode.write,
          _i17.Encoding? encoding = const _i17.Utf8Codec()}) =>
      (super.noSuchMethod(
          Invocation.method(#openWrite, [], {#mode: mode, #encoding: encoding}),
          returnValue: _FakeIOSink_10(
              this,
              Invocation.method(
                  #openWrite, [], {#mode: mode, #encoding: encoding}))) as _i6
          .IOSink);
  @override
  _i8.Future<_i18.Uint8List> readAsBytes() =>
      (super.noSuchMethod(Invocation.method(#readAsBytes, []),
              returnValue: _i8.Future<_i18.Uint8List>.value(_i18.Uint8List(0)))
          as _i8.Future<_i18.Uint8List>);
  @override
  _i18.Uint8List readAsBytesSync() =>
      (super.noSuchMethod(Invocation.method(#readAsBytesSync, []),
          returnValue: _i18.Uint8List(0)) as _i18.Uint8List);
  @override
  _i8.Future<String> readAsString(
          {_i17.Encoding? encoding = const _i17.Utf8Codec()}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsString, [], {#encoding: encoding}),
          returnValue: _i8.Future<String>.value('')) as _i8.Future<String>);
  @override
  String readAsStringSync({_i17.Encoding? encoding = const _i17.Utf8Codec()}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsStringSync, [], {#encoding: encoding}),
          returnValue: '') as String);
  @override
  _i8.Future<List<String>> readAsLines(
          {_i17.Encoding? encoding = const _i17.Utf8Codec()}) =>
      (super.noSuchMethod(
              Invocation.method(#readAsLines, [], {#encoding: encoding}),
              returnValue: _i8.Future<List<String>>.value(<String>[]))
          as _i8.Future<List<String>>);
  @override
  List<String> readAsLinesSync(
          {_i17.Encoding? encoding = const _i17.Utf8Codec()}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsLinesSync, [], {#encoding: encoding}),
          returnValue: <String>[]) as List<String>);
  @override
  _i8.Future<_i6.File> writeAsBytes(List<int>? bytes,
          {_i6.FileMode? mode = _i6.FileMode.write, bool? flush = false}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #writeAsBytes, [bytes], {#mode: mode, #flush: flush}),
              returnValue: _i8.Future<_i6.File>.value(_FakeFile_5(this,
                  Invocation.method(#writeAsBytes, [bytes], {#mode: mode, #flush: flush}))))
          as _i8.Future<_i6.File>);
  @override
  void writeAsBytesSync(List<int>? bytes,
          {_i6.FileMode? mode = _i6.FileMode.write, bool? flush = false}) =>
      super.noSuchMethod(
          Invocation.method(
              #writeAsBytesSync, [bytes], {#mode: mode, #flush: flush}),
          returnValueForMissingStub: null);
  @override
  _i8.Future<_i6.File> writeAsString(String? contents,
          {_i6.FileMode? mode = _i6.FileMode.write,
          _i17.Encoding? encoding = const _i17.Utf8Codec(),
          bool? flush = false}) =>
      (super
          .noSuchMethod(Invocation.method(#writeAsString, [contents], {#mode: mode, #encoding: encoding, #flush: flush}),
              returnValue: _i8.Future<_i6.File>.value(_FakeFile_5(
                  this,
                  Invocation.method(#writeAsString, [
                    contents
                  ], {
                    #mode: mode,
                    #encoding: encoding,
                    #flush: flush
                  })))) as _i8.Future<_i6.File>);
  @override
  void writeAsStringSync(String? contents,
          {_i6.FileMode? mode = _i6.FileMode.write,
          _i17.Encoding? encoding = const _i17.Utf8Codec(),
          bool? flush = false}) =>
      super.noSuchMethod(
          Invocation.method(#writeAsStringSync, [contents],
              {#mode: mode, #encoding: encoding, #flush: flush}),
          returnValueForMissingStub: null);
  @override
  _i8.Future<bool> exists() =>
      (super.noSuchMethod(Invocation.method(#exists, []),
          returnValue: _i8.Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  bool existsSync() => (super.noSuchMethod(Invocation.method(#existsSync, []),
      returnValue: false) as bool);
  @override
  _i8.Future<String> resolveSymbolicLinks() =>
      (super.noSuchMethod(Invocation.method(#resolveSymbolicLinks, []),
          returnValue: _i8.Future<String>.value('')) as _i8.Future<String>);
  @override
  String resolveSymbolicLinksSync() =>
      (super.noSuchMethod(Invocation.method(#resolveSymbolicLinksSync, []),
          returnValue: '') as String);
  @override
  _i8.Future<_i6.FileStat> stat() =>
      (super.noSuchMethod(Invocation.method(#stat, []),
              returnValue: _i8.Future<_i6.FileStat>.value(
                  _FakeFileStat_11(this, Invocation.method(#stat, []))))
          as _i8.Future<_i6.FileStat>);
  @override
  _i6.FileStat statSync() => (super.noSuchMethod(
          Invocation.method(#statSync, []),
          returnValue: _FakeFileStat_11(this, Invocation.method(#statSync, [])))
      as _i6.FileStat);
  @override
  _i8.Future<_i6.FileSystemEntity> delete({bool? recursive = false}) => (super
          .noSuchMethod(Invocation.method(#delete, [], {#recursive: recursive}),
              returnValue: _i8.Future<_i6.FileSystemEntity>.value(
                  _FakeFileSystemEntity_12(this,
                      Invocation.method(#delete, [], {#recursive: recursive}))))
      as _i8.Future<_i6.FileSystemEntity>);
  @override
  void deleteSync({bool? recursive = false}) => super.noSuchMethod(
      Invocation.method(#deleteSync, [], {#recursive: recursive}),
      returnValueForMissingStub: null);
  @override
  _i8.Stream<_i6.FileSystemEvent> watch(
          {int? events = 15, bool? recursive = false}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #watch, [], {#events: events, #recursive: recursive}),
              returnValue: _i8.Stream<_i6.FileSystemEvent>.empty())
          as _i8.Stream<_i6.FileSystemEvent>);
}
