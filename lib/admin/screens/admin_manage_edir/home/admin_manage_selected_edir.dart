import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/repository/admin_event_repository.dart';
import 'package:edir/core/models/event.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminManageSelectedEdir extends StatefulWidget {
  const AdminManageSelectedEdir({Key? key}) : super(key: key);

  @override
  _AdminManageSelectedEdirState createState() =>
      _AdminManageSelectedEdirState();
}

class _AdminManageSelectedEdirState extends State<AdminManageSelectedEdir>
    with SignInAndRegisterForm {
  final _eventFormKey = GlobalKey<FormState>();
  final _eventTitleController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  String validationStringTitle = "validate";
  String validationStringDescription = "validate";
  AdminEventRepository repository = AdminEventRepository(AdminDataProvider());
  int? eventId;
  Event? event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          backgroundColor: Colors.amber,
          title: Text("Edir name"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            )
          ],
        ),
        body: BlocListener<AdminEventBloc, AdminEventState>(
          listener: (context, state) {
            if (state is OneEventLoadedState) {
              print(state.getEvent.id);
              _eventTitleController.text = state.getEvent.title;
              _eventDescriptionController.text = state.getEvent.description;
              eventId = state.getEvent.id;
              event = state.getEvent;
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Form(
                key: _eventFormKey,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    children: [
                      Center(
                          child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(logoImageWithoutName),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        maxLength: 25,
                        controller: _eventTitleController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          this.validationStringTitle = value;
                          event = event?.copyWith(title: value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Event Title',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 65,
                        controller: _eventDescriptionController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          this.validationStringDescription = value;
                          event = event?.copyWith(description: value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 2,
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: raisedButtonStyle.copyWith(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.blueAccent)),
                              onPressed: () {
                                BlocProvider.of<AdminEventBloc>(context).add(
                                  GetAllEventsEvent(),
                                );
                                Navigator.pop(context);
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: const Text('Cancel'),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: raisedButtonStyle.copyWith(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.amber)),
                              onPressed: () {
                                if (_eventFormKey.currentState!.validate()) {
                                  print("eventId $eventId, event $event");
                                  BlocProvider.of<AdminEventBloc>(context)
                                      .add(UpdateEventEvent(eventId!, event!));
                                  Navigator.pop(context);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
