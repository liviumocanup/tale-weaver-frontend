/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tale_weaver/constants.dart';

class BirthDatePicker extends StatefulWidget{
  final IconData iconData;
  final String text;
  final Color iconColor;

  const BirthDatePicker({
    super.key,
    required this.iconData,
    required this.text,
    this.iconColor = kPrimaryColor,
  });

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();

}

class _BirthDatePickerState extends State<BirthDatePicker>{
  DateTime? _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();

  void savePickedDate(DateTime pickedDate) {
    setState(() {
      _selectedDate = pickedDate;
      _textEditingController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => _selectDate(),
        child: AbsorbPointer(
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
              icon: Icon(widget.iconData, color: widget.iconColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              labelText: widget.text,
            ),
          ),
        ),
      ),
    );
  }

  _selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = DateTime.now();
        Size size = MediaQuery.of(context).size;

        return SizedBox(
          height: size.height*0.3,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop(tempPickedDate);
                    },
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                maximumDate: DateTime.now(),
                //initialDateTime cannot be greater than maximumDate 
                initialDateTime: DateTime.now().subtract(const Duration(days: 1)),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      savePickedDate(pickedDate);
    }
  }
  
  
}
*/
