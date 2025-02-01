// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on NoteStoreBase, Store {
  late final _$notesAtom = Atom(name: 'NoteStoreBase.notes', context: context);

  @override
  ObservableList<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$NoteStoreBaseActionController =
      ActionController(name: 'NoteStoreBase', context: context);

  @override
  dynamic addNewNote(NoteModel newModel) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.addNewNote');
    try {
      return super.addNewNote(newModel);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeNote(NoteModel model) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.removeNote');
    try {
      return super.removeNote(model);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateModel(NoteModel model, int index) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
        name: 'NoteStoreBase.updateModel');
    try {
      return super.updateModel(model, index);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
