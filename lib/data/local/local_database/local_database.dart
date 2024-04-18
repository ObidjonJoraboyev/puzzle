import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    //......Android/data
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS GameData (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        moves INTEGER,
        timer INTEGER
      )
    ''');
  }

  static Future<void> saveGameData(GameData gameData) async {
    final Database db = await databaseInstance.database;
    await db.insert("GameData", gameData.toMap());
  }

  static Future<void> delete(int id) async {
    final Database db = await databaseInstance.database;
    await db.delete("GameData", where: "id = ?", whereArgs: [id]);
  }

  static Future<List<GameData>> getAllGameData() async {
    final Database db = await databaseInstance.database;
    String orderBy = "moves ASC";
    List json = await db.query('GameData', orderBy: orderBy);

    return json.map((e) => GameData.fromMap(e)).toList();
  }
}

class GameData {
  final int? id;
  final int moves;
  final String timer;

  GameData({this.id, required this.moves, required this.timer});

  factory GameData.fromMap(Map<String, dynamic> map) {
    return GameData(
      id: map['id'],
      moves: map['moves'],
      timer: map['timer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moves': moves,
      'timer': timer,
    };
  }
}
