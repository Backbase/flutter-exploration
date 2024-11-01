import 'dart:convert';

import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/repo/local_repository.dart';

const registerTokenKey = "register-token-key";
const userNameKey = "user-name-key";
const passwordKey = "password-key";
const passcodeKey = "passcode-key";
const deviceIdKey = "device-id-key";
const privateKeyKey = "private-key-key";
const publicKeyKey = "public-key-key";
const tokenKey = "token-key";

class StorageService {

  final LocalRepository _localRepo;

  StorageService(this._localRepo);

  Future<void> writeRegisterToken(String token) async {
    await _localRepo.inMemoryStorage.write(registerTokenKey, token);
  }
  Future<void> writeUserName(String username) async {
    await _localRepo.inMemoryStorage.write(userNameKey, username);
  }
  Future<void> writePasscode(String passcode) async {
    await _localRepo.inMemoryStorage.write(passcodeKey, passcode);
  }

  Future<void> writeDeviceId(String passcode) async {
    await _localRepo.inMemoryStorage.write(deviceIdKey, passcode);
  }
  Future<void> writePassword(String password) async {
    await _localRepo.inMemoryStorage.write(passwordKey, password);
  }
  Future<void> writePrivateKey(String privatekey) async {
    await _localRepo.inMemoryStorage.write(privateKeyKey, privatekey);
  }
  Future<void> writePublicKey(String publicKey) async {
    await _localRepo.inMemoryStorage.write(publicKeyKey, publicKey);
  }
  Future<void> writeToken(TokenDTO tokenJson) async {
    var jsonAsString = json.encode(tokenJson.toJson());
    await _localRepo.inMemoryStorage.write(tokenKey, jsonAsString);
  }


  Future<TokenDTO?> readToken() async {
    var jsonAsString = await _localRepo.inMemoryStorage.read(tokenKey);
    if(jsonAsString==null )return null;
    var jsonAsMap = json.decode(jsonAsString);
    return TokenDTO.fromJson(jsonAsMap);
  }
  Future<String?> readPublicKey() async =>await _localRepo.inMemoryStorage.read(publicKeyKey);
  Future<String?> readPrivateKey() async =>await _localRepo.inMemoryStorage.read(privateKeyKey);
  Future<String?> readUserName() async =>await _localRepo.inMemoryStorage.read(userNameKey);
  Future<String?> readPasscode() async =>await _localRepo.inMemoryStorage.read(passcodeKey);
  Future<String?> readDeviceId() async =>await _localRepo.inMemoryStorage.read(deviceIdKey);
  Future<String?> readRegisterToken() async => await _localRepo.inMemoryStorage.read(registerTokenKey);
  Future<String?> readPassword() async => await _localRepo.inMemoryStorage.read(passwordKey);


  Future<void> deletePasscode() async {await _localRepo.inMemoryStorage.delete(passcodeKey);}
  Future<void> clear() async {
    await _localRepo.inMemoryStorage.delete(registerTokenKey);
    await _localRepo.inMemoryStorage.delete(userNameKey);
    await _localRepo.inMemoryStorage.delete(passwordKey);
    await _localRepo.inMemoryStorage.delete(passcodeKey);
    await _localRepo.inMemoryStorage.delete(deviceIdKey);
    await _localRepo.inMemoryStorage.delete(privateKeyKey);
    await _localRepo.inMemoryStorage.delete(publicKeyKey);
    await _localRepo.inMemoryStorage.delete(tokenKey);
  }





}
