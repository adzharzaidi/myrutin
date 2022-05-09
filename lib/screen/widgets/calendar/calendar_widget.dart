import 'package:flutter/material.dart';
import 'package:myrutin/model/event_data_source.dart';
import 'package:myrutin/provider/event_provider.dart';
import 'package:myrutin/screen/widgets/calendar/calendar_task.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => CalendarTask(),
        );
      },
      cellBorderColor: Colors.transparent,
      backgroundColor: COLOR_LIGHTBLUE,
      todayHighlightColor: COLOR_PURPLE,
      selectionDecoration: BoxDecoration(
        color: COLOR_PURPLE.withOpacity(0.4),
        border: Border.all(color: COLOR_PURPLE, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
