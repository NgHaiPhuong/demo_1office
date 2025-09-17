import 'package:demo_1office/features/data/models/application_model.dart';
import 'package:demo_1office/features/data/models/contractitem.dart';
import 'package:demo_1office/features/data/models/familyinfo.dart';
import 'package:flutter/material.dart';

import '../../features/data/models/acountinfo.dart';
import '../../features/data/models/general_item.dart';
import '../../features/data/models/healthy_info.dart';
import '../../features/data/models/infoIitem.dart';
import '../../features/data/models/jobitem.dart';
import '../../features/data/models/menu_item.dart';
import '../../features/data/models/notification_item.dart';
import '../../features/data/models/salary_data.dart';
import '../../features/data/models/work_conscious.dart';
import '../../features/data/models/workprocess_item.dart';

class LoadData {

  List<SalaryData> dataSalary = [
    SalaryData('Tháng 1', 1.2),
    SalaryData('Tháng 2', 0),
    SalaryData('Tháng 3', 0),
    SalaryData('Tháng 4', 5.4),
    SalaryData('Tháng 5', 0),
    SalaryData('Tháng 6', 0),
    SalaryData('Tháng 7', 0),
    SalaryData('Tháng 8', 10.2),
  ];

  List<ApplicationItem> applicationList = [
    ApplicationItem(name: "Bài viết", des: "Mạng nội bộ"),
    ApplicationItem(name: "Hồ sơ nhân sự", des: "Trang cá nhân"),
    ApplicationItem(name: "Hồ sơ ký số", des: "Ký số"),
    ApplicationItem(name: "Tích hợp ký số cá nhân", des: "Ký số"),
    ApplicationItem(name: "Đơn xin nghỉ", des: "Đơn từ"),
    ApplicationItem(name: "Đơn vắng mặt", des: "Đơn từ"),
    ApplicationItem(name: "Đơn checkin/out", des: "Đơn từ"),
    ApplicationItem(name: "Đơn đổi ca", des: "Đơn từ"),
    ApplicationItem(name: "Đơn tăng ca", des: "Đơn từ"),
    ApplicationItem(name: "Đơn đăng ký ca", des: "Đơn từ"),
    ApplicationItem(name: "Đơn làm thêm", des: "Đơn từ"),
    ApplicationItem(name: "Đơn công tác", des: "Đơn từ"),
    ApplicationItem(name: "Đơn làm theo chế độ", des: "Đơn từ"),
    ApplicationItem(name: "Đơn làm thôi việc", des: "Đơn từ"),
    ApplicationItem(name: "Ticket", des: "Hỗ trợ"),
    ApplicationItem(name: "Thông báo cập nhật", des: "Hỗ trợ"),
  ];

  final List<NotificationItem> notifications = [
    NotificationItem(
      sender: "Admin Teracom",
      content: "đã duyệt 3 đơn checkin/out",
      time: "10:04",
      date: "04/09/2025",
      category: "Đơn checkin/out",
      iconUrl: "https://img.icons8.com/color/48/admin-settings-male.png",
    ),
    NotificationItem(
      sender: "",
      content: "[1OFFICE] THÔNG BÁO ĐỊNH KỲ CÁC TÍNH NĂNG NÂNG CẤP - THÁNG 08/2025",
      time: "11:16",
      date: "03/09/2025",
      category: "Thông báo",
      iconUrl: "https://img.icons8.com/color/48/briefcase.png",
      isUnread: false,
    ),
    NotificationItem(
      sender: "Admin Teracom",
      content: "đã duyệt 1 đơn xin nghỉ Không lương của Nguyễn Thị Hải Phương",
      time: "11:32",
      date: "27/08/2025",
      category: "Đơn xin nghỉ",
      iconUrl: "https://img.icons8.com/color/48/admin-settings-male.png",
    ),
  ];

  final List<ContractInfo> contractList = [
    ContractInfo(
      creator: "",
      idContract: "524-01/2025/HĐTV-TERACOM",
      nameContract: "Hợp đồng thử việc",
      departments: "DIV1",
      status: "Đang hiệu lực",
      signingDate: "--",
      effectiveDate: "04/08/2025",
      toDate: "3/10/2025",
      creationDate: "04/08/2025",
    ),
  ];

  List<JobItem> jobList = [
    JobItem(label: "Trạng thái", value: "Đang làm việc", isHighlighted: true),
    JobItem(label: "Phòng ban", value: "Công ty Cổ phần Teracom > DIV1"),
    JobItem(label: "Vị trí", value: "Fresher Android"),
    JobItem(label: "Ngày vào", value: "04/08/2025"),
    JobItem(label: "Tên hợp đồng", value: "Hợp đồng thử việc"),
    JobItem(label: "Tài khoản 10Office", value: "phuongnth (04/08/2025)"),
    JobItem(label: "Nhóm người dùng", value: "Nhóm nhân viên (BASIC_HRM)"),
  ];

