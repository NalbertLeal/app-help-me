import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    String projectId,
    String ownerId,
    String name,
    String description,
    String moto,
    String address,
    List<String> imagesIds,
  }) : super(
    projectId: projectId,
    ownerId: ownerId,
    name: name,
    description: description,
    moto: moto,
    address: address,
    imagesIds: imagesIds,
  );

  ProjectModel.fromMap(Map m) : super(
    projectId: m['projectId'],
    ownerId: m['ownerId'],
    name: m['name'],
    description: m['description'],
    moto: m['moto'],
    address: m['address'],
    imagesIds: m['imagesIds'],
  );

  Map toMap(Map m) {
    return {
      'projectId': projectId,
      'ownerId': ownerId,
      'name': name,
      'description': description,
      'moto': moto,
      'address': address,
      'imagesIds': imagesIds,
    };
  }
}