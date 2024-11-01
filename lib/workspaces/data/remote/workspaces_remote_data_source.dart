import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:generated_services/api.dart' as service;
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/data/datasource/workspaces_data_source.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';

class WorkspacesRemoteDataSource implements WorkspacesDataSource {
  service.WorkspaceApi workspaceApi;

  WorkspacesRemoteDataSource(this.workspaceApi);

  @override
  Future<Result<List<Workspace>, WorkspacesError>> getWorkspaces(WorkspacesParams params) async {
    var workspaceDTO = await workspaceApi.getWorkspaces(
        params.apiKey,
        params.authorization

    );
    return Success(workspaceDTO.toEntity());
  }

  Future<Result<List<Workspace>, WorkspacesError>> loadJson() async {
    try {
      final String source =
          await rootBundle.loadString('assets/workspaces.json');
      final List<dynamic> jsonArray =
          List<dynamic>.from(await jsonDecode(source));

      final List<Workspace> workspaces = List.empty(growable: true);
      for (var jsonObject in jsonArray) {
        workspaces.add(Workspace.fromJson(jsonObject));
      }
      return Success(workspaces);
    } catch (e) {
      return ResultError(UnExpectedError());
    }
  }
}

extension EntityMapper on List<service.Workspace>? {
  List<Workspace> toEntity() {
    var listOfWorkspaces = <Workspace>[];
    if(this==null) {
      return listOfWorkspaces;
    }
    for (var wp in this!) {
      listOfWorkspaces.add(Workspace(
        id: wp.id,
        name: wp.name,
        externalId: wp.externalId,
        description: wp.description,
        isMaster: wp.isMaster,
        validFromDate: wp.validFromDate,
        validFromTime: wp.validFromTime,
        validUntilDate: wp.validUntilDate,
        validUntilTime: wp.validUntilTime,
      ));
    }
    return listOfWorkspaces;
  }
}
