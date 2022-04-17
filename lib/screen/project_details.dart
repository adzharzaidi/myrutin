import 'package:flutter/material.dart';
import 'package:myrutin/model/project.dart';
import 'package:myrutin/utils/constants.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails(Project project);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: COLOR_LIGHTBLUE,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: COLOR_WHITE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        backgroundColor: COLOR_PURPLE,
        onPressed: (() {}),
        child: Icon(Icons.add, size: 35),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: COLOR_LIGHTBLUE.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: COLOR_WHITE,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: COLOR_PURPLE,
            unselectedItemColor: COLOR_GREY.withOpacity(0.5),
            items: [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home, size: 30)),
              BottomNavigationBarItem(
                  label: 'Calendar', icon: Icon(Icons.calendar_month, size: 30))
            ],
          ),
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: COLOR_LIGHTBLUE,
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
                'You have 3 task left today',
                style: TextStyle(
                  fontSize: 12,
                  color: COLOR_WHITE,
                ),
              )
            ]),
      ),
    );
  }
}
