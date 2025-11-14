import 'package:flutter/material.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/widgets/verification_section_card.dart';
import 'package:vouch/widgets/info_banner.dart';
import 'package:vouch/widgets/custom_button.dart';
import 'package:vouch/constants/verification_constants.dart';
import 'package:vouch/services/verification_service.dart';
import 'package:vouch/view/upload_photos_screen.dart';

class VerifyYourIdentity extends StatefulWidget {
  const VerifyYourIdentity({super.key});

  @override
  State<VerifyYourIdentity> createState() => _VerifyYourIdentityState();
}

class _VerifyYourIdentityState extends State<VerifyYourIdentity> {
  final VerificationService _verificationService = VerificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(AppImages.logo, width: 100, height: 100),

                const SizedBox(height: 20),

                Text(
                  VerificationConstants.verificationTitle,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                Text(
                  VerificationConstants.verificationSubtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                VerificationSectionCard(
                  icon: Icons.file_upload_outlined,
                  title: VerificationConstants.idDocumentTitle,
                  subtitle: VerificationConstants.idDocumentSubtitle,

                  isCompleted: _verificationService.isIdDocumentCompleted,
                  onTap: _handleIdDocumentUpload,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Accept formats: PDF, JPG, PNG", 
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                VerificationSectionCard(
                  icon: Icons.camera_alt_outlined,
                  title: VerificationConstants.selfieTitle,
                  subtitle: VerificationConstants.selfieSubtitle,

                  isCompleted: _verificationService.isSelfieCompleted,
                  onTap: _handleSelfieCapture,
                ),

                // Warning banner
                InfoBanner.warning(
                  message: VerificationConstants.warningMessage,
                ),

                const SizedBox(height: 30),

                // Continue button
                buildContinueButton(),

                const SizedBox(height: 16),

                // Footer text
                Text(
                  VerificationConstants.footerText,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContinueButton() {
    final bool canContinue = _verificationService.canProceed;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: CustomButton(
        onPressed: canContinue ? _handleContinue : null,
        icon: "",
        text: "Continue",
        backgroundColor: canContinue ? AppColors.primary : Colors.grey.shade300,
        borderColor: canContinue ? AppColors.primary : Colors.grey.shade300,
        textColor: Colors.white,
      ),
    );
  }

  void _handleIdDocumentUpload() async {
    // Show loading indicator
    _showLoadingDialog();

    // TODO: Implement actual camera/gallery functionality
    // For demo, simulate upload
    await Future.delayed(const Duration(seconds: 2));

    // Hide loading
    Navigator.pop(context);

    // Simulate successful upload
    _simulateIdDocumentUpload();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "ID Document uploaded successfully!",
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleSelfieCapture() async {
    // Show loading indicator
    _showLoadingDialog();

    // TODO: Implement actual camera functionality
    // For demo, simulate capture
    await Future.delayed(const Duration(seconds: 2));

    // Hide loading
    Navigator.pop(context);

    // Simulate successful capture
    _simulateSelfieUpload();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Selfie captured successfully!",
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _handleContinue() async {
    if (_verificationService.canProceed) {
      // Show loading
      _showLoadingDialog();

      // Submit verification
      final success = await _verificationService.submitVerification();

      // Hide loading
      Navigator.pop(context);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Verification submitted successfully!",
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to Upload Photos screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UploadPhotosScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Failed to submit verification. Please try again.",
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // Simulation methods for demo purposes
  void _simulateIdDocumentUpload() {
    _verificationService.simulateIdDocumentUpload();
    setState(() {
      // Force update to show completed state
    });
  }

  void _simulateSelfieUpload() {
    _verificationService.simulateSelfieUpload();
    setState(() {
      // Force update to show completed state
    });
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
