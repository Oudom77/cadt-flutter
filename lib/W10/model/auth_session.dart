import './user.dart';

class AuthSession {
  final User user;
  final String token;
  final DateTime expiration;

  const AuthSession({required this.user, required this.token, required this.expiration});

}