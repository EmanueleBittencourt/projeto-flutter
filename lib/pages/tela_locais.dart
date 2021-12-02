import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLocais extends StatefulWidget {
  const TelaLocais({Key? key}) : super(key: key);

  @override
  _TelaLocaisState createState() => _TelaLocaisState();
}

class _TelaLocaisState extends State<TelaLocais> {
  late CollectionReference locais;

  @override
  void initState() {
    super.initState();
    locais = FirebaseFirestore.instance.collection('Cadastro');
  }

  Widget itemLista(item) {
    String nome = item.data()['Nome'];
    String rua = item.data()['Rua'];
    String bairro = item.data()['Bairro'];
    String cidade = item.data()['Cidade'];
    String estado = item.data()['Estado'];

    return ListTile(
      title: Text(nome, style: TextStyle(fontSize: 30)),
      subtitle: Text('$rua, $bairro, $cidade, $estado',
          style: TextStyle(fontSize: 25)),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            locais.doc(item.id).delete();
          }),
      onTap: () {
        Navigator.pushNamed(context, '/menu', arguments: item.id);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\nLocais cadastrados'),
          elevation: 15,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: locais.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                    child: Text('Não foi possível conectar ao Firebase'));

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              //dados recebidos
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return itemLista(dados.docs[index]);
                    });
            }
          }),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/inserir');
        },
      ),
    );
  }
}
