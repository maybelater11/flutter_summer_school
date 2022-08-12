import 'package:elementary/elementary.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import '../../../app_model.dart';
import '../repository/auth_repository.dart';


class AuthModel extends ElementaryModel {
  final AppModel _appModel; /// Будет хранить логин и пароль
  AuthModel(this._appModel);
  final _studyJamClient = StudyJamClient();
  static const storage = FlutterSecureStorage();

  Future<void> tryLogin(List<String> authData) async {
    _appModel.authData = authData;
    var token = AuthRepository(_studyJamClient).signIn(login: authData[0],
        password: authData[1]);
    storage.write(key: 'token', value: '${await token}');
  }

  Future<String?> getToken() {
    return storage.read(key: 'token');
  }
}