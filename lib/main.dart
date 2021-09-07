import 'package:edir/bloc_observer.dart';
import 'package:edir/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(AppWidget());
}
