<img width="1034" height="778" alt="{A3F45771-E7E9-404B-98DB-60F1F26676EF}" src="https://github.com/user-attachments/assets/fe5c226a-aabe-4de9-9792-f50285b7c00d" />

public class KhachHang {
    private int id;
    private String ten;
    private String soCMND;
    private String soDienThoai;

    // Constructor không tham số
    public KhachHang() {}

    // Constructor có tham số
    public KhachHang(int id, String ten, String soCMND, String soDienThoai) {
        this.id = id;
        this.ten = ten;
        this.soCMND = soCMND;
        this.soDienThoai = soDienThoai;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }
    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getSoCMND() {
        return soCMND;
    }
    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }
    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
}
import java.util.ArrayList;
import java.util.List;

public class KhachHangDAO {
    private List<KhachHang> danhSach = new ArrayList<>();

    // Create
    public void themKhachHang(KhachHang kh) {
        danhSach.add(kh);
    }

    // Read
    public List<KhachHang> layTatCa() {
        return danhSach;
    }

    // Update
    public void suaKhachHang(int id, KhachHang khMoi) {
        for (int i = 0; i < danhSach.size(); i++) {
            if (danhSach.get(i).getId() == id) {
                danhSach.set(i, khMoi);
                break;
            }
        }
    }

    // Delete
    public void xoaKhachHang(int id) {
        danhSach.removeIf(kh -> kh.getId() == id);
    }
}
## Activity Diagram - Quản lý Khách hàng

```mermaid
flowchart TD
    A([Người dùng]) --> B[Chọn chức năng Khách hàng]
    B --> C{Chọn thao tác nào?}

    C -->|Thêm| D[Nhập thông tin khách hàng]
    D --> E[Lưu vào danh sách]
    E --> Z[Kết thúc]

    C -->|Xem| F[Hiển thị danh sách khách hàng]
    F --> Z

    C -->|Sửa| G[Chọn khách hàng cần sửa]
    G --> H[Nhập thông tin mới]
    H --> I[Cập nhật trong danh sách]
    I --> Z

    C -->|Xóa| J[Chọn khách hàng cần xóa]
    J --> K[Xóa khỏi danh sách]
    K --> Z

    Z --> L([Hoàn tất thao tác])


