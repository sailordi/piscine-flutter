# package

Create a Flutter package for your Secure Notes app. You should write
your own package which will work with sqflite and have CRUD
functionality.
Your package should consist of Database.dart class and Note class which
will allow easy access to SQLite database.
In the end you should be able to import it like:

```
import 'package:note/note.dart';

```

### Objective:

- Dealing with existing, large apps
- Reusing packages across multiple apps
- Local vs remote (git) packages

### Database.dart

```
class Database {
Database _db;

    Future create() async {
        Directory path = await getApplicationDocumentsDirectory();
        String dbPath = join(path.path, "database.db");

        _db = await openDatabase(dbPath, version: 1);
    }
}

```

Example of Database class, where you should create table "Note" with 4 parameters :

- id
- title
- body
- date

Database class should also have CRUD methods like getAllNotes, deleteAllNotes, addNote, deleteNote, updateNote.

- getAllNotes()
- deleteAllNotes()
- addNote(note: Note)
- deleteNote(note: Note)
- updateNote(oldNote: Note, newNote: Note)

### Note.dart

Model class for Note object.

```
class Note {
  int id;
  String title;
  String body;
  String date;

  Note({
    this.id,
    this.title,
    this.body,
    this.date;
  });

```