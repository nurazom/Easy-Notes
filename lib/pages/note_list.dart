import 'package:easynotes/Models/note_for_list.dart';
import 'package:easynotes/pages/note_delete.dart';
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
      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NoteModify(
                noteID: 0,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      //get Appbar
      appBar: AppBar(
        title: const Text("Note List"),
      ),
      /*Body Start*/
      body: ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(thickness: 2, color: Colors.black12),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            //for Delete
            return Dismissible(
              direction: DismissDirection.startToEnd,
              key: ValueKey("${notes[index].noteID}"),
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context, builder: (_) => NoteDelete());
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              //list Start
              child: ListTile(
                title: Text(notes[index].noteTitle),
                subtitle: Text("${notes[index].lastEdditDateTime}"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NoteModify(
                        noteID: notes[index].noteID,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
