import 'package:flutter/material.dart';

// Implementação dos widgets
import '/widgets/customAppBar.dart';

// Implementação das classes de Data
import '/models/app_colors.dart';
import '/models/HQdata.dart'; // Importe a nova classe HqData

class HQPage extends StatefulWidget {
  @override
  _HQPageState createState() => _HQPageState();
}

class _HQPageState extends State<HQPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < HqData.hqImages.length - 1) {
      // Alterado para HqData.hqImages
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg, // Cor de fundo
      appBar: CustomAppBar(title: 'HQ'), // Apenas muda o título
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.close, color: AppColors.text),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount:
                  HqData.hqImages.length, // Alterado para HqData.hqImages
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(
                    HqData.hqImages[index], // Alterado para HqData.hqImages
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _previousPage,
                  color: _currentPage > 0
                      ? AppColors.bolinhaOn
                      : Color(0x009e9e9e),
                ),
                Text(
                  '${_currentPage + 1} / ${HqData.hqImages.length}', // Alterado para HqData.hqImages
                  style: TextStyle(fontSize: 16, color: AppColors.text),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _nextPage,
                  color: _currentPage < HqData.hqImages.length - 1
                      ? AppColors.bolinhaOn
                      : Color(0x009e9e9e),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
