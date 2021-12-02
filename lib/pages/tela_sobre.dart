import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nSobre este projeto'),
          elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Image.asset('lib/imagens/foto2.jpeg'),
            ),
            Divider(),
            Column(
              children: [
                Container(
                  child: Text(
                    'Olá! Bem vindo ao Foundee! Meu nome é Emanuele, e este projeto tem como objetivo fazer com que os usuários possam usar o aplicativo Foundee para encontrar locais e comércios mais próximos de suas casas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Esta versão trata-se de um teste para verificar as principais necessidades dos usuários e de que maneira podemos desenvolver algo que realmente irá ajudá-los.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
           //Divider(),
            Container(
              //padding: EdgeInsets.all(20),
              color: Theme.of(context).backgroundColor,
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(20),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                child: Text(
                  'Clique aqui para entrar no menu',
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: (16),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
