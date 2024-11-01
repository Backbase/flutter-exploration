import 'package:mobile_foundation_headless_flutter/core/presentation/viewmodel/screen_state.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';

class WorkspacesScreenState extends ScreenState {
  List<Workspace> workspaces = List.empty();
  Workspace? workspace;
}