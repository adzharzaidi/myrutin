import 'package:flutter/material.dart';
import 'landing_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 60, 126),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 234, 235),
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

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Color.fromARGB(255, 47, 60, 126),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today\'s to do List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 5),
              Text(
                'You have 3 task left today',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ]),
      ),
    );
  }
}
