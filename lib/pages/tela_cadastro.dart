import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var txtNome = TextEditingController();
  var txtRua = TextEditingController();
  var txtBairro = TextEditingController();
  var txtCidade = TextEditingController();
  var txtEstado = TextEditingController();

  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('Cadastro')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('Nome');
      txtRua.text = doc.get('Rua');
      txtBairro.text = doc.get('Bairro');
      txtCidade.text = doc.get('Cidade');
      txtEstado.text = doc.get('Cidade');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty &&
          txtRua.text.isEmpty &&
          txtBairro.text.isEmpty &&
          txtCidade.text.isEmpty &&
          txtEstado.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('\Cadastre um local'),
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
                labelText: 'Nome do Local',
              ),
            ),
            TextField(
              controller: txtRua,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Rua e número',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtBairro,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Bairro',
              ),
            ),
            TextField(
              controller: txtCidade,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Cidade',
              ),
            ),
            TextField(
              controller: txtEstado,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                labelText: 'Estado',
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
                        FirebaseFirestore.instance.collection('Cadastro').add({
                          'Nome': txtNome.text,
                          'Rua': txtRua.text,
                          'Bairro': txtBairro.text,
                          'Cidade': txtCidade.text,
                          'Estado': txtEstado.text
                        });
                      } else {
                        //
                        // ATUALIZAR DOCUMENTO NO FIRESTORE
                        //
                        FirebaseFirestore.instance
                            .collection('Cadastro')
                            .doc(id.toString())
                            .set({
                          'Nome': txtNome.text,
                          'Rua': txtRua.text,
                          'Bairro': txtBairro.text,
                          'Cidade': txtCidade.text,
                          'Estado': txtEstado.text
                        });
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Cadastro de local realizado com sucesso!!'),
                        duration: Duration(seconds: 2),
                      ));

                      Navigator.pushNamed(context, '/menu');
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
