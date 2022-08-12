import 'package:surf_study_jam/surf_study_jam.dart';

import 'chat_geolocation_geolocation_dto.dart';
import 'chat_message_dto.dart';
import 'chat_user_dto.dart';


class ChatMessageGeolocationDto extends ChatMessageDto {
  final ChatGeolocationDto location;

  ChatMessageGeolocationDto({
    required ChatUserDto chatUserDto,
    required this.location,
    required String message,
    required DateTime createdDate,
  }) : super(
          chatUserDto: chatUserDto,
          message: message,
          createdDateTime: createdDate,
        );

  ChatMessageGeolocationDto.fromSJClient({
    required SjMessageDto sjMessageDto,
    required SjUserDto sjUserDto,
  })  : location = ChatGeolocationDto.fromGeoPoint(sjMessageDto.geopoint!),
        super(
          createdDateTime: sjMessageDto.created,
          message: sjMessageDto.text,
          chatUserDto: ChatUserDto.fromSJClient(sjUserDto),
        );

  @override
  String toString() => 'ChatMessageGeolocationDto(location: $location) extends ${super.toString()}';
}
