import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../home/widget/home_header.dart';
import '../widget/select_calendar_bottomsheet.dart';
import '../widget/select_time_bottomsheet.dart';
import 'reason_page.dart';
import 'package:flutter_quill/flutter_quill.dart';

class LeaveApplicationPage extends StatefulWidget {
  const LeaveApplicationPage({super.key});

  @override
  State<LeaveApplicationPage> createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  final QuillController _quillController = QuillController.basic();

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(userName: 'Tạo mới đơn xin nghỉ', showBackButton: true),
            Divider(color: Colors.grey[300]),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
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
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.lightGreen,
                size: 30,
              ),
              Text(
                'Thông tin chung',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Lý do',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReasonPage()),
                    );
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text('Tính công'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Không',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Spacer(), Icon(Icons.close)]),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Từ giờ',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.access_time),
                        ),
                        onTap: () {
                          showSelectTimeBottomSheet(context);
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Từ ngày',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        onTap: () {
                          showSelectCalendarBottomSheet(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          label: Text('Từ khóa'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                          hintText: 'Đến giờ',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.access_time),
                        ),
                        onTap: () {
                          showSelectTimeBottomSheet(context);
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Đến ngày',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        onTap: () {
                          showSelectCalendarBottomSheet(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.lightGreen,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterDescription() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                _buildCustomToolbar(),
                Divider(height: 1, color: Colors.grey.shade300),
                SizedBox(
                  height: 200,
                  child: QuillEditor.basic(controller: _quillController),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 20,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _buildHintText('Mô tả'),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomToolbar() {
    void toggle(Attribute attr) {
      final isApplied = _quillController
          .getSelectionStyle()
          .attributes
          .containsKey(attr.key);
      _quillController.formatSelection(
        isApplied ? Attribute.clone(attr, null) : attr,
      );
    }

    void clearFormat() {
      final attrs = _quillController.getSelectionStyle().attributes.values;
      for (final attr in attrs) {
        _quillController.formatSelection(Attribute.clone(attr, null));
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToolbarRow([
            _btn(Icons.format_bold, () => toggle(Attribute.bold)),
            _btn(Icons.format_italic, () => toggle(Attribute.italic)),
            _btn(Icons.format_underline, () => toggle(Attribute.underline)),
            _btn(
              Icons.format_strikethrough,
              () => toggle(Attribute.strikeThrough),
            ),
            _sep(),
            _btn(
              Icons.format_align_left,
              () => _quillController.formatSelection(Attribute.leftAlignment),
            ),
            _btn(
              Icons.format_align_center,
              () => _quillController.formatSelection(Attribute.centerAlignment),
            ),
            _btn(
              Icons.format_align_right,
              () => _quillController.formatSelection(Attribute.rightAlignment),
            ),
            _sep(),
            _btn(Icons.undo, _quillController.undo),
            _btn(Icons.redo, _quillController.redo),
          ]),
          Divider(height: 4, thickness: 0.5, color: Colors.grey.shade300),
          _buildToolbarRow([
            _btn(Icons.format_list_bulleted, () => toggle(Attribute.ul)),
            _btn(Icons.format_list_numbered, () => toggle(Attribute.ol)),
            _sep(),
            _btn(Icons.format_quote, () => toggle(Attribute.blockQuote)),
            _btn(Icons.code, () => toggle(Attribute.codeBlock)),
            _sep(),
            _btn(Icons.format_clear, clearFormat),
          ]),
        ],
      ),
    );
  }

  Widget _buildToolbarRow(List<Widget> children) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: children),
  );

  Widget _btn(IconData icon, VoidCallback onPressed) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    child: IconButton(
      icon: Icon(icon, size: 16),
      color: Colors.grey[700],
      onPressed: onPressed,
      constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
      visualDensity: VisualDensity.compact,
      splashRadius: 16,
    ),
  );

  Widget _sep() => Container(
    width: 1,
    height: 18,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    color: Colors.grey.shade300,
  );

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
                    child: const Icon(
                      Icons.cloud_download_outlined,
                      size: 30,
                      color: Colors.lightGreen,
                    ),
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
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
            child: _buildHintText('Đính kèm'),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedObject() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.lightGreen,
                size: 30,
              ),
              Text(
                'Đối tượng liên quan',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                Row(children: [Spacer(), Icon(Icons.close)]),
                SizedBox(height: 8),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Đối tượng liên quan',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.lightGreen,
              size: 40,
            ),
          ),
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

  Widget _buildHintText(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

}
