import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectProvider = Provider((ref) => ProjectProvider());

class ProjectProvider extends ChangeNotifier {
  bool usuarioLogado = false;
}