import 'package:flutter/material.dart';
import '../services/DriverService.dart';
import 'CreateDrivePage.dart';

class DriverHomePage extends StatefulWidget {
  final int driverId;

  const DriverHomePage({Key? key, required this.driverId}) : super(key: key);

  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  final DriverService _driverService = DriverService();
  List<dynamic> _drives = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDrives();
  }

  /// Fonction pour récupérer les trajets créés par le conducteur
  Future<void> _fetchDrives() async {
    try {
      List<dynamic> drives =
          await _driverService.getDriverDrives(widget.driverId);
      setState(() {
        _drives = drives;
        _isLoading = false;
      });
    } catch (error) {
      print('Erreur lors de la récupération des trajets : $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Home'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _drives.isEmpty
              ? const Center(child: Text('No drives available.'))
              : ListView.builder(
                  itemCount: _drives.length,
                  itemBuilder: (context, index) {
                    final drive = _drives[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                            '${drive['pickup']} → ${drive['destination']}'),
                        subtitle: Text(
                            'Date: ${drive['deptime']} | Price: ${drive['price']} MAD | Seats: ${drive['seating']}'),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers la page de création de trajet
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDrivePage(driverId: widget.driverId),
            ),
          ).then((_) {
            // Recharger les trajets après création
            _fetchDrives();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
