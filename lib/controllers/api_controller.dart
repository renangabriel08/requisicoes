import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiController {
  static loginRaw(String usuario, String senha) async {
    final url = Uri.parse('http://192.168.5.16:3000/tp01/usuarios/login');

    final req = await http.post(
      url,
      body: {"usuario": usuario, "senha": senha},
    );

    if (req.statusCode == 200) {
      final res = jsonDecode(utf8.decode(req.bodyBytes));
      print(res);
    } else {
      print(req.statusCode);
    }
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
      body: {
        "nome": "teste",
        "email": "teste@gamil.com",
        "senha": "1234",
        "dr": "SP",
        "tipoUsuarioId": "1"
      },
      headers: {
        'Content-Type': 'application/json',
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
    File imagem,
  ) async {
    final url = Uri.parse('http://192.168.5.16:3000/tp01/usuarios/cadastro');
    final stream = http.ByteStream(imagem.openRead());
    final length = await imagem.length();
    final req = http.MultipartRequest('POST', url);

    req.fields['email'] = email;
    req.fields['senha'] = senha;
    req.fields['nome'] = nome;
    req.fields['usuario'] = usuario;
    req.fields['celular'] = celular;

    req.files.add(
      http.MultipartFile(
        'imagem',
        stream,
        length,
        filename: imagem.path.split('/').last,
      ),
    );

    final res = await req.send();

    print(res.statusCode);
  }
}
