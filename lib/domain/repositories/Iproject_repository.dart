import '../entities/project.dart';

abstract class IProjectRepository {
  Future<Project> getProjecctById(String projetId);
  Future<List<Project>> findProjectByName(String name);
  Future<List<Project>> findProjectByAdress(String adreess);
  Future<void> setNewProject(Project project);
}