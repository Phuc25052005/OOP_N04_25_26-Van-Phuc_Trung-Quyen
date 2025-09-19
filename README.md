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
# Hotel Management App

Ứng dụng quản lý khách sạn với các chức năng CRUD cho Khách hàng, Nhân viên và Phòng.  

---

## Activity Diagram – CRUD cho Khách hàng, Nhân viên, Phòng

```mermaid
flowchart TD
    A([Người dùng]) --> B{Chọn chức năng nào?}

    B -->|Khách hàng| C1{Chọn thao tác}
    B -->|Nhân viên| C2{Chọn thao tác}
    B -->|Phòng| C3{Chọn thao tác}

    %% --- Quản lý Khách hàng ---
    C1 -->|Thêm| D1[Nhập thông tin khách hàng] --> E1[Lưu vào danh sách KH] --> Z
    C1 -->|Xem| F1[Hiển thị danh sách KH] --> Z
    C1 -->|Sửa| G1[Chọn KH cần sửa] --> H1[Nhập thông tin mới] --> I1[Cập nhật KH] --> Z
    C1 -->|Xóa| J1[Chọn KH cần xóa] --> K1[Xóa KH khỏi danh sách] --> Z

    %% --- Quản lý Nhân viên ---
    C2 -->|Thêm| D2[Nhập thông tin nhân viên] --> E2[Lưu vào danh sách NV] --> Z
    C2 -->|Xem| F2[Hiển thị danh sách NV] --> Z
    C2 -->|Sửa| G2[Chọn NV cần sửa] --> H2[Nhập thông tin mới] --> I2[Cập nhật NV] --> Z
    C2 -->|Xóa| J2[Chọn NV cần xóa] --> K2[Xóa NV khỏi danh sách] --> Z

    %% --- Quản lý Phòng ---
    C3 -->|Thêm| D3[Nhập thông tin phòng] --> E3[Lưu vào danh sách Phòng] --> Z
    C3 -->|Xem| F3[Hiển thị danh sách Phòng] --> Z
    C3 -->|Sửa| G3[Chọn Phòng cần sửa] --> H3[Nhập thông tin mới] --> I3[Cập nhật Phòng] --> Z
    C3 -->|Xóa| J3[Chọn Phòng cần xóa] --> K3[Xóa Phòng khỏi danh sách] --> Z

    Z([Hoàn tất thao tác])
Nguyễn văn PhúcPhúc
