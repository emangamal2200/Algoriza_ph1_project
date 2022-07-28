import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:td_app/features/presentation/pages/all%20tasks.dart';
import 'package:td_app/features/presentation/pages/favourite%20tasks.dart';
import 'package:td_app/features/presentation/pages/uncompleted%20tasks.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';

import '../../pages/completed tasks.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    AllTasksScreen(),
    CompletedTasksScreen(),
    UnCompletedTasksScreen(),
    FavouriteTasksScreen(),
  ];
  List<Map> tasks = [];
  Database? database;

  String? selectedValue1;
  String? selectedValue2;
  final List<String>? remindingTimes = [
    '1 day before',
    '1 hour before',
    '30 min before',
    '10 min before',
  ];
  final List<String>? repeatingTimes = [
    'Yearly',
    'Monthly',
    'Weekly',
    'Daily',
  ];

  Color? selectedColor;
  bool fClicked = false;

  bool sClicked = false;

  bool tClicked = false;

  bool frClicked = false;

  Color? cColor;
  bool shouldCheck = false;

  void createDataBase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, st TEXT, et TEXT, reminder TEXT, repeat TEXT,color TEXT ,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetFromDatabaseState());
        });
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void insertToDatabase({
    required String title,
    required String date,
    required String st,
    required String et,
    required String remind,
    required String repeat,
    required String color,
  }) async {
     database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,st,et,reminder,repeat,color,status) VALUES("$title","$date","$st","$et","$remind","$repeat","$color","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertIntoDatabaseState());
        getDataFromDatabase(database).then((value) {
          tasks = value;
          print(tasks);
          emit(AppGetFromDatabaseState());
        });
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    emit(AppGetFromDatabaseLoadingState());
    return await database.rawQuery('SELECT * FROM tasks');
  }

  void ChToFC({
    required Color col,
    required bool fiClicked,
    required bool scClicked,
    required bool thClicked,
    required bool forClicked,
  }) {
    selectedColor = col;
    fClicked = fiClicked;
    sClicked = scClicked;
    tClicked = thClicked;
    frClicked = forClicked;
    emit(AppChangeToFColor());
  }

  void ChToSC({
    required Color col,
    required bool fiClicked,
    required bool scClicked,
    required bool thClicked,
    required bool forClicked,
  }) {
    selectedColor = col;
    fClicked = fiClicked;
    sClicked = scClicked;
    tClicked = thClicked;
    frClicked = forClicked;
    emit(AppChangeToSColor());
  }

  void ChToTC({
    required Color col,
    required bool fiClicked,
    required bool scClicked,
    required bool thClicked,
    required bool forClicked,
  }) {
    selectedColor = col;
    fClicked = fiClicked;
    sClicked = scClicked;
    tClicked = thClicked;
    frClicked = forClicked;
    emit(AppChangeToTColor());
  }

  void ChToFrC({
    required Color col,
    required bool fiClicked,
    required bool scClicked,
    required bool thClicked,
    required bool forClicked,
  }) {
    selectedColor = col;
    fClicked = fiClicked;
    sClicked = scClicked;
    tClicked = thClicked;
    frClicked = forClicked;
    emit(AppChangeToFrColor());
  }

  void createColor(String color) {
    String valueString = color.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    cColor = new Color(value);
    emit(AppCreateColor());
  }


  void checked() {
    if (shouldCheck) {
      shouldCheck = true;
      emit(AppEnableCheckBox());
    } else {
      shouldCheck = false;
      emit(AppDisableCheckBox());
    }

  }

  IconData icon1 = Icons.favorite_border_outlined;

  IconData icon2 = Icons.archive_outlined;

  void addToFavourite() {
    icon1 = Icons.favorite;
    emit(AppAddToFavourite());
  }

  void addArchived() {
    icon2 = Icons.archive;
    emit(AppAddToArchived());
  }

  // void updateData({
  //   required String status,
  //   required int id,
  // }) async {
  //   database!.rawUpdate(
  //       'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
  //     emit(AppUpdateDatabaseTaskState());
  //   });
  // }

  // void updateFavourite({
  //   required int favourite,
  //   required int id,
  // }) async {
  //   database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
  //       [favourite, id]).then((value) {
  //     emit(AppUpdateDatabaseTaskFavouriteState());
  //   }).then((value) {
  //     getDataFromDatabase(database).then((value) {
  //       tasks = value;
  //       print(tasks);
  //       emit(AppGetFromDatabaseState());
  //     });
  //   });
  // }

  DateTime selectedValue = DateTime.now();
}
