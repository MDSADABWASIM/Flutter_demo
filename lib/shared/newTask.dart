import 'package:demo/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Returns an AlertDialog that Adds new location in local db
class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
    Key key,
    this.markerIdVal,
    this.latitude,
    this.longitude,
  }) : super(key: key);
  final String markerIdVal;
  final double longitude;
  final double latitude;
  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Enter the place name'),
        content: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTextField(context),
          ],
        ),
        actions: <Widget>[
          Center(
              child: RaisedButton(
            shape: OutlineInputBorder(),
            color: Colors.red[300],
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          )),
        ]);
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter name of Place'),
        onSubmitted: (inputName) {
          final database = Provider.of<AppDatabase>(context);
          final task = Task(
              markerId: widget.markerIdVal,
              name: inputName,
              lang: widget.longitude,
              lat: widget.latitude);
          database.insertTask(task);
          Navigator.pop(context, inputName);
        },
      ),
    );
  }

}
