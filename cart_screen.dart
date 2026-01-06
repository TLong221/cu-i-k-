import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'payment_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text('Giỏ hàng')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final shoe = cart[index];
                return ListTile(
                  leading: Image.asset(shoe.images[0], width: 50),
                  title: Text(shoe.name),
                  trailing: Text(
                    '${shoe.price.toStringAsFixed(0)} đ',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentScreen()),
                );
              },
              child: Text(
                'Thanh toán (${CartService.totalPrice().toStringAsFixed(0)} đ)',
              ),
            ),
          )
        ],
      ),
    );
  }
}
