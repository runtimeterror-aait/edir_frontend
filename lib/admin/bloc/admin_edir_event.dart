part of 'admin_edir_bloc.dart';

abstract class AdminEdirEvent extends Equatable {
  const AdminEdirEvent();

  @override
  List<Object> get props => [];
}

abstract class GetAllEdirsEvent extends Equatable {
  final List<Edir> edirs;

  const GetAllEdirsEvent({required this.edirs});

  @override
  List<Object> get props => [];
}

abstract class AddEdirEvent extends Equatable {
  final Edir edirs;

  const AddEdirEvent({required this.edirs});

  @override
  List<Object> get props => [];
}
