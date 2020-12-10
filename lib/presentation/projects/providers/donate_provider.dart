import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/donation.dart';
import '../../../domain/use_cases/donate.dart';
import '../../../data/repositories/project_repository.dart';
import '../../../data/repositories/donation_repository.dart';
import '../../../exceptions/project_not_found.dart';

final donateProvider = Provider((ref) => DonateProvider());

class DonateProvider extends ChangeNotifier {
  String donationId;
  String value;
  String projectName;
  String projectId;
  String donatorId;

  void makeDonation() async {
    final projects = await ProjectRepository().findProjectByName(projectName);
    if (projects.isEmpty) throw ProjectNotFound();

    final donate = Donate(DonationRepository());

    final donation = Donation(
      value: value,
      projectId: projects[0].projectId,
    );
    donate.execute(donation);
  }
}