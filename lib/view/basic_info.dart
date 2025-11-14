import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/setup_profile.dart';
import 'package:vouch/widgets/custom_textfield.dart';
import 'package:vouch/widgets/custom_dropdown.dart';
import 'package:vouch/widgets/custom_radio_button.dart';
import 'package:vouch/widgets/custom_button.dart';
import 'package:vouch/widgets/form_heading.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String? _selectedCountry;
  String? _selectedGender;
  String? _selectedSubGender;
  String? _selectedSexualOrientation;
  String? _selectedHereFor;
  String? _selectedOpenTo;

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Netherlands',
    'Other',
  ];

  final List<String> _sexualOrientations = [
    'Straight',
    'Gay',
    'Lesbian',
    'Bisexual',
    'Pansexual',
    'Asexual',
    'Other',
  ];

  final List<String> _hereForOptions = [
    'Dating',
    'Friendship',
    'Networking',
    'Relationship',
    'Casual',
    'Other',
  ];

  final List<String> _openToOptions = [
    'Everyone',
    'Men',
    'Women',
    'Non-binary',
    'Trans',
    'Custom',
  ];

  final List<String> _manSubOptions = [
    'Cis Man',
    'Intersex Man',
    'Trans Man',
    'Transmasculine',
  ];

  void _showFeedbackDialog(BuildContext context) {
    final TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Feedback Help Us',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We are to be inclusive of all genders. If we\'ve missed your choice, do let us know so we can improve and serve you better.',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade300,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: feedbackController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your feedback',
                        hintStyle: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey.shade400,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.buttonMedium.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SetupProfile());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Send',
                            style: AppTextStyles.buttonMedium.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _locationController.dispose();
    super.dispose();
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
                  icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                ),
                Center(
                  child: Text(
                    'Basic Information',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Tell us about yourself',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FormHeading(text: 'About'),
                SizedBox(height: 8),
                customTextField(
                  controller: _aboutController,
                  hintText: 'Name*',
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(height: 20),

                SizedBox(height: 8),
                customDropdown(
                  hintText: 'Select Country*',
                  items: _countries,
                  selectedValue: _selectedCountry,
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                ),
                SizedBox(height: 20),

                SizedBox(height: 8),
                customTextField(
                  controller: _locationController,
                  hintText: 'Location*',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 25),

                FormHeading(text: 'Gender'),
                SizedBox(height: 15),
                Column(
                  children: [
                    CustomRadioButton<String>(
                      value: 'Man',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                          _selectedSubGender =
                              null;
                        });
                      },
                      title: 'Man',
                    ),
                    SizedBox(height: 12),
                    CustomRadioButton<String>(
                      value: 'Woman',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                          _selectedSubGender =
                              null; 
                        });
                      },
                      title: 'Woman',
                    ),
                    SizedBox(height: 12),
                    CustomRadioButton<String>(
                      value: 'Beyond Binary',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                          _selectedSubGender =
                              null;  
                        });
                      },
                      title: 'Beyond Binary',
                    ),

         
                    if (_selectedGender == 'Man') ...[
                      SizedBox(height: 16),
                      customDropdown(
                        hintText: 'Add more about your gender (optional)',
                        items: _manSubOptions,
                        selectedValue: _selectedSubGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedSubGender = value;
                          });
                        },
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 25),
                FormHeading(text: 'Sexual Orientation'),
                SizedBox(height: 8),
                customDropdown(
                  hintText: 'Select your orientation',
                  items: _sexualOrientations,
                  selectedValue: _selectedSexualOrientation,
                  onChanged: (value) {
                    setState(() {
                      _selectedSexualOrientation = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                FormHeading(text: 'Here For'),
                SizedBox(height: 8),
                customDropdown(
                  hintText: 'Select here for',
                  items: _hereForOptions,
                  selectedValue: _selectedHereFor,
                  onChanged: (value) {
                    setState(() {
                      _selectedHereFor = value;
                    });
                  },
                ),
                SizedBox(height: 20),
 
                FormHeading(text: 'Open To'),
                SizedBox(height: 8),
                customDropdown(
                  hintText: 'Select open to',
                  items: _openToOptions,
                  selectedValue: _selectedOpenTo,
                  onChanged: (value) {
                    setState(() {
                      _selectedOpenTo = value;
                    });
                  },
                ),
      SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showFeedbackDialog(context);
                      }
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
