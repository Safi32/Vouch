import 'dart:io';
import 'package:flutter/material.dart';

enum ImageSource {
  camera,
  gallery,
}

class ImagePickerUtil {
  static Future<File?> pickImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    try {
      // TODO: Implement actual image picker functionality
      // For now, this is a placeholder that would use image_picker package
      
      // In a real implementation, you would:
      // 1. Add image_picker dependency to pubspec.yaml
      // 2. Import the package: import 'package:image_picker/image_picker.dart';
      // 3. Use it like this:
      /*
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source == ImageSource.camera 
            ? ImageSource.camera 
            : ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      
      if (image != null) {
        return File(image.path);
      }
      */
      
      // For demo purposes, return null
      return null;
    } catch (e) {
      debugPrint('Error picking image: $e');
      return null;
    }
  }

  static Future<void> showImagePickerOptions({
    required BuildContext context,
    required String title,
    required Function(File?) onImageSelected,
  }) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildPickerOption(
                    context: context,
                    icon: Icons.camera_alt,
                    title: "Camera",
                    onTap: () async {
                      Navigator.pop(context);
                      final file = await pickImage(
                        source: ImageSource.camera,
                        context: context,
                      );
                      onImageSelected(file);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildPickerOption(
                    context: context,
                    icon: Icons.photo_library,
                    title: "Gallery",
                    onTap: () async {
                      Navigator.pop(context);
                      final file = await pickImage(
                        source: ImageSource.gallery,
                        context: context,
                      );
                      onImageSelected(file);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _buildPickerOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}