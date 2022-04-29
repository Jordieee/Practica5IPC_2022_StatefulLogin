import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:core';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late TextEditingController _controller;
  DateTime? _day;
  String? day = "Hola";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          _Header(),
          const Spacer(
            flex: 1,
          ),
          Container(
            width: 325,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Name", hintText: "Introduce your name..."),
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Telephone",
                        hintText: "Introduce your telephone..."),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            child: const Icon(Icons.calendar_today),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                            ),
                            onPressed: () {
                              showDatePicker(

                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2099)
                              ).then((pickedValue){
                                if(pickedValue != null){
                                  debugPrint("Ok => ${pickedValue.weekday}");
                                  _day = pickedValue;
                                  DateFormat dateFormat = DateFormat("dd MMMM yyyy");
                                  day = dateFormat.format(_day!);
                                  setState(() {});
                                }
                                else{
                                  debugPrint("Cancelled :(");
                                }
                              });
                            }
                        ),
                      ),
                      Text(day!,

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ]),
      ),
    );
  }

  //Header with CustomPainter
  CustomPaint _Header() {
    return CustomPaint(
        painter: MyPaint(),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Spacer(
                  flex: 1,
                ),
                Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.white,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Formulario de Datos",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ));
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 100)
      ..lineTo(size.width / 2, size.height + 25)
      ..lineTo(size.width, 100)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
