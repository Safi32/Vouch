import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/subscription_plan.dart';
import 'package:vouch/widgets/custom_button.dart';
import 'package:vouch/widgets/custom_dropdown.dart';
import 'package:vouch/widgets/form_heading.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  // Dropdown selections
  String? _selectedAge;
  String? _selectedDateLength;
  String? _selectedHeight;
  String? _selectedLanguage;
  String? _selectedTravel;
  String? _selectedAgePreference;

  String? _selectedZodiac;
  String? _selectedSmoking;
  String? _selectedEyeColor;
  String? _selectedDrinking;
  String? _selectedCannabis;
  String? _selectedTattoos;

  // Dropdown options
  final List<String> _ageOptions = [
    'Select Age Range',
    '18-25',
    '26-30',
    '31-35',
    '36-40',
    '41-45',
    '46-50',
  ];

  final List<String> _dateLengthOptions = [
    'Select Date Length',
    'Short Date (1-2 hours)',
    'Medium Date (3-4 hours)',
    'Long Date (5+ hours)',
    'Full Day',
  ];

  final List<String> _heightOptions = [
    'Select Height Range',
    '150-160 cm',
    '160-170 cm',
    '170-180 cm',
    '180-190 cm',
    '190+ cm',
  ];

  final List<String> _languageOptions = [
    'Select Language Preference',
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Other',
  ];

  final List<String> _travelOptions = [
    'Select Travel Preference',
    'Local only',
    'Within city',
    'Within country',
    'International',
    'No preference',
  ];

  final List<String> _agePreferenceOptions = [
    'Select Age Preference',
    'Younger',
    'Same age',
    'Older',
    'No preference',
  ];

  final List<String> _zodiacOptions = [
    'Select Zodiac Sign',
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
    'No preference',
  ];

  final List<String> _smokingOptions = [
    'Select Smoking Preference',
    'Non-smoker',
    'Occasional smoker',
    'Regular smoker',
    'No preference',
  ];

  final List<String> _eyeColorOptions = [
    'Select Eye Color',
    'Brown',
    'Blue',
    'Green',
    'Hazel',
    'Gray',
    'No preference',
  ];

  final List<String> _drinkingOptions = [
    'Select Drinking Preference',
    'Non-drinker',
    'Occasional drinker',
    'Social drinker',
    'Regular drinker',
    'No preference',
  ];

  final List<String> _cannabisOptions = [
    'Select Cannabis Preference',
    'Never',
    'Occasionally',
    'Regularly',
    'No preference',
  ];

  final List<String> _tattooOptions = [
    'Select Tattoo Preference',
    'No tattoos',
    'Few tattoos',
    'Many tattoos',
    'No preference',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Center(
                child: Text(
                  'Preferences',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Set your matching preferences',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(height: 30),

              FormHeading(text: 'Attraction '),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Age Range',
                items: _ageOptions,
                selectedValue: _selectedAge,
                onChanged: (value) {
                  setState(() {
                    _selectedAge = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Hair Length'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Date Length',
                items: _dateLengthOptions,
                selectedValue: _selectedDateLength,
                onChanged: (value) {
                  setState(() {
                    _selectedDateLength = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Height'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Height Range',
                items: _heightOptions,
                selectedValue: _selectedHeight,
                onChanged: (value) {
                  setState(() {
                    _selectedHeight = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Language'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Language Preference',
                items: _languageOptions,
                selectedValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Travel'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Travel Preference',
                items: _travelOptions,
                selectedValue: _selectedTravel,
                onChanged: (value) {
                  setState(() {
                    _selectedTravel = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Body Type'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Body Type',
                items: _agePreferenceOptions,
                selectedValue: _selectedAgePreference,
                onChanged: (value) {
                  setState(() {
                    _selectedAgePreference = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Eye Color'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Eye Color',
                items: _eyeColorOptions,
                selectedValue: _selectedEyeColor,
                onChanged: (value) {
                  setState(() {
                    _selectedEyeColor = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Zodiac Sign'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Zodiac Sign',
                items: _zodiacOptions,
                selectedValue: _selectedZodiac,
                onChanged: (value) {
                  setState(() {
                    _selectedZodiac = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Smoking'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Smoking Preference',
                items: _smokingOptions,
                selectedValue: _selectedSmoking,
                onChanged: (value) {
                  setState(() {
                    _selectedSmoking = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Drinking'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Drinking Preference',
                items: _drinkingOptions,
                selectedValue: _selectedDrinking,
                onChanged: (value) {
                  setState(() {
                    _selectedDrinking = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Cannabis Friendly'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Cannabis Preference',
                items: _cannabisOptions,
                selectedValue: _selectedCannabis,
                onChanged: (value) {
                  setState(() {
                    _selectedCannabis = value;
                  });
                },
              ),
              SizedBox(height: 20),

              FormHeading(text: 'Tattoos'),
              SizedBox(height: 8),
              customDropdown(
                hintText: 'Select Tattoo Preference',
                items: _tattooOptions,
                selectedValue: _selectedTattoos,
                onChanged: (value) {
                  setState(() {
                    _selectedTattoos = value;
                  });
                },
              ),
              SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () {
                  Get.to(() => SubscriptionPlan());
                  },
                  icon: '',
                  text: 'Continue',
                  backgroundColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  textColor: Colors.black,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
