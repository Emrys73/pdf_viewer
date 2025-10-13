class PDFDocumentModel {
  final String filePath;
  final String fileName;
  final int totalPages;
  final DateTime lastAccessed;

  PDFDocumentModel({
    required this.filePath,
    required this.fileName,
    required this.totalPages,
    required this.lastAccessed,
  });

  PDFDocumentModel copyWith({
    String? filePath,
    String? fileName,
    int? totalPages,
    DateTime? lastAccessed,
  }) {
    return PDFDocumentModel(
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      totalPages: totalPages ?? this.totalPages,
      lastAccessed: lastAccessed ?? this.lastAccessed,
    );
  }

  @override
  String toString() {
    return 'PDFDocumentModel(filePath: $filePath, fileName: $fileName, totalPages: $totalPages, lastAccessed: $lastAccessed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PDFDocumentModel &&
        other.filePath == filePath &&
        other.fileName == fileName &&
        other.totalPages == totalPages &&
        other.lastAccessed == lastAccessed;
  }

  @override
  int get hashCode {
    return filePath.hashCode ^
        fileName.hashCode ^
        totalPages.hashCode ^
        lastAccessed.hashCode;
  }
}
