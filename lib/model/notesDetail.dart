import 'package:flutter/material.dart';
import 'package:proyek_akhir_flutter_dicoding/model/data.dart';

class notesDetailScreen extends StatelessWidget {
    final UserNotes notesData;

    const notesDetailScreen ({Key? key, required this.notesData}) :super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            color: Color.fromARGB(255, 51, 51, 51),
                            style: IconButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 203, 196)),
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Text(
                            notesData.title,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(notesData.notes),
                  )
                ],
              ),
            )
        );
    }
}