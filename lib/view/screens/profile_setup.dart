import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/view/subscription_plan.dart';
import 'package:vouch/widgets/custom_button.dart';
import 'package:vouch/widgets/custom_dropdown.dart';
import 'package:vouch/widgets/form_heading.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String? _selectedGender;
  String? _selectedGenderIdentity;
  String? _selectedRelationshipType;
  String? _selectedLanguage;
  String? _selectedNationality;
  String? _selectedLocation;

  final List<String> _genderOptions = [
    'Man',
    'Woman',
    'Non-binary',
    'Other',
  ];

  final List<String> _genderIdentityOptions = [
    'Cisgender',
    'Transgender',
    'Non-binary',
    'Genderfluid',
    'Agender',
    'Other',
  ];

  final List<String> _relationshipTypeOptions = [
    'Monogamous',
    'Non-monogamous',
    'Open to both',
  ];

  final List<String> _languageOptions = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
    'Korean',
  ];

  final List<String> _nationalityOptions = [
    'American',
    'British',
    'Canadian',
    'Australian',
    'French',
    'German',
    'Other',
  ];

  final List<String> _locationOptions = [
    'New York',
    'Los Angeles',
    'Chicago',
    'London',
    'Paris',
    'Tokyo',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile_image.png'),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text(
                    'Change Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'John Deo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '@John_deo12',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '+192 65646724674',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '20-06-2000',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Paris, Fr',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              FormHeading(text: 'Gender'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: _genderOptions.map((gender) {
                  return FilterChip(
                    label: Text(gender),
                    selected: _selectedGender == gender,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedGender = selected ? gender : null;
                      });
                    },
                    selectedColor: Colors.amber,
                    labelStyle: TextStyle(
                      color: _selectedGender == gender ? Colors.black : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              FormHeading(text: 'Gender Identity'),
              const SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Gender Identity',
                items: _genderIdentityOptions,
                selectedValue: _selectedGenderIdentity,
                onChanged: (value) {
                  setState(() {
                    _selectedGenderIdentity = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              FormHeading(text: 'Relationship Type'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: _relationshipTypeOptions.map((type) {
                  return FilterChip(
                    label: Text(type),
                    selected: _selectedRelationshipType == type,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedRelationshipType = selected ? type : null;
                      });
                    },
                    selectedColor: Colors.amber,
                    labelStyle: TextStyle(
                      color: _selectedRelationshipType == type ? Colors.black : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              FormHeading(text: 'Languages Spoken'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: _languageOptions.map((language) {
                  return FilterChip(
                    label: Text(language),
                    selected: _selectedLanguage == language,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedLanguage = selected ? language : null;
                      });
                    },
                    selectedColor: Colors.amber,
                    labelStyle: TextStyle(
                      color: _selectedLanguage == language ? Colors.black : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    Get.to(() => const SubscriptionPlan());
                  },
                  text: 'Update',
                  backgroundColor: Colors.amber,
                  borderColor: Colors.amber,
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
