import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCriarConta extends StatefulWidget {
  const TelaCriarConta({Key? key}) : super(key: key);

  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

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
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Usuário',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style: const TextStyle(
                  color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            Divider(),
            Divider(),

            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(30),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Criar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                Navigator.pushNamed(context, '/inserir');
              },
            ),

            Divider(),

            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(30),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            //const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
    /*    .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário criado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushNamed(context, '/inserir');      

    })
    */
      .catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ERRO: ${erro.message}'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }
}

//login manubitqui@gmail.com
//senha: magui2010

//tentar emanuelebittencourt3@gmail.com
//senha: magui2010