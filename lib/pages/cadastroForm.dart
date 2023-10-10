import 'package:flutter/material.dart';
import 'package:requisicoes/controllers/api_controller.dart';
import 'package:requisicoes/controllers/validate_controller.dart';

class CadastroForm extends StatefulWidget {
  const CadastroForm({super.key});

  @override
  State<CadastroForm> createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';
  String senha = '';
  String apelido = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Form'),
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
                    onChanged: (value) => apelido = value,
                    decoration: const InputDecoration(
                      label: Text('Apelido'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ApiController.cadastroForm(
                          nome,
                          email,
                          senha,
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
