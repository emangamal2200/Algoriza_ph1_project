import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class ArchivedTasksScreen extends StatelessWidget {
  DatePickerController controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.5,
              title: const Text(
                'Schedule',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                  size: 14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30 , vertical:20),
                  child: Container(
                    height:85,
                    child: DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 80,
                      controller: controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Color(0xff25c06d),
                      selectedTextColor: Colors.white,
                      inactiveDates: [
                        DateTime.now().add(Duration(days: 3)),
                        DateTime.now().add(Duration(days: 4)),
                        DateTime.now().add(Duration(days: 7))
                      ],
                      onDateChange: (date) {
                          cubit.selectedValue = date;
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 32),
                  height: 1.5,
                  color: Colors.grey.shade200,
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
