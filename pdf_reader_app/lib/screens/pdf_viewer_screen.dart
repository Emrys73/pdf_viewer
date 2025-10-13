import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/pdf_controls.dart';
import '../widgets/page_indicator.dart';

class PDFViewerScreen extends StatefulWidget {
  final String filePath;
  final String fileName;

  const PDFViewerScreen({
    super.key,
    required this.filePath,
    required this.fileName,
  });

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  int currentPage = 1;
  int totalPages = 0;
  bool isLoading = true;
  String? errorMessage;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    _initializePDF();
  }

  Future<void> _initializePDF() async {
    try {
      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                isLoading = false;
                errorMessage = 'Failed to load PDF: ${error.description}';
              });
            },
          ),
        )
        ..loadRequest(Uri.file(widget.filePath));
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load PDF: $e';
      });
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void _goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      setState(() {
        currentPage = page;
      });
      // Note: WebView doesn't support direct page navigation for PDFs
      // Users can scroll through the PDF manually
    }
  }

  void _zoomIn() {
    // Zoom functionality will be handled by the PdfView widget itself
    // Users can pinch to zoom
  }

  void _zoomOut() {
    // Zoom functionality will be handled by the PdfView widget itself
    // Users can pinch to zoom
  }

  void _fitToWidth() {
    // Fit to width functionality will be handled by the PdfView widget itself
  }

  @override
  void dispose() {
    // PDFViewController doesn't need explicit disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fileName,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          if (!isLoading && errorMessage == null)
            PageIndicator(
              currentPage: currentPage,
              totalPages: totalPages,
            ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: !isLoading && errorMessage == null
          ? PDFControls(
              currentPage: currentPage,
              totalPages: totalPages,
              onPageChanged: _goToPage,
              onZoomIn: _zoomIn,
              onZoomOut: _zoomOut,
              onFitToWidth: _fitToWidth,
            )
          : null,
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading PDF...'),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[400],
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      );
    }

    return WebViewWidget(controller: webViewController);
  }
}