  List<FamilyInfo> familyData = [
    FamilyInfo(
      name: " ",
      phone: "--",
      taxCode: "--",
      idNumber: "--",
      date: "--",
      place: "--",
      dependency: "Không",
      time: "--",
      note: "--",
    ),
  ];

  List<AccountInfo> accountData = [
    AccountInfo(
      accountNumber: "--",
      accountName: "NGUYEN THI HAI PHUONG",
      bank: "--",
      branch: "--",
    ),
  ];

  List<InfoItem> idNumberList = [
    InfoItem(
      title: "Số CMT/CC/CCCD",
      value:
      "027303000269",
    ),
    InfoItem(
      title: "Ngày cấp, nơi cấp CMT/CC/CCCD",
      value:
      "09/09/2021, Cục cảnh sát DKQL cư trú và DLQG về dân cư",
    ),
  ];

  List<InfoItem> infoList = [
    InfoItem(
      title: "Chỗ ở hiện nay",
      value:
      "Phú Diễn, Phúc Diễn, Bắc Từ Liêm, Hà Nội, Thành phố Hà Nội, Việt Nam",
    ),
    InfoItem(
      title: "Thường trú",
      value:
      "Xã Phú Cường (cũ), Huyện Sóc Sơn, Thành Phố Hà Nội, Thành phố Hà Nội, Việt Nam",
    ),
    InfoItem(
      title: "Ngân hàng",
      value: "NGUYEN THI HAI PHUONG",
    ),
    InfoItem(
      title: "Số năm kinh nghiệm hiện tại",
      value: "0.1",
    ),
    InfoItem(
      title: "Nghĩa vụ quân sự",
      value: "Không phải đi",
    ),
    InfoItem(
      title: "Ghi chú",
      value: "",
    ),
  ];

  final List<WorkConscious> workList = [
    WorkConscious(indicator: "Ngày công", total: "26.41 công", average: "13.2"),
    WorkConscious(indicator: "Đi muộn", total: "1 lần", average: "0.5"),
    WorkConscious(indicator: "Về sớm", total: "0 lần", average: "0"),
    WorkConscious(indicator: "Xin nghỉ", total: "1 lần", average: "0.5"),
    WorkConscious(indicator: "Tăng ca", total: "0 giờ", average: "0"),
  ];

  final List<HealthInfo> healthList = [
    HealthInfo(title: "Huyết áp", value: "--", unit: "mmHg"),
    HealthInfo(title: "Nhịp tim", value: "--", unit: "Nhịp/phút"),
    HealthInfo(title: "Nhóm máu", value: "--", unit: "--"),
    HealthInfo(title: "Chiều cao", value: "--", unit: "cm"),
    HealthInfo(title: "Cân nặng", value: "--", unit: "kg"),
  ];

  List<String> documentList = [
    "Ảnh cá nhân",
    "Bản sao giấy khai sinh",
    "Bản sao sổ hộ khẩu",
    "Bằng cấp, trình độ chuyên môn",
    "Bảo hiểm xã hội",
    "Cam kết chính thức",
    "Cam kết làm việc",
    "Cam kết thai sản",
    "Cam kết thử việc",
    "CMT/Căn cước/HC",
    "Cơ cấu lương",
    "Đánh giá thử việc",
    "Đề xuất điều chỉnh chức vụ, thu nhập",
    "Giấy khám sức khỏe",
    "Hợp đồng lao động",
    "Information security agreement",
    "Quyết định bổ nhiệm",
    "Quyết định chấm dứt HĐLĐ",
    "Sơ yếu lý lịch",
    "Tạo tài khoản email",
    "Thư mời làm việc",
  ];

  List<WorkProcessItem> workProcessList = [
    WorkProcessItem(
      date: "04/08/2025",
      status: "Đang làm việc",
      statusColor: Colors.green,
      title: "Hợp đồng lao động - Fresher Android",
      details:
      "524-01/2025/HĐTV-TERACOM • Hợp đồng thử việc • Công ty Cổ phần Teracom • Bộ phận Phát triển • DIV1 • Nhân viên",
    ),
    WorkProcessItem(
      date: "04/08/2025",
      status: "Đã làm việc",
      statusColor: Colors.teal,
      title: "Hợp đồng lao động - Fresher Android",
      details:
      "",
    ),
  ];

