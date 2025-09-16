import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int selectedCategoryIndex = 0;

  final List<Map<String, String>> mealCategories = [
    {"emoji": "🍳", "name": "Breakfast"},
    {"emoji": "🥪", "name": "Lunch"},
    {"emoji": "🍝", "name": "Dinner"},
    {"emoji": "🍿", "name": "Snacks"},
    {"emoji": "🍰", "name": "Dessert"},
  ];

  final Map<String, List<Map<String, dynamic>>> meals = {
    "Breakfast": [
      {
        "name": "Garlic Butter Croissant",
        "time": 20,
        "level": "Easy",
        "rating": 4.2,
        "emoji": "🥐",
      },
      {
        "name": "Truffle Scrambled Eggs",
        "time": 15,
        "level": "Easy",
        "rating": 4.5,
        "emoji": "🍳",
      },
      {
        "name": "Smoked Salmon Bagel",
        "time": 25,
        "level": "Medium",
        "rating": 4.7,
        "emoji": "🥯",
      },
      {
        "name": "Avocado Toast with Poached Egg",
        "time": 10,
        "level": "Easy",
        "rating": 4.3,
        "emoji": "🥑",
      },
    ],
    "Lunch": [
      {
        "name": "Grilled Chicken Caesar Salad",
        "time": 30,
        "level": "Medium",
        "rating": 4.6,
        "emoji": "🥗",
      },
      {
        "name": "Beef Wellington Sandwich",
        "time": 45,
        "level": "Hard",
        "rating": 4.8,
        "emoji": "🥪",
      },
      {
        "name": "Truffle Mushroom Risotto",
        "time": 40,
        "level": "Hard",
        "rating": 4.7,
        "emoji": "🍄",
      },
      {
        "name": "Seared Tuna Nicoise Salad",
        "time": 35,
        "level": "Medium",
        "rating": 4.5,
        "emoji": "🐟",
      },
    ],
    "Dinner": [
      {
        "name": "Garlic Shrimp Spaghetti",
        "time": 60,
        "level": "Hard",
        "rating": 4.8,
        "emoji": "🍤",
      },
      {
        "name": "Penne Chicken Carbonara",
        "time": 55,
        "level": "Medium",
        "rating": 4.6,
        "emoji": "🍝",
      },
      {
        "name": "Herb-Crusted Rack of Lamb",
        "time": 70,
        "level": "Hard",
        "rating": 4.9,
        "emoji": "🍖",
      },
      {
        "name": "Seared Salmon with Lemon Butter",
        "time": 50,
        "level": "Medium",
        "rating": 4.7,
        "emoji": "🐟",
      },
    ],
    "Snacks": [
      {
        "name": "Truffle Parmesan Fries",
        "time": 15,
        "level": "Easy",
        "rating": 4.3,
        "emoji": "🍟",
      },
      {
        "name": "Gourmet Chicken Nuggets",
        "time": 20,
        "level": "Easy",
        "rating": 4.4,
        "emoji": "🍗",
      },
      {
        "name": "Mini Caprese Skewers",
        "time": 10,
        "level": "Easy",
        "rating": 4.5,
        "emoji": "🍅",
      },
      {
        "name": "Spicy Sweet Potato Chips",
        "time": 12,
        "level": "Easy",
        "rating": 4.2,
        "emoji": "🍠",
      },
    ],
    "Dessert": [
      {
        "name": "Chocolate Lava Cake",
        "time": 25,
        "level": "Medium",
        "rating": 4.8,
        "emoji": "🍫",
      },
      {
        "name": "Vanilla Bean Panna Cotta",
        "time": 20,
        "level": "Medium",
        "rating": 4.6,
        "emoji": "🍮",
      },
      {
        "name": "Salted Caramel Brownie",
        "time": 30,
        "level": "Medium",
        "rating": 4.7,
        "emoji": "🍫",
      },
      {
        "name": "Strawberry Shortcake Tart",
        "time": 35,
        "level": "Hard",
        "rating": 4.9,
        "emoji": "🍓",
      },
    ],
  };

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> get selectedMeals {
    final category = mealCategories[selectedCategoryIndex]["name"]!;
    return meals[category] ?? [];
  }
}
