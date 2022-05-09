import 'package:flutter/material.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/widgets/projects/project_task_list.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:myrutin/provider/project_provider.dart';
import 'widgets/projects/add_project_task_dialog.dart';
import 'package:myrutin/screen/widgets/projects/project_task_completed.dart';

class ProjectDetails extends StatefulWidget {
  ProjectDetails({Key? key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ProjectTaskList(),
      ProjectTaskCompleted(),
    ];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: COLOR_LIGHTBLUE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: COLOR_LIGHTBLUE,
              child: tabs[selectedIndex],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: COLOR_WHITE,
        selectedItemColor: COLOR_PURPLE,
        unselectedItemColor: COLOR_GREY.withOpacity(0.5),
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              label: 'Todos', icon: Icon(Icons.fact_check, size: 30)),
          BottomNavigationBarItem(
              label: 'Completed', icon: Icon(Icons.done, size: 30))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        backgroundColor: COLOR_PURPLE,
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => new ProjectDialog(),
          // barrierDismissible: false,
        ),
        child: Icon(Icons.add, size: 35),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final provider = Provider.of<ProjectTaskProvider>(context);
    final projectTask = provider.projectTask;
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: COLOR_WHITE,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new),
        iconSize: 30,
        color: COLOR_PURPLE,
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
          color: COLOR_PURPLE,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Project 1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: COLOR_BLACK)),
              SizedBox(height: 5),
              Text(
                'You have ${projectTask.length} task left today',
                style: TextStyle(
                  fontSize: 12,
                  color: COLOR_GREY,
                ),
              )
            ]),
      ),
    );
  }
}
