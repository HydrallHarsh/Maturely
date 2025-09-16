import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/deposits/presentation/pages/dashboard_page.dart';
import '../../../features/deposits/presentation/pages/db_inspector_page.dart';
import '../../../features/deposits/presentation/pages/lineage_page.dart';
import '../../../features/ocr/presentation/pages/ocr_capture_page.dart';
import '../../../features/analytics/presentation/pages/analytics_dashboard.dart';

class MainNavigationPage extends ConsumerStatefulWidget {
  const MainNavigationPage({super.key});

  @override
  ConsumerState<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends ConsumerState<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const AnalyticsDashboard(),
    const OcrCapturePage(),
    const LineagePage(),
    const DbInspectorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'OCR Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Lineage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Database',
          ),
        ],
      ),
    );
  }
}
