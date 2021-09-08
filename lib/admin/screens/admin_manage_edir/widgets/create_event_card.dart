import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/core/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateEventCard extends StatefulWidget {
  const CreateEventCard({Key? key}) : super(key: key);

  @override
  _CreateEventCardState createState() => _CreateEventCardState();
}

class _CreateEventCardState extends State<CreateEventCard> {
  final TextStyle inputTextStyle = TextStyle(color: Colors.white);
  DateTime? selectedDate;
  bool pickedADate = false;
  bool redCalendar = false;
  String get showDate => DateFormat('EEEE, d MMM, yyyy').format(selectedDate!);
  String calendarMessage = "PICK A DATE";
  final _eventFormKey = GlobalKey<FormState>();
  final _eventTitleController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  String validationStringTitle = "validate";
  String validationStringDescription = "validate";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.amber,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Form(
          key: _eventFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _eventTitleController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  this.validationStringTitle = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                controller: _eventDescriptionController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  this.validationStringDescription = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                      pickedADate ? showDate : calendarMessage,
                      style: TextStyle(
                        color: redCalendar ? Colors.redAccent : Colors.black54,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the form inputs here
                      if (selectedDate == null) {
                        setState(() {
                          this.calendarMessage = "please pick a date";
                          this.redCalendar = true;
                        });
                      }

                      if (_eventFormKey.currentState!.validate() &&
                          selectedDate != null) {
                        Event event = Event(
                            title: _eventTitleController.text,
                            description: _eventDescriptionController.text,
                            eventDate: selectedDate!,
                            edirId: 2);

                        setState(() {
                          print("hey");
                          BlocProvider.of<AdminEventBloc>(context)
                              .add(CreateEventEvent(event, 2));
                        });
                      }
                    },
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
      ),
    );
  }

  void _datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        pickedADate = true;
        redCalendar = false;
      });
    }
  }
}
