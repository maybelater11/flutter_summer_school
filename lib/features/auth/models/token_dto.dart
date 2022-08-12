import 'package:flutter/foundation.dart';


@immutable
class TokenDto {
  final String token;

  const TokenDto({
    required this.token,
  });

  @override
  String toString() {
    return token;
  }
}