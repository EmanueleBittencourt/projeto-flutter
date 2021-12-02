import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_01/pages/criar_conta.dart';
import 'package:projeto_01/pages/inserir_documento.dart';
import 'package:projeto_01/pages/tela_ajuda.dart';
import 'package:projeto_01/pages/tela_cadastro.dart';
import 'package:projeto_01/pages/tela_cidades.dart';
import 'package:projeto_01/pages/tela_locais.dart';
import 'package:projeto_01/pages/tela_login.dart';
import 'package:projeto_01/pages/tela_menu.dart';
import 'package:projeto_01/pages/tela_pesquisa.dart';
import 'package:projeto_01/pages/tela_sobre.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/imagem': (context) => const TelaPrincipal(),
        '/login': (context) => const TelaLogin(),
        '/criar_conta': (context) => const TelaCriarConta(),
        '/sobre': (context) => const TelaSobre(),
        '/menu': (context) => const TelaMenu(),
        '/ajuda': (context) => const TelaAjuda(),
        '/cidades': (context) => const TelaCidades(),
        '/pesquisa': (context) => const TelaPesquisa(),
        '/inserir': (context) => const TelaInserirDoc(),
        '/cadastro': (context) => const TelaCadastro(),
        '/locais': (context) => const TelaLocais(),
      },
      title: 'Navegação',
      theme: ThemeData(
        primaryColor: Colors.teal[400],
        backgroundColor: Colors.green[50],
        focusColor: Colors.green[200],

        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.grey.shade900,
          ),
          headline2: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade900,
          ),
        ),

        //aparência do botão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[800],
            textStyle: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
      home: TelaLogin(),
    ),
  );
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
 

  @override
  
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
