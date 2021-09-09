import 'package:edir/bloc_observer.dart';
import 'package:edir/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'admin/bloc/admin_event_bloc.dart';
import 'admin/data_provider/admin_event_data_provider.dart';
import 'admin/repository/admin_event_repository.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final AdminEventRepository eventRepository =
      AdminEventRepository(AdminDataProvider());

  runApp(BlocProvider(
    create: (context) => AdminEventBloc(eventRepository: eventRepository)
      ..add(GetAllEventsEvent()),
    child: AppWidget(),
  ));
}
