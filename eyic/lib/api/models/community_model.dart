import 'package:flutter/material.dart';

class Community {
  String name;
  IconData icon;

  Community({required this.name, required this.icon});

  static var communities = [
    Community(name: "Blockchain", icon: Icons.currency_bitcoin),
    Community(name: "App Dev", icon: Icons.mobile_friendly),
    Community(name: "Academics", icon: Icons.school),
    Community(name: "Career Guidance", icon: Icons.alarm),
    Community(name: "Sports", icon: Icons.home),
    Community(name: "Photography", icon: Icons.camera),
    Community(name: "Entrepreneurship", icon: Icons.car_repair),
    Community(name: "Soft skills", icon: Icons.bus_alert),
  ];
}
