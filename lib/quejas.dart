import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Necesario para formatear la fecha

class QuejasPage extends StatefulWidget {
  final String title;
  const QuejasPage({super.key, required this.title});
  @override
  State<QuejasPage> createState() => _QuejasPageState();
}

class _QuejasPageState extends State<QuejasPage> {
  final TextEditingController _asunto = TextEditingController();
  final TextEditingController _detalldequeja = TextEditingController();
  late TextEditingController _fechaController; // Controlador para la fecha
  String _mensajeLogin = '';

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de fecha con la fecha actual
    String fechaActual = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _fechaController = TextEditingController(text: fechaActual);
  }

  void _registrarQueja() {
    setState(() {
      _mensajeLogin = 'Queja registrada el ${_fechaController.text}';
    });
  }

  @override
  void dispose() {
    _fechaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Formulario de Quejas',
              style: TextStyle(fontSize: 20, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _asunto,
              decoration: const InputDecoration(
                labelText: 'Asunto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _detalldequeja,
              decoration: const InputDecoration(
                labelText: 'Detalle Queja (Especificar Fecha)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _fechaController, // Controlador de la fecha
              decoration: const InputDecoration(
                labelText: 'Fecha de Queja',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Solo lectura, no editable
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarQueja,
              child: const Text('Enviar queja'),
            ),
            const SizedBox(height: 20),
            Text(
              _mensajeLogin,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
