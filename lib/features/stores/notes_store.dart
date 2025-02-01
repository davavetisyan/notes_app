import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/utils/shared_prefs.dart';

part 'notes_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final SharedPrefs prefs;
  NoteStoreBase(this.prefs) {
    notes.addAll(prefs.getNotesFromStorage());
  }

  @observable
  ObservableList<NoteModel> notes = ObservableList<NoteModel>();

  @action
  addNewNote(NoteModel newModel) {
    notes.add(newModel);
    prefs.saveNotesToStorage(notes);
  }

  @action
  removeNote(NoteModel model) {
    notes.remove(model);
    prefs.saveNotesToStorage(notes);
  }

  @action
  updateModel(NoteModel model, int index) {
    notes[index] = model;
    prefs.saveNotesToStorage(notes);
  }
}
