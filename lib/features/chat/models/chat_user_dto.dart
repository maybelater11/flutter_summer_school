import 'package:surf_study_jam/surf_study_jam.dart';


class ChatUserDto {
  final String? name;

  const ChatUserDto({
    required this.name,
  });

  ChatUserDto.fromSJClient(SjUserDto sjUserDto) : name = sjUserDto.username;

  @override
  String toString() => 'ChatUserDto(name: $name)';
}
