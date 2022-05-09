import 'package:flutter/material.dart';
import 'package:myrutin/model/event.dart';
import 'package:myrutin/provider/event_provider.dart';
import 'package:myrutin/screen/widgets/calendar/edit_event_page.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:myrutin/utils/show_snack_bar.dart';
import 'package:provider/provider.dart';

class ViewEventPage extends StatelessWidget {
  final Event event;
  const ViewEventPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: COLOR_LIGHTBLUE,
        appBar: AppBar(
          backgroundColor: COLOR_WHITE,
          foregroundColor: COLOR_PURPLE,
          leading: CloseButton(),
          title: const Text('Event Details'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => EditEventPage(event: event),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.deleteEvent(event);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            buildDateTime(event),
            SizedBox(height: 32),
            Text(
              event.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              event.description,
              style: TextStyle(
                color: COLOR_BLACK,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Container();
  }
}
