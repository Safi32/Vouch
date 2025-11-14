import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/preference_screen.dart';
import 'package:vouch/widgets/custom_textfield.dart';
import 'package:vouch/widgets/custom_dropdown.dart';
import 'package:vouch/widgets/custom_button.dart';
import 'package:vouch/widgets/form_heading.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  String? _selectedDateOfBirth;
  List<String> _selectedLanguages = [];

  final List<String> _dateOptions = [
    'Select Height',
    '18 years',
    '19 years',
    '20 years',
    '21 years',
    '22 years',
    '23 years',
    '24 years',
    '25 years',
    '26 years',
    '27 years',
    '28 years',
    '29 years',
    '30 years',
    '31 years',
    '32 years',
    '33 years',
    '34 years',
    '35 years',
  ];

  final List<String> _availableLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Chinese',
    'Arabic',
    'Japanese',
    'Korean',
  ];

  @override
  void dispose() {
    _instagramController.dispose();
    _whatsappController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  void _toggleLanguage(String language) {
    setState(() {
      if (_selectedLanguages.contains(language)) {
        _selectedLanguages.remove(language);
      } else {
        _selectedLanguages.add(language);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Set up your profile',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Complete your profile to start using Vouch',
                    style: AppTextStyles.buttonSmall.copyWith(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                SizedBox(height: 30),
 
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Upload Photo", style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: AppColors.primary,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 30),

             
                SizedBox(height: 8),
                customTextField(
                  controller: _instagramController,
                  hintText: 'Instagram Username',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
 
                SizedBox(height: 8),
                customTextField(
                  controller: _whatsappController,
                  hintText: 'WhatsApp Bio',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),

               
                SizedBox(height: 8),
                customDropdown(
                  hintText: 'Select Height',
                  items: _dateOptions,
                  selectedValue: _selectedDateOfBirth,
                  onChanged: (value) {
                    setState(() {
                      _selectedDateOfBirth = value;
                    });
                  },
                ),
                SizedBox(height: 20),

         
                SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _aboutController,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Tell us about yourself...',
                      hintStyle: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey.shade400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 25),
 
                FormHeading(text: 'LANGUAGES SPOKEN'),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _availableLanguages.map((language) {
                    final isSelected = _selectedLanguages.contains(language);
                    return InkWell(
                      onTap: () => _toggleLanguage(language),
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                        ),
                        child: Text(
                          language,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey.shade600,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),

 
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      Get.to(()=> const PreferenceScreen());
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
      ),
    );
  }
}
