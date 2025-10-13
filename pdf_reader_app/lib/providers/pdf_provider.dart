import 'package:flutter/foundation.dart';
import '../models/pdf_document_model.dart';

class PDFProvider extends ChangeNotifier {
  List<PDFDocumentModel> _recentDocuments = [];
  PDFDocumentModel? _currentDocument;

  List<PDFDocumentModel> get recentDocuments => _recentDocuments;
  PDFDocumentModel? get currentDocument => _currentDocument;

  void setCurrentDocument(PDFDocumentModel document) {
    _currentDocument = document;
    _addToRecentDocuments(document);
    notifyListeners();
  }

  void _addToRecentDocuments(PDFDocumentModel document) {
    // Remove if already exists
    _recentDocuments.removeWhere((doc) => doc.filePath == document.filePath);
    
    // Add to the beginning
    _recentDocuments.insert(0, document);
    
    // Keep only the last 10 documents
    if (_recentDocuments.length > 10) {
      _recentDocuments = _recentDocuments.take(10).toList();
    }
  }

  void removeRecentDocument(String filePath) {
    _recentDocuments.removeWhere((doc) => doc.filePath == filePath);
    notifyListeners();
  }

  void clearRecentDocuments() {
    _recentDocuments.clear();
    notifyListeners();
  }
}
