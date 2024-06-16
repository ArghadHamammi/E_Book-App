import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookPdf extends StatelessWidget {
  const BookPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Book Name"),
      // ),
      body:
          // Container(
          //   height: 200,
          //   width: 200,
          //   child:
          // Image.network("https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg")),
          SfPdfViewer.network(
       "https://spaz.org/~jake/pix/ebooks/The%20Martian%20-%20Andy%20Weir.pdf",
      ),
      // PDFView(
      //   filePath: "https://spaz.org/~jake/pix/ebooks/The%20Martian%20-%20Andy%20Weir.pdf",
      //   enableSwipe: true,
      //   swipeHorizontal: true,
      //   autoSpacing: false,
      //   pageSnap: true,
      //   pageFling: false,

      // ),
    );
  }
}
