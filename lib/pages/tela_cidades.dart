import 'package:flutter/material.dart';

class TelaCidades extends StatefulWidget {
  const TelaCidades({Key? key}) : super(key: key);

  @override
  _TelaCidadesState createState() => _TelaCidadesState();
}

class _TelaCidadesState extends State<TelaCidades> {
  //lista dinâmica para armazenamento das tarefas

  var lista = [];

  @override
  void initState() {
    lista.add("Araraquara");
    lista.add("Brodosqui");
    lista.add("Cajuru");
    lista.add("Jaboticabal");
    lista.add("Monte Alto");
    lista.add("Ribeirão Preto");
    lista.add("Sertãozinho");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nCidades que já estamos atuando'),
          //elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Theme.of(context).backgroundColor,
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 15,
              shadowColor: Theme.of(context).primaryColor,
              child: ListTile(
                title: Text(
                  lista[index],
                  style: TextStyle(fontSize: 14),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.pin_drop),
                  onPressed: () {},
                ),
                hoverColor: Theme.of(context).primaryColor,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Em breve novidades em ${lista[index]} :D'),
                    duration: Duration(seconds: 2),
                  ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
