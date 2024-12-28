<<<<<<< HEAD
import 'package:pontal_03/src/models/cart_item.dart';
import 'package:pontal_03/src/models/item_model.dart';

ItemModel apple = ItemModel(
    description:
    'Frango empanado com queijo e presunto ao molho de tomate.Acompanha arroz à grega e purê',
    imgUrl: 'assets/executivos/filepontal.jpeg',
    itemName: 'File ',
    price: 49.90,
    unit: 'PF',
=======
import 'package:pontal_delivery/src/models/item_model.dart';

ItemModel apple = ItemModel(
    description:
    'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    imgUrl: 'assets/fruits/apple.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'kg',
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
);



ItemModel grape = ItemModel(
<<<<<<< HEAD
    imgUrl: 'assets/executivos/salmao.jpeg',
    itemName: 'Salmão grelhado executivo',
    price: 82.90,
    unit: 'pf',
=======
    imgUrl: 'assets/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
    description:
    'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
<<<<<<< HEAD
    imgUrl: 'assets/executivos/cam.jpeg',
    itemName: 'Goiaba',
    price: 11.5,
    unit: 'PF',
=======
    imgUrl: 'assets/fruits/guava.png',
    itemName: 'Goiaba',
    price: 11.5,
    unit: 'kg',
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
    description:
    'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
    imgUrl: 'assets/fruits/kiwi.png',
    itemName: 'Kiwi',
    price: 2.5,
    unit: 'un',
    description:
    'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
    imgUrl: 'assets/fruits/mango.png',
    itemName: 'Manga',
    price: 2.5,
    unit: 'un',
    description:
    'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
    imgUrl: 'assets/fruits/papaya.png',
    itemName: 'Mamão papaya',
    price: 8,
<<<<<<< HEAD
    unit: 'PF',
=======
    unit: 'kg',
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
    description:
    'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
    apple,
    grape,
    guava,
    kiwi,
    mango,
    papaya,
];

final List<String> categories = [
    'executivos',
    'bebidas',
    'sobremessas',
    'promo da semana',
    'Entradas e petiscos',
    'pratos kid/individual',
    'fit',
    'acompanhamentos',
    'frutas',
];
<<<<<<< HEAD

List<cartItemModel> cartItems = [
  cartItemModel(
    item: apple,
    quantity: 1
  ),
  cartItemModel(
    item: apple,
    quantity: 1
  ),
  cartItemModel(
    item: apple,
    quantity: 2
  )
];
=======
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39
