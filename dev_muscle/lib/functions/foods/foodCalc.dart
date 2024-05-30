Map<String, double> CalculateFood(
    int weight, int height, String goal, String gender, int age) {
  double cal = 0;
  double protein = 0;
  double carb = 0;
  double fat = 0;
  if (goal == "Lose Weight") {
    cal -= 500;
    protein = weight * 1;
    carb = weight * 4;
  } else if (goal == "Get Fitter") {
    cal -= 100;
    protein = weight * 1;
    carb = weight * 5;
  } else if (goal == "Gain Weight") {
    cal += 500;
    protein = weight * 2;
    carb = weight * 6;
  } else {
    protein = weight * 1;
    carb = weight * 5;
  }

  if (gender == "Male") {
    cal += (88 + (weight * 13) + (height * 5) + (6 * age)) * 2;
  } else {
    cal += (88 + (weight * 9) + (height * 3) + (4 * age)) * 2;
  }

  fat = cal / 20;

  return {
    "cal": cal,
    "protein": protein,
    "carb": carb,
    "fat": fat,
  };
}
