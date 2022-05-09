import 'package:flutter/material.dart';
import 'package:myrutin/provider/today_task_provider.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:myrutin/screen/todays_task_details.dart';
import 'package:provider/provider.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodayTaskProvider>(context);
    final todaytask = provider.todayTask;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodayDetails()));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: COLOR_WHITE, borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Icon(
                    Icons.star,
                    color: COLOR_PURPLE,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s To do List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${todaytask.length} Tasks left',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: COLOR_GREY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
