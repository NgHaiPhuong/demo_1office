import 'package:flutter/material.dart';

class ReasonExtraWorkPage extends StatefulWidget {
  const ReasonExtraWorkPage({super.key});

  @override
  State<ReasonExtraWorkPage> createState() => _ReasonExtraWorkPageState();
}

class _ReasonExtraWorkPageState extends State<ReasonExtraWorkPage> {
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
              SizedBox(height: 16),
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

  List<Widget> _buildReasonList() {
    final reasons = [
      {'title': 'Không có lựa chọn nào', 'limit': '', 'showLimit': false},
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
