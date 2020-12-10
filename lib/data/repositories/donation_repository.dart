import '../../domain/entities/donation.dart';
import '../../domain/repositories/Idonation_repository.dart';

class DonationRepository extends IDonationRepository {
  Future<List<Donation>> findAllUserDonations(String userId) {}
  Future<List<Donation>> findAllProjectDonations(String projectId) {}
  Future<void> setNewDonation(Donation donation) {}
}