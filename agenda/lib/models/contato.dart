import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";
final String contatoTable = "contatoTable";

class ContatoDao{

  static final ContatoDao _instance = ContatoDao.internal();

  factory ContatoDao() => _instance;

  ContatoDao.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
    }
    return db;
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath + 'contatos.db');

    return openDatabase(path, version: 1, onCreate: (Database db, int newVersion) async {
      await db.execute("CREATE TABLE $contatoTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, "
          "$emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)");
    });
  }

}

class Contato{

  int id;
  String name;
  String email;
  String phone;
  String img;

  Contato.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: this.name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };

    if(id != null){
      map[idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {
    return "Contato(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }


}