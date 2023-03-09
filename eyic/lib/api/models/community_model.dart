import 'package:flutter/material.dart';

class Community {
  String name;
  IconData icon;

  Community({required this.name, required this.icon});

  static var communities = [
    Community(name: "Crypto", icon: Icons.currency_bitcoin),
    Community(name: "App Dev", icon: Icons.mobile_friendly),
    Community(name: "Academics", icon: Icons.school),
    Community(name: "Clock", icon: Icons.alarm),
    Community(name: "Home", icon: Icons.home),
    Community(name: "Photography", icon: Icons.camera),
    Community(name: "Mechianic", icon: Icons.car_repair),
    Community(name: "Bus", icon: Icons.bus_alert),
  ];
}
