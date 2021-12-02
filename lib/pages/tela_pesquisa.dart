import 'package:flutter/material.dart';

class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({Key? key}) : super(key: key);

  @override
  _TelaPesquisaState createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nPesquisar locais perto de você'),
          elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Icon(
                Icons.search,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              //Divider(),
              Container(
                  child: TextFormField(
                  autofocus: true,
                  style: new TextStyle(color: Colors.black, fontSize: 11),
                  decoration: InputDecoration(
                    labelText: "Busque o local que deseja encontrar",
                    labelStyle: Theme.of(context).textTheme.headline2,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              //Divider(),
              Container(
                padding: EdgeInsets.all(50),
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
                    'Buscar',
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
                            title: Text(
                                'Desculpe, página em manutenção!! Em breve voltaremos.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
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
      ),
    );
  }
}
