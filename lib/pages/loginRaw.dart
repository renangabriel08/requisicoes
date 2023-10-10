import 'package:flutter/material.dart';
import 'package:requisicoes/controllers/api_controller.dart';
import 'package:requisicoes/controllers/validate_controller.dart';

class LoginRaw extends StatefulWidget {
  const LoginRaw({super.key});

  @override
  State<LoginRaw> createState() => _LoginRawState();
}

class _LoginRawState extends State<LoginRaw> {
  final _formKey = GlobalKey<FormState>();

  String user = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Raw'),
      ),
      body: SizedBox(
        width: width,
        height: height * .4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => user = value,
                    decoration: const InputDecoration(
                      label: Text('Usuário'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => senha = value,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final res = await ApiController.loginRaw(user, senha);
                        print(res);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * .9, 50),
                    ),
                    child: const Text('Entrar'),
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
