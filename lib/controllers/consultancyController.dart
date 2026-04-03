import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Views/Models/PartnerModel.dart';

class ConsultancyController extends GetxController {
  final selectedTab = 0.obs;

  final educationPartners = <PartnerModel>[
    PartnerModel(
      name: 'Global Study Abroad',
      subtitle: 'Admissions • Visa • IELTS',
      tags: ['🇬🇧', '🇨🇦', '🇦🇺', '🇳🇿', '🇺🇸'],
      rating: 5.0,
      reviewCount: 120,
      imagePath: "https://object.pixocial.com/pixocial/dmxffni837f1xrj8pki9xgrl.jpg",
      overview: 'Leading consultancy with 15+ years of experience in overseas education.',
      services: [
        ServiceModel(title: 'University Admissions', icon: Icons.school),
        ServiceModel(title: 'Visa Assistance', icon: Icons.card_travel),
        ServiceModel(title: 'Scholarship Guidance', icon: Icons.workspace_premium),
      ],
    ),
    PartnerModel(
      name: 'Bright Future Consultants',
      subtitle: 'Study Abroad Experts',
      tags: ['🇺🇸', '🇩🇪'],
      rating: 4.0,
      imagePath: "https://object.pixocial.com/pixocial/dmxffni837f1xrj8pki9xgrl.jpg",
      overview: 'Dedicated consultancy helping students achieve their dreams abroad.',

      services: [
        ServiceModel(title: 'University Admissions', icon: Icons.school),
        ServiceModel(title: 'Visa Assistance', icon: Icons.card_travel),
      ],
    ),
  ].obs;

  final volunteeringPartners = <PartnerModel>[
    PartnerModel(
      name: 'Eco Warriors',
      subtitle: 'Environment',
      tags: [],
      rating: 0,
      imagePath: "https://object.pixocial.com/pixocial/dmxffni837f1xrj8pki9xgrl.jpg",
      cause: 'Environment',
      location: 'Remote & On-site',
      overview: 'Join us in protecting the planet through impactful environmental projects.',
      services: [
        ServiceModel(title: 'Tree Plantation Drives', icon: Icons.park),
        ServiceModel(title: 'Climate Awareness', icon: Icons.wb_sunny),
        ServiceModel(title: 'Tree Plantation Drives', icon: Icons.park),
        ServiceModel(title: 'Climate Awareness', icon: Icons.wb_sunny),
        ServiceModel(title: 'Tree Plantation Drives', icon: Icons.park),
        ServiceModel(title: 'Climate Awareness', icon: Icons.wb_sunny),
        ServiceModel(title: 'Tree Plantation Drives', icon: Icons.park),
        ServiceModel(title: 'Climate Awareness', icon: Icons.wb_sunny),
        ServiceModel(title: 'Tree Plantation Drives', icon: Icons.park),
        ServiceModel(title: 'Climate Awareness', icon: Icons.wb_sunny),
      ],
    ),
    PartnerModel(
      name: 'Teach for Change',
      subtitle: 'Education',
      tags: [],
      rating: 0,
      imagePath: "https://object.pixocial.com/pixocial/dmxffni837f1xrj8pki9xgrl.jpg",
      cause: 'Education',
      location: 'India',
      overview: 'Empowering underprivileged children through quality education and mentorship.',
      services: [
        ServiceModel(title: 'Classroom Teaching', icon: Icons.school),
        ServiceModel(title: 'Curriculum Development', icon: Icons.edit_note),
      ],
    ),
  ].obs;

  void changeTab(int index) => selectedTab.value = index;
}