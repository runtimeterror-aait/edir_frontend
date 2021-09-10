part of 'admin_edir_bloc.dart';

abstract class AdminEdirState extends Equatable {
  const AdminEdirState();

  @override
  List<Object> get props => [];
}

class AdminEdirInitial extends AdminEdirState {}

class AllEdirsLoadedState extends AdminEdirState {}

class EdirsLoadingState extends AdminEdirState {}

class AddEdirState extends AdminEdirState {}
