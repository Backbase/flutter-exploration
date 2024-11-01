import "package:mobile_foundation_headless_flutter/core/domain/result.dart";
import "package:mobile_foundation_headless_flutter/core/presentation/viewmodel/view_model.dart";
import "package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart";
import "package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart";
import "package:mobile_foundation_headless_flutter/workspaces/domain/usecase/get_workspaces_use_case.dart";
import "package:mobile_foundation_headless_flutter/workspaces/domain/usecase/select_workspace_use_case.dart";

import 'workspaces_events.dart';
import "workspaces_screen_state.dart";

class WorkspacesViewModel
    extends ViewModel<WorkspacesScreenState, WorkspacesEvent> {
  final GetWorkSpacesUseCase _getWorkSpacesUseCase;
  final SelectWorkspaceUseCase _selectWorkspaceUseCase;
  final WorkspacesScreenState _state = WorkspacesScreenState();

  WorkspacesViewModel(this._getWorkSpacesUseCase, this._selectWorkspaceUseCase) : super(WorkspacesScreenState());

  @override
  WorkspacesScreenState get state => _state;

  @override
  onEvent(WorkspacesEvent event) async {
    switch (event) {
      case OnGetWorkspaces():
        await _handleGetWorkspaces();
        break;
      case OnSelectWorkspace():
        _handleSelectWorkspace(event.id);
        break;
    }
    notifyListeners();
  }

  Future _handleGetWorkspaces() async {
    _state.reset();
    _state.isLoading = true;
    notifyListeners();
    Result<List<Workspace>, WorkspacesError> result = await _getWorkSpacesUseCase();
    switch (result) {
      case Success<List<Workspace>, WorkspacesError>():
        List<Workspace> workspaces = result.data;
        _state.workspaces = workspaces;
        break;
      case ResultError<List<Workspace>, WorkspacesError>():
        _state.error = result.error;
        break;
    }
    _state.isLoading = false;
  }

  void _handleSelectWorkspace(String id) {
    Result<Workspace, WorkspacesError> result = _selectWorkspaceUseCase(id);
    switch (result) {
      case Success<Workspace, WorkspacesError>():
        _state.workspace = result.data;
        break;
      case ResultError<Workspace, WorkspacesError>():
        _state.error = result.error;
        break;
    }
  }
}
