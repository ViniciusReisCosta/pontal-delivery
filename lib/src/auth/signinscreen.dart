import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pontal_delivery/confing/custom_colors.dart';
import 'package:pontal_delivery/src/auth/sign_up_screen.dart';
import 'components/customtextfield.dart';

class SignInscreen extends StatelessWidget {
  const SignInscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: CustomColors.customswatchColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            //nome do app
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(TextSpan(
                      style: TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        TextSpan(
                            text: 'Pontal',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'Delivery',
                            style: TextStyle(
                                color: Color.fromRGBO(244, 67, 54, 1),
                                fontWeight: FontWeight.bold)),
                      ])),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //email
                      const Customtextfield(
                        icon: Icons.email,
                        label: 'email',
                      ),
                      const SizedBox(
                        height: 13,
                        width: 120,
                      ),
                      //senha
                      const Customtextfield(
                        icon: Icons.lock,
                        label: 'senha',
                        issecret: true,
                      ),
                      const SizedBox(
                        height: 13,
                      ),

                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              )),
                          onPressed: () {},
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('esqueceu a senha?',
                                style: TextStyle(
                                    color: CustomColors.customContrastColor))),
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (c){
                                return   SignUpScreen();
                              }
                            ));
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
          ]),
        ));
  }
}