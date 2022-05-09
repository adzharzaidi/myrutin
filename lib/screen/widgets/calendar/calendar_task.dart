import 'package:flutter/material.dart';
import 'package:myrutin/model/event_data_source.dart';
import 'package:myrutin/provider/event_provider.dart';
import 'package:myrutin/screen/widgets/calendar/view_event_page.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CalendarTask extends StatefulWidget {
  CalendarTask({Key? key}) : super(key: key);

  @override
  State<CalendarTask> createState() => _CalendarTaskState();
}

class _CalendarTaskState extends State<CalendarTask> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
        child: Text(
          'No Events Found!',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
          timeTextStyle: TextStyle(fontSize: 16, color: COLOR_BLACK)),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: COLOR_PURPLE,
        selectionDecoration: BoxDecoration(
          color: COLOR_PURPLE.withOpacity(0.2),
        ),
        onTap: (details) {
          if (details.appointments == null) return;

          final event = details.appointments!.first;

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewEventPage(event: event),
            ),
          );
        },
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: COLOR_PURPLE.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: COLOR_WHITE,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
