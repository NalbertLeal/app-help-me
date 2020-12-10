import '../../domain/entities/project.dart';
import '../models/project_model.dart';
import '../../exceptions/project_with_same_name_exists.dart';

class ProjectDataSource {
  static List<ProjectModel> projects = [];

  ProjectModel _findProjectsById(String id) {
    for (int i = 0; i < ProjectDataSource.projects.length; i++) {
      final shouldIntoResult = ProjectDataSource.projects[i].projectId == id;
      if (shouldIntoResult) {
        return ProjectDataSource.projects[i];
      }
    }
    return null;
  }

  List<ProjectModel> _findProjectsByName(String name) {
    final matches = ProjectDataSource.projects.where((element) => element.name.allMatches(name).toList().length != 0);
    return matches.toList();
  }

  Future<Project> getProjecctById(String projetId) async {
    return this._findProjectsById(projetId);
  }

  Future<List<Project>> findProjectByName(String name) async {
    return this._findProjectsByName(name);
  }

  Future<List<Project>> findProjectByAdress(String adreess) {}

  Future<void> setNewProject(Project project) {
    final userFound = this._findProjectsByName(project.name);
    if (userFound != null) {
      throw ProjectWithSameNameExists();
    }

    project.projectId = "${ProjectDataSource.projects.length}-${project.name}";
    ProjectDataSource.projects.add(project);
  }
}