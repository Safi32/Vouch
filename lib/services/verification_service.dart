import 'dart:io';

enum VerificationStatus {
  notStarted,
  inProgress,
  completed,
  failed,
  pending,
}

enum DocumentType {
  idDocument,
  selfie,
}

class VerificationService {
  static final VerificationService _instance = VerificationService._internal();
  
  factory VerificationService() {
    return _instance;
  }
  
  VerificationService._internal();

  // Track verification status
  VerificationStatus _idDocumentStatus = VerificationStatus.notStarted;
  VerificationStatus _selfieStatus = VerificationStatus.notStarted;
  
  File? _idDocumentFile;
  File? _selfieFile;

  // Getters
  VerificationStatus get idDocumentStatus => _idDocumentStatus;
  VerificationStatus get selfieStatus => _selfieStatus;
  File? get idDocumentFile => _idDocumentFile;
  File? get selfieFile => _selfieFile;

  bool get isIdDocumentCompleted => 
      _idDocumentStatus == VerificationStatus.completed;
  
  bool get isSelfieCompleted => 
      _selfieStatus == VerificationStatus.completed;
  
  bool get canProceed => isIdDocumentCompleted && isSelfieCompleted;

  // Upload ID document
  Future<bool> uploadIdDocument(File file) async {
    try {
      _idDocumentStatus = VerificationStatus.inProgress;
      
      // Validate file
      if (!await _validateFile(file)) {
        _idDocumentStatus = VerificationStatus.failed;
        return false;
      }
      
      // TODO: Implement actual upload logic here
      // For now, simulate upload
      await Future.delayed(const Duration(seconds: 2));
      
      _idDocumentFile = file;
      _idDocumentStatus = VerificationStatus.completed;
      return true;
    } catch (e) {
      _idDocumentStatus = VerificationStatus.failed;
      return false;
    }
  }

  // Upload selfie
  Future<bool> uploadSelfie(File file) async {
    try {
      _selfieStatus = VerificationStatus.inProgress;
      
      // Validate file
      if (!await _validateFile(file)) {
        _selfieStatus = VerificationStatus.failed;
        return false;
      }
      
      // TODO: Implement actual upload logic here
      // For now, simulate upload
      await Future.delayed(const Duration(seconds: 2));
      
      _selfieFile = file;
      _selfieStatus = VerificationStatus.completed;
      return true;
    } catch (e) {
      _selfieStatus = VerificationStatus.failed;
      return false;
    }
  }

  // Submit verification
  Future<bool> submitVerification() async {
    if (!canProceed) return false;
    
    try {
      // TODO: Implement actual submission logic here
      await Future.delayed(const Duration(seconds: 3));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Simulation methods for demo
  void simulateIdDocumentUpload() {
    _idDocumentStatus = VerificationStatus.completed;
  }

  void simulateSelfieUpload() {
    _selfieStatus = VerificationStatus.completed;
  }

  // Reset verification state
  void reset() {
    _idDocumentStatus = VerificationStatus.notStarted;
    _selfieStatus = VerificationStatus.notStarted;
    _idDocumentFile = null;
    _selfieFile = null;
  }

  // Private helper methods
  Future<bool> _validateFile(File file) async {
    // Check file size (max 5MB)
    final fileSize = await file.length();
    if (fileSize > 5 * 1024 * 1024) {
      return false;
    }
    
    // Check file extension
    final extension = file.path.split('.').last.toLowerCase();
    final supportedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
    
    return supportedExtensions.contains(extension);
  }
}