import 'package:flutter/material.dart';
import 'package:projeto_01/tela_sobre.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

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
              //entradad de texto e número para nome do usuário
              TextFormField(
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => TelaSobre())
                    );
                },
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
