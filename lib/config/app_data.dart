import 'package:pontal_delivery/models/cart_item_model.dart';
import 'package:pontal_delivery/models/order_model.dart';
import 'package:pontal_delivery/models/user_model.dart';

import '../models/item_model.dart';

ItemModel apple = ItemModel(

    description:
    'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    imgUrl: 'assets/fruits/apple.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'kg',
);

ItemModel grape = ItemModel(
    imgUrl: 'assets/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
    description:
    'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
    imgUrl: 'assets/fruits/guava.png',
    itemName: 'Goiaba',
    price: 11.5,
    unit: 'kg',
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
    unit: 'kg',
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
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais'
];

List<CartItemModel> cartItems = [

    CartItemModel(
        item: apple,
        quantity: 1
    ),

    CartItemModel(
        item: mango,
        quantity: 1
    ),

    CartItemModel(
        item: guava,
        quantity: 3
    )
];

UserModel user = UserModel(

    phone: '99 9 9999-9999',
    cpf: '999.999.999-99',
    email: 'gustavotinho@hotmail.com',
    name: 'Gustavo Henrique',
    password: '',
);

List<OrderModel> orders = [

    OrderModel(
        copyAndPaste: 'q1w2e3r4t5y6',
        createdDateTime: DateTime.parse(
            '2025-01-08 10:00:10.458',
        ),
        overdueDateTime: DateTime.parse(
            '2021-06-08 11:00:10.458',
        ),

        id: 'asd6a54da6s2d1',
        status: 'pending_payment',
        total: 11.0,
        items: [
            CartItemModel(
                item: apple,
                quantity: 2,
            ),

            CartItemModel(
                item: guava,
                quantity: 2,
            ),
        ],
    ),

    OrderModel(
        copyAndPaste: 'q1w2e3r4t5y6',
        createdDateTime: DateTime.parse(
            '2025-01-01 10:00:10.458',
        ),
        overdueDateTime: DateTime.parse(
            '2025-01-01 11:00:10.458',
        ),

        id: 'asd6a54da6s2d1',
        status: 'shipping',
        total: 12.0,
        items: [
            CartItemModel(
                item: apple,
                quantity: 2,
            ),

            CartItemModel(
                item: mango,
                quantity: 3,
            ),
        ],
    ),
];


