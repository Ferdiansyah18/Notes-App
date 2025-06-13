import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_dicoding/model/data.dart';

class NewNotesScreen extends StatelessWidget {


  const NewNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewNotesInput();
  }
}

class NewNotesInput extends StatefulWidget {

  const NewNotesInput({Key? key}) : super(key: key);

  @override
  _NewNotesInputState createState() => _NewNotesInputState();
}

class _NewNotesInputState extends State<NewNotesInput> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isNotEmpty && _notesController.text.isNotEmpty) {
      setState(() {
        userNotesList.add(
          UserNotes(
            title: _titleController.text,
            notes: _notesController.text,
          ),
        );
      });

      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
     content: Text("Masukkan Catatan"),
      ));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      style: IconButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 203, 196)),
                      color: Color.fromARGB(255, 51, 51, 51),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    "Buat Catatan Baru",
                    style: TextStyle(fontSize: 18,),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Judul Catatan")
                      ],
                    ),
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Isi Catatan")
                      ],
                    ),
                  ),
                  TextField(
                    maxLines: 10,
                    controller: _notesController,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      onPressed: _saveNote,
                      child: Text(
                        "Simpan",
                        style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontWeight: FontWeight.w600),
                        ),
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 203, 196)),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}