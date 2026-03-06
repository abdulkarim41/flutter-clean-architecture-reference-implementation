
import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, showOnboarding, unauthenticated, authenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isLoginLoading;

  const AuthState(this.status, {this.isLoginLoading = false});

  @override
  List<Object?> get props => [status, isLoginLoading];
}