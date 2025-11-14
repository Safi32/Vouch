import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  final Function(String country, String city) onLocationSelected;
  final VoidCallback onClose;

  const LocationSelector({
    super.key,
    required this.onLocationSelected,
    required this.onClose,
  });

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String? selectedCountry;
  String? selectedCity;
  final Map<String, List<String>> countryToCities = {
    'France': ['Paris', 'Lyon', 'Marseille', 'Nice', 'Toulouse', 'Nantes'],
    'United States': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia'],
    'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Glasgow', 'Liverpool', 'Edinburgh'],
    'Germany': ['Berlin', 'Munich', 'Hamburg', 'Cologne', 'Frankfurt', 'Stuttgart'],
    'Italy': ['Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genoa'],
    'Spain': ['Madrid', 'Barcelona', 'Valencia', 'Seville', 'Bilbao', 'Malaga'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
 
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select a Country',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              value: selectedCountry,
              isExpanded: true,
              icon: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue;
                  selectedCity = null; // Reset city when country changes
                });
              },
              items: countryToCities.keys.map<DropdownMenuItem<String>>((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        // Add flag icon based on country if needed
                        _getCountryFlag(country),
                        const SizedBox(width: 8),
                        Text(country, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // City Dropdown
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select a City',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              value: selectedCity,
              isExpanded: true,
              icon: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ),
              onChanged: selectedCountry == null
                  ? null
                  : (String? newValue) {
                      setState(() {
                        selectedCity = newValue;
                      });
                      if (newValue != null) {
                        widget.onLocationSelected(selectedCountry!, newValue);
                        widget.onClose();
                      }
                    },
              items: selectedCountry == null
                  ? []
                  : countryToCities[selectedCountry]!
                      .map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(city, style: const TextStyle(fontSize: 14)),
                        ),
                      );
                    }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Close button
        TextButton(
          onPressed: widget.onClose,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _getCountryFlag(String country) {
    // Return appropriate flag widget based on country
    // For now, using simple colored containers as placeholders
    Map<String, Color> flagColors = {
      'France': Colors.blue,
      'United States': Colors.red,
      'United Kingdom': Colors.red,
      'Germany': Colors.black,
      'Italy': Colors.green,
      'Spain': Colors.red,
    };

    return Container(
      width: 20,
      height: 14,
      decoration: BoxDecoration(
        color: flagColors[country] ?? Colors.grey,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          country.substring(0, 2).toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}