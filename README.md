<img width="1034" height="778" alt="{A3F45771-E7E9-404B-98DB-60F1F26676EF}" src="https://github.com/user-attachments/assets/fe5c226a-aabe-4de9-9792-f50285b7c00d" />
flowchart TD
    A[Người dùng chọn chức năng] --> B{Tạo / Xem / Sửa / Xóa?}
    B -->|Tạo| C[Nhập thông tin Khách hàng mới] --> D[Lưu DB]
    B -->|Xem| E[Lấy danh sách Khách hàng từ DB] --> F[Hiển thị danh sách]
    B -->|Sửa| G[Chọn Khách hàng cần sửa] --> H[Cập nhật thông tin] --> D
    B -->|Xóa| I[Chọn Khách hàng cần xóa] --> J[Xóa DB]
    D --> K[Thông báo thành công]
    F --> K
    H --> K
    J --> K
