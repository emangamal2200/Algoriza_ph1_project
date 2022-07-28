import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_app/features/presentation/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:td_app/features/presentation/shared/cupit/block%20opservar.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';


import 'package:td_app/features/presentation/shared/cupit/states.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );
      runApp(BlocProvider(
        create: (BuildContext context) => AppCubit()..createDataBase(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            return const MyApp();
          },
        ),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
