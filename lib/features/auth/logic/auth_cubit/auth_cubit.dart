import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/features/auth/data/model/register_model.dart';
import 'package:rakna/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool isVisable = false;

  static AuthCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get nationalityController => _nationalityController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;

  void login({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (fail) => emit(AuthError(fail.errorMessage)),
      (sucess) => emit(
        AuthSuccess(),
      ),
    );
  }

  void register({required RegisterModel registerModel}) async {
    emit(AuthLoading());
    var result = await authRepo.register(registerModel: registerModel);
    result.fold(
      (fail) => emit(AuthError(fail.errorMessage)),
      (sucess) => emit(
        AuthSuccess(),
      ),
    );
  }

  void changeVisability() {
    isVisable = !isVisable;
    emit(AuthChangeVisability());
  }

  @override
  Future<void> close() {
    _userNameController.dispose();
    _nationalityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    return super.close();
  }
}
