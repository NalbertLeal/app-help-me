import '../entities/project.dart';
import '../repositories/Iproject_repository.dart';

class RegisterProject {
  IProjectRepository projectRepository;
  
  RegisterProject(this.projectRepository);

  void execute(Project project) {
    projectRepository.setNewProject(project);
  }
}