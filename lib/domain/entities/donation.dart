import 'package:equatable/equatable.dart';

import 'enums/Coin.dart';

class Donation extends Equatable {
  final String donationId;
  final String value;
  final Coin coin;
  final String projectId;
  final String donatorId;
  final DateTime donatedAt;

  Donation({
    this.donationId,
    this.value,
    this.coin = Coin.REAL,
    this.projectId,
    this.donatorId,
  }) : this.donatedAt = DateTime.now();

  @override
  List<Object> get props => [donationId];
}