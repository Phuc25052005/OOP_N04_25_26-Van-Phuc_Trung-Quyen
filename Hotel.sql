USE HOTEL;
GO

	CREATE TABLE NhanVien (
		MaNV INT PRIMARY KEY,
		TenNV NVARCHAR(100) NOT NULL,
		Cccd VARCHAR(12) UNIQUE NOT NULL,
		Sdt VARCHAR(12) UNIQUE NOT NULL,
		TaiKhoan VARCHAR(50) UNIQUE,
		MatKhau VARCHAR(50),
		PhanCap VARCHAR(10) CHECK (PhanCap IN ('manager', 'employee')) NOT NULL,
		GioiTinh VARCHAR(5) CHECK (GioiTinh IN ('nam', 'nu')) NOT NULL
	);

	CREATE TABLE Phong (
		MaP VARCHAR(50) PRIMARY KEY,
		KieuPhong VARCHAR(50) NOT NULL,
		GiaGio DECIMAL(10,2) NOT NULL,
		TrangThai NVARCHAR(50) CHECK (TrangThai IN ('Trong', 'Dang su dung')) NOT NULL
	);

	CREATE TABLE KhachHang (
		MaKH VARCHAR(20) PRIMARY KEY,
		TenKH NVARCHAR(50),
		Cccd VARCHAR(20),
		Sdt VARCHAR(20)
	);

	CREATE TABLE DatPhong (
		MaDP INT IDENTITY(1,1) PRIMARY KEY,
		MaDatPhongHienThi VARCHAR(10),
		MaKH VARCHAR(20) NOT NULL,
		MaP VARCHAR(50) NOT NULL,
		MaNV INT,
		NgayThue DATETIME,
		NgayTra DATETIME,
		FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
		FOREIGN KEY (MaP) REFERENCES Phong(MaP),
		FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV) ON DELETE SET NULL
	);

	CREATE TABLE DichVu (
		MaDV VARCHAR(50) PRIMARY KEY,
		TenDV NVARCHAR(100) UNIQUE NOT NULL,
		GiaDV DECIMAL(10,2) NOT NULL
	);

	CREATE TABLE SuDungDV (
		MaSDDV INT IDENTITY(1,1) PRIMARY KEY,
		NgayThue DATETIME NOT NULL,
		SoLuong INT NOT NULL,
		MaDV VARCHAR(50) NOT NULL,
		MaDP INT NOT NULL,
		TongTien DECIMAL(10,2) NOT NULL,
		FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV),
		FOREIGN KEY (MaDP) REFERENCES DatPhong(MaDP)
	);

	CREATE TABLE HoaDon (
		MaHD INT IDENTITY(1,1) PRIMARY KEY,
		MaDP INT NOT NULL UNIQUE,
		NgayLapHD DATETIME,
		TongTien DECIMAL(10,2) NOT NULL,
		NgayTT DATETIME NOT NULL,
		PhuongThucTT NVARCHAR(30) NOT NULL CHECK (PhuongThucTT IN ('Tien mat', 'Tai khoan')),
		FOREIGN KEY (MaDP) REFERENCES DatPhong(MaDP)
	);

INSERT INTO NhanVien (MaNV ,TenNV, Cccd, Sdt, TaiKhoan, MatKhau, PhanCap, GioiTinh)
VALUES 
(1,N'Nguyen Van d', '123456789015', '09111111114', 'user1', '1', 'manager', 'nam'),
(2,N'Tran Thi B', '123456789013', '0911111112', 'user2', '1', 'employee', 'nu'),
(3,N'Le Van C', '123456789014', '0911111113', 'levanc', '789', 'employee', 'nam');

INSERT INTO Phong (MaP, KieuPhong, GiaGio, TrangThai)
VALUES 
('P101', N'Phòng đơn', 50000, N'Trong'),
('P102', N'Phòng đôi',  80000, N'Trong'),
('P103', N'Phòng VIP', 120000, N'Trong'),
('P104', N'Phòng đơn', 50000, N'Trong'),
('P105', N'Phòng đôi', 80000, N'Trong'),
('P201', N'Phòng đơn', 50000, N'Trong'),
('P202', N'Phòng VIP', 120000, N'Trong');

INSERT INTO KhachHang (MaKH,TenKH, Cccd, Sdt)
VALUES
('KH1',N'Pham Van D', '987654321001', '0988888881'),
('KH2',N'Nguyen Thi E', '987654321002', '0988888882'),
('KH3',N'Tran Van F', '987654321003', '0988888883');

INSERT INTO DatPhong (MaKH, MaP, MaNV, NgayThue, NgayTra)
VALUES
('KH1', 'P102', 2, '2025-05-13 14:00:00', '2025-05-13 18:00:00'),
('KH2', 'P105', 3, '2025-05-12 13:00:00', '2025-05-14 12:00:00');

INSERT INTO DichVu (MaDV, TenDV, GiaDV)
VALUES
('DV01', N'Nước suối', 10000),
('DV02', N'Giặt ủi', 50000),
('DV03', N'Bữa sáng', 80000);

INSERT INTO SuDungDV (NgayThue, SoLuong, MaDV, MaDP, TongTien)
VALUES
('2025-05-13 14:30:00', 2, 'DV01', 1, 20000),
('2025-05-13 15:00:00', 1, 'DV02', 1, 50000),
('2025-05-13 16:00:00', 1, 'DV03', 2, 80000);

INSERT INTO HoaDon (MaDP, NgayLapHD, TongTien, NgayTT, PhuongThucTT)
VALUES
(1, '2025-05-13 19:00:00', 570000, '2025-05-13 19:10:00', N'Tien mat'),
(2, '2025-05-14 12:00:00', 1080000, '2025-05-14 12:10:00', N'Tai khoan');

