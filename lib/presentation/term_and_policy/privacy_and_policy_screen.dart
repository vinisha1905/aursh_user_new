import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyAndPolicyScreen extends StatefulWidget {
  static final String routName = '/privacy_and_policy';

  @override
  PrivacyAndPolicyScreenState createState() {
    return PrivacyAndPolicyScreenState();
  }
}

class PrivacyAndPolicyScreenState extends State<PrivacyAndPolicyScreen> {
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
                        text: 'Privacy Policy',
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
                  child: SfPdfViewer.asset('assets/files/privacy_policy.pdf'))
            ],
          )),
    );
  }
}
