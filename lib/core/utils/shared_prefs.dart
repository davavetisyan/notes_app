import 'dart:convert';

import 'package:notes_app/core/config/constants/storage_keys.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? _prefs;

  Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  Future<bool> setDouble(String key, double value) async =>
      await _prefs!.setDouble(key, value);

  Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs!.setStringList(key, value);

  bool getBool(String key) => _prefs?.getBool(key) ?? false;

  double getDouble(String key) => _prefs!.getDouble(key)!;

  int getInt(String key) => _prefs!.getInt(key)!;

  String? getString(String key) => _prefs?.getString(key) ?? null;

  List<String> getStringList(String key) => _prefs?.getStringList(key) ?? [];

  Future<bool> remove(String key) async => await _prefs!.remove(key);

  Future<bool> clear() async => await _prefs!.clear();

  saveNotesToStorage(List<NoteModel> notesList) async {
    List<String> newListOfStrings =
        notesList.map((element) => jsonEncode(element.toJson())).toList();

    await setStringList(StorageKeys.notesList, newListOfStrings);
  }

  getNotesFromStorage() {
    final list = getStringList(StorageKeys.notesList);
    if (list.isNotEmpty) {
      return list
          .map((jsonString) => NoteModel.fromJson(jsonDecode(jsonString)))
          .toList();
    } else {
      return <NoteModel>[];
    }
  }
}
