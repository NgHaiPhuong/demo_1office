import 'package:flutter/material.dart';

class ReasonPage extends StatefulWidget {
  const ReasonPage({super.key});

  @override
  State<ReasonPage> createState() => _ReasonPageState();
}

class _ReasonPageState extends State<ReasonPage> {
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
          Text('Lý do',style: TextStyle(fontSize: 20,color: Colors.white),),
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
      {'title': 'Nghỉ ốm', 'limit': '10 Ngày / Tháng'},
      {'title': 'Nghỉ thai sản', 'limit': '180 Ngày / Năm'},
      {'title': 'Nghỉ không lương', 'limit': '30 Ngày / Tháng'},
      {'title': 'Nghỉ phép năm', 'limit': '', 'showLimit': false},
      {'title': 'Nghỉ khác', 'limit': '10 Ngày / Năm'},
      {'title': 'Nghỉ con ốm', 'limit': '10 Ngày / Tháng'},
      {'title': 'Nghỉ dưỡng sức sau ốm đau', 'limit': '2 Ngày / Tháng'},
      {'title': 'Nghỉ hội nghị, học tập', 'limit': '5 Ngày / Năm'},
      {'title': 'Nghỉ dưỡng sức sau thai sản', 'limit': '30 Ngày / Năm'},
      {'title': 'Nghỉ dưỡng sức sau điều trị thương tật, tai nạn', 'limit': '12 Ngày / Tháng'},
      {'title': 'Nghỉ tai nạn', 'limit': '30 Ngày / Năm'},
      {'title': 'Nghỉ công tác', 'limit': '10 Ngày / Năm'},
      {'title': 'Remote', 'limit': '5 Ngày / Tuần'},
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
