import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../home/widget/home_header.dart';

class AbsenceApplicationPage extends StatelessWidget {
  const AbsenceApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(userName: 'Tạo mới đơn vắng mặt',showBackButton: true,),
            Divider(color: Colors.grey[300]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildGeneralInformation(context),
                    _buildEnterDescription(),
                    _buildAttached(),
                    _buildRelatedObject(),
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
              Text('Thông tin đơn', style: TextStyle(fontSize: 18, color: Colors.lightGreen, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.close),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    label: Text('Ngày vắng mặt'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: '16/09/2025',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(Icons.date_range_outlined),
                  ),),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Vắng mặt từ'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'hh:mm',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.access_time),
                        ),
                        onTap: (){
                          // showSelectTimeBottomSheet(context);
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Vắng mặt đến'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'hh:mm',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.access_time),
                        ),
                        onTap: () {
                          // showSelectCalendarBottomSheet(context);
                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 16),
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
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Tính công',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                        onTap: (){
                          // showSelectTimeBottomSheet(context);
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Yêu cầu chốt',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                        onTap: () {
                          // showSelectCalendarBottomSheet(context);
                        },
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(child: Icon(Icons.add_circle_outline,color: Colors.lightGreen,size: 40,))
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

  Widget _buildRelatedObject(){
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.lightGreen, size: 30),
              Text('Đối tượng liên quan', style: TextStyle(fontSize: 18, color: Colors.lightGreen, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.close),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Đối tượng liên quan',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  onTap: (){
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(child: Icon(Icons.add_circle_outline,color: Colors.lightGreen,size: 40,))
        ],
      ),
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
