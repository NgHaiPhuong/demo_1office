import 'package:flutter/material.dart';
import '../../individual/page/individual_bottomsheet.dart';
import '../../menu/page/menu_page.dart';
import '../../notify/page/notifty_page.dart';
import '../../payroll/page/payroll_page.dart';
import '../../timesheet/page/timesheet_page.dart';
import '../../timesheet/widget/category_bottomsheet.dart';
import '../widget/filter_bottomsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isNeedBeDoneVisible = true;
  bool _isProposeVisible = true;
  bool _isWorkTrackingVisible = true;
  bool _isTimeCardVisible = true;
  bool _isEventsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                children: [
                  _buildNeedBeDone(),
                  _buildPropose(),
                  _buildWorkTracking(),
                  _buildTimeCard(),
                  _buildEventsList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ),
              );
            },
            child: const Icon(Icons.grid_view_outlined, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Nguyễn Thị Hải Phương',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(width: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.bookmark_border_outlined, size: 30),
              const SizedBox(width: 12),
              const Icon(
                Icons.details_outlined,
                color: Colors.orange,
                size: 30,
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotifyPage(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Icon(Icons.notifications_none, size: 30),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 14,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.home, color: Colors.green, size: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNeedBeDone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildTitle(
            'Việc cân thực hiện',
            hasFilter: true,
            isVisible: _isNeedBeDoneVisible,
            onToggle: () {
              setState(() {
                _isNeedBeDoneVisible = !_isNeedBeDoneVisible;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_isNeedBeDoneVisible)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.grey,
                    size: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Thật tuyệt. Bạn đã xử lý hết công việc!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWorkTracking() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildTitle(
            'Việc bàn giao, theo dõi',
            hasFilter: true,
            isVisible: _isWorkTrackingVisible,
            onToggle: () {
              setState(() {
                _isWorkTrackingVisible = !_isWorkTrackingVisible;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_isWorkTrackingVisible)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.sticky_note_2_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Công việc bạn theo dõi đã được xử lý hết.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropose() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildTitle(
            'Đề xuất của bạn',
            hasFilter: true,
            isVisible: _isProposeVisible,
            onToggle: () {
              setState(() {
                _isProposeVisible = !_isProposeVisible;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_isProposeVisible)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Text(
                      'O',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Đơn checkin/out', style: TextStyle(fontSize: 20)),
                        Row(
                          children: [
                            Text(
                              'Nguyễn Thị Hải Phương ',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const Icon(
                              Icons.access_time,
                              color: Colors.grey,
                              size: 16,
                            ),
                            Flexible(
                              child: Text(
                                ' 08:50 ng 3/9/2025',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildContent(
                          'Lý do',
                          Text(
                            'Quên chốt vân tay',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildContent(
                          'Ngày \ncheckin/out',
                          Text('25/08/2025', style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 8),
                        _buildContent(
                          'Trạng thái',
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Chờ duyệt',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
    );
  }

  Widget _buildContent(String title, Widget content) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Align(alignment: Alignment.centerLeft, child: content),
        ),
      ],
    );
  }

  Widget _buildTimeCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Thứ 4, 03/09/2025',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.chevron_left, color: Colors.grey, size: 30),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 30),
              const Icon(
                Icons.date_range_rounded,
                color: Colors.grey,
                size: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isTimeCardVisible = !_isTimeCardVisible;
                  });
                },
                child: Icon(
                  _isTimeCardVisible ? Icons.remove : Icons.add,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_isTimeCardVisible)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildTimeIn()),
                const SizedBox(width: 8),
                Expanded(child: _buildTimeOut()),
                const SizedBox(width: 8),
                Expanded(child: _buildWorkingTime()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTimeIn() {
    return Container(
      color: Colors.green[50],
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text('Giờ vào', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
            ],
          ),
          Text(
            '08:27 AM',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Sớm nhất: 08:27',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.green, size: 14),
              const SizedBox(width: 8),
              Text('Đến đúng giờ', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeOut() {
    return Container(
      color: Colors.orange[50],
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Giờ về', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              const Icon(
                Icons.access_time_filled_outlined,
                color: Colors.orange,
                size: 20,
              ),
            ],
          ),
          Text(
            '--',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Muộn nhất: --',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.orange, size: 14),
              const SizedBox(width: 8),
              Text('Chưa đến giờ', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkingTime() {
    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Công', style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Text(
            '0.44',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Text('00:00p', style: TextStyle(color: Colors.blue, fontSize: 12)),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(
            'Lịch và sự kiện',
            isVisible: _isEventsVisible,
            onToggle: () {
              setState(() {
                _isEventsVisible = !_isEventsVisible;
              });
            },
          ),
          const SizedBox(height: 16),
          if (_isEventsVisible) ...[
            _buildEventItem(
              'Hôm nay',
              '03/09',
              'Ngô Thị Kiều Oanh',
              Colors.red,
              'O',
            ),
            _buildEventItem('Thứ 7', '06/09', 'Lê Hoàng Việt', Colors.teal, 'V'),
          ],
        ],
      ),
    );
  }

  Widget _buildEventItem(
      String day,
      String date,
      String title,
      Color color,
      String initial,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Ngày $date',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      ),
      const SizedBox(width: 12),
      Container(color: Colors.red, width: 3, height: 140),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sinh nhật $title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.date_range_sharp,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Cả ngày',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: color,
                radius: 20,
                child: Text(
                  initial,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),]
      ),
    );
  }

  Widget _buildTitle(
      String title, {
        bool hasFilter = false,
        bool isVisible = true,
        VoidCallback? onToggle,
      }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        if (hasFilter) InkWell(
          onTap: (){
            showFilterBottomSheet(context);
          },
            child: Icon(Icons.filter_alt_outlined, color: Colors.grey, size: 30)),
        InkWell(
          onTap: onToggle,
          child: Icon(isVisible ? Icons.remove : Icons.add, color: Colors.grey, size: 30),
        ),
      ],
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      height: 80,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItemNavigationBar(Icons.menu, 'Danh mục', () {
            showCategoryBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.date_range_rounded, 'Bảng công', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TimesheetPage()),
            );
          }),
          _buildItemNavigationBar(Icons.add_box_outlined, 'Tạo mới'),
          _buildItemNavigationBar(Icons.paid_outlined, 'Bảng lương', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PayrollPage()),
            );
          }),
          _buildItemNavigationBar(Icons.person_outline, 'Cá nhân', () {
            showIndividualBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildItemNavigationBar(IconData icon, String label, [VoidCallback? onTap]) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30),
          Text(label, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}