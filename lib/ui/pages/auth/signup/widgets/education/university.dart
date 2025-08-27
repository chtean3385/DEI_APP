import 'package:flutter/material.dart';
import '../../components/auto_sugstion_form_field.dart';

class UniversityField extends StatelessWidget {
  final TextEditingController controller;

  UniversityField({super.key, required this.controller});

  final List<String> _universities = [
    // Global universities
    "Harvard University",
    "Stanford University",
    "Massachusetts Institute of Technology (MIT)",
    "University of Cambridge",
    "University of Oxford",
    "California Institute of Technology (Caltech)",
    "University of Chicago",
    "Princeton University",
    "Yale University",
    "Columbia University",
    "University of Pennsylvania",
    "Johns Hopkins University",
    "University of California, Berkeley",
    "University of California, Los Angeles (UCLA)",
    "University of Michigan",
    "Cornell University",
    "Duke University",
    "Northwestern University",
    "University of Toronto",
    "University of British Columbia",
    "McGill University",
    "University of Sydney",
    "University of Melbourne",
    "National University of Singapore",
    "Nanyang Technological University",
    "Tsinghua University",
    "Peking University",
    "ETH Zurich",
    "University of Hong Kong",
    "University of Tokyo",
    "Seoul National University",
    "KAIST",
    "Imperial College London",
    "London School of Economics (LSE)",
    "University College London (UCL)",
    "University of Edinburgh",
    "University of Manchester",
    "University of Warwick",
    "Australian National University",
    "Monash University",

    // Indian universities
    "Indian Institute of Science (IISc), Bangalore",
    "Indian Institute of Technology (IIT) Bombay",
    "Indian Institute of Technology (IIT) Delhi",
    "Indian Institute of Technology (IIT) Madras",
    "Indian Institute of Technology (IIT) Kanpur",
    "Indian Institute of Technology (IIT) Kharagpur",
    "Indian Institute of Technology (IIT) Roorkee",
    "Indian Institute of Technology (IIT) Guwahati",
    "Indian Institute of Technology (IIT) Hyderabad",
    "Indian Institute of Technology (IIT) Indore",
    "Jawaharlal Nehru University (JNU), Delhi",
    "University of Delhi (DU), Delhi",
    "Banaras Hindu University (BHU), Varanasi",
    "University of Calcutta, Kolkata",
    "Anna University, Chennai",
    "Savitribai Phule Pune University, Pune",
    "University of Mumbai, Mumbai",
    "Aligarh Muslim University (AMU), Aligarh",
    "Jamia Millia Islamia (JMI), Delhi",
    "Indian Institute of Management (IIM) Ahmedabad",
    "Indian Institute of Management (IIM) Bangalore",
    "Indian Institute of Management (IIM) Calcutta",
    "Indian Institute of Technology (ISM) Dhanbad",
    "University of Hyderabad (UoH), Hyderabad",
    "Manipal Academy of Higher Education, Manipal",
    "Vellore Institute of Technology (VIT), Vellore",
    "Birla Institute of Technology & Science (BITS) Pilani",
    "Indian Statistical Institute (ISI), Kolkata",
    "Tata Institute of Fundamental Research (TIFR), Mumbai",
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      hint: "University name",
      icon: Icons.school_outlined,
      suggestions: _universities,
      maxSuggestions: 10,
      caseSensitive: false,
      onSuggestionSelected: (suggestion) {
        print('Selected University: $suggestion');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a university';
        }
        return null;
      },
    );
  }
}
