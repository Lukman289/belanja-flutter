import 'package:belanja/main.dart';
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  final Item itemArgs;
  const ItemPage({super.key, required this.itemArgs});
  @override
  Widget build(BuildContext context) {
    // final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    Widget productContent = Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RP.${itemArgs.price}',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            itemArgs.name,
            style: const TextStyle(
                fontSize: 23
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Stok: ${itemArgs.stok}',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 22,
                  ),
                  Text(
                    '${itemArgs.rating}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
    Widget productImage = Container(
      margin: const EdgeInsets.all(5),
      child: Hero(
          tag: 'product${itemArgs.name}',
          child: Image.asset(
            itemArgs.photo,
            height: 350,
            fit: BoxFit.contain,
          )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      bottomNavigationBar: const Text(
        'Lukman Eka Septiawan | 2241720049',
        textAlign: TextAlign.center,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => context.go('/'),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(
            eccentricity: 0,
          ),
          foregroundColor: Colors.black
        ),
        child: const Icon(
          Icons.arrow_back_ios_new
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            productImage,
            productContent,
          ],
        ),
      ),
    );
  }
}
