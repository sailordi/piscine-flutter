import 'package:flutter/material.dart';
import 'package:note/note.dart';
import 'package:note/database_service.dart';
import 'package:package/screens/create_update/CreateUpdateView.dart';
import 'package:package/widgets/ListWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late DatabaseService _dbService;
  Future<List<Note> >? _notes;

  @override
  void initState() {
    super.initState();

    _dbService = DatabaseService();

    _dbService.initialize().whenComplete( () async {
      await _refreshNotes();
      setState(() {});
    });

  }

  Future _refreshNotes() async {
    final data = _dbService.get();

    setState(() {
      _notes = data;
    });

  }

  Future _removeItem(Note n) async {
    await _dbService.delete(n.id!);
    _refreshNotes();
  }

  Future _editItem(Note n) async {
    showDialog(context: context,
      builder: (_) => CreateUpdateView(
        note: n,
        onSubmit: (title,body) async{
          if(title == n.title) { title = ""; }
          if(body == n.body) { body = ""; }

          await _dbService.update(Note(id:n.id,title: title, body: body) );
          if(!mounted) return;
          _refreshNotes();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Package"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context,
            builder: (_) => CreateUpdateView(
              onSubmit: (title,body) async{
                await _dbService.create(Note(title: title, body: body) );
                if(!mounted) return;
                _refreshNotes();
                Navigator.of(context).pop();
              },
            ),
          );
        },
    ),
      body: Center(
          child: FutureBuilder<List<Note>>(
            future: _notes,
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }else if (snapshot.hasError) {
                return const Center(child: Text('Error loading notes'));
              }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No notes'));
              }else {
                final data = snapshot.data!;

                return ListWidget.list(data,_removeItem,_editItem);
              }
            }
          )
      ),
    );

  }

}