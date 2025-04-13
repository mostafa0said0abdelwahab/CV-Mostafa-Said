import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'السيرة الذاتية',
      debugShowCheckedModeBanner: false,
      home: ResumePage(),
    );
  }
}

class ResumePage extends StatefulWidget {
  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final ScrollController _scrollController = ScrollController();

  // قوائم الصور فقط، بدون فيديو أو PDF
  final List<String> tasmem = [
    'assets/s1.png',
    'assets/ggg1.png',
    'assets/s2.png',
    'assets/s3.png',
    'assets/s4.png',
    'assets/s5.png',
    'assets/s6.png',
    'assets/s7.png',
    'assets/s8.png',
    'assets/s9.png',
    'assets/s10.png',
    'assets/ggg2.png',
    'assets/s12.png',
  ];
  final List<String> khepra = [
    'assets/s11.jpg',
    'assets/s12.jpg',
    'assets/s13.jpg',
  ];
  final List<String> imagesNetwork4 = [
    'assets/sh1.png',
    'assets/sh2.png',
    'assets/sh3.png',
    'assets/sh4.png',
  ];
  final List<String> imagesNetwork5 = [
    'assets/h4.png',
    'assets/h5.png',
    'assets/h6.png',
    'assets/h7.png',
    'assets/h8.png',
    'assets/h9.png',
    'assets/h10.png',
    'assets/h11.png',
    'assets/h12.png',
    'assets/h13.png',
    'assets/h14.png',
  ];
  final List<String> imagesNetwork8 = [
    'assets/3d.png',
  ];

  // قائمة الأقسام مع الرموز والصور المرتبطة بكل قسم
  List<Map<String, dynamic>> get segments => [
    {'svg': 'assets/b1.svg', 'media': khepra},
    {'svg': 'assets/b2.svg', 'media': imagesNetwork4},
    {'svg': 'assets/b3.svg', 'media': imagesNetwork5},
    {'svg': 'assets/b5.svg', 'media': tasmem},
    {'svg': 'assets/b9.svg', 'media': imagesNetwork8},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // دالة لإنشاء شبكة عرض الصور فقط
  Widget buildMediaGrid(List<String> media) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: media.map((path) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('السيرة الذاتية'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thickness: 10,
        radius: Radius.circular(10),
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // عرض الصورة الرئيسية
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Image.asset(
                    'assets/any.png',
                    width: 280,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // عرض الأقسام المتعددة مع الصور المرتبطة
              ...segments.map((segment) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SvgPicture.asset(
                          segment['svg'],
                          width: constraints.maxWidth,
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                    buildMediaGrid(segment['media']),
                    SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
