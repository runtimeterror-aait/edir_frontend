part of 'admin_edir_bloc.dart';

abstract class AdminEdirEvent extends Equatable {
  const AdminEdirEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentEdirEvent extends AdminEdirEvent {
  const GetCurrentEdirEvent();

  @override
  List<Object> get props => [];
}

class CreateEdirEvent extends AdminEdirEvent {
  final Edir edir;

  const CreateEdirEvent({required this.edir});

  @override
  List<Object> get props => [];
}

class UpdateEdirEvent extends AdminEdirEvent {
  final Edir edir;
  final int edirInt;

  const UpdateEdirEvent({required this.edir, required this.edirInt});

  @override
  List<Object> get props => [];
}
