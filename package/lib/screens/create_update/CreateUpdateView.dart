import 'package:flutter/material.dart';
import 'package:note/note.dart';

class CreateUpdateView extends StatefulWidget {
  final Note? note;
  final void Function(String title, String body) onSubmit;

  const CreateUpdateView({super.key,this.note,required this.onSubmit});

  @override
  State<CreateUpdateView> createState() => _CreateUpdateViewState();
}

class _CreateUpdateViewState extends State<CreateUpdateView> {
    final TextEditingController titleC = TextEditingController();
    final TextEditingController bodyC = TextEditingController();
    final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

    @override
    void initState() {
      super.initState();
      titleC.text = widget.note?.title ?? '';
      bodyC.text = widget.note?.body ?? '';
    }

    @override
    Widget build(BuildContext context) {
      final bool update = widget.note != null;
      return AlertDialog(
        title: Text(update ? "Update note" : "Add note"),
        content:
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: titleC,
                      decoration: const InputDecoration(hintText: "Title"),
                      validator: (value) =>
                      value != null && value.isEmpty ? "Title is needed" : null
                  ),
                  TextFormField(
                      autofocus: true,
                      controller: bodyC,
                      decoration: const InputDecoration(hintText: "Note text"),
                      validator: (value) =>
                      value != null && value.isEmpty ? "Note text is needed" : null
                  )
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")
              ),
              TextButton(onPressed: () {
                  if(formKey.currentState!.validate() ) {
                    widget.onSubmit(titleC.text,bodyC.text);
                  }
                },
                child: Text(update ? "Update" : "Add")
              )
            ],
        );
    }
}