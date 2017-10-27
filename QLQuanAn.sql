Use master
GO
If DB_ID('QLQuanAn') IS NOT NULL
Begin;
	Drop Database QLQuanAn;
End;
GO
Create Database QLQuanAn
Go
Use QLQuanAn
Go

CREATE TABLE DANHMUC
(
	MADM CHAR (10) NOT NULL,
	TENDM NVARCHAR (20),
	GHICHU NVARCHAR (50),
	PRIMARY KEY (MADM)
)

CREATE TABLE MONAN
(
	MAMA CHAR (10) NOT NULL,
	TENMA NVARCHAR (20),
	MADM CHAR (10),
	DONVI NCHAR (10),
	GIABAN INT,
	GIAVON INT,
	PRIMARY KEY (MAMA)
)

CREATE TABLE CHINHANH
(
	MACN CHAR (10) NOT NULL,
	TENCN NVARCHAR (30),
	MABAN CHAR (10),
	MADM CHAR (10),
	MAMA CHAR (10),
	DIACHI NVARCHAR (100),
	PRIMARY KEY (MACN)
)

CREATE TABLE BAN
(
	MABAN CHAR (10) NOT NULL,
	SOLUONG INT,
	MAKH CHAR (10),
	THOIGIANDAT DATE,
	TINHTRANG bit,
	MACN CHAR (10),
	PRIMARY KEY (MABAN)
)

CREATE TABLE KHACHHANG
(
	MAKH CHAR (10) NOT NULL,
	TENKH NVARCHAR (20),
	SODIENTHOAI INT,
	DIACHI NVARCHAR (50),
	GHICHU NVARCHAR (50),
	PRIMARY KEY (MAKH)
)

CREATE TABLE NHANVIEN
(
	MANV CHAR (10) NOT NULL,
	TENNV NVARCHAR (20),
	SODIENTHOAI INT,
	DIACHI NVARCHAR (50),
	CHUCVU NVARCHAR (50),
	GHICHU NVARCHAR (20),
	PRIMARY KEY (MANV)
)

CREATE TABLE DONHANG
(
	MADH CHAR (10) NOT NULL,
	LOAIDH NVARCHAR (20),
	MAKH CHAR (10),
	MANV CHAR (10),
	NGAYTAO DATE,
	DONGIA INT,
	TRANGTHAI NCHAR (20),
	PRIMARY KEY (MADH)
)

CREATE TABLE CHITIETDONHANG
(
	MADH CHAR (10) NOT NULL,
	MACN CHAR (10) NOT NULL,
	MAKH CHAR (10) NOT NULL,
	MANV CHAR (10) NOT NULL,
	MACP CHAR (10) NOT NULL,
	NGAYTAO DATE,
	DONGIA INT,
	TRANGTHAI NCHAR (20),
	PRIMARY KEY (MADH, MACN, MAKH, MANV, MACP)
)

CREATE TABLE CHIPHI
(
	MACP CHAR (10) NOT NULL,
	NGAYTAO DATE,
	LOAI NCHAR (10),
	MANV CHAR (10),
	DONGIA INT,
	GHICHU NVARCHAR (20),
	PRIMARY KEY (MACP)
)

CREATE TABLE TAIKHOAN
(
	USERNAME NCHAR (20) NOT NULL,
	PASSWORDS NCHAR (20) NOT NULL,
	MANV CHAR (10),
	CHUCVU NVARCHAR (10),
	NGAYTAO DATE,
	NGAYKETTHUC DATE,
	GHICHU NVARCHAR (20),
	PRIMARY KEY (USERNAME, PASSWORDS)
)

CREATE TABLE BAOCAO
(
	MABAOCAO CHAR (10) NOT NULL,
	MANV CHAR (10),
	MACN CHAR (10),
	MAKH CHAR (10),
	DOANHTHU INT,
	TUNGAY DATE,
	DENNGAY DATE,
	PRIMARY KEY (MABAOCAO)
)

ALTER TABLE MONAN 
ADD CONSTRAINT FK_MONAN_DANHMUC
FOREIGN KEY(MADM) REFERENCES DANHMUC(MADM)

