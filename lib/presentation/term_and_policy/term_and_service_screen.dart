import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TermAndServiceScreen extends StatefulWidget {
  static final String routName = '/term_and_service';

  @override
  TermAndServiceScreenState createState() {
    return TermAndServiceScreenState();
  }
}

class TermAndServiceScreenState extends State<TermAndServiceScreen> {
  static final int _initialPage = 0;
  int _actualPageNumber = _initialPage;
  int _allPagesCount = 0;
  bool isSampleDoc = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              SizedBox(height: 30),
              Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon:
                            SvgPicture.asset('assets/icons/ic_arrow_left.svg')),
                    SizedBox(width: 24),
                    TextWidget(
                        text: 'Terms and Services',
                        fontSize: 20,
                        height: 24,
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ),
              // Expanded(
              //     child: PdfView(
              //   backgroundDecoration: BoxDecoration(color: Colors.white),
              //   scrollDirection: Axis.vertical,
              //   builders: PdfViewBuilders(
              //     options: const DefaultBuilderOptions(
              //         loaderSwitchDuration: const Duration(seconds: 1)),
              //     documentLoaderBuilder: (_) =>
              //         const Center(child: CircularProgressIndicator()),
              //     pageLoaderBuilder: (_) =>
              //         const Center(child: CircularProgressIndicator()),
              //   ),
              //   controller: _pdfController,
              //   onDocumentLoaded: (document) {
              //     setState(() {
              //       _allPagesCount = document.pagesCount;
              //     });
              //   },
              //   onPageChanged: (page) {
              //     setState(() {
              //       _actualPageNumber = page;
              //     });
              //   },
              // ))
              Expanded(
                  child:
                      SfPdfViewer.asset('assets/files/terms_and_service.pdf'))
            ],
          )),
    );
  }
}
