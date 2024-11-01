sealed class WorkspacesEvent {}

class OnGetWorkspaces extends WorkspacesEvent {
  OnGetWorkspaces();
}

class OnSelectWorkspace extends WorkspacesEvent {
  final String id;
  OnSelectWorkspace(this.id);
}