ALTER TABLE CHINHANH 
ADD CONSTRAINT FK_CHINHANH_DANHMUC
FOREIGN KEY(MADM) REFERENCES DANHMUC(MADM)

ALTER TABLE CHINHANH 
ADD CONSTRAINT FK_CHINHANH_MONAN
FOREIGN KEY(MAMA) REFERENCES MONAN(MAMA)

ALTER TABLE CHINHANH 
ADD CONSTRAINT FK_CHINHANH_BAN
FOREIGN KEY(MABAN) REFERENCES BAN(MABAN)

ALTER TABLE BAN 
ADD CONSTRAINT FK_BAN_KHACHHANG
FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE BAN 
ADD CONSTRAINT FK_BAN_CHINHANH
FOREIGN KEY(MACN) REFERENCES CHINHANH(MACN)

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_DONHANG
FOREIGN KEY(MADH) REFERENCES DONHANG(MADH)

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_CHINHANH
FOREIGN KEY(MACN) REFERENCES CHINHANH(MACN)

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_KHACHHANG
FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_NHANVIEN
FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE CHITIETDONHANG
ADD CONSTRAINT FK_CHITIETDONHANG_CHIPHI
FOREIGN KEY(MACP) REFERENCES CHIPHI(MACP)

ALTER TABLE CHIPHI
ADD CONSTRAINT FK_CHIPHI_NHANVIEN
FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE TAIKHOAN
ADD CONSTRAINT FK_TAIKHOAN_NHANVIEN
FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_CHINHANH
FOREIGN KEY(MACN) REFERENCES CHINHANH(MACN)

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_KHACHHANG
FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE BAOCAO
ADD CONSTRAINT FK_BAOCAO_NHANVIEN
FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

insert into DANHMUC values('DM01', 'Thịt', 'Bao gồm các món thịt như: bò, gà, heo,...')
insert into DANHMUC values('DM02', 'Bún-phở', 'Bao gồm các món bún như: bún bò, bún chả,...')
insert into DANHMUC values('DM03', 'Hải sản', 'Bao gồm các món hải sản như: tôm hùm, cá thu,...')
insert into DANHMUC values('DM04', 'Tráng miệng', 'Bao gồm các món tráng miệng như: rau câu, ổi,...')
insert into DANHMUC values('DM05', 'Thức uống', 'Bao gồm các món thức uống như: coca, pepsi,...')

insert into MONAN values('MA01', 'Bún đậu mắm tôm', 'Bún-phở', 100, 'bát', 25000, 20000)
insert into MONAN values('MA02', 'Bún bò Huế', 'Bún-phở', 200, 'bát', 30000, 20000)
insert into MONAN values('MA03', 'Cá thu hấp gừng', 'Hải sản', 50, 'dĩa', 50000, 40000)

insert into CHINHANH values('CN01', 'Nguyễn Văn Cừ', 'B01', 'DM01', 'MA01', '227 Nguyễn Văn Cừ Quận 5')
insert into CHINHANH values('CN01', 'Nguyễn Văn Cừ', 'B02', 'DM02', 'MA02', '227 Nguyễn Văn Cừ Quận 5')
insert into CHINHANH values('CN02', 'Võ Thị Sáu', 'B01', 'DM01', 'MA01', '150 Võ Thị Sáu Quận 3')
insert into CHINHANH values('CN02', 'Võ Thị Sáu', 'B02', 'DM02', 'MA02', '150 Võ Thị Sáu Quận 3')

insert into BAN values('B01', 4, 'KH01', '20171010', 1, 'CN01')
insert into BAN values('B02', 10, 'KH02', '20171111', 0, 'CN01')
insert into BAN values('B03', 8, 'KH03', '20171212', 0, 'CN02')
insert into BAN values('B04', 10, 'KH03', '20170101', 1, 'CN02')

insert into KHACHHANG values('KH01', 'Bùi Đăng Khoa', 0123456, '200 Đinh Tiên Hoàng', 'vv')
insert into KHACHHANG values('KH02', 'Trần Đình Hoàng', 1234567, '17/28 Lý Thường Kiệt', 'vv')
insert into KHACHHANG values('KH03', 'Trần Đăng Khoa', 4444444, '50A Trần Hưng Đạo', 'vv')

