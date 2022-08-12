import 'package:surf_study_jam/surf_study_jam.dart';

import 'chat_user_dto.dart';
import 'chat_user_local_dto.dart';


class ChatMessageDto {
  final ChatUserDto chatUserDto;

  final String? message;

  final DateTime createdDateTime;

  const ChatMessageDto({
    required this.chatUserDto,
    required this.message,
    required this.createdDateTime,
  });

  ChatMessageDto.fromSJClient({
    required SjMessageDto sjMessageDto,
    required SjUserDto sjUserDto,
    required bool isUserLocal,
  })  : chatUserDto = isUserLocal
            ? ChatUserLocalDto.fromSJClient(sjUserDto)
            : ChatUserDto.fromSJClient(sjUserDto),
        message = sjMessageDto.text,
        createdDateTime = sjMessageDto.created;

  @override
  String toString() =>
      'ChatMessageDto(chatUserDto: $chatUserDto, message: $message, createdDate: $createdDateTime)';
}
