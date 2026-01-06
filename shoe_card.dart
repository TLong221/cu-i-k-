import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../screens/detail_screen.dart';

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailScreen(shoe: shoe),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                shoe.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(
  shoe.name,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12, 
  ),
),
Text(
  '${shoe.price.toStringAsFixed(0)} đ',
  style: const TextStyle(
    color: Colors.red,
    fontSize: 11,
  ),
),

          ],
        ),
      ),
    );
  }
}
