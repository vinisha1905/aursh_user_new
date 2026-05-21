import 'dart:io';
import 'dart:typed_data';

import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewArguments {
  final String url;
  final String fullName;

  const PdfViewArguments(this.url, this.fullName);
}

class PdfViewScreen extends StatefulWidget {
  static final String routName = '/pdf_view';
  final PdfViewArguments arguments;

  PdfViewScreen({required this.arguments});

  @override
  PdfViewScreenState createState() {
    return PdfViewScreenState();
  }
}

class PdfViewScreenState extends State<PdfViewScreen> {
  static final int _initialPage = 0;
  int _actualPageNumber = _initialPage;
  int _allPagesCount = 0;
  bool isSampleDoc = true;
  // PdfController? _pdfController;
  String filePath = '';
  bool isDownloaded = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  Future<void> saveFileToDownloads(Uint8List fileBytes, String fileName) async {
    try {
      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: fileBytes,
        ext: 'pdf', // or png, txt etc.
        mimeType: MimeType.other,
      );
    } catch (e) {
      print('Save failed: $e');
    }
  }

  Future<String> getDownloadPath(String fileName) async {
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }

  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (Platform.version.contains("13")) {
        var photos = await Permission.photos.request();
        return photos.isGranted;
      }
      var status = await Permission.storage.request();
      return status.isGranted;
    }
    return true;
  }

  void _setPath() async {
    if (Platform.isAndroid) {
      filePath =
          '${(await pathProvider.getTemporaryDirectory()).path}/${widget.arguments.fullName}';
    } else {
      filePath =
          '${(await pathProvider.getTemporaryDirectory()).path}/${widget.arguments.fullName}';
    }
    print(widget.arguments.url);
    var response =
        await GetIt.I.get<Dio>().download(widget.arguments.url, filePath);
    setState(() {
      isDownloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Center(
                child: Row(
              children: [
                widget.arguments.url == ""
                    ? Container()
                    : Wrap(
                        spacing: 8,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (await _requestStoragePermission()) {
                                final url = widget.arguments.url;
                                final fileName = widget.arguments.fullName;
                                final path = await getDownloadPath(fileName);

                                try {
                                  // await GetIt.I.get<Dio>().download(url, path);
                                  final response = await Dio().get(url,
                                      options: Options(
                                          responseType: ResponseType.bytes));
                                  await saveFileToDownloads(
                                      response.data, 'myfile.pdf');
                                  await OpenFilex.open(filePath);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Saved to $path')),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Download failed: $e')),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Storage permission denied')),
                                );
                              }
                            },
                            icon: const Icon(Icons.save_alt, size: 18),
                            label: const Text('Save',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkYellow,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              minimumSize: const Size(10, 36),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              final url = widget.arguments.url;
                              final fileName = widget.arguments.fullName;
                              final path = await getDownloadPath(fileName);

                              try {
                                await GetIt.I.get<Dio>().download(url, path);
                                await Share.shareXFiles([XFile(path)],
                                    text: 'Check this out!');
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Sharing failed: $e')),
                                );
                              }
                            },
                            icon: const Icon(Icons.share,
                                size: 18, color: AppColors.darkYellow),
                            label: Text(
                              'Share',
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.darkYellow),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              minimumSize: const Size(10, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(
                                    color: AppColors.darkYellow,
                                    width: 1), // 👈 Brown border
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  width: 10,
                )
              ],
            ))
          ],
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_rounded, color: AppColors.darkGray)),
        ),
        body: isDownloaded == true
            ? SfPdfViewer.network(widget.arguments.url)
            : Container(),
      ),
    );
  }
}
