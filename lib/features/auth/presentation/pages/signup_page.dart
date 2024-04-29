import 'package:anime_wave/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/commen/widgets/loader.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/show_snack_bar.dart';
import '../../../navigation/presentation/page/navigation_page.dart';
import '../bloc/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/commen/widgets/custom_button.dart';
import '../../../../core/commen/widgets/custom_text_field.dart';


class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    ErrorShowSnackBar(context, state.massage);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Loader(color: AppPallete.color1);
                  }
                  if (state is AuthSuccses) {
                    Navigator.pushAndRemoveUntil(context, NavigatorPage.route(),(route)=>false);
                  }
                  return Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height:60,),

                          SvgPicture.asset(
                            'assets/logo.svg',
                            height: 170,
                            width: 170,
                          ),
                          SizedBox(height: 10,),
                          Text("Create New Account",style: GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w800,fontSize: 28),),
                          SizedBox(height: 20,),
                          CustomTextField(hint:"Name", icon: Icons.person, isPassword: false, textEditingController: nameController,),
                          SizedBox(height: 16,),
                          CustomTextField(hint:"Email",icon: Icons.email,isPassword: false, textEditingController: emailController,),
                          SizedBox(height: 16,),
                          CustomTextField(hint:"Password",icon: Icons.lock,isPassword:true, textEditingController: passwordController,),
                          SizedBox(height: 24,),

                          CustomButton("Sign Up ",onPressed: () {
                            if(formKey.currentState!.validate()){
                              print( nameController.text.toString().trim());
                              context.read<AuthBloc>().add(AuthSignUp(email: emailController.text.toString().trim(),
                                  password:passwordController.text.toString().trim(), name:nameController.text.toString().trim() ));
                            }
                          }),
                          SizedBox(height:24),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, LoginPage.route());
                            },
                            child: RichText(text:
                            TextSpan(text:"Already have an account? ",style:GoogleFonts.poppins().copyWith(fontSize: 14,fontWeight: FontWeight.w800,color: AppPallete.color2),
                                children: [TextSpan(text: "Login", style:GoogleFonts.poppins().copyWith(fontSize: 14,fontWeight: FontWeight.w800,color: AppPallete.color1))
                                ]
                            )
                              ,
                            ),
                          ),


                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
