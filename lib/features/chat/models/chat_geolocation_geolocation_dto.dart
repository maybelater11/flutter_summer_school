class ChatGeolocationDto {
  final double latitude;

  final double longitude;

  ChatGeolocationDto({
    required this.latitude,
    required this.longitude,
  });

  ChatGeolocationDto.fromGeoPoint(List<double> geopoint)
      : latitude = geopoint[0],
        longitude = geopoint[1];
  @override
  String toString() => 'ChatGeolocationDto(latitude: $latitude, longitude: $longitude)';

  List<double> toGeopoint() => [latitude, longitude];
}
