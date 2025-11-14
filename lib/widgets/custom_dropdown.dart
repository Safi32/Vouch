import 'package:flutter/material.dart';
import 'package:vouch/utils/colors.dart';

Widget customDropdown({
  required String hintText,
  required List<String> items,
  String? selectedValue,
  required Function(String?) onChanged,
  String? Function(String?)? validator,
}) {
  return DropdownButtonFormField<String>(
    value: selectedValue,
    isExpanded: true,
    hint: Text(
      hintText,
      style: TextStyle(color: Colors.grey[400], fontSize: 14),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
    items: items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Container(
          width: double.infinity,
          child: Text(
            item,
            style: TextStyle(fontSize: 14, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    }).toList(),
    onChanged: onChanged,
    validator: validator,
    dropdownColor: Colors.white,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      filled: true,
      fillColor: Colors.white,
    ),
    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
  );
}