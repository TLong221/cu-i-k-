import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thanh toán')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Họ tên'),
            ),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(labelText: 'Địa chỉ'),
            ),
            const SizedBox(height: 20),
            Text(
              'Tổng tiền: ${CartService.totalPrice().toStringAsFixed(0)} đ',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                CartService.clear();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Thành công'),
                    content: const Text('Thanh toán thành công!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.popUntil(context, (r) => r.isFirst);
                        },
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              },
              child: const Text('Xác nhận thanh toán'),
            )
          ],
        ),
      ),
    );
  }
}
