import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/features/auth/data/model/Auth_model.dart';
import 'package:rakna/features/auth/data/model/register_model.dart';
import 'package:rakna/features/auth/data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final GlobalKey<FormState> _formPasswordKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
       final FancyPasswordController _fancyPasswordController = FancyPasswordController();
  final FancyPasswordController _fancyPasswordConfirmController =
      FancyPasswordController();
  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get formPasswordKey => _formPasswordKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get nationalityController => _nationalityController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;
  FancyPasswordController get fancyPasswordController => _fancyPasswordController;
  FancyPasswordController get fancyPasswordConfirmController =>
      _fancyPasswordConfirmController;
  
  PageController pageController = PageController();

  void register() async {
    emit(RegisterLoading());
    var result = await authRepo.register(
      registerModel: RegisterModel(
        fullName: _userNameController.text,
        nationalId: _nationalityController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phoneNumber: _phoneController.text,
      ),
    );
    result.fold((fail) => emit(RegisterError(fail.errorMessage)), (sucess) {
      isAuthenticated(authModel: sucess);
    });
  }

  void isAuthenticated({required AuthModel authModel}) {
    if (authModel.isAuthenticated) {
      saveToken(token: authModel.token);
      emit(RegisterSuccess(message: authModel.message));
    } else {
      emit(RegisterError(authModel.message));
    }
  }

  void saveToken({required String token}) {
    CacheService.put(key: Keys.token, value: token);
  }

  @override
  Future<void> close() {
    _emailController.dispose();
    _userNameController.dispose();
    _nationalityController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    return super.close();
  }
}
