import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';
import 'package:td_app/features/presentation/widgets/first%20task%20widget.dart';


class AllTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context, state) {},
      builder:(context,state){
        var tasks = AppCubit.get(context).tasks!;
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.separated(
            itemBuilder: (context, index) => FirstTaskWidget(model:tasks[index]),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 15.0,
            ),
            itemCount: tasks.length,
          ),
        );
      } ,
    );
  }
}

// Center(
// child: Text(
// 'All Tasks',
// style: TextStyle(
// fontSize: 25.0,
// fontWeight: FontWeight.bold,
// ),
// ));
