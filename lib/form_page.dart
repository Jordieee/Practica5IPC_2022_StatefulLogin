import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ipc_jlincar_p5/card_page.dart';
import 'dart:core';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerPhone;

  DateTime? _day;
  String? name;
  String? phone;
  String? day = "No birthday selected";
  String? gender = "No gender selected";

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerPhone = TextEditingController();

  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPhone.dispose();
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
            flex: 2,
          ),
          _Body(context),
          const Spacer(
            flex: 1,
          ),
          ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => _createAlert(context)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                "Confirm Data",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              )),
          const Spacer(
            flex: 3,
          ),
        ]),
      ),
    );
  }

  Container _Body(BuildContext context) {
    return Container(
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
          SizedBox(
            width: 300,
            child: TextField(
              controller: _controllerName,
              keyboardType: TextInputType.name,
              onEditingComplete: () {
                setState(() {});
              },
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Introduce your name...",
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  )),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: _controllerPhone,
              keyboardType: TextInputType.name,
              onEditingComplete: () {
                setState(() {});
              },
              decoration: const InputDecoration(
                  labelText: "Telephone",
                  hintText: "Introduce your telephone...",
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.green,
                  )),
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
                                lastDate: DateTime(2099))
                            .then((pickedValue) {
                          if (pickedValue != null) {
                            _day = pickedValue;
                            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
                            day = dateFormat.format(_day!);
                            setState(() {});
                          } else {
                            debugPrint("Cancelled :(");
                          }
                        });
                      }),
                ),
                Text(
                  day!,
                )
              ],
            ),
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Gender: "),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text("Other"),
                        Radio(
                            value: "Other",
                            groupValue: gender,
                            onChanged: (String? newGender) {
                              setState(() {
                                gender = newGender;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("F"),
                        Radio(
                            value: "F",
                            groupValue: gender,
                            onChanged: (String? newGender) {
                              setState(() {
                                gender = newGender;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("M"),
                        Radio(
                            value: "M",
                            groupValue: gender,
                            onChanged: (String? newGender) {
                              setState(() {
                                gender = newGender;
                              });
                            }),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
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

AlertDialog _createAlert(BuildContext context) => AlertDialog(
      title: const Text("Your data"),
      content: Column(
        children: const [Text("Name")],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel")),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Accept")),
      ],
    );

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
