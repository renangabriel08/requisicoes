import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: height * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/loginRaw'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * .9, 50),
                ),
                child: const Text('Login Raw'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/loginForm'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * .9, 50),
                ),
                child: const Text('Login Form-Data'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastroRaw'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * .9, 50),
                ),
                child: const Text('Cadastro Raw'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastroForm'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * .9, 50),
                ),
                child: const Text('Cadastro Form-Data'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastroFoto'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * .9, 50),
                ),
                child: const Text('Cadastro Com Foto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
