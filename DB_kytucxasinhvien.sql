-- Tạo cơ sở dữ liệu và bảng
CREATE DATABASE kytucxasinhvien3;
USE kytucxasinhvien3;

CREATE TABLE SinhVien (
    MaSV VARCHAR(10) PRIMARY KEY,
    SoCMT VARCHAR(12),
    NgaySinh DATE,
    Lop VARCHAR(20),
    QueQuan VARCHAR(100)
);

CREATE TABLE Phong (
    SoPhong INT PRIMARY KEY,
    LoaiPhong VARCHAR(50),
    DonGia DECIMAL(10, 2),
    SoNguoiToiDa INT
);

CREATE TABLE KhachDenChoi (
    SoCMT VARCHAR(12) PRIMARY KEY,
    TenKhach VARCHAR(100),
    NgaySinh DATE,
    MaSV VARCHAR(10),
    NgayDen DATE,
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);

CREATE TABLE DichVu (
    MaDV VARCHAR(10) PRIMARY KEY,
    TenDV VARCHAR(100),
    DonGia DECIMAL(10, 2)
);

CREATE TABLE SuDungDichVu (
    MaSV VARCHAR(10),
    MaDV VARCHAR(10),
    ThoiGianSuDung DATE,
    SoLuong INT,
    PRIMARY KEY (MaSV, MaDV, ThoiGianSuDung),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV)
);

CREATE TABLE GuiXeThang (
    MaSV VARCHAR(10),
    BienSoXe VARCHAR(10),
    ThangGui DATE,
    PRIMARY KEY (MaSV, BienSoXe, ThangGui),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);

-- Cập nhật bảng GuiLayXe để bao gồm cột ThangGui
CREATE TABLE GuiLayXe (
    MaSV VARCHAR(10),
    BienSoXe VARCHAR(10),
    ThangGui DATE,
    ThoiGianGui DATETIME,
    ThoiGianLay DATETIME,
    SoTienPhatSinh DECIMAL(10, 2),
    PRIMARY KEY (MaSV, BienSoXe, ThangGui, ThoiGianGui),
    FOREIGN KEY (MaSV, BienSoXe, ThangGui) REFERENCES GuiXeThang(MaSV, BienSoXe, ThangGui)
);

INSERT INTO SinhVien (MaSV, SoCMT, NgaySinh, Lop, QueQuan) VALUES
('SV001', '123456789012', '2000-01-01', 'K12A', 'Hà Nội'),
('SV002', '234567890123', '2001-02-02', 'K12B', 'Hải Phòng'),
('SV003', '345678901234', '2002-03-03', 'K12C', 'Đà Nẵng'),
('SV004', '456789012345', '2003-04-04', 'K12D', 'Cần Thơ'),
('SV005', '567890123456', '2004-05-05', 'K12E', 'Nha Trang');

INSERT INTO Phong (SoPhong, LoaiPhong, DonGia, SoNguoiToiDa) VALUES
(101, 'Phòng Đơn', 500000.00, 1),
(102, 'Phòng Đôi', 1000000.00, 2),
(103, 'Phòng Gia Đình', 1500000.00, 4),
(104, 'Phòng VIP', 2500000.00, 2),
(105, 'Phòng Nghỉ', 300000.00, 1);

INSERT INTO KhachDenChoi (SoCMT, TenKhach, NgaySinh, MaSV, NgayDen) VALUES
('123456789012', 'Nguyễn Văn A', '1995-01-01', 'SV001', '2024-09-01'),
('234567890123', 'Trần Thị B', '1996-02-02', 'SV002', '2024-09-05'),
('345678901234', 'Lê Văn C', '1997-03-03', 'SV003', '2024-09-10'),
('456789012345', 'Phạm Thị D', '1998-04-04', 'SV004', '2024-09-15'),
('567890123456', 'Nguyễn Văn E', '1999-05-05', 'SV005', '2024-09-20');

INSERT INTO DichVu (MaDV, TenDV, DonGia) VALUES
('DV001', 'Giặt ủi', 20000.00),
('DV002', 'Đưa đón sân bay', 300000.00),
('DV003', 'Đặt tour', 500000.00),
('DV004', 'Massage', 150000.00),
('DV005', 'Bữa sáng', 50000.00);

