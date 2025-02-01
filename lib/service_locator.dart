import 'package:get_it/get_it.dart';
import 'package:notes_app/core/config/constants/storage_keys.dart';
import 'package:notes_app/features/stores/notes_store.dart';

import 'core/utils/shared_prefs.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSharedPrefs();
}

Future<void> _initSharedPrefs() async {
  final sharedPrefs = SharedPrefs();

  try {
    await sharedPrefs.init();
  } catch (e) {
    print('Local storage doesnt init');
  }

  locator.registerSingleton<SharedPrefs>(sharedPrefs);
   


  locator.registerSingleton<NoteStore>(NoteStore(locator()));
}