  final List<MenuItem> menuItems = [
    MenuItem(id: "network", title: "Mạng nội bộ", icon: Icons.language, color: Colors.blue, group: "WORKPLACE", isActive: true),
    MenuItem(id: "sign", title: "Ký số", icon: Icons.edit, color: Colors. blue, group: "WORKPLACE", isActive: true),
    MenuItem(id: "task", title: "Công việc", icon: Icons.task, color: Colors.green , group: "WORKPLACE"),
    MenuItem(id: "project", title: "Dự án", icon: Icons.work, color: Colors.yellow , group: "WORKPLACE"),
    MenuItem(id: "process", title: "Quy trình", icon: Icons.account_tree, color: Colors.purple , group: "WORKPLACE"),
    MenuItem(id: "document", title: "Tài liệu", icon: Icons.book, color: Colors.orange , group: "WORKPLACE"),
    MenuItem(id: "calendar", title: "Lịch biểu", icon: Icons.calendar_today, color: Colors.redAccent , group: "WORKPLACE"),
    MenuItem(id: "paper", title: "Văn bản", icon: Icons.description, color: Colors.orange, group: "WORKPLACE"),
    MenuItem(id: "asset", title: "Tài sản", icon: Icons.devices_other, color: Colors.green , group: "WORKPLACE"),

    MenuItem(id: "form", title: "Đơn từ", icon: Icons.note, color: Colors.blue, group: "HRM", isActive: true),
    MenuItem(id: "recruit", title: "Tuyển dụng", icon: Icons.person_add, color: Colors.orange, group: "HRM"),
    MenuItem(id: "hr", title: "Nhân sự", icon: Icons.group, color: Colors.green, group: "HRM"),
    MenuItem(id: "evaluate", title: "Đánh giá", icon: Icons.fact_check, color: Colors.yellow, group: "HRM"),
    MenuItem(id: "ivan", title: "IVAN", icon: Icons.umbrella, color: Colors.purple, group: "HRM"),
    MenuItem(id: "training", title: "Đào tạo", icon: Icons.school, color: Colors.redAccent, group: "HRM"),
    MenuItem(id: "attendance", title: "Chấm công", icon: Icons.check_circle, color: Colors.blue, group: "HRM"),
    MenuItem(id: "payroll", title: "Bảng lương", icon: Icons.attach_money, color: Colors.redAccent, group: "HRM"),
    MenuItem(id: "kpi", title: "KPI", icon: Icons.track_changes, color: Colors.green, group: "HRM"),
    MenuItem(id: "okr", title: "OKR", icon: Icons.show_chart, color: Colors.yellow, group: "HRM"),

    MenuItem(id: "finance", title: "Tài chính", icon: Icons.account_balance_wallet, color: Colors.blue ,group: "CRM"),
    MenuItem(id: "marketing", title: "Marketing", icon: Icons.campaign, color: Colors.orange ,group: "CRM"),
    MenuItem(id: "sales", title: "Bán hàng", icon: Icons.shopping_cart, color: Colors.yellow ,group: "CRM"),
    MenuItem(id: "customer", title: "Khách hàng", icon: Icons.chat, color: Colors.purple ,group: "CRM"),
    MenuItem(id: "warehouse", title: "Kho hàng", icon: Icons.inventory, color: Colors.redAccent ,group: "CRM"),
    MenuItem(id: "purchase", title: "Mua hàng", icon: Icons.shopping_bag, color: Colors.purple ,group: "CRM"),
    MenuItem(id: "promotion", title: "Khuyến mại", icon: Icons.local_offer, color: Colors.blue ,group: "CRM"),

    MenuItem(id: "one", title: "One", icon: Icons.change_history, color: Colors.orange, group: "ADVANCE"),
    MenuItem(id: "support", title: "Hỗ trợ", icon: Icons.headset, color: Colors.blue, group: "ADVANCE", isActive: true),
    MenuItem(id: "report", title: "Báo cáo", icon: Icons.bar_chart, color: Colors.orange, group: "ADVANCE"),
  ];

  List<GeneralItem> generalItems = [
    GeneralItem(
      id: "email",
      title: "Email",
      information: "nghaiphuong2003@gmail.com",
      icon: Icons.email_outlined,
      color: Colors.red,
    ),
    GeneralItem(
      id: "dt",
      title: "Điện thoại",
      information: "0867820523",
      icon: Icons.phone,
      color: Colors.green,
    ),
    GeneralItem(
      id: "dob",
      title: "Ngày sinh",
      information: "27/12/2003",
      icon: Icons.cake_outlined,
      color: Colors.blue,
    ),
    GeneralItem(
      id: "hometown",
      title: "Nguyên quán",
      information: "--",
      icon: Icons.home_outlined,
      color: Colors.orange,
    ),
    GeneralItem(
      id: "gender",
      title: "Giới tính",
      information: "Nữ",
      icon: Icons.person_outline,
      color: Colors.blue,
    ),
    GeneralItem(
      id: "marital_status",
      title: "Tình trạng hôn nhân",
      information: "--",
      icon: Icons.star_border,
      color: Colors.blue,
    ),
    GeneralItem(
      id: "account",
      title: "Tài khoản 10Office",
      information: "phuongnth",
      icon: Icons.account_circle_outlined,
      color: Colors.greenAccent,
    ),
    GeneralItem(
      id: "gps_location",
      title: "Địa điểm chấm công GPS",
      information: "Tất cả",
      icon: Icons.location_on_outlined,
      color: Colors.green,
    ),
  ];
}