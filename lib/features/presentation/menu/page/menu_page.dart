import 'package:collection/collection.dart';
import 'package:demo_1office/core/utils/data.dart';
import 'package:demo_1office/features/data/models/menu_item.dart';
import 'package:flutter/material.dart';
import '../../single_word/page/single_word_page.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {

  final groupedItems = groupBy(LoadData().menuItems, (MenuItem item) => item.group);

  void _handleNavigation(BuildContext context, String id) {
    switch (id) {
      case 'form':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SingleWordPage()),
        );
        break;
      // Thêm các case khác tương ứng với các id khác
      default:
        debugPrint("No route defined for $id");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedItems.entries.map((entry) {
            final groupName = entry.key;
            final items = entry.value;
            return _buildSection(groupName, items);
          }).toList(),
        ),
      )
    );
  }

  Widget _buildSection(String title, List<MenuItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, bottom: 8),
            child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildMenuItem(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return GestureDetector(
      onTap: () {
        _handleNavigation(context, item.id);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: item.isActive ? item.color.withValues(alpha: 0.1) : item.color.withValues(alpha: 0.05)
            ),
            child: Icon(item.icon, size: 28, color: item.isActive ? item.color : item.color.withValues(alpha: 0.3)),
          ),
          const SizedBox(height: 8),
          Text(item.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: item.isActive ? Colors.black : Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.grey,
        size: 24,
      ),
      title: Text(
        "Menu",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
