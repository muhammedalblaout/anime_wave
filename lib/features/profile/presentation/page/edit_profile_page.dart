import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/commen/widgets/custom_button.dart';
import '../../../../core/commen/widgets/custom_text_field.dart';
import '../../../../core/commen/widgets/loader.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/pick_image.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../bloc/profile_bloc.dart';
import '../widget/profile_pic.dart';
import '../widget/profile_row.dart';

class EditProfilePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<ProfileBloc>(context),
          child: EditProfilePage(),
        );
      });

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
@override
  void initState() {
  var user=(context.read<ProfileBloc>().state as ProfileSuccess).user;
  nameController.value=TextEditingValue(text:user.name );
  emailController.value=TextEditingValue(text:user.email );

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins()
              .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {

        return Loader(color: AppPallete.color1);
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

                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [

                        SizedBox(height: 50,),
                        CustomTextField(hint:"Name", icon: Icons.person, isPassword: false, textEditingController: nameController,),
                        SizedBox(height: 16,),
                        CustomTextField(hint:"Email",icon: Icons.email,isPassword: false, textEditingController: emailController,),
                        SizedBox(height: 200,),


                        CustomButton("Update ",onPressed: () {
                          if(formKey.currentState!.validate()){
                            print( nameController.text.toString().trim());
                            var user=(context.read<ProfileBloc>().state as ProfileSuccess).user;
                            user=user.copyWith(email:emailController.text.toString().trim() ,name: nameController.text.toString().trim());
                            context.read<ProfileBloc>().add(UpdateProfileEvent(user: user));

                          }
                        }),



                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      }
      return SizedBox();
    }, listener: (BuildContext context, ProfileState state) {
      if(state is ProfileFail){
        ErrorShowSnackBar(context, state.massage);
      }
    },));
  }
  void selectImage()async
  {
    final pickedImage= await PickImage();
    if(pickedImage!=null){
      var user=(context.read<ProfileBloc>().state as ProfileSuccess).user;
      context.read<ProfileBloc>().add(UpdateImageEvent(image: pickedImage, user: user));
    }
  }
}
