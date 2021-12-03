import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaInserirDoc extends StatefulWidget {
  const TelaInserirDoc({Key? key}) : super(key: key);

  @override
  _TelaInserirDocState createState() => _TelaInserirDocState();
}

class _TelaInserirDocState extends State<TelaInserirDoc> {
  var txtNome = TextEditingController();
  var txtCPF = TextEditingController();
  var txtTelefone = TextEditingController();

  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('CriarConta')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('Nome completo');
      txtCPF.text = doc.get('CPF');
      txtTelefone.text = doc.get('Telefone');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty &&
          txtCPF.text.isEmpty &&
          txtTelefone.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\Inserir dados pessoais'),
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
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtCPF,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'CPF',
              ),
            ),
            TextField(
              controller: txtTelefone,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: const Text('Salvar'),
                    onPressed: () {
                      if (id == null) {
                        //
                        // ADICIONAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('CriarConta')
                            .add({
                          'Nome Completo': txtNome.text,
                          'CPF': txtCPF.text,
                          'Telefone': txtTelefone.text
                        });
                      } else {
                        //
                        // ATUALIZAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('CriarConta')
                            .doc(id.toString())
                            .set({
                          'Nome Completo': txtNome.text,
                          'CPF': txtCPF.text,
                          'Telefone': txtTelefone.text
                        });
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Conta criada com sucesso!!'),
                        duration: Duration(seconds: 2),
                      ));

                      Navigator.pushNamed(context, '/sobre');
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
