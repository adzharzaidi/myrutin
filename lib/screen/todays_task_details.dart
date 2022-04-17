import 'package:flutter/material.dart';
import 'package:myrutin/utils/constants.dart';

class TodayDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_LIGHTBLUE,
      body: CustomScrollView(
        slivers: [
          _buildTaskBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: COLOR_WHITE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTaskBar(BuildContext context) {
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
              Text('Today\'s To Do List',
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
