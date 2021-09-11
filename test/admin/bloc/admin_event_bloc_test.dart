import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:test/test.dart';



void main(){
  group(
    'Admin Event Bloc', (){
      AdminEventBloc adminEventBloc = AdminEventBloc();
      blocTest<AdminEventBloc, AdminEventState>('emit [EventLoadingState(),EventOperationFailedState()] when GetAllEventsEvent is added',
        build: () => adminEventBloc,
        act: (bloc) => bloc.add(GetAllEventsEvent()),
        expect: () => [EventLoadingState(),EventOperationFailedState()],
        // expect: () => [EventLoadingState(), isA<AllEventsLoadedState>()],
      );


    });

}



