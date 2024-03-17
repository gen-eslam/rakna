import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rakna/features/auth/data/model/register_model.dart';
import 'package:rakna/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;
  static AuthCubit get(context) => BlocProvider.of(context);

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
}
