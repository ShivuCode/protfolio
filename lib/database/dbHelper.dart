import 'package:protfolio/model/project.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Future<Database> openDb() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'projects.db');
      return await openDatabase(path, onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE project(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT, url TEXT,giturl TEXT)');
      }, version: 1);
    } catch (e) {
      print('Error opening database: $e');
      rethrow; // Rethrow the exception to propagate it
    }
  }

  // INSERTING PROJECTS
  static Future<bool> insertProject(Project project) async {
    try {
      final db = await openDb();
      await db.insert('project', {
        'title': project.title,
        'desc': project.description,
        'url': project.url,
        'giturl': project.giturl,
      });
      return true;
    } catch (e) {
      print('Error inserting project: $e');
      return false;
    }
  }

  // FETCHING ALL PROJECTS
  static Future<List<Map<String, dynamic>>> getAllProjects() async {
    try {
      final db = await openDb();
      final records = await db.query('project');
      await db.close();
      return records;
    } catch (e) {
      print('Error fetching projects: $e');
      return [];
    }
  }

  //DELETING ALL PROJECTS
  static Future<bool> deleteAllProjects() async {
    try {
      final db = await openDb();
      await db.delete('project');
      await db.close();
      return true;
    } catch (e) {
      print('Error fetching projects: $e');
      return false;
    }
  }

  //DELETING ONE PROJECT
  static Future<bool> deleteProject(id) async {
    try {
      final db = await openDb();
      await db.delete('project', where: 'id=?', whereArgs: [id]);
      await db.close();
      return true;
    } catch (e) {
      print('Error fetching projects: $e');
      return false;
    }
  }
}
