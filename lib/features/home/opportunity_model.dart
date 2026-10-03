import 'package:flutter/material.dart';

enum OppType { job, internship, course }

class OpportunityModel {
  final String id;
  final OppType type;
  final String title;
  final String company;
  final String location;
  final String pay;
  final String duration;
  final double rating;
  final List<String> tags;
  final Color color;

  const OpportunityModel({
    required this.id,
    required this.type,
    required this.title,
    required this.company,
    required this.location,
    required this.pay,
    required this.duration,
    this.rating = 0,
    this.tags = const [],
    required this.color,
  });
}
