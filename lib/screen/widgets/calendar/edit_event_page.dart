import 'package:flutter/material.dart';
import 'package:myrutin/model/event.dart';
import 'package:myrutin/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../provider/event_provider.dart';
import '../../../utils/utils.dart';

class EditEventPage extends StatefulWidget {
  final Event? event;
  EditEventPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
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
    } else {
      final event = widget.event!;

      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_LIGHTBLUE,
      appBar: AppBar(
        backgroundColor: COLOR_WHITE,
        foregroundColor: COLOR_PURPLE,
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
              buildDescription(),
              buildEditAction(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditAction() => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: COLOR_PURPLE,
          onPrimary: COLOR_WHITE,
          shadowColor: COLOR_WHITE,
        ),
        onPressed: saveForm,
        icon: Icon(Icons.done),
        label: Text('Update'),
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

  Widget buildDate(String title, DateTime date) {
    return Container();
  }

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
      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);

      if (isEditing) {
        provider.editEvent(event, widget.event!);

        Navigator.of(context).pop();
      } else {
        provider.addEvent(event);
      }

      Navigator.of(context).pop();
    }
  }
}
