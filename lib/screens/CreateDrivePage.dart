import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateDrivePage extends StatefulWidget {
  final int driverId;

  const CreateDrivePage({Key? key, required this.driverId}) : super(key: key);

  @override
  _CreateDrivePageState createState() => _CreateDrivePageState();
}

class _CreateDrivePageState extends State<CreateDrivePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _deptime;

  Future<void> _createDrive() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final url = Uri.parse('http://localhost:8080/api/v1/drives');

    final body = jsonEncode({
      "pickup": _pickupController.text,
      "destination": _destinationController.text,
      "deptime": _deptime!.toIso8601String(),
      "price": double.parse(_priceController.text),
      "seating": int.parse(_seatsController.text),
      "description": _descriptionController.text,
      "id_driver": widget.driverId,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Trajet créé avec succès !')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur réseau : ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Trajet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pickupController,
                decoration: const InputDecoration(labelText: 'Lieu de départ'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ obligatoire' : null,
              ),
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(labelText: 'Destination'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ obligatoire' : null,
              ),
              Row(
                children: [
                  Text(_deptime == null
                      ? 'Sélectionnez une date'
                      : 'Date : ${_deptime!.toLocal()}'),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _deptime = selectedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ obligatoire' : null,
              ),
              TextFormField(
                controller: _seatsController,
                decoration:
                    const InputDecoration(labelText: 'Places disponibles'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ obligatoire' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Champ obligatoire' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createDrive,
                child: const Text('Ajouter Trajet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
