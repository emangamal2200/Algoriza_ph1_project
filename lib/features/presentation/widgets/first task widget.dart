import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';

class FirstTaskWidget extends StatelessWidget {
  Map? model ;
  FirstTaskWidget({
    this.model,
  });
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
      create: (BuildContext context) =>
      AppCubit()
        ..getDataFromDatabase(AppCubit.get(context).database),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            return Padding(padding: const EdgeInsets.only(

              left: 10,

              right: 10,

            ),

              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  CustomCheckBox(

                    value: AppCubit
                        .get(context)
                        .shouldCheck,

                    shouldShowBorder: true,

                    borderColor: AppCubit
                        .get(context)
                        .cColor!,

                    checkedFillColor: AppCubit
                        .get(context)
                        .cColor!,

                    borderRadius: 8,

                    borderWidth: 1,

                    checkBoxSize: 22,

                    onChanged: (value) {
                      AppCubit.get(context).checked();
                    },

                  ),

                  Padding(

                    padding: EdgeInsets.only(top: 13),

                    child: Text(

                      '${model!['title']}',

                      style: TextStyle(

                        color: Colors.black,

                        fontSize: 18.0,

                      ),

                    ),

                  ),

                  SizedBox(

                    width: 20,

                  ),

                  Row(

                    children: [

                      Padding(

                        padding: EdgeInsets.only(top: 3),

                        child: IconButton(

                          icon: Icon(

                            AppCubit
                                .get(context)
                                .icon1,

                            color: AppCubit
                                .get(context)
                                .cColor!,

                            size: 27,

                          ),

                          onPressed: () {},

                        ),

                      ),

                      Padding(

                        padding: EdgeInsets.only(top: 3),

                        child: IconButton(

                          icon: Icon(

                            AppCubit
                                .get(context)
                                .icon2,

                            color: AppCubit
                                .get(context)
                                .cColor!,

                            size: 27,

                          ),

                          onPressed: () {},

                        ),

                      ),

                    ],

                  ),

                ],

              ),

            );
          }
      ),
);}
}

