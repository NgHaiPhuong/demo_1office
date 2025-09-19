import 'package:flutter/material.dart';

void showTimekeepingInfoBottomSheet(BuildContext context, DateTime date,) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(date),
              Divider(),
              _buildContent(),
              _buildShiftAdministration(),
              _buildDayTimekeeping(),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildHeader( DateTime date){
  return Center(
      // child: Text('Chấm công, ngày 15/09/2025',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),));
      child: Text('Chấm công, ngày ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),);
}

Widget _buildContent() {
  return Row(
    children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: 1.2,
          child: _buildBox(
            color: Colors.green[100]!,
            time: '8:29',
            status: 'Đến đúng giờ',
            title: 'Giờ vào',
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: AspectRatio(
          aspectRatio: 1.2,
          child: _buildBox(
            color: Colors.green[100]!,
            time: '17:30',
            status: 'Về đúng giờ',
            title: 'Giờ ra',
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: AspectRatio(
          aspectRatio: 1.2,
          child: _buildBoxProgress(),
        ),
      ),
    ],
  );
}

Widget _buildBox({
  required Color color,
  required String time,
  required String status,
  required String title,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.check,
                size: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
              fontSize: 18, color: Colors.green, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        Text(status),
      ],
    ),
  );
}

Widget _buildBoxProgress() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.deepPurple[100],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.access_time),
            SizedBox(width: 4),
            Text('8h'),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 5,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '1',
          style: TextStyle(
              fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget _buildShiftAdministration(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8),
      Text('Ca làm việc HC - Ca hành chính',style: TextStyle(fontSize: 16),),
      SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('Thời gian',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Spacer(),
                Text('8:30 - 18:00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text('Số giờ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Spacer(),
                Text('8',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text('Số công',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Spacer(),
                Text('1',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text('Chốt vân tay',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Spacer(),
                Text('8:29 - 18:05',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

Widget _buildDayTimekeeping(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8,),
      Text('Chốt công trong ngày',style: TextStyle(fontSize: 16),),
      SizedBox(height: 8,),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('08:29, 15/09/25, Mã máy: Tang06',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                Spacer(),
                Text('(máy)',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

