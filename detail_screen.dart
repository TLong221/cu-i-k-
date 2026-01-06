import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../services/cart_service.dart';

class DetailScreen extends StatelessWidget {
  final Shoe shoe;

  const DetailScreen({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shoe.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                children: shoe.images
                    .map((img) => Image.asset(img, fit: BoxFit.cover))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(shoe.description),
                  const SizedBox(height: 10),
                  Text(
                    '${shoe.price.toStringAsFixed(0)} đ',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      CartService.addToCart(shoe);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Đã thêm vào giỏ hàng'),
                        ),
                      );
                    },
                    child: const Text('Thêm vào giỏ hàng'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
