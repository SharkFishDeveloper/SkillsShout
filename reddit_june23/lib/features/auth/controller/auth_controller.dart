import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(authRepository: ref.read(firebaseAuthMethodsProvider));
});

class AuthController {
  final FireBaseAuthMethods _authRepository;

  AuthController({required FireBaseAuthMethods authRepository})
      : _authRepository = authRepository;

  Future<bool> signUpWithEmail(
      String email, String password, BuildContext context) async {
    bool res = await _authRepository.signUpWithEmail(
        email: email, password: password, context: context);
    return res;
  }

  Future<bool> loginWithEmail(String email, String password, BuildContext context) async{
   bool res= await _authRepository.loginWithEmail(
        email: email, password: password, context: context);
        return res;
  }
}
