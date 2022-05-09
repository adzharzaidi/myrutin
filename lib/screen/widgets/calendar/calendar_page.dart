import 'package:flutter/material.dart';
import 'package:myrutin/screen/widgets/calendar/calendar_widget.dart';
import 'package:myrutin/utils/constants.dart';

import 'calendar_event.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: COLOR_LIGHTBLUE,
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 90),
          child: CalendarWidget(),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: Icon(
            Icons.add,
            color: COLOR_WHITE,
          ),
          backgroundColor: COLOR_PURPLE,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CalendarEvent()),
          ),
        ),
      );
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
            'Calendar Page',
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
