import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  static loginRaw(String usuario, String senha) {
    final url = Uri.parse('localhost:3000/tp01/usuarios/login');
  }

  static loginForm(String email, String senha) async {
    final url = Uri.parse('https://fredaugusto.com.br/simuladodrs/token');
    final req = http.MultipartRequest('POST', url);

    req.fields['email'] = email;
    req.fields['senha'] = senha;

    final res = await req.send();

    print(res.statusCode);
  }

  static cadastroRaw(
    String nome,
    String email,
    String senha,
    String dr,
    String id,
  ) async {
    final url = Uri.parse(
      'https://apieuvounatrip.azurewebsites.net/api/Usuarios',
    );
    final req = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        "nome": "teste",
        "email": "teste@gamil.com",
        "senha": "1234",
        "dr": "SP",
        "tipoUsuarioId": "1"
      },
    );

    if (req.statusCode == 200) {
      print(req.statusCode);
      final res = await jsonDecode(utf8.decode(req.bodyBytes));
      print(res);
    } else {
      print(req.statusCode);
      final res = await jsonDecode(utf8.decode(req.bodyBytes));
      print(res);
    }
  }

  static cadastroForm(String nome, String email, String senha) async {
    final url = Uri.parse('https://fredaugusto.com.br/simuladodrs/users');
    final req = http.MultipartRequest('POST', url);

    req.fields['nome_user'] = nome;
    req.fields['email_user'] = email;
    req.fields['senha_user'] = senha;

    final res = await req.send();

    print(res.statusCode);
  }

  static cadastroFoto(
    String email,
    String senha,
    String nome,
    String usuario,
    String celular,
    String imagem,
  ) {
    final url = Uri.parse('localhost:3000/tp01/usuarios/cadastro');
  }
}
