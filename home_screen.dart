import 'package:flutter/material.dart';
import '../data/shoe_data.dart';
import '../widgets/shoe_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredShoes = shoes.where((shoe) {
      return shoe.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Store'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // 🔶 SEARCH BOX
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm giày...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          // 🔶 BANNER
          SizedBox(
            height: 150,
            child: PageView(
              children: [
                Image.asset(
                  'assets/images/banner1.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/banner2.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔶 PRODUCT GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredShoes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return ShoeCard(shoe: filteredShoes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