INSERT INTO SuDungDichVu (MaSV, MaDV, ThoiGianSuDung, SoLuong) VALUES
('SV001', 'DV001', '2024-09-02', 2),
('SV002', 'DV002', '2024-09-06', 1),
('SV003', 'DV003', '2024-09-11', 3),
('SV004', 'DV004', '2024-09-16', 1),
('SV005', 'DV005', '2024-09-21', 2);

INSERT INTO GuiXeThang (MaSV, BienSoXe, ThangGui) VALUES
('SV001', '29A-12345', '2024-09-01'),
('SV002', '29B-54321', '2024-09-02'),
('SV003', '29C-13579', '2024-09-03'),
('SV004', '29D-24680', '2024-09-04'),
('SV005', '29E-98765', '2024-09-05');

INSERT INTO GuiLayXe (MaSV, BienSoXe, ThangGui, ThoiGianGui, ThoiGianLay, SoTienPhatSinh) VALUES
('SV001', '29A-12345', '2024-09-01', '2024-09-01 08:00:00', '2024-09-01 18:00:00', 0.00),
('SV002', '29B-54321', '2024-09-02', '2024-09-02 09:00:00', '2024-09-02 17:00:00', 0.00),
('SV003', '29C-13579', '2024-09-03', '2024-09-03 10:00:00', '2024-09-03 19:00:00', 0.00),
('SV004', '29D-24680', '2024-09-04', '2024-09-04 11:00:00', '2024-09-04 20:00:00', 0.00),
('SV005', '29E-98765', '2024-09-05', '2024-09-05 12:00:00', '2024-09-05 21:00:00', 0.00);

select * from SinhVien;
select * from Phong;
select * from KhachDenChoi;
select * from DichVu;
select * from SuDungDichVu;
select * from GuiXeThang;
select * from GuiLayXe;

-- SELECT 
--     SV.MaSV, SV.Lop, SUM(DV.DonGia * SDV.SoLuong) AS TongTienDichVu, P.DonGia AS TienPhong,
--     (SUM(DV.DonGia * SDV.SoLuong) + P.DonGia) AS TongTien
-- FROM 
--     SinhVien SV
-- JOIN 
--     SuDungDichVu SDV ON SV.MaSV = SDV.MaSV
-- JOIN 
--     DichVu DV ON SDV.MaDV = DV.MaDV
-- JOIN 
--     Phong P ON SV.MaSV = P.SoPhong
-- WHERE 
--     MONTH(SDV.ThoiGianSuDung) = MONTH(CURDATE())
-- GROUP BY 
--     SV.MaSV;

-- 	SELECT 
--     SV.MaSV, DV.TenDV, SUM(DV.DonGia * SDV.SoLuong) AS TongTienDichVu
-- FROM 
--     SinhVien SV
-- JOIN 
--     SuDungDichVu SDV ON SV.MaSV = SDV.MaSV
-- JOIN 
--     DichVu DV ON SDV.MaDV = DV.MaDV
-- WHERE 
--     SDV.ThoiGianSuDung BETWEEN '2023-09-01' AND '2023-09-30'
-- GROUP BY 
--     SV.MaSV, DV.TenDV;

-- 	SELECT 
--     SV.MaSV, KDC.TenKhach, COUNT(*) AS SoLanDen
-- FROM 
--     SinhVien SV
-- JOIN 
--     KhachDenChoi KDC ON SV.MaSV = KDC.MaSV
-- WHERE 
--     MONTH(KDC.NgayDen) = MONTH(CURDATE())
-- GROUP BY 
--     SV.MaSV, KDC.SoCMT;

-- 	SELECT 
--     DV.TenDV, SUM(DV.DonGia * SDV.SoLuong) AS DoanhThu
-- FROM 
--     DichVu DV
-- JOIN 
--     SuDungDichVu SDV ON DV.MaDV = SDV.MaDV
-- WHERE 
--     MONTH(SDV.ThoiGianSuDung) = MONTH(CURDATE())
-- GROUP BY 
--     DV.MaDV;
