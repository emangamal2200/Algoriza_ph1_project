import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:td_app/features/presentation/pages/add%20task.dart';
import 'package:td_app/features/presentation/pages/archived%20tasks.dart';
import 'package:td_app/features/presentation/shared/cupit/cubit.dart';
import 'package:td_app/features/presentation/shared/cupit/states.dart';
import 'package:td_app/features/presentation/widgets/custom%20button.dart';
import 'package:td_app/features/presentation/widgets/custom%20tab.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {

      },
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              appBar: AppBar(
                elevation: 0.5,
                backgroundColor: Colors.white,
                title: Text(
                  'Board',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArchivedTasksScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff25c06d),
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    margin: EdgeInsetsDirectional.only(bottom: 32),
                    height: 1.5,
                    color: Colors.grey.shade200,
                    width: double.infinity,
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0),
                    insets: EdgeInsets.symmetric(horizontal: 14.5),
                  ),
                  tabs: <Widget>[
                    Tab(
                      icon: CustomTabWidget(
                        tLabel: 'All',
                      ),
                    ),
                    Tab(
                      icon: CustomTabWidget(
                        tLabel: 'Completed',
                      ),
                    ),
                    Tab(
                      icon: CustomTabWidget(
                        tLabel: 'Uncompleted',
                      ),
                    ),
                    Tab(
                      icon: CustomTabWidget(
                        tLabel: 'Favourite',
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: state is! AppGetFromDatabaseLoadingState,
                builder: (context) => TabBarView(
                  children: cubit.screens,
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              floatingActionButton: CustomButtonWidget(
                  bLabel: 'Add a task',
                  myFunc: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddTaskScreen()));
                  })),
        );
      },
    );
  }
}

// id integer
// title string
// date string
// st time string
// et time string
// reminder string
// repeat string
// status string
