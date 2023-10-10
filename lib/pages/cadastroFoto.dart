import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:requisicoes/controllers/api_controller.dart';
import 'package:requisicoes/controllers/validate_controller.dart';

class CadastroFoto extends StatefulWidget {
  const CadastroFoto({super.key});

  @override
  State<CadastroFoto> createState() => _CadastroFotoState();
}

class _CadastroFotoState extends State<CadastroFoto> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String senha = '';
  String nome = '';
  String usuario = '';
  String celular = '';

  var image;
  Future abrirCamera(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        this.image = File(image.path);
      });
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Foto'),
      ),
      body: SizedBox(
        width: width,
        height: height * .8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      image != null
                          ? SizedBox(
                              width: 110,
                              height: 140,
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              width: 110,
                              height: 140,
                              color: Colors.blue,
                            ),
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => abrirCamera(ImageSource.camera),
                          child: Container(
                            width: 110,
                            height: 30,
                            color: Colors.blue,
                            child: const Center(
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                        ),
                      )
                    ],
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
                    onChanged: (value) => nome = value,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => usuario = value,
                    decoration: const InputDecoration(
                      label: Text('Usuário'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) => Validate.validarDados(value),
                    onChanged: (value) => celular = value,
                    decoration: const InputDecoration(
                      label: Text('Celular'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ApiController.cadastroFoto(
                          email,
                          senha,
                          nome,
                          usuario,
                          celular,
                          File(image.path),
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
