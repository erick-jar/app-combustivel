import 'package:flutter/material.dart';
import 'sobre.dart';

void main() {
  runApp(const MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const Home({super.key}); 

  @override
  State<Home> createState() => _HomeState(); 
}

class _HomeState extends State<Home> {
  // Controladores para capturar o texto dos inputs
  final TextEditingController kmController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();

  String _infoText = 'Informe os dados do veículo!';

  // Função para limpar os campos e o resultado
  void _resetFields() {
    kmController.text = '';
    litrosController.text = '';
    setState(() {
      _infoText = 'Informe os dados do veículo!';
    });
  }

  // Função para calcular o consumo de combustível
  void _calculate() {
    setState(() {
      if (kmController.text.isEmpty || litrosController.text.isEmpty) {
        _infoText = "Por favor, preencha todos os campos!";
        return;
      }

      double km = double.parse(kmController.text.replaceAll(',', '.'));
      double litros = double.parse(litrosController.text.replaceAll(',', '.'));

      if (litros == 0) {
        _infoText = "A quantidade de litros não pode ser zero!";
        return;
      }

      // Fórmula: Consumo = Quilômetros / Litros
      double consumo = km / litros;
      String resultadoFormatado = consumo.toStringAsFixed(1).replaceAll('.', ',');

      if (consumo < 8.0) {
        _infoText = "Consumo: $resultadoFormatado km/l\nClassificação: Consumo Alto ⚠️";
      } else if (consumo >= 8.0 && consumo <= 12.0) {
        _infoText = "Consumo: $resultadoFormatado km/l\nClassificação: Consumo Médio 😐";
      } else {
        _infoText = "Consumo: $resultadoFormatado km/l\nClassificação: Econômico 🚗";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader( 
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ), 
            ListTile(
              title: const Text('Consumo de Combustível'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SobrePage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Consumo de Combustível',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
        ),
        backgroundColor: Colors.blue, 
        centerTitle: true, 
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: _resetFields, 
            icon: const Icon(Icons.refresh, color: Colors.white), 
            tooltip: 'Limpar tudo',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.local_gas_station, size: 120, color: Colors.blue),
            
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue, fontSize: 25),
              decoration: const InputDecoration(
                labelText: 'Quilômetros percorridos',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              controller: kmController,
            ),
            
            const SizedBox(height: 20),
            
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue, fontSize: 25),
              decoration: const InputDecoration(
                labelText: 'Litros consumidos',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              controller: litrosController,
            ),
            
            const SizedBox(height: 30),
            
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text(
                        "CALCULAR",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _resetFields,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                    child: const Text(
                      "LIMPAR",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
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
