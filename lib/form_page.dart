import 'package:flutter/material.dart';


class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(

          children: [
            _Header(),
          ]
        ),
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
                      Spacer(flex: 1,),
                      Icon(Icons.menu, size: 40, color: Colors.white,),
                      Spacer(flex: 2,),
                      Text(
                        "Formulario de Datos",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(flex: 3,),
                    ],
                  ),
                ),
              )

          );
  }
}

class MyPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint();
    
    paint
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    
    final path = Path()
      ..moveTo(0, 100)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 100)
      ..lineTo(200, 125);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}
