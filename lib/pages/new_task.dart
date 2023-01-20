import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(title: const Text('Nova tarefa')),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                    height: 650,
                    width: 375,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              controller: nameController,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Nome',
                                  fillColor: Colors.white70,
                                  filled: true),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'Insira o nome da tarefa';
                                }

                                return null;
                              },
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              controller: difficultyController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Dificuldade',
                                  fillColor: Colors.white70,
                                  filled: true),
                              validator: (String? value) {
                                int difficultyNumber = int.parse(value!);

                                if (difficultyNumber > 5 ||
                                    difficultyNumber < 1) {
                                  return 'Insira uma dificuldade entre 1 e 5';
                                }

                                return null;
                              },
                            )),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              keyboardType: TextInputType.url,
                              controller: imageController,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Imagem',
                                  fillColor: Colors.white70,
                                  filled: true),
                              onChanged: (text) {
                                setState(() {});
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Insira uma URL de imagem!';
                                }

                                return null;
                              },
                            )),
                        Container(
                            height: 100,
                            width: 72,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.blue)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageController.text,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 42,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Deu bom');
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Tarefa criada!')));
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Adicionar'))
                      ],
                    )),
              ),
            )));
  }
}
