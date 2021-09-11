import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Open app", (WidgetTester tester) async {
    //find all widgets needed
    // final  = find.byKey(ValueKey(""));
    // final  = find.byKey(ValueKey(""));

    //execute the actual test
    // await tester.pumpWidget(MultiBlocProvider(providers: [], child: AppWidget()));
    AdminMembersRepository membersRepository =
      AdminMembersRepository(AdminMembersDataProvider());
    // try{
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdminEventBloc(),
        ),
        BlocProvider(
          create: (context) => AdminPaymentBloc(),
        ),
        BlocProvider(
          create: (context) =>
              AdminMemberBloc(membersRepository: membersRepository),
        ),
      ],
      child: AppWidget(),
    ));
    // await tester.enterText(, "Make Widget Testing Video");
    // await tester.pump(); //rebuilds your widget
    await tester.pump(Duration(seconds: 5));
    // } catch(_){
    // }finally {
    //check outputs
    expect(find.text("Welcome"), findsOneWidget);
    
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump(Duration(seconds: 2));
    expect(find.text('Already Have Account'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump(Duration(seconds: 2));
    expect(find.text('Please enter your full name'), findsOneWidget);


    // await tester.enterText(find., text);

    // }
  });

  // testWidgets(" ", (WidgetTester tester) async {
  //   //find all widgets needed
  //   final  = find.byKey(ValueKey(""));

  //   //execute the actual test
  //   await tester.pumpWidget();
  //   await tester.tap();
  //   await tester.pump(Duration(seconds: 3)); //rebuilds your widget

  //   //check outputs
  //   expect(find.text(""), findsOneWidget);
  // });
}