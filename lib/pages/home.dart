import 'package:flutter/material.dart';
import 'package:project_test/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(children: const [
          Task('Aprender Flutter', 'assets/images/dash.png', 1),
          Task('Meditar', 'assets/images/meditar.jpeg', 5),
          Task('Jogar', 'assets/images/jogar.jpg', 3),
          SizedBox(
            height: 80,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove_red_eye),
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
      ),
    );
  }
}
