import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';
import 'model/usuer_entity.dart';

class Database {
  static late Store _store;

  static Future<void> open() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final path = '${appDocumentDir.path}/objectbox';

    _store = Store(getObjectBoxModel(), directory: path);
  }

  static Box<User> get userBox => _store.box<User>();
}