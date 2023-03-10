class Coupon {
  String id;
  String brand;
  String description;
  int price;
  String category;

  Coupon({
    required this.id,
    required this.brand,
    required this.description,
    required this.category,
    required this.price
  });

  static var coupons = [
    Coupon(
      id: "1",
      brand: "Amazon",
      description: "Amazon Prime",
      category: "Entertainment",
      price: 299
    ),
    Coupon(
      id: "2",
      brand: "Netflix",
      description: "Netflix Premium",
      category: "Entertainment",
      price: 399
    ),
    Coupon(
      id: "3",
      brand: "Spotify",
      description: "Spotify Premium",
      category: "Entertainment",
      price: 499
    ),
    Coupon(
      id: "4",
      brand: "Google",
      description: "Google Drive",
      category: "Productivity",
      price: 199
    ),
    Coupon(
      id: "5",
      brand: "Microsoft",
      description: "Microsoft Office",
      category: "Productivity",
      price: 99
    ),
    Coupon(
      id: "6",
      brand: "Adobe",
      description: "Adobe Photoshop",
      category: "Productivity",
      price: 399
    ),
    Coupon(
      id: "7",
      brand: "Apple",
      description: "Apple Music",
      category: "Entertainment",
      price: 499
    ),
    Coupon(
      id: "8",
      brand: "Apple",
      description: "Apple iCloud",
      category: "Productivity",
      price: 999
    ),
    Coupon(
      id: "9",
      brand: "Apple",
      description: "Apple Arcade",
      category: "Entertainment",
      price: 999
    ),
    Coupon(
      id: "10",
      brand: "Apple",
      description: "Apple TV+",
      category: "Entertainment",
      price: 999
    ),
    Coupon(
      id: "11",
      brand: "Apple",
      description: "Apple News+",
      category: "Entertainment",
      price: 999
    ),
    Coupon(
      id: "12",
      brand: "Apple",
      description: "Apple Fitness+",
      category: "Entertainment",
      price: 999
    ),
    Coupon(
      id: "13",
      brand: "Swiggy",
      description: "Swiggy Super",
      category: "Food",
      price: 999
    ),
    Coupon(
      id: "14",
      brand: "Zomato",
      description: "Zomato Gold",
      category: "Food",
      price: 999
    ),
    Coupon(
      id: "15",
      brand: "Uber",
      description: "Uber Eats",
      category: "Food",
      price: 999
    ),
    Coupon(
      id: "16",
      brand: "Uber",
      description: "Uber Go",
      category: "Transport",
      price: 999
    ),
    Coupon(
      id: "17",
      brand: "Uber",
      description: "Uber X",
      category: "Transport",
      price: 999
    ),
    Coupon(
      id: "18",
      brand: "Uber",
      description: "Uber XL",
      category: "Transport",
      price: 999
    ),
    Coupon(
      id: "19",
      brand: "Himalaya",
      description: "Facewash",
      category: "Beauty",
      price: 999
    ),
    Coupon(
      id: "20",
      brand: "Himalaya",
      description: "Shampoo",
      category: "Beauty",
      price: 999
    ),
    Coupon(
      id: "21",
      brand: "Himalaya",
      description: "Bodywash",
      category: "Beauty",
      price: 999
    ),
  ];
}
