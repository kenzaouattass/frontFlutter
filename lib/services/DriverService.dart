import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Reservation.dart';

class DriverService {
  static const String baseUrl = 'http://localhost:8080/api/v1';

  /// Créer un trajet
  Future<void> createDrive({
    required int driverId,
    required String pickup,
    required String destination,
    required DateTime deptime,
    required double price,
    required int seating,
    required String description,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/drives'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "pickup": pickup,
        "destination": destination,
        "deptime": deptime.toIso8601String(),
        "price": price,
        "seating": seating,
        "description": description,
        "idDriver": driverId
      }),
    );

    if (response.statusCode != 201) {
      throw Exception(
          'Erreur lors de la création du trajet : ${response.body}');
    }
  }

  /// Récupérer les trajets d'un conducteur
  Future<List<dynamic>> getDriverDrives(int driverId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/findListDriveByUserId/$driverId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch drives');
    }
  }

  /// Récupérer les réservations pour un trajet
  Future<List<Reservation>> getReservations(int driveId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/reservations?driveId=$driveId'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Reservation.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des réservations');
    }
  }

  /// Mettre à jour le statut d'une réservation
  Future<void> updateReservationStatus(int reservationId, String action) async {
    String endpoint;
    if (action == 'accept') {
      endpoint = '$baseUrl/reservations/accept/$reservationId';
    } else if (action == 'refuse') {
      endpoint = '$baseUrl/reservations/refuse/$reservationId';
    } else {
      throw Exception('Invalid action for updating reservation status.');
    }

    final response = await http.put(
      Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update reservation status: ${response.body}');
    }
  }
}
