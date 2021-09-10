part of 'admin_edir_bloc.dart';

abstract class AdminEdirState extends Equatable {
  const AdminEdirState();

  @override
  List<Object> get props => [];
}

class AdminEdirInitial extends AdminEdirState {}

class EdirsLoadedState extends AdminEdirState {
  final Edir edir;
  EdirsLoadedState({required this.edir});
}

class EdirsLoadingState extends AdminEdirState {}

class CreateEdirState extends AdminEdirState {}

class EdirOperationFailedState extends AdminEdirState {}
