import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoPicker extends StatefulWidget {
  String label;
  TextInputType inputType;
  List<String> items = ["MALE", "FEMALE", "RATHER NOT TO SAY"];

  int selectedValue;

  TextEditingController controller = TextEditingController();

  CustomCupertinoPicker(
      {required this.label,
      required this.inputType,
      required this.items,
      this.selectedValue = 0,
      required this.controller});

  @override
  State<CustomCupertinoPicker> createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  final FocusNode _focusNode = FocusNode();
  buildItems() {
    List<Widget> items = [];
    for (int i = 0; i < widget.items.length; i++) {
      items.add(
        Center(
            child: Text(
          widget.items[i].toString(),
          style: TextStyle(color: Theme.of(context).primaryColor),
        )),
      );
    }
    return items;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: const Border(
                    bottom: BorderSide(
                      width: 0.25,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text(
                        "Pick " + widget.label.toLowerCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        if (widget.label == 'Gender') {
                          Navigator.of(context).pop();
                        }
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: CupertinoPicker(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      // widget.id=authProvider.genderIdList[value].id;

                      widget.selectedValue = value;
                      widget.controller.text =
                          widget.items[widget.selectedValue];
                    });
                  },
                  scrollController: FixedExtentScrollController(
                      initialItem: widget.selectedValue - 1),
                  itemExtent: 40.0,
                  children: [...buildItems()],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 11,
      // margin: EdgeInsets.only(bottom: 5),
      // padding: EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //     color: Colors.white, //white
      //     borderRadius: BorderRadius.all(Radius.circular(45))),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          alignLabelWithHint: true,
          hintText: widget.label,
          filled: true,
//          fillColor: Theme.of(context).scaffoldBackgroundColor,
//          border: OutlineInputBorder(
//            borderRadius: BorderRadius.all(Radius.circular(12)),
//            borderSide: BorderSide(
//              color: Colors.red,
//            ),
//          ),
//          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(5.0),
//            borderSide: const BorderSide(
//            ),
//          ),
        ),
        focusNode: _focusNode,
        controller: widget.controller,
        onTap: () {
          _focusNode.unfocus();
          showPicker(context);
        },
        readOnly: true,
        keyboardType: widget.inputType,
      ),
    );
  }
}

