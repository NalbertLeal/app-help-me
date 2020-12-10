import '../../domain/entities/project.dart';
import '../../domain/repositories/Iproject_repository.dart';
import '../data_sources/project_data_source.dart';

class ProjectRepository extends IProjectRepository {
  final dataSource = ProjectDataSource();

  Future<Project> getProjecctById(String projetId) async {
    return await dataSource.getProjecctById(projetId);
  }

  Future<List<Project>> findProjectByName(String name) async {
    return await dataSource.findProjectByName(name);
  }

  Future<List<Project>> findProjectByAdress(String adreess) {

  }

  Future<void> setNewProject(Project project) async {
    await dataSource.setNewProject(project);
  }
}