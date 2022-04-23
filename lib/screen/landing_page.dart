import 'package:flutter/material.dart';
import 'package:myrutin/screen/widgets/projects/projects_list.dart';
import 'package:myrutin/utils/constants.dart';
import 'widgets/today/todays_task.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_LIGHTBLUE,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TodaysTask(),
          Divider(
            color: COLOR_PURPLE,
            indent: 20,
            endIndent: 20,
            thickness: 6,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Projects',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Projects(),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: COLOR_LIGHTBLUE,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Hello!',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.settings,
          color: COLOR_PURPLE,
          size: 40,
        )
      ],
    );
  }
}
