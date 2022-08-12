import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter_summer_school/features/chat/repository/chat_repository.dart';
import 'package:flutter_summer_school/features/chat/screens/chat_screen.dart';
import 'package:flutter_summer_school/utils/constants.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import '../../../main.dart';
import '../../../app_model.dart';
import '../../../service/navigation_helper.dart';
import '../models/auth_model.dart';
import '../screens/auth_screen.dart';


class AuthWidgetModel
    extends WidgetModel<AuthScreen, AuthModel>
    implements IAuthWidgetModel {
  final TextEditingController _usernameFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final NavigationHelper _navigator;

  @override
  TextEditingController get usernameFieldController => _usernameFieldController;

  @override
  TextEditingController get passwordFieldController => _passwordFieldController;

  AuthWidgetModel(AuthModel model, this._navigator  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

///  void _showSnackBar(String message) {
///    scaffoldMessengerKey.currentState!.showSnackBar(
///      SnackBar(
///        content: Text(message),
///      ),
///    );
///  }

  @override
  Future<void> onPressed(List<String> data) async {
    model.tryLogin(data);
    var token = await model.getToken();
    if (token != null) {
      _navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (_) {
                return ChatScreen(
                  chatRepository: ChatRepository(
                    StudyJamClient().getAuthorizedClient(token),
                  ),
                );
              }
              )
      );
    } else {
///      _showSnackBar(authError);
    }
  }
}

abstract class IAuthWidgetModel extends IWidgetModel {
  TextEditingController get usernameFieldController;
  TextEditingController get passwordFieldController;
  void onPressed(List<String> data);
}

AuthWidgetModel createAuthWidgetModel(BuildContext _) => AuthWidgetModel(
    AuthModel(getIt<AppModel>()), NavigationHelper());