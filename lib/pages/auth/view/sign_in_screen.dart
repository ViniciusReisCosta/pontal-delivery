import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontal_delivery/pages/auth/controller/auth_controller.dart';
import 'package:pontal_delivery/pages/auth/view/sign_up_screen.dart';
import 'package:pontal_delivery/pages/common_widgets/app_name_widget.dart';
import 'package:pontal_delivery/pages_routes/app_pages.dart';

import '../../../config/custom_colors.dart';
import '../../base/base_screen.dart';

import '../../common_widgets/custom_text_field.dart';

class SignInscreen extends StatelessWidget {
  SignInscreen({super.key});

  final _formKey = GlobalKey<FormState>();

  // Controlador de campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            //nome do app
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppNameWidget(
                    greenTitleColor: Colors.white,
                    textSize: 40,
                  ),
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                      child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Pratos executivos'),
                            FadeAnimatedText('Frutos do mar'),
                            FadeAnimatedText('Frango a pontal'),
                            FadeAnimatedText('cartolas'),
                          ]),
                    ),
                  ),
                ],
              ),
            ),

            //formulario
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 43,
                horizontal: 32,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //email
                        Customtextfield(
                          controller: emailController,
                          icon: Icons.email,
                          label: 'email',
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Digite seu email';
                            }

                            if (!email.isEmail) {
                              return 'Digite um email válido !';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                          width: 120,
                        ),
                        //senha
                        Customtextfield(
                          controller: passwordController,
                          icon: Icons.lock,
                          label: 'senha',
                          issecret: true,
                          validator: (password){

                            if(password == null || password.isEmpty) {
                              return 'Digite sua senha';
                            }

                            if(password.length < 7) {
                              return 'Digite uma senha com pelo menos 7 caracteres';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),

                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(

                            builder: (authController) {
                              return ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(18),
                                 ),
                               ),

                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {

                                    //FocusScope.of(context).unfocus();
                                    if(_formKey.currentState!.validate()) {

                                      String email = emailController.text;
                                      String password = passwordController.text;

                                      authController.signIn(email: email, password: password);
                                    } else {

                                      print('Campos não válidos');
                                    }

                                    //Get.offNamed(PagesRoutes.baseRoute);
                                },
                                child: authController.isLoading.value
                                    ? CircularProgressIndicator()
                                    :  Text(
                                        'Entrar',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white
                                        ),
                                ),
                              );
                            },
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text('esqueceu a senha?',
                                  style: TextStyle(
                                      color: CustomColors.customConstrastColor))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('ou'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                side: const BorderSide(
                                    width: 2, color: Colors.green)),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              'Novo Usuario',
                              style: TextStyle(color: Colors.green, fontSize: 18),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ]),
        ));
  }
}
