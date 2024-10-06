import 'package:belanja/main.dart';
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget gridProduct = GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Jumlah kolom dalam grid
        crossAxisSpacing: 8.0, // Jarak antar kolom
        mainAxisSpacing: 8.0, // Jarak antar baris
        childAspectRatio: 0.7, // Mengatur rasio aspek item grid
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        // return InkWell(
        //   onTap: () {
        //     Navigator.pushNamed(context, '/item', arguments: item);
        //   },
        return ElevatedButton(
          onPressed: () => context.go('/item', extra: item),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
          child: Container(
            margin: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: 'product${item.name}',
                    child: Image.asset(
                      item.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Rp.${item.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Stok ${item.stok}'),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '${item.rating}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja'),
      ),
      bottomNavigationBar: const Text(
        'Lukman Eka Septiawan | 2241720049',
        textAlign: TextAlign.center,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: gridProduct,
      ),
    );
  }

  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, photo: 'assets/images/sugar1.jpeg', rating: 3.5, stok: 6),
    Item(name: 'Salt', price: 2000, photo: 'assets/images/salt1.jpeg', rating: 4.0, stok: 7),
  ];

// return Scaffold(
//   appBar: AppBar(
//     title: Text('Belanja'),
//   ),
//   body: Container(
//     margin: EdgeInsets.all(8),
//     child: ListView.builder(
//       padding: EdgeInsets.all(8),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, '/item', arguments: item);
//           },
//           child: Card(
//             child: Container(
//               margin: EdgeInsets.all(8),
//               child: Row(
//                 children: [
//                   Expanded(child: Text(item.name)),
//                   Expanded(
//                     child: Text(
//                       item.price.toString(),
//                       textAlign: TextAlign.end,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     ),
//   )
// );
}
