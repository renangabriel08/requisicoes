import 'package:flutter/material.dart';
import 'package:requisicoes/controllers/api_controller.dart';
import 'package:requisicoes/controllers/validate_controller.dart';

class CadastroRaw extends StatefulWidget {
  const CadastroRaw({super.key});

  @override
  State<CadastroRaw> createState() => _CadastroRawState();
}

class _CadastroRawState extends State<CadastroRaw> {
  final _formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';
  String senha = '';
  String dr = '';
  String id = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Raw'),
      ),
      body: SizedBox(
        width: width,
        height: height * .6,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => nome = value,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => email = value,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => senha = value,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => dr = value,
                    decoration: const InputDecoration(
                      label: Text('DR'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => id = value,
                    decoration: const InputDecoration(
                      label: Text('Id tipo user'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ApiController.cadastroRaw(
                          nome,
                          email,
                          senha,
                          dr,
                          id,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * .9, 50),
                    ),
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
