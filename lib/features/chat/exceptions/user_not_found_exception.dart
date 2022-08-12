class UserNotFoundException implements Exception {
  final String message;

  const UserNotFoundException(this.message);

  @override
  String toString() => 'UserNotFoundException(message: $message)';
}
