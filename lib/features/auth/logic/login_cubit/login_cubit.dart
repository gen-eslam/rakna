import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/features/auth/data/model/Auth_model.dart';

import 'package:rakna/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static LogInCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  void login() async {
    emit(AuthLoading());
    var result = await authRepo.login(
        email: _emailController.text, password: _passwordController.text);
    result.fold((fail) => emit(AuthError(fail.errorMessage)), (sucess) {
      isAuthenticated(authModel: sucess);
    });
  }

  void isAuthenticated({required AuthModel authModel}) {
    if (authModel.isAuthenticated) {
      saveToken(token: authModel.token!);
      emit(AuthSuccess(message: "Login Success"));
    } else {
      emit(AuthError(authModel.message!));
    }
  }

  void saveToken({required String token}) {
    CacheService.put(key: Keys.token, value: token);
  }

  @override
  Future<void> close() {
    _emailController.dispose();
    _passwordController.dispose();
    return super.close();
  }
}
