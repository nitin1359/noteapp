import 'dart:math';
import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import '../models/note.dart';
import '../constants/colors.dart';
import '../widgets/confirm_dialog.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  Future<void> _fetchNotes() async {
    final dataList = await DatabaseHelper().getNotes();
    setState(() {
      _notes = dataList.map((item) => Note(
        id: item['id'],
        title: item['title'],
        content: item['content'],
      )).toList();
      _isLoading = false;
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  Future<void> _addNoteDialog(BuildContext context) async {
    String title = '';
    String content = '';

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Add Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && content.isNotEmpty) {
                  _addNote(Note(
                    title: title,
                    content: content,
                  ));
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _editNoteDialog(BuildContext context, Note note) async {
    String title = note.title;
    String content = note.content;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
                controller: TextEditingController()..text = note.title,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  content = value;
                },
                controller: TextEditingController()..text = note.content,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && content.isNotEmpty) {
                  _updateNote(Note(
                    id: note.id,
                    title: title,
                    content: content,
                  ));
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addNote(Note note) async {
    await DatabaseHelper().insertNote(note.toMap());
    _fetchNotes();
  }

  Future<void> _updateNote(Note note) async {
    await DatabaseHelper().updateNote(note.toMap());
    _fetchNotes();
  }

  Future<void> _deleteNote(int id) async {
    await DatabaseHelper().deleteNote(id);
    _fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: notesHomeScreen(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNoteDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView notesHomeScreen() {
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        final note = _notes[index];
        return Card(
          color: getRandomColor(),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () => _editNoteDialog(context, note),
              title: RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: '${note.title}\n',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: note.content,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  final result = await confirmDialog(context);
                  if (result != null && result) {
                    _deleteNote(note.id!);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
