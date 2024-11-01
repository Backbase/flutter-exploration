import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/viewmodel/workspaces_events.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/viewmodel/workspaces_screen_state.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/viewmodel/workspaces_view_model.dart';

class WorkspacesScreen extends StatelessWidget {
  const WorkspacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workspaces'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _WorkspacesScreen(),
        ));
  }
}

class _WorkspacesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkspacesScreenState();
}

class _WorkspacesScreenState extends State<_WorkspacesScreen> {
  final WorkspacesViewModel _viewModel = GetIt.instance.get();

  List<Workspace> workspaces = List.empty();
  String? selectedValue; // Initial selected value

  @override
  void initState() {
    super.initState();

    _viewModel.addListener(() {
      final WorkspacesScreenState state = _viewModel.state;
      if (state.workspaces.isNotEmpty && workspaces.isEmpty) {
        workspaces = state.workspaces;
        selectedValue = workspaces.first.id;
      }
      if (state.workspace != null) {
      }
      if (state.error != null) {
        _showToast(context, state.error);
      }
    });

    _viewModel.onEvent(OnGetWorkspaces());
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _viewModel,
        builder: (BuildContext context, Widget? child) {
          return buildColumn();
        });
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text('Select your workspace'),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: workspaces.map((Workspace value) {
            return DropdownMenuItem<String>(
              value: value.id,
              child: Text(value.name ?? 'No name'),
            );
          }).toList(),
        ),
        ElevatedButton(
            onPressed: () {
              if (selectedValue != null) {
                _viewModel.onEvent(OnSelectWorkspace(selectedValue!));
                context.go("/home");
              }
            },
            child: const Text('Select'))
      ],
    );
  }

  void _showToast(BuildContext context, WorkspacesError e) {
    late String message;
    switch (e) {
      case ConnectionError():
        message = "Connection error";
      case UnExpectedError():
        message = "Unexpected error";
      case SelectWorkspaceError():
        message = "Unable to select workspace";
      default:
        message = "Something went wrong";
        break;
    }

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text('Error: $message')),
    );
  }
}
