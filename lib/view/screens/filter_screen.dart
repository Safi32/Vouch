import 'package:flutter/material.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/utils/colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedGender = 'Woman';
  List<String> selectedTiers = [];
  List<String> selectedPreferences = [];
  RangeValues ageRange = const RangeValues(22, 46);
  String selectedSexualOrientation = '';
  String selectedHereFor = '';
  String selectedOpenTo = '';
  String selectedSortBy = 'Most Popular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom header
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Text(
                    'Filter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Select Tiers'),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTierSelection(
                            imageUrl: AppImages.subscriptionIcon01,
                          ),
                          _buildTierSelection(
                            imageUrl: AppImages.subscriptionIcon02,
                          ),
                          _buildTierSelection(
                            imageUrl: AppImages.subscriptionIcon03,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      _buildTierSelection(
                        imageUrl: AppImages.subscriptionIcon05,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Select Preferences'),
                  const SizedBox(height: 12),
                  _buildPreferencesGrid(),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Gender'),
                  const SizedBox(height: 12),
                  _buildGenderSelection(),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Age Range'),
                  const SizedBox(height: 12),
                  _buildAgeRangeSlider(),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Sexual Orientation'),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    'Select sexual orientation',
                    selectedSexualOrientation,
                    (value) {
                      setState(() {
                        selectedSexualOrientation = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Here For'),
                  const SizedBox(height: 12),
                  _buildDropdown('Select Here For', selectedHereFor, (value) {
                    setState(() {
                      selectedHereFor = value;
                    });
                  }),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Open To'),
                  const SizedBox(height: 12),
                  _buildDropdown('Select Open To', selectedOpenTo, (value) {
                    setState(() {
                      selectedOpenTo = value;
                    });
                  }),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Sort By'),
                  const SizedBox(height: 12),
                  _buildSortBySelection(),
                  const SizedBox(height: 20),
                  _buildBottomButtons(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTierSelection({required String imageUrl}) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
        image: DecorationImage(image: AssetImage(imageUrl)),
      ),
    );
  }

  Widget _buildPreferencesGrid() {
    final preferences = [
      'Attraction',
      'Height',
      'Language',
      'Body Type',
      'Eye Color',
      'Smoking',
      'Hair Length',
      'Tattoos',
      'Cannabis',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: preferences.length,
      itemBuilder: (context, index) {
        final pref = preferences[index];
        final isSelected = selectedPreferences.contains(pref);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedPreferences.remove(pref);
              } else {
                selectedPreferences.add(pref);
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFA500) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? const Color(0xFFFFA500) : Colors.grey[300]!,
              ),
            ),
            child: Center(
              child: Text(
                pref,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderSelection() {
    final genders = ['Man', 'Woman', 'Beyond Binary'];
    return Column(
      children: genders.map((gender) {
        return RadioListTile<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value!;
            });
          },
          title: Text(
            gender,
            style: const TextStyle(color: Colors.black),
          ),
          activeColor: AppColors.primary,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildAgeRangeSlider() {
    return Column(
      children: [
        RangeSlider(
          values: ageRange,
          min: 18,
          max: 100,
          activeColor: AppColors.primary,
          onChanged: (values) {
            setState(() {
              ageRange = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${ageRange.start.round()}'),
            Text('${ageRange.end.round()}'),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, String value, Function(String) onChanged) {
    return GestureDetector(
      onTap: () {
        // Handle dropdown selection
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value.isEmpty ? hint : value,
              style: TextStyle(
                color: value.isEmpty ? Colors.grey[600] : Colors.black,
                fontSize: 14,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildSortBySelection() {
    final sortOptions = ['Most Popular', 'Near Me', 'Recent Profile'];
    return Column(
      children: sortOptions.map((option) {
        return RadioListTile<String>(
          value: option,
          groupValue: selectedSortBy,
          onChanged: (value) {
            setState(() {
              selectedSortBy = value!;
            });
          },
          title: Text(
            option,
            style: const TextStyle(color: Colors.black),
          ),
          activeColor: AppColors.primary,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Clear filters
                setState(() {
                  selectedGender = 'Woman';
                  selectedTiers.clear();
                  selectedPreferences.clear();
                  ageRange = const RangeValues(22, 46);
                  selectedSexualOrientation = '';
                  selectedHereFor = '';
                  selectedOpenTo = '';
                  selectedSortBy = 'Most Popular';
                });
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey[400]!),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Clear Filter',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Apply filters
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Apply Filter',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
