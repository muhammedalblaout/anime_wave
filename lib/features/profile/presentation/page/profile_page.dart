import 'package:anime_wave/core/cubit/app_user/app_user_cubit.dart';
import 'package:anime_wave/core/utils/show_snack_bar.dart';
import 'package:anime_wave/features/auth/presentation/pages/login_page.dart';
import 'package:anime_wave/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:anime_wave/features/profile/presentation/page/edit_profile_page.dart';
import 'package:anime_wave/features/profile/presentation/widget/profile_pic.dart';
import 'package:anime_wave/features/profile/presentation/widget/profile_row.dart';
import 'package:anime_wave/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/commen/widgets/loader.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/pick_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Loader(color: AppPallete.color1);
            }


            if (state is ProfileLogOut) {
              context.read<AppUserCubit>().logout();

            }

            if (state is ProfileSuccess) {

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: ProfilePic(state.user.avatarurl, onTap: () {
                          selectImage();
                        }),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.user.name,
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        state.user.email,
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account",
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              child: ProfileRow(AppPallete.color2, "Edit",
                                  Icons.person_outline_sharp),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider.value(
                                    value:
                                        BlocProvider.of<ProfileBloc>(this.context),
                                    child: EditProfilePage(),
                                  );
                                }));
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Actions",
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              child: ProfileRow(
                                  AppPallete.error, "Log Out", Icons.logout),
                              onTap: (){
                                context.read<ProfileBloc>().add(LogoutEvent());

                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
          listener: (BuildContext context, ProfileState state) {
            if (state is ProfileFail) {
              ErrorShowSnackBar(context, state.massage);
            }
          },
        ));
  }

  void selectImage() async {
    final pickedImage = await PickImage();
    if (pickedImage != null) {
      var user = (context.read<ProfileBloc>().state as ProfileSuccess).user;
      context
          .read<ProfileBloc>()
          .add(UpdateImageEvent(image: pickedImage, user: user));
    }
  }
}
