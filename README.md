# Quizzi - Ứng dụng ôn tập câu hỏi

Quizzi là một ứng dụng di động được xây dựng bằng Flutter, giúp người dùng ôn tập kiến thức thông qua các bài trắc nghiệm (quiz) thuộc nhiều lĩnh vực khác nhau như Toán học, Anh văn, Vật lý và Sinh học.

## 👥 Thành viên nhóm 9
- **Ngô Văn Hưng** - MSSV: 23010622
- **Nguyễn Minh Đức** - MSSV: 23010634

## ✨ Tính năng chính
- **Xác thực người dùng**: Đăng nhập và đăng ký tài khoản.
- **Danh mục Quiz phong phú**: Tìm kiếm và lọc quiz theo các chủ đề:
  - Toán Cơ Bản
  - Ngữ Pháp Tiếng Anh
  - Vật Lý Cơ Bản
  - Sinh Học Đại Cương
- **Trải nghiệm làm bài**: Giao diện làm bài trực quan với các tùy chọn trả lời.
- **Kết quả & Phản hồi**: Xem điểm số và kết quả ngay sau khi hoàn thành.
- **Bảng xếp hạng**: Theo dõi vị trí của bạn so với những người chơi khác.
- **Lịch sử làm bài**: Xem lại các bài quiz đã thực hiện và chi tiết điểm số.

## 🛠️ Công nghệ sử dụng
- **Framework**: [Flutter](https://flutter.dev) (v3.10.4 trở lên)
- **Ngôn ngữ**: [Dart](https://dart.dev)
- **Kiến trúc**: MVC (Models - Views - Controllers)

## 📁 Cấu trúc dự án
```text
lib/
├── controllers/ # Xử lý logic nghiệp vụ (Auth, History, Leaderboard)
├── data/        # Dữ liệu mẫu (Fake DB, Quiz Data)
├── models/      # Định nghĩa các đối tượng dữ liệu (User, Quiz, Question, History)
├── views/       # Giao diện người dùng (Login, Home, Quiz, Result, Profile, v.v.)
└── main.dart    # Điểm khởi đầu của ứng dụng

*Dự án được thực hiện cho học phần Lập trình thiết bị di động - Lớp Lập trình cho thiết bị di động-1-2-25(N02)-.*
