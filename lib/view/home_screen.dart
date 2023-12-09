import 'package:flutter/material.dart';
import 'package:note_8_11/model/note_model.dart';

import '../utils/color_list.dart';
import 'list_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> noteModelList = [
    NoteModel(title: "New List", date: 'date', description: "Description"),
  ];
  final namecontroller = TextEditingController();
  final Descontroller = TextEditingController();
  final Datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB799FF),
      appBar: AppBar(
        title: Text("My Notes"),
        toolbarHeight: 60,
        backgroundColor: Color(0xFF99DBF5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: noteModelList.length,
            itemBuilder: (context, index) => ListscreenWidgets(
                  onTap: () {
                    noteModelList.removeAt(index);
                    setState(() {});
                  },
                  title: noteModelList[index].title,
                  description: noteModelList[index].description,
                  date: noteModelList[index].date,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                StatefulBuilder(builder: (context, insetState) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: Descontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Descriptiion',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF9BBEC8),
                            borderRadius: BorderRadius.circular(18)),
                        child: TextField(
                          controller: Datecontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'date',
                            hintStyle:
                                TextStyle(fontSize: 21, color: Colors.black),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            noteModelList.add(NoteModel(
                              title: namecontroller.text,
                              date: Datecontroller.text,
                              description: Descontroller.text,
                            ));
                            setState(() {});
                            namecontroller.clear();
                            Descontroller.clear();
                            Datecontroller.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Save")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  colorList.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: InkWell(
                                            onTap: () {
                                              insetState(() {});
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: colorList[index],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            )),
                                      )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
        child: Icon(
          Icons.mode_edit_outline,
          color: Colors.black,
          size: 34,
        ),
        backgroundColor: Color(0xFFDDF2FD),
      ),
    );
  }
}
