import 'package:stacked/stacked.dart';
import 'package:yummy_bites/routes/navigation_helper.dart';

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
        "image": "assets/breakfast/garlic_butter_croissant.png",
      },
      {
        "name": "Truffle Scrambled Eggs",
        "time": 15,
        "level": "Easy",
        "rating": 4.5,
        "image": "assets/breakfast/truffled_scrambled_eggs.png",
      },
      {
        "name": "Smoked Salmon Bagel",
        "time": 25,
        "level": "Medium",
        "rating": 4.7,
        "image": "assets/breakfast/salmon_bagel.png",
      },
      {
        "name": "Avocado Toast with Poached Egg",
        "time": 10,
        "level": "Easy",
        "rating": 4.3,
        "image": "assets/breakfast/avocado_toast.png",
      },
    ],
    "Lunch": [
      {
        "name": "Grilled Chicken Caesar Salad",
        "time": 30,
        "level": "Medium",
        "rating": 4.6,
        "image": "assets/breakfast/grilled_chicken.png",
      },
      {
        "name": "Beef Wellington Sandwich",
        "time": 45,
        "level": "Hard",
        "rating": 4.8,
        "image": "assets/breakfast/beef_sandwich.png",
      },
      {
        "name": "Truffle Mushroom Risotto",
        "time": 40,
        "level": "Hard",
        "rating": 4.7,
        "image": "assets/breakfast/truffle_mushroom_risotto.png",
      },
      {
        "name": "Seared Tuna Nicoise Salad",
        "time": 35,
        "level": "Medium",
        "rating": 4.5,
        "image": "assets/breakfast/tuna_nicoise_salad.png",
      },
    ],
    "Dinner": [
      {
        "name": "Garlic Shrimp Spaghetti",
        "time": 60,
        "level": "Hard",
        "rating": 4.8,
        "image": "assets/dinner/shrimp_spaghetti.png",
      },
      {
        "name": "Penne Chicken Carbonara",
        "time": 55,
        "level": "Medium",
        "rating": 4.6,
        "image": "assets/dinner/chicken_carbonara.png",
      },
      {
        "name": "Herb-Crusted Rack of Lamb",
        "time": 70,
        "level": "Hard",
        "rating": 4.9,
        "image": "assets/dinner/rack_lamb.png",
      },
      {
        "name": "Seared Salmon with Lemon Butter",
        "time": 50,
        "level": "Medium",
        "rating": 4.7,
        "image": "assets/dinner/salmon_lemon.png",
      },
    ],
    "Snacks": [
      {
        "name": "Truffle Parmesan Fries",
        "time": 15,
        "level": "Easy",
        "rating": 4.3,
        "image": "assets/snacks/parmesan_fries.png",
      },
      {
        "name": "Gourmet Chicken Nuggets",
        "time": 20,
        "level": "Easy",
        "rating": 4.4,
        "image": "assets/snacks/chicken_nuggets.png",
      },
      {
        "name": "Mini Caprese Skewers",
        "time": 10,
        "level": "Easy",
        "rating": 4.5,
        "image": "assets/snacks/caprese_skewers.png",
      },
      {
        "name": "Spicy Sweet Potato Chips",
        "time": 12,
        "level": "Easy",
        "rating": 4.2,
        "image": "assets/snacks/sweet_potato_chips.png",
      },
    ],
    "Dessert": [
      {
        "name": "Chocolate Lava Cake",
        "time": 25,
        "level": "Medium",
        "rating": 4.8,
        "image": "assets/dessert/lava_cake.png",
      },
      {
        "name": "Vanilla Bean Panna Cotta",
        "time": 20,
        "level": "Medium",
        "rating": 4.6,
        "image": "assets/dessert/panna_cotta.png",
      },
      {
        "name": "Salted Caramel Brownie",
        "time": 30,
        "level": "Medium",
        "rating": 4.7,
        "image": "assets/dessert/salted_brownie.png",
      },
      {
        "name": "Strawberry Shortcake Tart",
        "time": 35,
        "level": "Hard",
        "rating": 4.9,
        "image": "assets/dessert/strawberry_tart.png",
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

  onFoodPressed() {
    RouterHelper().navigateToFoodView();
  }
}
