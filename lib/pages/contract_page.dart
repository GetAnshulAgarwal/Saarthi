import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Map<String, String>> contracts = [
    {
      'language': 'English',
      'file': 'assets/contract/englsih.pdf',
    },
    {
      'language': 'Spanish',
      'file': 'assets/contracts/contract_es.pdf',
    },
    {
      'language': 'Hindi',
      'file': 'assets/contracts/contract_hi.pdf',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contracts'),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: ListView.builder(
          itemCount: contracts.length,
          itemBuilder: (context, index) {
            final contract = contracts[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contract['language']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.preview),
                      color: Colors.blue,
                      tooltip: 'Preview',
                      onPressed: () {
                        _previewContract(contract['file']!);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.download),
                      color: Colors.black,
                      tooltip: 'Download',
                      onPressed: () {
                        _downloadContract(contract['file']!);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _previewContract(String filePath) async {
    final localFile = await _getLocalFile(filePath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(filePath: localFile.path),
      ),
    );
  }

  Future<void> _downloadContract(String filePath) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = filePath.split('/').last;
      final localFile = File('${dir.path}/$fileName');

      // Load the asset and write it to the local file
      ByteData data = await rootBundle.load(filePath);
      List<int> bytes = data.buffer.asUint8List();
      await localFile.writeAsBytes(bytes);

      print('Downloaded: ${localFile.path}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded: ${localFile.path}')),
      );
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  Future<File> _getLocalFile(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${path.split('/').last}';
    return File(filePath);
  }
}

class PDFViewerPage extends StatelessWidget {
  final String filePath;

  const PDFViewerPage({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PDFView(
        filePath: filePath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageSnap: true,
        pageFling: true,
        onPageChanged: (page, total) {
          print('Page $page of $total');
        },
      ),
    );
  }
}
