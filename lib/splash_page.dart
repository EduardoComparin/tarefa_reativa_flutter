import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tarefa_reativa_flutter/page/tarefa_list_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 80,
                child: ClipRRect(
                  child: Image.asset('assets/images/ideia.png'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    repeatForever: false,
                    onFinished: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => TarefaListPage()));
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Lista de tarefa',
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Horizon',
                        ),
                        speed: Duration(milliseconds: 100)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
