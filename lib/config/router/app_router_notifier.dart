import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/presentation/providers/auth/auth_provider.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouterNotifier(authNotifier);
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  AuthStatus _authStatus = AuthStatus.cheking;

  GoRouterNotifier(this._authNotifier) {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}
