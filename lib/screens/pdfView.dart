import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

//Pdf viewer page to show pdf from local db and from web.
class PdfViewer extends StatefulWidget {
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/sample.pdf');

    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/sample.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
          "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
    }else
       document = await PDFDocument.fromAsset('assets/sample.pdf');
      
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(height: 36),
              ListTile(
                leading: Icon(Icons.sd_storage),
                title: Text('Load from Database'),
                onTap: () {
                  Navigator.of(context).pop();
                  changePDF(1);
                },
              ),
              ListTile(
                 leading: Icon(Icons.web),
                title: Text('Load from URL'),
                onTap: () {
                  Navigator.of(context).pop();
                  changePDF(2);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Pdf Viewer'),
          centerTitle: true,
        ),
        body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document)),
    );
  }

}