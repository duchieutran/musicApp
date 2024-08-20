// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_audio.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageAudio on ManageAudioBase, Store {
  late final _$durationStateAtom =
      Atom(name: 'ManageAudioBase.durationState', context: context);

  @override
  DurationState get durationState {
    _$durationStateAtom.reportRead();
    return super.durationState;
  }

  @override
  set durationState(DurationState value) {
    _$durationStateAtom.reportWrite(value, super.durationState, () {
      super.durationState = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ManageAudioBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$ManageAudioBaseActionController =
      ActionController(name: 'ManageAudioBase', context: context);

  @override
  void play() {
    final _$actionInfo = _$ManageAudioBaseActionController.startAction(
        name: 'ManageAudioBase.play');
    try {
      return super.play();
    } finally {
      _$ManageAudioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pause() {
    final _$actionInfo = _$ManageAudioBaseActionController.startAction(
        name: 'ManageAudioBase.pause');
    try {
      return super.pause();
    } finally {
      _$ManageAudioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seek(Duration position) {
    final _$actionInfo = _$ManageAudioBaseActionController.startAction(
        name: 'ManageAudioBase.seek');
    try {
      return super.seek(position);
    } finally {
      _$ManageAudioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
durationState: ${durationState}
    ''';
  }
}
