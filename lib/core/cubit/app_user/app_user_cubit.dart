import 'package:bloc/bloc.dart';

import '../../entites/user.dart';
import 'app_user_state.dart';


class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user ){
    if(user==null){
      emit(AppUserInitial());
    }
    else{
      emit(AppUserLoggin(user));
    }
  }

  void logout( ){
    print("emit Appuser Logout");
      emit(AppUserLogout());

  }

}
