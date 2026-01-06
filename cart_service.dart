import '../models/shoe.dart';

class CartService {
  static final List<Shoe> cartItems = [];

  static void addToCart(Shoe shoe) {
    cartItems.add(shoe);
  }

  static double totalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  static void clear() {
    cartItems.clear();
  }
}
