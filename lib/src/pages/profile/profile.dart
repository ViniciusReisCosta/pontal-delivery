import 'package:flutter/material.dart';
import 'package:pontal_03/src/pages/common_widgets/customtextfield.dart';
import 'package:pontal_03/src/config/app_data.dart ';
import 'package:pontal_03/src/models/user_model.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuario'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // formulario
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          Customtextfield(
              readOnly: true,
              initialValue: appData.user.email,
              icon: Icons.email,
              label: 'Email'),
          //Nome
          Customtextfield(
              readOnly: true,
              initialValue: appData.user.name,
              icon: Icons.person,
              label: 'Nome'),
          //Celular
          Customtextfield(
              readOnly: true,
              initialValue: appData.user.phone,
              icon: Icons.phone,
              label: 'Celular'),
          // cpf
          Customtextfield(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'cpf',
            issecret: true,
          ),
          //endereço
          Customtextfield(
              readOnly: true,
              initialValue: appData.user.endereco,
              icon: Icons.location_on,
              label: 'Endereço'),

          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 1, color: Colors.deepOrange),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    updatepassword();
                  },
                  child: const Text('trocar senha'))),
        ],
      ),
    );
  }

  Future<bool?> updatepassword() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return Dialog(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Alteração de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Customtextfield(
                        icon: Icons.lock,
                        issecret: true,
                        label: 'Senha atual',
                      ),
                      Customtextfield(
                        icon: Icons.lock_outline,
                        issecret: true,
                        label: 'Nova senha',
                      ),
                      Customtextfield(
                        issecret: true,
                        icon: Icons.lock_outline,
                        label: 'confirmar senha',
                      ),
                      //botão de confirmar
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: Text('Confirmar')),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
