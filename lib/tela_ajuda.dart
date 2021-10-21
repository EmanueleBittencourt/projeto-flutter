import 'package:flutter/material.dart';
import 'package:projeto_01/tela_menu.dart';

class TelaAjuda extends StatefulWidget {
  const TelaAjuda({Key? key}) : super(key: key);

  @override
  _TelaAjudaState createState() => _TelaAjudaState();
}

class _TelaAjudaState extends State<TelaAjuda> {
  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nNos ajude a melhorar'),
          elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
              child: Text(
                'Responda as perguntas abaixo, sua contribuição é muito importante!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (16),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Não consegui usar na minha cidade'),
                          Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: checked1,
                            onChanged: (bool? value) {
                              setState(() {
                                checked1 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Não achei o app intitivo'),
                          Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: checked2,
                            onChanged: (bool? value) {
                              setState(() {
                                checked2 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Tive problemas com o Login'),
                          Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: checked3,
                            onChanged: (bool? value) {
                              setState(() {
                                checked3 = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: (16),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Muito obrigado!!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('Fechar'),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
