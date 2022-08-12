import 'package:surf_study_jam/surf_study_jam.dart';

import '../exceptions/auth_exception.dart';
import '../models/token_dto.dart';


abstract class IAuthRepository {
  Future<TokenDto> signIn({
    required String login,
    required String password,
  });

  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  final StudyJamClient _studyJamClient;

  AuthRepository(this._studyJamClient);

  @override
  Future<TokenDto> signIn({
    required String login,
    required String password,
  }) async {
    try {
      final token = await _studyJamClient.signin(login, password);

      return TokenDto(token: token);
    } on Exception catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> signOut() {
    return _studyJamClient.logout();
  }
}