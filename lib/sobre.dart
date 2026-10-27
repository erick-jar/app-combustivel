import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
const SobrePage({super.key});

@override
Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text(
        'Sobre o Aplicativo',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
    ),
    body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Center(
            child: Icon(Icons.info_outline, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            
            const Text(
            'Desenvolvedor:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Text(
              'erick-jar', // Substitua pelo seu nome completo se preferir
            style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            
            const Text(
            'Objetivo do Aplicativo:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Text(
            'Aplicativo mobile desenvolvido em Flutter com o propósito de calcular a eficiência de combustível de um veículo. Ele processa a quilometragem percorrida em relação aos litros consumidos, classificando o rendimento entre Consumo Alto, Médio ou Econômico de forma prática e intuitiva.',
            style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
            textAlign: TextAlign.justify,
            ),
        ],
        ),
    ),
    bottomNavigationBar: const BottomAppBar(
        padding: EdgeInsets.all(0),
        color: Colors.blue, 
        height: 30.0,       
        child: Center(       
        child: Text(
            'Erick-jar', 
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500), 
            textAlign: TextAlign.center,
        ),
        ),
    ),
);
}
}
