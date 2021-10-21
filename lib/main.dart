import 'package:flutter/material.dart';
import 'package:projeto_01/tela_login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',

        theme: ThemeData(
        primaryColor: Colors.teal[400],
        backgroundColor: Colors.green[50],
        focusColor: Colors.green[200],

        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.grey.shade900,
          ),
          headline2: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade900,
          ),
        ),

        //aparência do botão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[800],
            textStyle: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),

      home: TelaLogin(),
    ),
    
  );
 

}

class TelaImagem extends StatelessWidget {
  const TelaImagem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 30),

        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,

          border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
          ),

          borderRadius: BorderRadius.all(
          Radius.circular(20),
          ),
        ),
          
    );
    
  }
}
