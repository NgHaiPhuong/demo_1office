import 'package:flutter/material.dart';

class OverTimePage extends StatefulWidget {
  const OverTimePage({super.key});

  @override
  State<OverTimePage> createState() => _OverTimePageState();
}

class _OverTimePageState extends State<OverTimePage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              _buildTitle(),
              _buildSearchBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                      _buildReasonList(),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildButtonComplete(),
    );
  }

  Widget _buildTitle(){
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.lightGreen,
      child: Row(
        children: [
          Text('Ca tăng',style: TextStyle(fontSize: 20,color: Colors.white),),
          Text('*',style: TextStyle(fontSize: 20,color: Colors.red),),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Tìm kiếm...',
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildReasonList() {
    final reasons = [
      {'title': 'Nghỉ tuần', 'limit': '', 'showLimit': false},
      {'title': 'Nghỉ thưởng/Hủy ca', 'limit': '', 'showLimit': false},
      {'title': 'Tự động hủy ca', 'limit': '', 'showLimit': false},
      {'title': 'Ca hành chính', 'limit': 'HC 8:30 - 18:00 (8h) \nNghỉ giữa ca (12:00 -13:30)'},
      {'title': 'Ca hành chính 1', 'limit': 'HC1 8:30 - 18:00 (8h) \nNghỉ giữa ca (12:00 -13:30)'},
      {'title': 'Extreme VN', 'limit': 'ExtremeVN 7:50 - 16:50 (8h) \nNghỉ giữa ca (11:50 -12:50)'},
      {'title': 'Ca Onsite 08h30 - 17h30', 'limit': 'Ca Onsite MBBank 8h30 - 17h30 08:30 - 17:30 (7.5h) \nNghỉ giữa ca (12:00 -13:30)'},
      {'title': 'Ca Onsite Viettel 08h30 - 18h00', 'limit': 'Ca Onsite Viettel 8:30 - 18:00 (8h) \nNghỉ giữa ca (12:00 -13:30)'},
    ];

    return reasons.map((reason) {
      return _buildReasonItem(
        reason['title'] as String,
        reason['limit'] as String,
        showLimit: reason['showLimit'] == false ? false : true,
      );
    }).toList();
  }

  Widget _buildReasonItem(String title, String limit, {bool showLimit = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: showLimit
                  ? Text(
                'Tối đa: $limit',
                style: const TextStyle(color: Colors.grey),
              )
                  : null,
              onTap: () {
                // Handle reason selection
              },
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }


  Widget _buildButtonComplete() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey[800],
            elevation: 0,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'HOÀN TẤT ',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
