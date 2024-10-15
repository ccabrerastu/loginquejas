import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha

class QuejasPage extends StatefulWidget {
  final String title;
  const QuejasPage({super.key, required this.title});
  @override
  State<QuejasPage> createState() => _QuejasPageState();
}

class _QuejasPageState extends State<QuejasPage> {
  final TextEditingController _asunto = TextEditingController();
  final TextEditingController _detalldequeja = TextEditingController();
  final TextEditingController _direccioncasa = TextEditingController();
  
  late TextEditingController _fechaController; 
  final TextEditingController _fechaSeleccionadaController = TextEditingController(); 
  String _mensajeLogin = '';

  @override
  void initState() {
    super.initState();
    String fechaActual = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _fechaController = TextEditingController(text: fechaActual); 
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),  
      lastDate: DateTime(2100),   
    );

    if (selectedDate != null) {
      setState(() {
        _fechaSeleccionadaController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  void _registrarQueja() {
    setState(() {
      _mensajeLogin = 'Queja registrada el ${_fechaSeleccionadaController.text.isNotEmpty ? _fechaSeleccionadaController.text : _fechaController.text}';
    });
  }

  @override
  void dispose() {
    _fechaController.dispose();
    _fechaSeleccionadaController.dispose();
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
                labelText: 'Detalle Queja',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _direccioncasa,
              decoration: const InputDecoration(
                labelText: 'Dirección Casa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _fechaSeleccionadaController,  
              decoration: const InputDecoration(
                labelText: 'Fecha del Suceso (Seleccionar)',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today), 
              ),
              readOnly: true, 
              onTap: () {
                _selectDate(context); 
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _fechaController, 
              decoration: const InputDecoration(
                labelText: 'Fecha de Queja',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
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
