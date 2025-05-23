import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pontal_delivery/pages/auth/controller/auth_controller.dart';

import '../../../config/custom_colors.dart';
import '../../../services/validators.dart';
import '../../common_widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final cpffFormatter = MaskTextInputFormatter(
   mask: '###.###.###-##',
   filter:{'#':RegExp(r'[0-9]')},
  );
 final phoneFormatter = MaskTextInputFormatter(
   mask: '##.#.####-####',
   filter:{'#':RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customConstrastColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
               Positioned(
                          top: 10,
                         left: 10,
                          child: SafeArea(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  //formulario de cadastro
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 244, 244, 244),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Customtextfield(
                            icon: Icons.email,
                            label: 'Email',
                            onSaved: (value){
                              authController.user.email = value;
                            },
                            validator: emailValidator,
                            textInputType: TextInputType.emailAddress,
                          ),
                           const SizedBox(height: 16),
                           Customtextfield(
                            icon: Icons.lock,
                            label: 'Senha',
                            onSaved: (value){
                              authController.user.password = value;
                            },
                            validator: passwordValidator,
                            issecret: true,
                          ), const SizedBox(height: 16),

                           Customtextfield(
                            icon: Icons.person,
                            label: 'Nome',
                            onSaved: (value){
                              authController.user.name = value;
                            },
                            validator: nameValidator,
                          ),
                          const SizedBox(height: 16),

                          Customtextfield(
                            icon: Icons.phone,
                            label: 'Celular',
                            onSaved: (value){
                              authController.user.phone = value;
                            },
                            validator: phoneValidator,
                            textInputType: TextInputType.phone,
                            inputFormatters:[phoneFormatter],
                          ),
                           const SizedBox(height: 16),

                          Customtextfield(
                            icon: Icons.file_copy,
                            label: 'Cpf',
                            onSaved: (value){
                              authController.user.cpf = value;
                            },
                            validator: cpfvalidator,
                            textInputType: TextInputType.number,
                            inputFormatters: [cpffFormatter],
                          ), const SizedBox(height: 16),

                          SizedBox(
                            height: 50,
                            child: Obx((){

                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                                onPressed: authController.isLoading.value ? null
                                    : () {

                                  FocusScope.of(context).unfocus();

                                  if(_formKey.currentState!.validate()) {

                                    _formKey.currentState!.save();

                                    authController.signUp();
                                  }
                                },
                                child: authController.isLoading.value
                                    ? CircularProgressIndicator()
                                    :  Text(
                                  'Cadastrar usuário',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),
                                ),
                              );
                            })
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}