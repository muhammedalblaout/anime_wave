import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/app_user/app_user_cubit.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domin/usecases/current_user_usecase.dart';
import '../../domin/usecases/user_login_usecase.dart';
import '../../domin/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLoginUsecase _userLoginUsecase;
  final CurrentUserUsecase _currentUserUsecase;
  final AppUserCubit _appUserCubit;


  AuthBloc({required UserSignUp userSignUp,
    required UserLoginUsecase userLoginUsecase,
    required CurrentUserUsecase current_user_usecase,
    required AppUserCubit appUserCubit}) :
        _userSignUp=userSignUp,
        _userLoginUsecase=userLoginUsecase,
        _currentUserUsecase=current_user_usecase,
        _appUserCubit=appUserCubit,
super(AuthInitial()) {
    on<AuthEvent>((_,emit)=>emit(AuthLoading()));

    on<AuthSignUp>((event, emit) async {
      final res= await _userSignUp(UserSignUpParams(email:event.email , name: event.name, password: event.password));

      res.fold((l) => emit(AuthFailure(l.massage)),
              (r) => _emitAuthSuccess(r,emit));
    });

    on<AuthLoginEvent>((event, emit) async {
      final res= await _userLoginUsecase(UserloginParams(email: event.email, Password: event.password));

      res.fold((l) => emit(AuthFailure(l.massage)),
              (r) => _emitAuthSuccess(r,emit));
    });

    on<AuthIsUserLoggedInEvent>((event, emit) async {
      final res= await _currentUserUsecase(NoParams());

      res.fold((l) => emit(AuthFailure(l.massage)),
              (r) {
        print(r.email);
        _emitAuthSuccess(r,emit);
              }
      );
    });
  }
  void _emitAuthSuccess(User user,Emitter<AuthState> emit){
    _appUserCubit.updateUser(user);
    emit(AuthSuccses(user));
  }
}
