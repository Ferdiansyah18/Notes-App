import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_dicoding/model/data.dart';
import 'package:proyek_akhir_flutter_dicoding/model/newNotes.dart';
import 'package:proyek_akhir_flutter_dicoding/model/notesDetail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToNewNote() async {
    final refresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewNotesScreen(),
      ),
    );

    if (refresh == true) {
      setState(() {});
    }
  }

  void _deleteNote(UserNotes note) {
    setState(() {
      userNotesList.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      color: Color.fromARGB(255, 51, 51, 51),
      fontWeight: FontWeight.bold,
      fontSize: 26,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              height: 335,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 213, 232, 212),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Halo, Ferdiansyah", style: titleTextStyle),
                  const SizedBox(height: 5),
                  const Text("Ada Cerita Apa", style: titleTextStyle),
                  const SizedBox(height: 5),
                  const Text("Hari Ini?", style: titleTextStyle),
                  const SizedBox(height: 60),
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      style: IconButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 128, 203, 196),
                      ),
                      color: Color.fromARGB(255, 51, 51, 51),
                      onPressed: _navigateToNewNote,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Catatan Anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: UserNotesList(
                onDelete: _deleteNote,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserNotesList extends StatelessWidget {
  final Function(UserNotes) onDelete;

  const UserNotesList({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userNotesList.isEmpty) {
      return Center(
        child: Text(
          "Masih belum ada catatan nih",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final UserNotes notesData = userNotesList[index];
        return Container(
          padding: EdgeInsets.only(bottom: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return notesDetailScreen(notesData: notesData);
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 229, 180),
              ),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 95,
              width: 362,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          notesData.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          notesData.notes,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Color.fromARGB(255, 51, 51, 51),
                    onPressed: () {
                      onDelete(notesData); 
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: userNotesList.length,
    );
  }
}
