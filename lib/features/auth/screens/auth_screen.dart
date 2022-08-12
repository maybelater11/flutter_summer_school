import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter_summer_school/utils/constants.dart';

import '../widget_models/auth_widget_model.dart';


class AuthScreen extends ElementaryWidget<IAuthWidgetModel> {
  const AuthScreen({
    Key? key,
    WidgetModelFactory wmFactory = createAuthWidgetModel
  }) : super(createAuthWidgetModel, key: key);

  @override
  Widget build(IAuthWidgetModel wm) {

    Widget _logo() {
      return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Card(
              color: primaryHingBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Icon(Icons.chat, color: primary, size: 50,),
                    Text(
                      appNameLabel,
                      style: TextStyle(
                          color: primary,
                          fontSize: 36
                      ),
                    ),
                  ],
                ),
              )
          )
      );
    }

    Widget _signIn() {
      return const Padding(
        padding: EdgeInsets.only(top: 30),
        child: Text(
            signInLabel
        ),
      );
    }

    Widget _username() {
      return Padding(
          padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
          child: TextField(
            controller: wm.usernameFieldController,
            textInputAction: TextInputAction.next,
            cursorColor: primary,
            decoration: InputDecoration(
                labelText: usernameLabel,
                prefixIcon: const Icon(Icons.face),
                prefixIconColor: primary,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: primary,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: primary,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: accent,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                )
            ),
          )
      );
    }

    Widget _password() {
      return Padding(
          padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
          child: TextField(
            controller: wm.passwordFieldController,
            textInputAction: TextInputAction.done,
            cursorColor: primary,
            obscureText: true,
            decoration: InputDecoration(
                labelText: passwordLabel,
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: primary,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: primary,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: primary,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: accent,
                        width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(30)
                )
            ),
          )
      );
    }

    Widget _animatedImage() { /// Нужно анимировать
      return Container(
        padding: const EdgeInsets.only(top: 30),
        width: 30,
        child: Image.asset('assets/auth_img.png'),
      );
    }

    Widget _btn() {
      return Container(
          height: 70,
          width: 130,
          padding: const EdgeInsets.only(top: 30),
          child: OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      )
                  )
              ),
              onPressed: () {
                wm.onPressed([wm.usernameFieldController.text,
                              wm.passwordFieldController.text]);
///                return ScaffoldMessenger(key: wm.scaffoldMessengerKey,)
              },
              child: const Text(signInBtnLabel),
          )
      );
    }

    Widget _image() {
      return Image.asset('assets/auth_background_img.png');
    }

    return SafeArea(
        child: Scaffold(
            body: Column(
              children: <Widget>[
                _logo(),
                _signIn(),
                _username(),
                _password(),
                _animatedImage(),
                _btn(),
                Row(
                  children: [
                    _image()
                  ],
                )
              ],
            )
        )
    );
  }
}