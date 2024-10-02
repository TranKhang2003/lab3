﻿create database QLThucTap;
go
use QLThucTap;


create table SinhVien(
	Mssv nvarchar(10) primary key,
	Hoten nvarchar(100),
	Quequan nvarchar(100),
	Ngaysinh date,
	Hocluc float check (Hocluc between 0 and 10)
)

create table DeTai(
	Msdt nvarchar(10) primary key,
	Tendetai nvarchar(100),
	Chunhiemdetai nvarchar(100),
	Kinhphi decimal(16,2)
)

create table SinhVien_DeTai(
	Mssv nvarchar(10),
	Msdt nvarchar(10),
	primary key(Mssv,Msdt),
	Noithuctap nvarchar(100),
	Quangduong int check( Quangduong > 0),
	Ketqua float check (Ketqua between 0 and 10)
	constraint SinhVien_DeTai_Mssv_SinhVien foreign key (Mssv) references SinhVien(Mssv),
	constraint SinhVien_DeTai_Mssv_Detai foreign key (Msdt) references DeTai(Msdt)
)

CREATE FUNCTION AddStudent
(
    @MaSV INT,
    @HoTen NVARCHAR(100),
    @QueQuan NVARCHAR(100),
    @NgaySinh DATE,
    @HocLuc NVARCHAR(50)
)
RETURNS INT
AS
BEGIN
    -- Thêm sinh viên vào bảng Sinhvien
    INSERT INTO Sinhvien (MaSV, HoTen, QueQuan, NgaySinh, HocLuc)
    VALUES (@MaSV, @HoTen, @QueQuan, @NgaySinh, @HocLuc);

    RETURN @@ROWCOUNT; -- Trả về số hàng bị ảnh hưởng (1 nếu thành công)
END;

SELECT dbo.AddStudent(1, 'Nguyen Van A', 'Hanoi', '2000-01-01', 'Tot');



INSERT INTO DeTai VALUES
('DT01', N'Quản lý quán ăn', N'Nguyễn Thễ Hữu', 10000000),
('DT02', N'Quản lý khách sạn', N'Trần Trung Hiếu', 200000000),
('DT03', N'Quản lý sân bóng đá mini', N'Nguyễn Công Tâm', 300000000),
('DT04', N'Quản lý shop hoa tươi', N'Đặng Đức Trung', 150000000),
('DT05', N'Quản lý cửa hàng điện thoại', N'Trịnh Thanh Duy', 2000000000);

INSERT INTO SinhVien  VALUES
('SV01', N'Trần Thanh Trâm', N'Sài Gòn', '1998-03-23', 8.5),
('SV02', N'Nguyễn Hồng Linh', N'Thanh Hóa', '2000-01-20', 9.0),
('SV03', N'Trần Thanh Phước', N'Tiền Giang', '2001-07-12', 7.5),
('SV04', N'Nguyễn Minh Hải', N'Nghệ An', '1993-02-28', 7.0),
('SV05', N'Trần Thị Hồng Nhung', N'Kiên Giang', '1998-07-15', 9.0);

INSERT INTO SinhVien_DeTai VALUES
('SV01', 'DT01', N'Tiền Giang', 70, 8.0),
('SV02', 'DT01', N'Bình Dương', 50, 7.0),
('SV03', 'DT02', N'Vũng Tàu', 150, 9.5),
('SV03', 'DT03', N'Long An', 50, 8.5),
('SV04', 'DT03', N'Nha Trang', 500, 10.0);