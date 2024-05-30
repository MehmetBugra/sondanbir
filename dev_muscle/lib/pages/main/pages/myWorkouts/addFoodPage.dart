import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/foods/foods.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  late List foods;
  late Map _selectedFood;

  @override
  void initState() {
    // foods = ["Seçenek 1", "Seçenek 2", "Seçenek 3"];

    _selectedFood = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchFoods(), // Veriyi alacak olan future
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Veri alınıncaya kadar yükleme animasyonunu göster
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Hata durumunda hata mesajını göster
          return Text('Error: ${snapshot.error}');
        } else {
          foods = snapshot.data!['foods'];

          List<DropdownMenuEntry> items = [];
          for (var food in foods) {
            items.add(DropdownMenuEntry(value: food, label: food['food_name']));
          }

          return Container(
            decoration: BoxDecoration(
              color: button_color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            width: double.infinity,
            height: double.infinity * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  "ADD FOOD",
                  style: TextStyles.IntroTitleText(),
                ),
                const SizedBox(height: 30),
                DropdownMenu(
                  textStyle: const TextStyle(color: Colors.white),
                  label: Text(
                    _selectedFood.isEmpty ? "Food" : _selectedFood['food_name'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  dropdownMenuEntries: items,
                  onSelected: (value) {
                    setState(() {
                      _selectedFood = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Calories: ${_selectedFood['cal'] ?? 0}",
                        style: TextStyles.PrivacyPolicyTextStyle()),
                    Text("Carb: ${_selectedFood['carb'] ?? 0}",
                        style: TextStyles.PrivacyPolicyTextStyle()),
                    Text("Fat: ${_selectedFood['fat'] ?? 0}",
                        style: TextStyles.PrivacyPolicyTextStyle()),
                    Text("Protein: ${_selectedFood['protein'] ?? 0}",
                        style: TextStyles.PrivacyPolicyTextStyle()),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    print(_selectedFood);
                    if (_selectedFood.isNotEmpty) {
                      addFoods(_selectedFood);
                      Navigator.pop(context);
                    } else if (_selectedFood.isEmpty) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please select a food."),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => high_green)),
                  child: Text(
                    "Add",
                    style: TextStyles.GetInfoNextButtonText(),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
