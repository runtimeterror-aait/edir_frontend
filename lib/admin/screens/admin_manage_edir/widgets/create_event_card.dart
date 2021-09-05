import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventCard extends StatefulWidget {
  const CreateEventCard({Key? key}) : super(key: key);

  @override
  _CreateEventCardState createState() => _CreateEventCardState();
}

class _CreateEventCardState extends State<CreateEventCard> {
  // OutlineInputBorder inputBorder = OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.black),
  // );
  final TextStyle inputTextStyle = TextStyle(color: Colors.white70);
  DateTime selectedDate = DateTime.now();
  bool pickedADate = false;
  String get showDate => DateFormat('EEEE, d MMM, yyyy').format(selectedDate);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        color: Colors.amber,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Event Title",
                    labelStyle: inputTextStyle,
                    isDense: true,
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: inputTextStyle,
                    isDense: true,
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        _datePicker(context);
                      },
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      label: Text(
                        pickedADate ? showDate : "PICK A DATE",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Post",
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        pickedADate = true;
      });
    }
  }
}
