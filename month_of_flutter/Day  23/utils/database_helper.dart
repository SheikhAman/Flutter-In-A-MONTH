import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/note.dart';

class DatabaseHelper {
  // Sigleton object means this instance will only initialize once throughout the application
  static DatabaseHelper? _databaseHelper; // Singleton  DatabaseHelper object
  static Database? _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

// If we use factory keyword in a constructor we can return a value
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, Singleton object
    }

    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initalizeDatabase();
    }
    return _database!;
  }

  Future<Database> initalizeDatabase() async {
// Get the directory path for both Android and iOS to store database.

    Directory directory =
        await getApplicationDocumentsDirectory(); // this function belongs to path provider package
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    // this statement will help you to create database with required columns
    await db.execute(
        'Create Table $noteTable($colId INTEGER PRIMARY KEY AUROINCREMENT, $colTitle TEXT, '
        '$colDescription Text, $colPriority INTEGER, $colDate Text)');
  }

  // Fetch Operation : Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db =
        await this.database; // First we have taken reference of Database

    // var result =
    //     await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC'); // writing raw sql
    var result = await db.query(noteTable,
        orderBy: '$colPriority ASC'); // Using Helper function
    return result;
  }

  // Insert Operation : Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());

    return result;
  }

  // Update Operation : Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation : Delete a Note object from database
  Future<int> deleteNote(int id) async {
    Database db = await this.database;

    int result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');

    return result;
  }

  // Get number of Note(records of the table) objects in database

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }
}
