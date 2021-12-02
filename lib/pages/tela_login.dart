import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nFoundee'),
          elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person_pin_circle_sharp,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              //entrada de texto e número para nome do usuário
              TextFormField(
                controller: txtEmail,
                autofocus: true,
                style: new TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Nome de usuário",
                  labelStyle: Theme.of(context).textTheme.headline3,
                ),
              ),
              Divider(),
              Divider(),
              //entradad de texto e número para senha
              TextFormField(
                controller: txtSenha,
                autofocus: true,
                obscureText: true,
                style: new TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: Theme.of(context).textTheme.headline3,
                ),
              ),
              Divider(),
              Divider(),
              //botão de "entrar" para fazer login
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(45),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                  
                },
              ),

              Divider(),

              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(45),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/criar_conta');
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void login(email, senha) {

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha).then((value) {
      Navigator.pushNamed(context, '/sobre');

    }).catchError((erro){

      var mensagem = '';
      if (erro.code == 'user-not-found'){
        mensagem = 'ERRO: Usuário não encontrado';
      }else if (erro.code == 'wrong-password'){
        mensagem = 'ERRO: Senha incorreta';
      }else if ( erro.code == 'invalid-email'){
        mensagem = 'ERRO: Email inválido';
      }else{
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensagem),
            duration: const Duration(seconds:2)
          )
      );

    });
  }
}
