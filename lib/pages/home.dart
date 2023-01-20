import 'package:flutter/material.dart';
import 'package:project_test/components/task.dart';
import 'package:project_test/pages/new_task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: ListView(children: const [
        Task('Aprender Flutter', 'assets/images/dash.png', 1),
        Task('Meditar', 'assets/images/meditar.jpeg', 5),
        Task('Jogar', 'assets/images/jogar.jpg', 3),
        SizedBox(
          height: 80,
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormPage()));
        },
      ),
    );
  }
}
