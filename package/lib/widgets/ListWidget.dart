import 'package:flutter/material.dart';
import 'package:note/note.dart';

class ListWidget {

  static dynamic _item(Note n,void Function(Note n) delete,void Function(Note n) edit) {
    return ListTile(
      title: Column(
        children: <Widget>[
          Text(n.title,style: const TextStyle(fontWeight: FontWeight.bold) ),
          Text(n.body),
        ],
      ),
      subtitle: Text(n.formattedDate("dd/MM/yyyy") ),
      trailing: IconButton(
        onPressed: () async { delete(n); },
        icon: const Icon(Icons.delete,color: Colors.red),
      ),
      onTap: () async { edit(n); },
    );
  }

  static dynamic list(List<Note> data,void Function(Note n) delete,void Function(Note n) edit) {
    if(data.isEmpty) {
      return const Center(child: Text("No notes",
          style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.separated(separatorBuilder: (context,index) =>
        const SizedBox(height: 12),
        itemCount: data.length,
        itemBuilder: (context,index){
          final n = data[index];
          return _item(n,delete,edit);
        }
    );
  }

}