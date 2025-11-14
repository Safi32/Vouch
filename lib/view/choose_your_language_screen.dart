import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/referral_screen.dart';
import 'package:vouch/widgets/custom_button.dart';

class ChooseYourLanguageScreen extends StatefulWidget {
  const ChooseYourLanguageScreen({super.key});

  @override
  State<ChooseYourLanguageScreen> createState() => _ChooseYourLanguageScreenState();
}

class _ChooseYourLanguageScreenState extends State<ChooseYourLanguageScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'name': 'English', 'subtitle': ''},
    {'name': 'Thai', 'subtitle': 'ไทย'},
    {'name': 'Portuguese', 'subtitle': 'Português'},
    {'name': 'Spanish', 'subtitle': 'Español'},
    {'name': 'French', 'subtitle': 'Française'},
    {'name': 'Arabic', 'subtitle': 'عربي'},
    {'name': 'Chinese', 'subtitle': '中国人'},
    {'name': 'German', 'subtitle': 'Deutsch'},
    {'name': 'Italian', 'subtitle': 'Italiano'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
   
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Choose Your Language',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey[300],
                    indent: 0,
                    endIndent: 0,
                  ),
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      leading: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = language['name']!;
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedLanguage == language['name'] 
                                ? AppColors.primary 
                                : Colors.transparent,
                            border: Border.all(
                              color: selectedLanguage == language['name'] 
                                  ? AppColors.primary 
                                  : Colors.grey[400]!,
                              width: 2,
                            ),
                          ),
                          child: selectedLanguage == language['name']
                              ? Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      title: Text(
                        language['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: language['subtitle']!.isNotEmpty
                          ? Text(
                              language['subtitle']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          selectedLanguage = language['name']!;
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    icon: '',  
                    text: 'Select',
                    backgroundColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    textColor: Colors.black,
                    onPressed: () {
                      Get.to(() => const ReferralScreen());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}