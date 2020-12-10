import '../../domain/entities/donation.dart';
import '../../domain/entities/enums/Coin.dart';

class DonationModel extends Donation {
  DonationModel([
    String donationId,
    String value,
    Coin coin,
    String projectId,
    String donatorId,
  ]) : super(
    donationId: donationId,
    value: value,
    coin: coin,
    projectId: projectId,
    donatorId: donatorId,
  );

  DonationModel.fromMap(Map m) : super(
    donationId: m['donationId'],
    value: m['value'],
    coin: m['coin'],
    projectId: m['projectId'],
    donatorId: m['donatorId'],
  );

  Map toMap() {
    return {
      'donationId': donationId,
      'value': value,
      'coin': coin,
      'projectId': projectId,
      'donatorId': donatorId,
    };
  }
}