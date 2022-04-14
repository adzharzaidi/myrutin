import 'package:flutter/material.dart';
import 'package:myrutin/screen/widgets/projects.dart';
import 'package:myrutin/utils/constants.dart';
import 'widgets/todays_task.dart';

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
    );
  }
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
