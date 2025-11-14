# Verify Your Identity Screen - Modular Architecture

This document explains the modular architecture of the identity verification screen.

## Architecture Overview

The verification screen has been designed with a modular approach to promote code reusability, maintainability, and separation of concerns.

### Core Components

#### 1. **Main Screen** (`verify_your_identity.dart`)
- **Purpose**: Orchestrates the verification flow
- **Responsibilities**: 
  - UI state management
  - Coordinating between service and widgets
  - Handling user interactions

#### 2. **Reusable Widgets**
All widgets are located in the `lib/widgets/` directory:

- **`verification_section_card.dart`**: Displays upload sections (ID document and selfie)
- **`info_banner.dart`**: Shows informational messages with different styles (warning, success, info)
- **`app_header.dart`**: Reusable header with title, subtitle, and optional logo
- **`progress_indicator.dart`**: Shows progress through verification steps
- **Custom Button**: Uses existing `custom_button.dart` for consistent styling

#### 3. **Service Layer** (`verification_service.dart`)
- **Purpose**: Handles all verification-related business logic
- **Features**:
  - Singleton pattern for global state management
  - File validation (size, format)
  - Upload simulation
  - Status tracking
  - Error handling

#### 4. **Constants** (`verification_constants.dart`)
- **Purpose**: Centralized configuration and messaging
- **Contents**:
  - File upload constraints
  - User-facing messages
  - Supported file formats

#### 5. **Utilities** (`image_picker_util.dart`)
- **Purpose**: Handle image selection from camera/gallery
- **Features**:
  - Abstracted image picking logic
  - Modal bottom sheet for selection
  - Error handling

## Key Benefits of This Modular Architecture

### 1. **Reusability**
- `VerificationSectionCard` can be reused for any upload section
- `InfoBanner` can display different message types across the app
- `AppHeader` provides consistent header styling

### 2. **Maintainability**
- Business logic separated into service layer
- Constants centralized for easy updates
- Each component has a single responsibility

### 3. **Testability**
- Service layer can be unit tested independently
- Widgets can be tested in isolation
- Mock services can be easily injected

### 4. **Scalability**
- Easy to add new verification steps
- Service can be extended for different document types
- Widgets can be enhanced without affecting other components

## Usage Examples

### Creating a New Verification Section
```dart
VerificationSectionCard(
  icon: Icons.passport,
  title: "Upload Passport",
  subtitle: "Upload your passport for international verification",
  acceptedFormats: "JPG, PNG, PDF (max 10MB)",
  isCompleted: verificationService.isPassportCompleted,
  onTap: () => handlePassportUpload(),
)
```

### Displaying Different Banner Types
```dart
// Warning
InfoBanner.warning(message: "Please review your documents")

// Success
InfoBanner.success(message: "Document verified successfully")

// Info
InfoBanner.info(message: "Additional information required")
```

### Using the Service
```dart
final service = VerificationService();

// Check status
if (service.canProceed) {
  // Submit verification
  await service.submitVerification();
}

// Upload document
await service.uploadIdDocument(file);
```

## File Structure
```
lib/
├── view/
│   └── verify_your_identity.dart
├── widgets/
│   ├── verification_section_card.dart
│   ├── info_banner.dart
│   ├── app_header.dart
│   ├── progress_indicator.dart
│   └── custom_button.dart
├── services/
│   └── verification_service.dart
├── constants/
│   └── verification_constants.dart
├── utils/
│   └── image_picker_util.dart
└── theme/
    └── app_text_styles.dart
```

## Future Enhancements

1. **Add Progress Tracking**: Integrate `ProgressIndicator` widget
2. **Real Image Picker**: Implement actual image picking with `image_picker` package
3. **File Upload**: Add real file upload functionality
4. **Enhanced Validation**: Add document type detection
5. **Biometric Matching**: Integrate face matching APIs
6. **Multi-language Support**: Internationalize all text constants

## Dependencies to Add (Future)
```yaml
dependencies:
  image_picker: ^1.0.4
  file_picker: ^6.1.1
  dio: ^5.3.2 # for file uploads
  permission_handler: ^11.0.1 # for camera permissions
```

This modular architecture ensures the verification screen is maintainable, scalable, and follows Flutter best practices.