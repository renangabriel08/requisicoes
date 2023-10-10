import 'package:flutter/material.dart';
import 'package:requisicoes/pages/cadastroForm.dart';
import 'package:requisicoes/pages/cadastroFoto.dart';
import 'package:requisicoes/pages/cadastroRaw.dart';
import 'package:requisicoes/pages/home.dart';
import 'package:requisicoes/pages/loginForm.dart';
import 'package:requisicoes/pages/loginRaw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginForm': (context) => const LoginForm(),
        '/loginRaw': (context) => const LoginRaw(),
        '/cadastroForm': (context) => const CadastroForm(),
        '/cadastroRaw': (context) => const CadastroRaw(),
        '/cadastroFoto': (context) => const CadastroFoto(),
        '/home': (context) => const Home(),
      },
      initialRoute: '/home',
    );
  }
}
