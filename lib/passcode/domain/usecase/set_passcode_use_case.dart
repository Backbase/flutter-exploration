import 'package:mobile_foundation_headless_flutter/passcode/domain/repo/passcode_repository.dart';

import '../../../core/domain/storage_service.dart';


class SetPasscodeUseCase {
  final StorageService storageService;
  SetPasscodeUseCase(this.storageService);
  Future<void> call(String passcode) async {
    await storageService.writePasscode(passcode);
  }
}
