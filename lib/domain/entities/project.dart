import 'package:equatable/equatable.dart';

class Project extends Equatable {
  String projectId;
  final String ownerId;
  final String name;
  final String description;
  final String moto;
  final String address;
  final List<String> imagesIds;
  final DateTime createdAt;

  Project({
    this.projectId,
    this.ownerId,
    this.name,
    this.description,
    this.moto,
    this.address,
    this.imagesIds,
  }) : this.createdAt = DateTime.now();

  @override
  List<Object> get props => [projectId];
}
