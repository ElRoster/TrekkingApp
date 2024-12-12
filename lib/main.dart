import 'package:flutter/material.dart';
import 'Screens/ListarDatos.dart';

void main (){
  runApp(const GuiaApp());
}

class GuiaApp extends StatefulWidget{
  const GuiaApp({super.key});

  @override
  State<GuiaApp> createState() => _GuiaAppState();
}

class _GuiaAppState extends State<GuiaApp> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Guias',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      initialRoute: '/',
      routes: {
        '/': (context) =>ListGuiasScreen()
      },
    );
  }
}