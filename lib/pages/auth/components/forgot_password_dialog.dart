import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontal_delivery/pages/auth/controller/auth_controller.dart';
import 'package:pontal_delivery/pages/common_widgets/custom_text_field.dart';

import '../../../services/validators.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPasswordDialog({
    required String email,
    Key? key,
  }) : super(key: key) {
    emailController.text = email;
  }

  final _formFieldKey = GlobalKey<FormFieldState>();
  final authControler = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 300), // Aumenta a altura
        padding: const EdgeInsets.all(20), // Espaçamento interno
        child: Stack(
          alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Recuperação de senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Digite seu email para recuperar sua senha',
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Customtextfield(
                    formFieldKey: _formFieldKey,
                    controller: emailController,
                    icon: Icons.email,
                    label: 'Email',
                    validator: emailValidator,
                  ),

                  const SizedBox(height: 30), // Espaço entre campo e botão

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(width: 2, color: Colors.green),
                    ),

                    onPressed: () {

                      if(_formFieldKey.currentState!.validate()) {

                        authControler.resetPassword(emailController.text);
                        Get.back(result: true);

                      }
                    },

                    child: const Text(
                      'Recuperar',
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ]
        ),
      )
    );
  }
}
