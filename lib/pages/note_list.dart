import 'package:easynotes/Models/note_for_list.dart';
import 'package:easynotes/pages/note_modify.dart';
import 'package:flutter/material.dart';

List<NoteForList> notes = [
  NoteForList(
    noteID: 1,
    noteTitle: "food",
    adedDateAndTime: DateTime.now(),
    lastEdditDateTime: DateTime.now(),
  ),
  //
  NoteForList(
    noteID: 2,
    noteTitle: "food",
    adedDateAndTime: DateTime.now(),
    lastEdditDateTime: DateTime.now(),
  ),
  //
  NoteForList(
    noteID: 3,
    noteTitle: "food",
    adedDateAndTime: DateTime.now(),
    lastEdditDateTime: DateTime.now(),
  ),
];

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteModify(
                    noteID: 0,
                  )));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Note List"),
      ),
      //
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
          color: Colors.black12,
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].noteTitle),
            subtitle: Text("${notes[index].lastEdditDateTime}"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => NoteModify(
                        noteID: notes[index].noteID,
                      )));
            },
          );
        },
      ),
    );
  }
}
