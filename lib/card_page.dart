import 'package:flutter/material.dart';
import 'package:ipc_jlincar_p5/person_model.dart';



class CardPage extends StatelessWidget {
  CardPage({Key? key, required this.person}) : super(key: key);

  Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset("cat.jpg"),
            )
          ],
        )
      ),
    );
  }
}

