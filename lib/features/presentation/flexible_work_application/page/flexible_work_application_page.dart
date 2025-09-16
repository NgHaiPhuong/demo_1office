import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../home/widget/home_header.dart';

class FlexibleWorkApplicationPage extends StatefulWidget {
  const FlexibleWorkApplicationPage({super.key});

  @override
  State<FlexibleWorkApplicationPage> createState() => _FlexibleWorkApplicationPageState();
}

class _FlexibleWorkApplicationPageState extends State<FlexibleWorkApplicationPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(userName: 'Tạo mới đơn làm theo chế độ',showBackButton: true,),
            Divider(color: Colors.grey[300]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildGeneralInformation(context),
                    _buildEnterDescription(),
                    _buildAttached(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildButtonUpdate(),
    );
  }

  Widget _buildGeneralInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 1),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.lightGreen, size: 30),
              Text('Thông tin chung', style: TextStyle(fontSize: 18, color: Colors.lightGreen, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('Lý do'),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Chọn lý do...',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                ),),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Thời gian hoạt động',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.help_outline,
                    color: Colors.orange,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Text('Từ ngày'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'hh:mm',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.date_range_outlined),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Text('Đến ngày'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'hh:mm',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.date_range_outlined),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Text('Chế độ'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Đi muộn',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Text('Thời gian đi muộn'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'hh:mm',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Về sớm',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'hh:mm',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEnterDescription() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          label: Text('Mô tả'),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Nhập mô tả',
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),),
    );
  }

  Widget _buildAttached() {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: DottedBorder(
            color: Colors.grey,
            strokeWidth: 1,
            dashPattern: const [4, 2],
            borderType: BorderType.RRect,
            radius: const Radius.circular(6),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[50],
                    child: const Icon(Icons.cloud_download_outlined, size: 30, color: Colors.lightGreen),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send_outlined, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'CHỌN TỪ MÁY',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey[800],
                            elevation: 0,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_outlined, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(
                                'CHỌN TỪ CLOUD',
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 20,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: const Text(
              'Đính kèm',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonUpdate() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'CẬP NHẬT ',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
