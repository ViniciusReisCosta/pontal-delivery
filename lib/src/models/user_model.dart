class UserModel {
  String name;
  String email;
  String phone;
  String cpf;
  String endereco;
  String password;

  UserModel(
      {required this.phone,
      required this.cpf,
      required this.email,
      required this.name,
      required this.endereco,
      required this.password});
}

UserModel user = UserModel(
    phone: '8399057579',
    cpf: '713.806.334-47',
    email: 'josesinho@gmail.com',
    name: 'jose gomes da silva santos',
    endereco: 'rua experidionario santos',
    password: 'sextaão_santos'
    );
