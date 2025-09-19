<img width="1034" height="778" alt="{A3F45771-E7E9-404B-98DB-60F1F26676EF}" src="https://github.com/user-attachments/assets/fe5c226a-aabe-4de9-9792-f50285b7c00d" />

// KhachHang.java
public class KhachHang {
    private int id;
    private String ten;
    private String soCMND;
    private String soDienThoai;

    // constructor, getter, setter
}
// KhachHangDAO.java
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

