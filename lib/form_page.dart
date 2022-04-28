import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  late TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose(){
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
          const Spacer(flex: 1,),
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
              children: const [
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Introduce your name..."
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Telephone",
                        hintText: "Introduce your telephone..."
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(flex: 3,),
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
      ..moveTo(0, 100)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 100)
      ..lineTo(210, 125);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
