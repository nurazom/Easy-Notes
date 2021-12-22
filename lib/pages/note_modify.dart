// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final int noteID;

  // ignore: prefer_const_constructors_in_immutables
  NoteModify({Key? key, required this.noteID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteID == 0 ? "Creat Notes" : "Eddit Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "Note Title",
              ),
            ),
            //
            const TextField(
              decoration: InputDecoration(
                hintText: "Note Title",
              ),
            ),

            //add a submit buttom
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: const Text("Submit"),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
