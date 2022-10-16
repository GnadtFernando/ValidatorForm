import 'package:flutter/material.dart';
import 'package:teste_formulario_validador/validate.dart';
import 'package:validatorless/validatorless.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Validate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          onChanged: () {
            setState(() {
              controller.valid == true;
            });
          },
          child: Column(
            children: [
              TextFormField(
                  onChanged: (value) {
                    if (value.length == 5) {
                      controller.isCpf = true;
                    } else {
                      controller.isCpf = false;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.text1,
                  key: controller.key1,
                  validator: Validatorless.required('teste')),
              controller.isCpf == true
                  ? TextFormField(
                      key: controller.key4,
                      controller: controller.text4,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: Validatorless.required('Teste'))
                  : Column(
                      children: [
                        TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.text2,
                            key: controller.key2,
                            validator: Validatorless.required('Teste')),
                        TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.text3,
                            key: controller.key3,
                            validator: Validatorless.required('teste')),
                      ],
                    ),
              Checkbox(
                value: controller.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    controller.isChecked = value!;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: controller.isChecked == true &&
                          controller.validate() == true
                      ? () {}
                      : null,
                  child: const Text('Teste')),
            ],
          ),
        ),
      ),
    );
  }
}
