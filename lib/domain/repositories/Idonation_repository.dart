import '../entities/donation.dart';

abstract class IDonationRepository {
  Future<List<Donation>> findAllUserDonations(String userId);
  Future<List<Donation>> findAllProjectDonations(String projectId);
  Future<void> setNewDonation(Donation donation);
}