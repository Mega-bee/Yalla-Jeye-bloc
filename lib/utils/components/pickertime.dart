import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {

  bool read;

  String label;
  TextEditingController controller;
  DatePicker({ required this.controller,  required this.label, this.read=false});
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');
  final DateFormat _monthFormat = DateFormat('MMMM');
  final DateFormat _yearFormat = DateFormat('yyyy');
  final DateFormat _dayFormat = DateFormat('dd');

  DateTime _chosenDate=DateTime.now();
  String _chosenMonth="";
  String _chosenYear="";
  String _chosenDay="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chosenDate = DateTime.now();
    _chosenMonth = _monthFormat.format(_chosenDate);
    _chosenYear = _yearFormat.format(_chosenDate);
    _chosenDay = _dayFormat.format(_chosenDate);
  }


  void showPicker(ctx) {
    showCupertinoModalPopup(
        context: context,


        builder: (BuildContext builder) {

          return Container(
              height: MediaQuery
                  .of(context)
                  .copyWith()
                  .size
                  .height * 0.25,
              color: Theme.of(context).scaffoldBackgroundColor,
              child:
              CupertinoDatePicker(



                mode: CupertinoDatePickerMode.date,



                maximumDate: DateTime.now() ,
                initialDateTime: _chosenDate,

                minimumDate:_chosenDate,

                onDateTimeChanged: (dateTime) {
                  setState(() {
                    _chosenDate = dateTime;
                    _chosenDay = _dayFormat.format(dateTime);
                    _chosenMonth = _monthFormat.format(dateTime);
                    _chosenYear = _yearFormat.format(dateTime);
                    widget.controller.text = _dateFormat.format(dateTime);
                  });
                },
              ));
        });

  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    FocusNode focusNode = FocusNode();
    return  Container(

        padding: const EdgeInsets.all(1.0),
        child: TextFormField(

          readOnly: widget.read,
          controller: widget.controller,
          focusNode: focusNode,

          onTap: ()  {
            if(widget.read){
              showPicker(context);
            }
          },
          decoration: InputDecoration(



            // contentPadding:
            // EdgeInsets.only(left: mediaQuery.size.width * 0.04),

              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  fontSize: focusNode.hasFocus ? 18 : 16.0,//I believe the size difference here is 6.0 to account padding
                  color:
                  focusNode.hasFocus ? Theme.of(context).primaryColor : Colors.white ),
              labelText: widget.label,
              hintStyle:const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  ),

              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
                borderSide:  const BorderSide(
                  width: 0,
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:  const BorderSide(
                    width: 0,
                    color:Colors.grey
                  ))),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,

              ),
        ));
  }
}
