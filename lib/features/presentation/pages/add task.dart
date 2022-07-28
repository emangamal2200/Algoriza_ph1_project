import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:td_app/features/presentation/shared/constances.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';

import 'package:td_app/features/presentation/widgets/custom%20button.dart';
import 'package:td_app/features/presentation/widgets/custom%20color%20widget.dart';
import 'package:td_app/features/presentation/widgets/default%20form%20field.dart';

class AddTaskScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var stController = TextEditingController();
  var edController = TextEditingController();
  var c = AppCubit.get;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AppInsertIntoDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: const Text(
              'Add Task',
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
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 25),
                      child: DefaultFormField(
                          controller: titleController,
                          type: TextInputType.text,
                          label: 'Title',
                          hint: ' Task title',
                          onTap: () {},
                          onChange: (String? value) {},
                          onSubmit: (String? value) {
                            titleController.text = value!;
                            print(value);
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'title must not be empty';
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: DefaultFormField(
                          controller: dateController,
                          type: TextInputType.none,
                          label: 'Date',
                          hint: ' 2022-07-24',
                          suffix: Icons.keyboard_arrow_down_outlined,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2022-12-30'),
                            ).then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                              print(DateFormat.yMMMd().format(value));
                            });
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'date must not be empty';
                            }
                            return null;
                          }),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: DefaultFormField(
                              controller: stController,
                              type: TextInputType.none,
                              label: 'Start time',
                              hint: ' 11:00 Am',
                              width: 155,
                              suffixSize: 16,
                              suffix: Icons.watch_later_outlined,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  stController.text =
                                      value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Starting time must not be empty';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: DefaultFormField(
                              controller: edController,
                              type: TextInputType.none,
                              label: 'End time',
                              width: 155,
                              suffixSize: 16,
                              hint: ' 14:00 Pm',
                              suffix: Icons.watch_later_outlined,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  edController.text =
                                      value!.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Ending time must not be empty';
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Remind',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 400,
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                fillColor: Color(0xfff9f9f9),
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xfff9f9f9),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                '1 day before',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xffc5c5c5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Color(0xffc5c5c5),
                                size: 30,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              items: cubit.remindingTimes!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select reminding time.';
                                }
                              },
                              onChanged: (value) {
                                cubit.selectedValue1 = value.toString();
                                print(cubit.selectedValue1);
                              },
                              onSaved: (value) {
                                cubit.selectedValue1 = value.toString();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Remind',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 400,
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                fillColor: Color(0xfff9f9f9),
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xfff9f9f9),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Yearly',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xffc5c5c5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Color(0xffc5c5c5),
                                size: 30,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              items: cubit.repeatingTimes!
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select reminding time.';
                                }
                              },
                              onChanged: (value) {
                                cubit.selectedValue2 = value.toString();
                                print(cubit.selectedValue2);
                              },
                              onSaved: (value) {
                                cubit.selectedValue2 = value.toString();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        children: [
                          const Text(
                            'Task color',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorWidget(
                            color: const Color(0xffff5147),
                            onTap: () {
                              cubit.ChToFC(
                                  col: Color(0xffff5147),
                                  fiClicked: true,
                                  scClicked: false,
                                  thClicked: false,
                                  forClicked: false);
                            },
                            hasFocus: cubit.fClicked,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorWidget(
                            color: const Color(0xffff9d42),
                            onTap: () {
                              cubit.ChToSC(
                                  col: Color(0xffff9d42),
                                  fiClicked: false,
                                  scClicked: true,
                                  thClicked: false,
                                  forClicked: false);
                            },
                            hasFocus: cubit.sClicked,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorWidget(
                            color: const Color(0xfff9c50b),
                            onTap: () {
                              cubit.ChToTC(
                                  col: Color(0xfff9c50b),
                                  fiClicked: false,
                                  scClicked: false,
                                  thClicked: true,
                                  forClicked: false);
                            },
                            hasFocus: cubit.tClicked,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorWidget(
                            color: const Color(0xff42a0ff),
                            onTap: () {
                              cubit.ChToTC(
                                  col: Color(0xff42a0ff),
                                  fiClicked: false,
                                  scClicked: false,
                                  thClicked: false,
                                  forClicked: true);
                            },
                            hasFocus: cubit.frClicked,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: CustomButtonWidget(
            bLabel: 'Create a task',
            myFunc: () {
              if (formKey.currentState!.validate()) {
                cubit.insertToDatabase(
                  title: titleController.text,
                  date: dateController.text,
                  st: stController.text,
                  et: edController.text,
                  remind: cubit.selectedValue1!,
                  repeat: cubit.selectedValue2!,
                  color: cubit.selectedColor!.toString(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
