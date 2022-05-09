import 'package:flutter/material.dart';
import 'package:myrutin/model/event.dart';
import 'package:myrutin/provider/event_provider.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../../utils/utils.dart';

class CalendarEvent extends StatefulWidget {
  final Event? event;
  const CalendarEvent({Key? key, this.event}) : super(key: key);

  @override
  State<CalendarEvent> createState() => _CalendarEventState();
}

class _CalendarEventState extends State<CalendarEvent> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  Widget build(BuildContext context) => Scaffold(
        backgroundColor: COLOR_LIGHTBLUE,
        appBar: AppBar(
          backgroundColor: COLOR_WHITE,
          leading: CloseButton(),
          title: Title(color: COLOR_BLACK, child: Text('Add Event')),
          foregroundColor: COLOR_PURPLE,
          // actions: buildEditAction(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                SizedBox(height: 12),
                buildDateTimePicker(),
                SizedBox(height: 12),
                buildDescription(),
                buildEditAction(),
              ],
            ),
          ),
        ),
      );

  Widget buildEditAction() => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: COLOR_PURPLE,
          onPrimary: COLOR_WHITE,
          shadowColor: COLOR_WHITE,
        ),
        onPressed: saveForm,
        icon: Icon(Icons.done),
        label: Text('Save'),
      );

  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Add Title'),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Add Description'),
        onFieldSubmitted: (_) => saveForm(),
        controller: descController,
      );

  Widget buildDateTimePicker() => Column(
        children: [
          buildForm(),
          buildTo(),
        ],
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2000),
          lastDate: DateTime(2200));
      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildForm() => buildHeader(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropdownField(
              text: Utils.toDate(fromDate),
              onClicked: () => pickFromDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropdownField(
              text: Utils.toTime(fromDate),
              onClicked: () => pickFromDateTime(pickDate: false),
            ),
          ),
        ],
      ));

  Widget buildTo() => buildHeader(
      header: 'TO',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropdownField(
              text: Utils.toDate(toDate),
              onClicked: () => pickToDateTime(pickDate: true),
            ),
          ),
          Expanded(
            child: buildDropdownField(
              text: Utils.toTime(toDate),
              onClicked: () => pickToDateTime(pickDate: false),
            ),
          ),
        ],
      ));

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
        title: titleController.text,
        from: fromDate,
        to: toDate,
        description: descController.text,
        isAllDay: false,
      );

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);

      Navigator.of(context).pop();
    }
  }
}
