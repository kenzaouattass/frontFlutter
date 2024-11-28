import 'package:flutter/material.dart';
import 'screens/DriverHomePage.dart';
import 'screens/ManageReservationsPage';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DriverHomePage(driverId: 1),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/manageReservations') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ManageReservationsPage(driveId: args['driveId']);
            },
          );
        }
        return null; // Return null for unknown routes
      },
    );
  }
}
