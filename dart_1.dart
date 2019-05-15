import 'dart:core';                                 //Added to manipulate arrays.
import 'dart:io';                                   //Added to get user input.

class PackageShipCost{                              //Class for determining shipping cost of a specific item.
  int weight;
  String packageName;
  double groundFlatCharge = 20.00;                  //Flat rate to add for ground shipping

  double DronePrice(int packageWeight){             //Method to find the price of drone shipping.
    if (packageWeight <= 2) {
      return 4.50*packageWeight;
    }
    if((packageWeight > 2) && (packageWeight <= 6)){
      return 9.00*packageWeight;
    }
    if((packageWeight > 6) && (packageWeight <= 10)){
      return 12.00*packageWeight;
    }
    else{
      return 14.25*packageWeight;
    }
  }

  double GroundPrice(int packageWeight){             //Method to find the price of ground shipping.
    if (packageWeight <= 2) {
      return 1.50*packageWeight + groundFlatCharge;
    }
    if((packageWeight > 2) && (packageWeight <= 6)){
      return 3.00*packageWeight + groundFlatCharge;
    }
    if((packageWeight > 6) && (packageWeight <= 10)){
      return 4.00*packageWeight + groundFlatCharge;
    }
    else{
      return 4.75*packageWeight + groundFlatCharge;
    }
  }
}

main(){
  var package = new PackageShipCost();
  stdout.write("What kind of object are you shipping? ");
  //package.packageName = stdin.readLineSync();
  package.packageName = stdin.readLineSync();                 //User inputs package name.

  stdout.write("How many whole pounds does it weigh? ");
  //package.weight = stdin.readLineSync();
  var weightInput = stdin.readLineSync();                 //User inputs package weight.
  int weightInt = int.parse(weightInput);
  package.weight = weightInt;

  double dronePriceReturn = package.DronePrice(package.weight);
  double groundPriceReturn = package.GroundPrice(package.weight);
  double premiumGroundRate = 125.00;
  double minPrice = 0;
  String minShipMethod;


  var priceTypes = ['Drone', 'Ground', 'Premium Ground'];
  var prices = [dronePriceReturn, groundPriceReturn, premiumGroundRate];


  for (var i = 0; i < prices.length; i++) {
    if(minPrice == 0){
      minPrice = prices[i];
      minShipMethod = priceTypes[i];
    }
    if(minPrice > prices[i]){
      minPrice = prices[i];
      minShipMethod = priceTypes[i];
    }
  }

  stdout.write("What's your name? ");
  var name = stdin.readLineSync();
  print("Drone price: " + dronePriceReturn.toString());
  print("Ground price: " + groundPriceReturn.toString());
  print("Premium ground price: " + premiumGroundRate.toString());
  print("Hi, $name! The minimum ship price for the " + package.packageName + " is \$" + minPrice.toString() + " via " + minShipMethod.toString() + ".");


}
