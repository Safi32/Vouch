class VerificationConstants {
  // File upload constraints
  static const int maxFileSizeMB = 5;
  static const List<String> supportedFormats = ['JPG', 'PNG', 'PDF'];
  
  // Messages
  static const String verificationTitle = "Verify Your Identity";
  static const String verificationSubtitle = 
      "We carefully review all accounts to help you verify every identity and ensure a safe, authentic experience for all Vouch members.";
  
  static const String idDocumentTitle = "Upload ID Document";
  static const String idDocumentSubtitle = 
      "Upload a government-issued ID document. Driver's License or National ID. Your identity credentials are document to certified authenticity.";
  
  static const String selfieTitle = "Take a Selfie";
  static const String selfieSubtitle = 
      "Take a quick selfie to complete biometric verification. Vouch compares your selfie with ID document identity.";
  
  static const String warningMessage = 
      "Most verifications are completed within minutes. You'll receive a confirmation as soon as your ID is approved.";
  
  static const String footerText = "Verified by Vouch • Secure KYC Electronic Verification";
  
  // Format accepted formats message
  static String get acceptedFormatsMessage => 
      "Accept formats: ${supportedFormats.join(', ')} (max ${maxFileSizeMB}MB)";
}