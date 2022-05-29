import 'package:flutter/material.dart';
import 'package:myrutin/model/today_task.dart';
import 'package:myrutin/screen/add_project_dialog.dart';
import 'package:myrutin/screen/widgets/calendar/calendar_page.dart';
import 'package:myrutin/screen/widgets/homepage/projects_list.dart';
import 'package:myrutin/screen/widgets/today/today_task_completed.dart';
import 'package:myrutin/utils/constants.dart';
import 'today_task.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      _buildHomePage(),
      Calendar(),
    ];
    return Scaffold(
      backgroundColor: COLOR_LIGHTBLUE,
      appBar: selectedIndex == 0 ? _buildAppBar() : null,
      body: tabs[selectedIndex],
      floatingActionButton: selectedIndex == 0 ? _buildButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor: COLOR_PURPLE,
      onPressed: (() => showDialog(
            context: context,
            builder: (BuildContext context) => new AddProject(),
          )),
      child: Icon(Icons.add, size: 35),
    );
  }

  Widget _buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Today(),
        Divider(
          color: COLOR_PURPLE,
          indent: 20,
          endIndent: 20,
          thickness: 6,
        ),
        Container(
          padding: EdgeInsets.all(25),
          child: Text(
            'Projects',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Projects(),
        ),
      ],
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
          currentIndex: selectedIndex,
          selectedItemColor: COLOR_PURPLE,
          unselectedItemColor: COLOR_GREY.withOpacity(0.5),
          onTap: (index) => setState(() {
            selectedIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home, size: 30)),
            BottomNavigationBarItem(
                label: 'Calendar', icon: Icon(Icons.calendar_month, size: 30))
          ],
        ),
      ),
    );
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
      // actions: [
      //   Icon(
      //     Icons.settings,
      //     color: COLOR_PURPLE,
      //     size: 40,
      //   )
      // ],
    );
  }
}
