import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/Donation.dart';
import '../models/donation_model.dart';

class DonationLocalDataSource {
  static final List<DonationModel> donations = [];
  static bool donationsLoaded = false;

  DonationLocalDataSource() {
    DonationLocalDataSource.loadDonations();
  }

  static Future<void> loadDonations() async {
    if (DonationLocalDataSource.donations.isEmpty) {
      final sharedPreferences = await SharedPreferences.getInstance();
      final donationsListJSON = sharedPreferences.getStringList('donations');

      for (int i = 0; i < donationsListJSON.length; i++) {
        final donationJSON = jsonDecode(donationsListJSON[i]);
        final donation = DonationModel.fromMap(donationJSON);
        DonationLocalDataSource.donations.add(donation);
      }

      DonationLocalDataSource.donationsLoaded = true;
    }
  }

  static Future<void> saveDonations() async {
    final donationsListJSON = DonationLocalDataSource.donations.map(
      (DonationModel e) => jsonEncode(e.toMap()),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('donations', donationsListJSON.toList());
  }

  void requireDonationsLoaded() {
    while (!DonationLocalDataSource.donationsLoaded) {
      DonationLocalDataSource.loadDonations();
    }
  }

  Future<List<DonationModel>> findAllByUserID(String userId) async {
    requireDonationsLoaded();
  }

  Future<List<Donation>> findAllUserDonations(String userId) {
    requireDonationsLoaded();
  }

  Future<List<Donation>> findAllProjectDonations(String projectId) {
    requireDonationsLoaded();
  }

  Future<void> setNewDonation(Donation donation) {
    requireDonationsLoaded();
  }
}
