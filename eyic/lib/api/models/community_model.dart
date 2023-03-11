import 'package:flutter/material.dart';

class Community {
  String name;
  IconData icon;

  Community({required this.name, required this.icon});

  static var communities = [
    Community(name: "Application development", icon: Icons.currency_bitcoin),
    Community(name: "Blockchain", icon: Icons.mobile_friendly),
    Community(name: "Academics", icon: Icons.school),
    Community(name: "Career Guidance", icon: Icons.alarm),
    Community(name: "Entrepreneurship", icon: Icons.home),
    Community(name: "Photography", icon: Icons.camera),
    Community(name: "Fun chat", icon: Icons.car_repair),
    Community(name: "Mentors only", icon: Icons.bus_alert),
  ];
}
