import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ipc_jlincar_p5/card_page.dart';
import 'package:ipc_jlincar_p5/person_model.dart';
import 'dart:core';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  DateTime? _day;
  String name = "No name selected";
  String phone = "No phone selected";
  String birthday = "No birthday selected";
  String gender = "No gender selected";

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
          _Button(context),
          const Spacer(
            flex: 3,
          ),
        ]),
      ),
    );
  }

  ElevatedButton _Button(BuildContext context) {
    return ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    _createAlert(context, name, phone, birthday, gender)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text(
              "Confirm Data",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ));
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
              keyboardType: TextInputType.name,
              onChanged: (newName) {
                setState(() {
                  name = newName;
                });
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
              keyboardType: TextInputType.name,
              onChanged: (newPhone) {
                setState(() {
                  phone = newPhone;
                });
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
                            birthday = dateFormat.format(_day!);
                            setState(() {});
                          } else {
                            debugPrint("Cancelled :(");
                          }
                        });
                      }),
                ),
                Text(
                  birthday,
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
                                gender = newGender!;
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
                                gender = newGender!;
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
                                gender = newGender!;
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

AlertDialog _createAlert(BuildContext context, String name, String phone, String birthday, String gender) =>
    AlertDialog(
      title: const Text("Your data"),
      content: SizedBox(
        width: 300,
        height: 200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name:", style: TextStyle(fontSize: 15)),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 50,
                height: 5,
                color: Colors.green,
              ),
            ],
          ),
          const Spacer(flex: 1,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Telephone:", style: TextStyle(fontSize: 15)),
              Text(phone, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 50,
                height: 5,
                color: Colors.green,
              ),
            ],
          ),
          const Spacer(flex: 1,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Birthday:", style: TextStyle(fontSize: 15)),
              Text(birthday, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 50,
                height: 5,
                color: Colors.green,
              ),
            ],
          ),
          const Spacer(flex: 1,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Gender:", style: TextStyle(fontSize: 15)),
              Text(gender, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 50,
                height: 5,
                color: Colors.green,
              ),
            ],
          ),

        ]),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              Person person = Person(name: name, phone: phone, birthday: birthday, gender: gender);
              var route = MaterialPageRoute(builder: (context) => CardPage(
                person: person,
              ));
              Navigator.of(context).pop();
              Navigator.of(context).push(route);
            },
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
