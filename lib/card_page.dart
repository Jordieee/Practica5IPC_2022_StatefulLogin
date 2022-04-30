import 'package:flutter/material.dart';
import 'package:ipc_jlincar_p5/person_model.dart';

class CardPage extends StatelessWidget {
  CardPage({Key? key, required this.person}) : super(key: key);

  Person person;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if(orientation == Orientation.landscape){
          return horizontal();
        }
        else{
          return vertical();
        }
      },
    );


  }

  Scaffold vertical() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Container(
                  width: 300,
                  height: 250,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/img/cat.jpg",
                          )))),
              const Spacer(
                flex: 1,
              ),
              Container(
                width: double.infinity,
                height: 390,
                color: Colors.green,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      person.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Text("Born " + person.birthday,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic)),
                    const Spacer(
                      flex: 1,
                    ),
                    Text("Gender: " + person.gender,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic)),
                    const Spacer(
                      flex: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text("+34 " + person.phone,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Scaffold horizontal() {
    return Scaffold(
    resizeToAvoidBottomInset: false,
    body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/img/cat.png",

                        )))),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: double.infinity,
              width: 390,
              color: Colors.green,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    person.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Text("Born " + person.birthday,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic)),
                  const Spacer(
                    flex: 1,
                  ),
                  Text("Gender: " + person.gender,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic)),
                  const Spacer(
                    flex: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("+34 " + person.phone,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
            )
          ],
        )),
  );
  }
}