insert into NHANVIEN values('NV01', 'Khoa', 111111, '100 Đinh Tiên Hoàng', 'Nhân viên bán hàng', 'Có thành tích tốt trong công việc')
insert into NHANVIEN values('NV02', 'Hoàng', 222222, '20 Lý Thường Kiệt', 'Nhân viên bán hàng', 'Có cố gắng trong công việc')
insert into NHANVIEN values('NV03', 'Hùng', 333333, '95 Trần Hưng Đạo', 'Nhân viên tổng đài', 'Cần lấy ý kiến của đồng nghiệp')

insert into DONHANG values('DH01', 'Tại chỗ', 'KH01', 'NV03', '20171010', 100000, 'Đã thanh toán')
insert into DONHANG values('DH02', 'Mang về', 'KH02', 'NV03', '20171111', 200000, 'Đã thanh toán')
insert into DONHANG values('DH01', 'Đặt hàng', 'KH03', 'NV02', '20171212', 150000, 'Đã thanh toán')

insert into CHITIETDONHANG values('DH01', 'CN01', 'KH01', 'NV01', 'CP01', '20171010', 100000, 'Đã thanh toán')
insert into CHITIETDONHANG values('DH02', 'CN02', 'KH02', 'NV02', 'CP02', '20171111', 200000, 'Đã thanh toán')

insert into CHIPHI values('CP01', '20171010', 'Tại chỗ', 'NV01', 100000, 'Đã thanh toán')
insert into CHIPHI values('CP02', '20171111', 'Mang về', 'NV02', 200000, 'Đã thanh toán')

insert into TAIKHOAN values('abc', 'a000', 'NV01', 'Nhân viên bán hàng', '20161010', '20181010', 'vv')
insert into TAIKHOAN values('def', 'b000', 'NV02', 'Nhân viên bán hàng', '20161111', '20181111', 'vv')
insert into TAIKHOAN values('ghi', 'c000', 'NV02', 'Nhân viên tổng đài', '20161212', '20181212', 'vv')

insert into CHIPHI values('CP02', '20171111', 'Mang về', 'NV02', 200000, 'Đã thanh toán')
insert into CHIPHI values('CP02', '20171111', 'Mang về', 'NV02', 200000, 'Đã thanh toán')
insert into CHIPHI values('CP02', '20171111', 'Mang về', 'NV02', 200000, 'Đã thanh toán')

insert into BAOCAO values('BC01', 'NV01', 'CN01', 'KH01', 1500000, '20161010', '20171010')
insert into BAOCAO values('BC02', 'NV02', 'CN02', 'KH02', 1000000, '20161111', '20171111')
insert into BAOCAO values('BC03', 'NV03', 'CN03', 'KH03', 500000, '20161212', '20171212')
go

-- Thêm --
create proc Them
	@MaDM char(10),
	@TenDM nvarchar(50),
	@GC nvarchar(50)
as
begin
	if(exists(select * from DANHMUC D where D.MADM = @MaDM))
		begin
			insert into DANHMUC values(@MaDM, @TenDM, @GC)
		end
	else
		begin
			print N'Không tìm thấy kết quả'
		end
end
exec Them 'DM05', 'Đặc biệt', 'Coming soon'	
go

-- Xóa --
create proc Xoa
	@MaDM char(10)
as
begin
	if(exists(select * from DANHMUC D where D.MADM = @MaDM))
		begin
			delete DANHMUC where MADM = @MaDM
		end
	else
		begin
			print N'Không tìm thấy kết quả'
		end
end
exec Xoa 'DM05'
go

-- Cập nhật --
create proc Capnhat
	@MaDM char(10),
	@TenDM nvarchar(50),
	@GC nvarchar(50)
as
begin
	if(exists(select * from DANHMUC D where D.MADM = @MaDM))
		begin
			update DANHMUC 
			set MADM = @MaDM, TENDM = @TenDM, GHICHU = @GC
		end
	else
		begin
			print N'Không tìm thấy kết quả'
			return 0
		end
end
exec Them 'DM04', 'Đặc biệt', 'Coming soon'	