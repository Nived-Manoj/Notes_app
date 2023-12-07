import 'package:flutter/material.dart';
import 'package:note_8_11/model/note_model.dart';

class ListscreenWidgets extends StatefulWidget {
  final String title;
  final String date;
  final String description;
  final void Function()? onTap;
  const ListscreenWidgets(
      {required this.title,
      required this.date,
      required this.description,
      this.onTap});

  @override
  State<ListscreenWidgets> createState() => _ListscreenWidgetsState();
}

class _ListscreenWidgetsState extends State<ListscreenWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.greenAccent),
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                InkWell(
                  onTap: widget.onTap,
                  child: Icon(
                    Icons.delete,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
