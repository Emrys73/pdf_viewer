# PDF Reader App

A cross-platform Flutter PDF reader application for iOS and Android with basic viewing capabilities.

## Features

- **Cross-platform**: Works on both iOS and Android
- **PDF Viewing**: Open and view PDF files from device storage
- **Zoom Controls**: Pinch to zoom and zoom controls
- **Page Navigation**: Navigate between pages with smooth scrolling
- **Modern UI**: Material Design 3 with beautiful, intuitive interface
- **Dark Mode**: Automatic dark/light theme support

## Screenshots

The app provides a clean, modern interface for PDF viewing with:
- Home screen with file picker
- PDF viewer with navigation controls
- Page indicators and zoom functionality

## Getting Started

### Prerequisites

- Flutter SDK (3.24.5 or later)
- Dart SDK (3.5.4 or later)
- Android Studio / Xcode for platform-specific development

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd pdf_reader_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Building for Release

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── home_screen.dart      # File picker and home screen
│   └── pdf_viewer_screen.dart # Main PDF viewing screen
├── widgets/
│   ├── pdf_controls.dart     # Zoom and navigation controls
│   └── page_indicator.dart   # Page counter display
├── models/
│   └── pdf_document_model.dart # PDF document data model
└── providers/
    └── pdf_provider.dart     # State management
```

## Dependencies

- `pdfx: ^2.6.0` - PDF rendering and viewing
- `file_picker: ^6.0.0` - File selection from device
- `provider: ^6.1.0` - State management
- `path_provider: ^2.1.0` - File path utilities

## Usage

1. **Opening a PDF**: Tap "Open PDF File" on the home screen
2. **Navigation**: Use the previous/next buttons or swipe between pages
3. **Zooming**: Pinch to zoom or use the zoom controls
4. **Page Indicator**: Shows current page and total pages

## Platform Permissions

### Android
The app requires the following permissions:
- `READ_EXTERNAL_STORAGE` - To access PDF files
- `READ_MEDIA_*` - For accessing media files (Android 13+)

### iOS
The app requires the following permissions:
- `NSDocumentsFolderUsageDescription` - To access documents
- `NSDownloadsFolderUsageDescription` - To access downloads

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and feature requests, please create an issue in the repository.
