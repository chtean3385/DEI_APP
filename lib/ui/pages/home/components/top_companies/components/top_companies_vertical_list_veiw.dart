import 'package:dei_champions/ui/pages/home/components/top_companies/components/top_companies_list_card.dart';
import 'package:flutter/material.dart';

import '../top_companies.dart';

class TopCompaniesVerticalListView extends StatelessWidget {
  TopCompaniesVerticalListView({super.key});

  final topCompanies = [
    Company(
      name: "Bigbasket",
      logoUrl: "https://img.icons8.com/color/96/000000/shopping-cart.png",
      rating: 3.9,
      reviewCount: 5200,
      tag: "B2C",
      description:
      "Bigbasket is India’s largest online supermarket delivering groceries, fresh fruits, vegetables, and household essentials.",
      onViewJobs: () {
        // Navigate to Bigbasket jobs
      },
    ),
    Company(
      name: "Care Health Insurance",
      logoUrl: "https://img.icons8.com/color/96/000000/medical-insurance.png",
      rating: 3.5,
      reviewCount: 2300,
      tag: "Insurance",
      description:
      "Care Health Insurance offers a wide range of affordable and comprehensive health insurance products across India.",
      onViewJobs: () {
        // Navigate to Care Health Insurance jobs
      },
    ),
    Company(
      name: "Brillio",
      logoUrl: "https://img.icons8.com/color/96/000000/briefcase.png",
      rating: 3.4,
      reviewCount: 1200,
      tag: "IT Services",
      description:
      "Brillio is a digital consulting and technology services company driving transformation with cloud, analytics, and AI.",
      onViewJobs: () {
        // Navigate to Brillio jobs
      },
    ),
    Company(
      name: "Aurobindo Pharma",
      logoUrl: "https://img.icons8.com/color/96/000000/pill.png",
      rating: 4.0,
      reviewCount: 5300,
      tag: "Pharma",
      description:
      "Aurobindo Pharma is a leading Indian multinational engaged in manufacturing generic pharmaceuticals and APIs.",
      onViewJobs: () {
        // Navigate to Aurobindo Pharma jobs
      },
    ),
    Company(
      name: "Pristyn Care",
      logoUrl: "https://img.icons8.com/color/96/000000/hospital-room.png",
      rating: 3.3,
      reviewCount: 919,
      tag: "Healthcare",
      description:
      "Pristyn Care is a healthcare startup offering advanced surgical care through partnerships with hospitals and doctors.",
      onViewJobs: () {
        // Navigate to Pristyn Care jobs
      },
    ),
    Company(
      name: "Lenovo",
      logoUrl: "https://img.icons8.com/color/96/000000/lenovo.png",
      rating: 4.1,
      reviewCount: 210,
      tag: "Technology",
      description:
          "Lenovo is a global leader in PCs, laptops, and smart devices, driving innovation in consumer and enterprise solutions.",
      onViewJobs: () {
        // Navigate to Lenovo jobs
      },
    ),
    Company(
      name: "EPAM Systems",
      logoUrl: "https://img.icons8.com/ios-filled/100/000000/epam.png",
      rating: 3.7,
      reviewCount: 1800,
      tag: "IT Services",
      description:
          "EPAM Systems is a leading provider of digital platform engineering and product development services worldwide.",
      onViewJobs: () {
        // Navigate to EPAM jobs
      },
    ),
    Company(
      name: "Dow Chemical",
      logoUrl: "https://img.icons8.com/color/96/000000/chemical-plant.png",
      rating: 3.9,
      reviewCount: 850,
      tag: "Chemicals",
      description:
          "Dow Chemical delivers a broad range of science-based products and solutions for packaging, infrastructure, and consumer care.",
      onViewJobs: () {
        // Navigate to Dow Chemical jobs
      },
    ),
    Company(
      name: "EC-Council",
      logoUrl:
          "https://img.icons8.com/color/96/000000/security-configuration.png",
      rating: 4.0,
      reviewCount: 650,
      tag: "Cybersecurity",
      description:
          "EC-Council is a global leader in cybersecurity certification programs such as CEH, CHFI, and CND.",
      onViewJobs: () {
        // Navigate to EC-Council jobs
      },
    ),
    Company(
      name: "Tech Mahindra",
      logoUrl: "https://img.icons8.com/color/96/000000/tech.png",
      rating: 4.2,
      reviewCount: 4200,
      tag: "IT Services",
      description:
          "Tech Mahindra provides innovative IT services, networking technology solutions, and business process outsourcing worldwide.",
      onViewJobs: () {
        // Navigate to Tech Mahindra jobs
      },
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topCompanies.length,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return TopCompaniesListCard(company: topCompanies[index]);
      },
    );
  }
}
