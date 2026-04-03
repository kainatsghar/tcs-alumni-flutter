import 'package:flutter/material.dart';

class PartnerModel {
  final String name;
  final String subtitle;
  final List<String> tags;
  final double rating;
  final int? reviewCount;
  final IconData? icon;
  final String? imagePath;
  final String? overview;
  final List<ServiceModel>? services;

  // Volunteering specific
  final String? cause;
  final String? location;

  const PartnerModel({
    required this.name,
    required this.subtitle,
    required this.tags,
    required this.rating,
    this.reviewCount,
    this.icon,
    this.imagePath,
    this.overview,
    this.services,
    this.cause,
    this.location,
  });
}

class ServiceModel {
  final String title;
  final IconData icon;

  const ServiceModel({required this.title, required this.icon});
}