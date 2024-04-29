import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/cubit/app_user/app_user_cubit.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domin/usecase/get_profile_usecase.dart';
import '../../domin/usecase/logout_usecase.dart';
import '../../domin/usecase/update_user_usecase.dart';
import '../../domin/usecase/upload_image_usecase.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetProfileUsecase _getProfileUsecase;
  final AppUserCubit _appUserCubit;
  final UploadImageUsecase _uploadImageUsecase;
  final UpdateUserUsecase _updateUserUsecase;
  final LogOutUsecase _logOutUseUsecase;




  ProfileBloc({required GetProfileUsecase getProfileUsecase,
    required AppUserCubit appUserCubit,
    required  UploadImageUsecase uploadImageUsecase,
    required UpdateUserUsecase updateUserUsecase,
    required LogOutUsecase logOutUsecase

  })
      : _getProfileUsecase = getProfileUsecase,
        _appUserCubit=appUserCubit,
        _uploadImageUsecase=uploadImageUsecase,
        _updateUserUsecase =updateUserUsecase,
        _logOutUseUsecase =logOutUsecase,


      super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());

      final res= await _getProfileUsecase(NoParams());

      res.fold((l) => emit(ProfileFail(l.massage)),
              (r) {
            print(r.email);
            _emitProfileSuccess(r,emit);
          }
      );
    });

    on<UpdateImageEvent>((event, emit) async {
      emit(ProfileLoading());
      final res= await _uploadImageUsecase(UploadImageParams(image: event.image, user: event.user));
      res.fold((l) => emit(ProfileFail(l.massage)),
              (r) {
            print(r.email);
            _emitProfileSuccess(r,emit);
          }
      );
    });


    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final res= await _updateUserUsecase(UpdateUserParams(user: event.user));
      res.fold((l) => emit(ProfileFail(l.massage)),
              (r) {
            print(r.email);
            _emitProfileSuccess(r,emit);
          }
      );
    });

    on<LogoutEvent>((event, emit) async {
      emit(ProfileLoading());
      final res= await _logOutUseUsecase(NoParams());
      res.fold((l) => emit(ProfileFail(l.massage)),
              (r) {
                _emitProfileLoogout(emit);
          }
      );
    });



    }
  void _emitProfileSuccess(User user,Emitter<ProfileState> emit){
    _appUserCubit.updateUser(user);

    emit(ProfileSuccess(user));
  }
  void _emitProfileLoogout(Emitter<ProfileState> emit){
    _appUserCubit.logout();

    emit(ProfileLogOut());
  }

}
