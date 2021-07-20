import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Page1 extends StatefulWidget{
  @override 
  _ListaUsuario createState() => _ListaUsuario();
}

class _ListaUsuario extends State<Page1>{
  List<String> User=[];

  @override
  void initState(){
    super.initState();
    getRequest();
  }
  
  @override 
  Widget build(BuildContext context){
    return Center(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: User.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: new Text('${index + 1}.- ${User[index]}'),
                ),
              );
            },
          ),
        ),
      )
    );
  }

  Future getRequest() async {
    var url = Uri.parse('https://randomuser.me/api/?results=100');
    final response = await http.get(url);
    final Map<String, dynamic> json = convert.jsonDecode(response.body);
      
    for(var user in json['results']){
      String nombreCo= user['name']['title']+' ';
      nombreCo+=user['name']['first']+' ';
      nombreCo+=user['name']['last'];
      setState(() {
        User.add(nombreCo);
      });
    }
  }
}