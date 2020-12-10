import '../entities/donation.dart';
import '../repositories/Idonation_repository.dart';

class Donate {
  IDonationRepository donationRepository;
  
  Donate(this.donationRepository);

  void execute(Donation donation) {
    donationRepository.setNewDonation(donation);
  }
}