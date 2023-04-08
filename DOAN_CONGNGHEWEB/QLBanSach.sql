CREATE DATABASE NHASACH
USE NHASACH
drop DATABASE NHASACH
use master
GO
CREATE TABLE NHANVIEN
(
	MaNV INT IDENTITY(1,1) NOT NULL,
	TenNV NVARCHAR(50),
	NgaySinh DATE,
	GioiTinh NVARCHAR(5),
	Email NVARCHAR(100),
	SoDT CHAR(12),
    HinhAnh NCHAR(100),
	TenDN NVARCHAR(50),
	MatKhau NVARCHAR(30),
    CONSTRAINT PK_NHANVIEN PRIMARY KEY CLUSTERED  (MaNV ASC)
)
select * from CT_PHIEUDATHANG
select * from PHIEUDATHANG

select * from CT_PHIEUDATHANG WHERE MaPhieuDH = 1063
CREATE TABLE KHACHHANG
(
	MaKH INT  IDENTITY(1,1) NOT NULL,
	TenKH NVARCHAR(50),
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(50),
	Email NVARCHAR(50),
	NgaySinh DATETIME,
	GioiTinh NVARCHAR(10),
	NgayTao datetime,
	TenDN NVARCHAR(50),
	MatKhau NVARCHAR(30),
	CONSTRAINT PK_KhachHang PRIMARY KEY CLUSTERED  (MaKH  ASC )
)

CREATE TABLE LIENHE(
	MaLH int IDENTITY(1,1) NOT NULL,
	Ho nvarchar(50) NULL,
	Ten nvarchar(50) NULL,
	Email [varchar](100) NULL,
	DienThoai varchar(50) NULL,
	NoiDung nvarchar(500) NULL,
	NgayCapNhat smalldatetime NULL,
	CONSTRAINT PK_LIENHE PRIMARY KEY CLUSTERED  (MaLH ASC )
)

CREATE TABLE LOAISACH
( 
	MaLoai INT IDENTITY(1,1) NOT NULL,
	TenLoai NVARCHAR(50) NULL,
	 CONSTRAINT PK_LoaiSach PRIMARY KEY CLUSTERED  (MaLoai ASC )	
)
GO
CREATE TABLE TACGIA(
	MaTG  INT IDENTITY(1,1) NOT NULL,
	TenTG NVARCHAR(50),
	QueQuan NVARCHAR(250),
	NgaySinh DATETIME,
	NgayMat DATETIME,
	TieuSu NVARCHAR(500) NULL,
	CONSTRAINT PK_TACGIA PRIMARY KEY CLUSTERED  (MaTG  ASC ),
)

CREATE TABLE NHAXUATBAN(
	MaNXB INT IDENTITY(1,1) NOT NULL,
	TenNXB NVARCHAR(50),
	DiaChi NVARCHAR(250),
	DienThoai NVARCHAR(50),
	CONSTRAINT PK_NHAXUATBAN PRIMARY KEY CLUSTERED  (MaNXB ASC ),
)
CREATE TABLE THONGTINSACH
(
	MaSach INT  IDENTITY(1,1) NOT NULL,
	MaLoai  INT,
	MaTG INT,
	MaNXB INT,
	TenSach NVARCHAR(50),
	GiaSach FLOAT,
	MoTa NVARCHAR(500),
	HinhAnh  NVARCHAR(200),
	GiamGia FLOAT,
	SLTon INT,
	CONSTRAINT PK_THONGTINSACH PRIMARY KEY CLUSTERED  (MaSach  ASC ),
	CONSTRAINT FK_THONGTINSACH_LOAISACH FOREIGN KEY (MaLoai) REFERENCES LOAISACH (MaLoai),
	CONSTRAINT FK_THONGTINSACH_TACGIA FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG),
	CONSTRAINT FK_THONGTINSACH_NHAXUATBAN FOREIGN KEY (MaNXB) REFERENCES NHAXUATBAN(MaNXB),
)

update THONGTINSACH set GiamGia 
--==================================Qu?n lí thông tin nh?p sách vào
CREATE TABLE NHACUNGCAP
(
	MaNCC nchar(10) not null,
	TenNCC NVARCHAR(100),
	DiaChi NVARCHAR(250),
	DienThoai INT,
	constraint PK_NHACUNGCAP primary key (MaNCC) 
)
CREATE TABLE PHIEUNHAPHANG
(
	MaPhieuNhapHang nchar(10) not null,
	MaNCC nchar(10),
	MaNV INT ,
	NgayLap_PN date,
	TongSL int,
	TongTien_NH FLOAT,
	constraint PK_PHIEUNHAPHANG primary key (MaPhieuNhapHang),
    constraint FK_PHIEUNHAPHANG_NHANVIEN foreign key(MaNV) references NHANVIEN(MaNV),
     constraint FK_PHIEUNHAPHANGg_NHACUNGCAP foreign key(MaNCC) references NHACUNGCAP(MaNCC)
)
CREATE TABLE CT_PHIEUNHAPHANG
(
	MaSach INT not null,
	MaPhieuNhapHang nchar(10) not null,
	Sluong INT,
	DonGiaNhap FLOAT,
	TongTien FLOAT,
	constraint PK_CT_PHIEUNHAPHANG  primary key (MaSach, MaPhieuNhapHang),
    constraint FK_CT_PHIEUNHAPHANG_PNH foreign key (MaPhieuNhapHang) references PHIEUNHAPHANG(MaPhieuNhapHang),
	constraint FK_CT_PHIEUNHAPHANG_TTS foreign key (MaSach) references THONGTINSACH(MaSach)
)
--///////////////////////PHẦN GIỎ HÀNG
select * from PHIEUDATHANG
select * from CT_PHIEUDATHANG
CREATE TABLE PHIEUDATHANG
(
	MaPhieuDH INT IDENTITY(1,1) NOT NULL,
	MaKH INT,
	NgayDat datetime,
	Tong_SL_Dat INT,
	ThanhTien FLOAT,
	TinhTrang BIT,
	CONSTRAINT PK_PHIEUDATHANG PRIMARY KEY CLUSTERED  (MaPhieuDH  ASC),
    constraint FK_PHIEUDATHANG_KH foreign key(MaKH) references KHACHHANG(MaKH)
)

CREATE TABLE PHIEUGIAOHANG
(
	MaGH INT  IDENTITY(1,1) NOT NULL,
	MaPhieuDH INT NOT NULL,
	TenKH NVARCHAR(50),
	Email NVARCHAR(50),
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(50),
	NgayTao datetime,
	CONSTRAINT PK_PHIEUGIAOHANG PRIMARY KEY CLUSTERED  (MaGH  ASC),
    constraint FK_PHIEUGIAOHANG_PDH foreign key(MaPhieuDH) references PHIEUDATHANG(MaPhieuDH)
)

select * from PHIEUGIAOHANG
select * from KhachHang,PHIEUDATHANG where PHIEUDATHANG.MaKH = KhachHang.MaKH 
CREATE TABLE CT_PHIEUDATHANG
(
	MaPhieuDH INT not null,
	MaSach INT not null ,
	SoLuong INT,
	DonGia FLOAT,
    constraint PK_CT_PHIEUDATHANG primary key (MaPhieuDH ,MaSach),
    constraint FK_CT_PHIEUDH_PDT foreign key(MaPhieuDH) references PHIEUDATHANG(MaPhieuDH),
    constraint FK_CT_PHIEUDH_TTS foreign key(MaSach) references THONGTINSACH(MaSach)
)

CREATE TABLE SALE
(
	MASL INT  IDENTITY(1,1) NOT NULL,
	TENSL NVARCHAR(MAX),
	NGAYBATDAU DATETIME,
	NGAYKETTHUC DATETIME
	constraint PK_SL primary key (MASL)
)
set dateformat dmy
Insert into SALE
values(N'tết','22/1/2023','23/2/2023')
select * from SPSALE
delete from SALE where MASL=1
CREATE TABLE SPSALE
(
	MASPSALE INT IDENTITY(1,1) NOT NULL,
	MASL INT NOT NULL,
	MaSach INT NOT NULL,
	GIAMGIA FLOAT,
	constraint PK_SPSL primary key (MASPSALE),
	constraint FK_SL_SPSL foreign key(MASL) references SALE(MASL),
    constraint  FK_SACH_SPSL foreign key(MaSach) references THONGTINSACH(MaSach)
)
drop table SALE
drop table SPSALE

ALTER TABLE PHIEUDATHANG
ALTER COLUMN TinhTrang INT
---------------NHAP CƠ SỞ DỮ LIỆU
--************BẢNG NHÂN VIÊN 
SET DATEFORMAT DMY
INSERT INTO NHANVIEN VALUES(N'Bui Thi Ai Ly','23/7/2001',N'Nữ',N'AiLy@gmail.com',0356322754,N'NV1.JPG','aily','12345')
INSERT INTO NHANVIEN VALUES(N'Pham Tuan Dat','01/5/2001',N'Nam',N'PhamTuanDat@gmail.com',0355467282,N'NV2.JPG','tuandat','12345')
INSERT INTO NHANVIEN VALUES(N'Tran Cao Tung','12/8/2001',N'Nam',N'TranCaoTung@gmail.com',0355467282,N'NV2.JPG','caotung','12345')
select * from NHANVIEN
--************BẢNG KHÁCH HÀNG
SET DATEFORMAT DMY
INSERT INTO KHACHHANG VALUES(N'Trần Ly',N'Bình Định',0356322754,N'minhly@gmail.com',N'23/7/2001',N'Nam',N'13/10/2020','minhly','12345')
INSERT INTO KHACHHANG VALUES(N'Văn A',N'TP.HCM',0355467282,N'vana@gmail.com',N'01/5/2001',N'Nam',N'12/10/2020','an','12345')
select * from KHACHHANG
--*****************BANG LIEN HE
SET DATEFORMAT DMY
INSERT LIENHE VALUES (N'a', N'a', N'a@gmail.com', N'123456', N'đây là nội dung thứ 2', CAST(N'2016-07-01 00:00:00' AS SmallDateTime))
INSERT LIENHE VALUES (N'b', N'b', N'test@gmail.com', N'1', N'nội dung 3', CAST(N'2016-07-01 00:00:00' AS SmallDateTime))
select * from LIENHE
--************BẢNG LOẠI SÁCH
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Ngoại Văn')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Kinh Tế')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Văn Học Trong Nước')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Văn Học Nước Ngoài')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Thường Thức - Đời Sống')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Thiếu Nhi')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Phát Triển Bản Thân')
INSERT LOAISACH(TenLoai) VALUES (N'Sách Tin Học - Ngoại Ngữ')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Chuyên Ngành')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Giáo Khoa - Giáo Trình')
INSERT LOAISACH(TenLoai) VALUES ( N'Sách Văn Học-Tiều Thuyết')
INSERT LOAISACH(TenLoai) VALUES ( N'Tạp Chí - Văn Phòng Phẩm')
INSERT LOAISACH(TenLoai) VALUES ( N'Tạp Chí - Văn Phòng Phẩm')
select * from LOAISACH
--************BẢNG TÁC GIẢ
GO
SET DATEFORMAT DMY
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Ái vân', N'Hà nội',N'20/10/1983',N'20/10/1993',N'Ái Vân là một ca sĩ nhạc nhẹ được nhiều người biết đến trong thập niên 1970 và 1980 tại Việt Nam qua các bài hát như Triệu bông hồng, Trăng chiều hay Bài ca xây dựng. Từ năm 1990 Ái Vân bắt đầu ở lại Đức và sau đó sang Hoa Kỳ sinh sống và biểu diễn.')
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Mỹ Chi', N'Khánh Hòa', N'8/6/1973',N'1/11/2001',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'David Ebershoff ',N'Amarican', N'19/7/1983',N'23/8/2005',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Đỗ Huân ', N'Bac Son', N'1/10/1988', NULL,NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Phạm Tuấn Sơn ', N'Quang Ninh',N'7/5/1955', NULL,N'Phạm Tuấn Sơn là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn. Ông sinh ngày 7 tháng 5 năm 1955 tại huyện Thăng Bình, Quảng Nam.')
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Lương Đức Thiệp ',N'Lạng Sơn', N'19/7/1963',N'23/8/2018',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Watanabe Dzunichi ', N'Mỹ', N'19/7/1983',N'23/8/2005',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Trần Thị Huyên Thảo ',N'Bến Tre', N'1/12/1989', NULL,NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Tiểu Hồng Hoa ',N'Bình Thuận', NULL, NULL,NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Jo Gang-Soo ', N'China', NULL, NULL,NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Thích Nhất Như ',N'Bình Định', N'4/12/1985',N'23/8/2019',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Trần Hữu Văn', N'Hà Nội', N'24/9/1991',N'23/8/2012',NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'Jojo Moyes ', NULL, NULL, NULL,NULL)
INSERT TACGIA(TenTG,QueQuan,NgaySinh,NgayMat,TieuSu) VALUES ( N'J. K. Rowling ',N'Korean', N'11/7/1973',N'20/8/2005',NULL)
select * from TACGIA
GO
--************BẢNG NHÀ XUẤT BẢN
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Lao động', N'175 Giảng Võ, Q. Đống Đa, Hà Nội', N'04.38515380')
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Thế giới', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Tri thức', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'NXB Phụ Nữ', N'16 Alexandre de Rhodes, Bến Nghé, Quận 1, Hồ Chí Minh', N'08 3829 4459')
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Phương Đông', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Trẻ', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'ArtBook', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'CDIMex', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Hội Nhà Văn', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N'Nxb Khoa học xã hội', NULL, NULL)
INSERT NHAXUATBAN(TenNXB,DiaChi,DienThoai) VALUES ( N' NXB Chính Trị Quốc Gia', NULL, NULL)
SET IDENTITY_INSERT NHAXUATBAN OFF

--*************BẢNG CHI TIẾT SÁCH

SELECT TenSach FROM THONGTINSACH,CT_PHIEUDATHANG where THONGTINSACH.MaSach = CT_PHIEUDATHANG.MaSach
select * from CT_PHIEUDATHANG
select KhachHang.MaKH,KhachHang.TenKH,PHIEUDATHANG.MaPhieuDH from KhachHang,PHIEUDATHANG,CT_PHIEUDATHANG where KhachHang.MaKH = PHIEUDATHANG.MaKH and CT_PHIEUDATHANG.MaPhieuDH = PHIEUDATHANG.MaPhieuDH
select* from THONGTINSACH
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (1, 7, 11, N'Me Before You', 25000, N'THE NEW YORK TIMES NUMBER 1 BESTSELLING NOVEL THAT IS LOVED AROUND THE WORLD, SOON TO BE RELEASED AS A FILM STARRING EMILIA CLARKE AND SAM CLAFLINLou Clark knows lots of things. She knows how many footsteps there are between the bus stop and home. ', N'me-before-you.jpg',0,10)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (3, 2, 2, N'Combo Cứ Bình Tĩnh + Sẽ Có Cách, Đừng Lo', 11300, N' Cứ Bình Tĩnh!Tuần hoàn cuộc sống, có yêu thì sẽ có ghét. Sẽ là bất khả thi nếu khuyên con người đừng ghét bỏ ai. Tôi cũng từng ghét người khác, vì tôi nghĩ rằng họ là tác nhân khiến tôi mất đi điều tôi yêu quý. Nhưng suy cho cùng, ', N'cu-binh-tinh.jpg',0, 5)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (7, 4, 5, N'Mỗi Buổi Sáng, Hãy Tạo Ra Một Điều Gì Đó Mới Mẻ', 9000, N'Từ khi mới sinh ra, bạn đã là người vô cùng sáng tạo.Bạn nhìn thế giới này với một con mắt tò mò, ngạc nhiên đầy phấn khích.Bạn không hề biết sợ, không hề biết lùi bước, bạn luôn đặt mình vào trong những tình huống thử thách cao độ.Bạn ...', N'moi-buoi-sang-hay-tao-ra-mot-dieu-gi-do-moi-me.jpg', 0,8)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (3, 3, 9, N'Ngày Xưa Có Một Chuyện Tình', 11800, N'Ngày xưa có một chuyện tình là một câu chuyện cảm động khi người ta yêu nhau, nỗi khát khao một hạnh phúc êm đềm ấm áp đến thế; hay đơn giản chỉ là chuyện ba người - anh, em, và người ấy…?', N'ngay-xua-co-mot-chuyen-tinh.jpg', 0,12)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (1, 8, 11, N'Harry Potter And The Cursed Child - Parts I & II ', 53000, NULL, N'harrypotter.jpg',0, 4)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (2, 1, 10, N'Nhà Đào Tạo Sành Sỏi', 11200, N'MỌI THỨ BẠN CẦN CHO ĐÀO TẠO & PHÁT TRIỂN“Ngày nay chỉ có một thứ không đổi đó chính là...sự thay đổi.”“Hãy đối mặt với sự thật rằng một nhà lãnh đạo muốn có các nhân viên tốt chỉ có hai sự lựa chọn: hoặc đi thuê hoặc phải đứng ..',  N'nha-dao-tao-sanh-soi.jpg',0, 12)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (2, 1, 9, N'Dám Làm Giàu', 13200, N'Có nhiều con đường khác nhau để trở nên giàu có, nhưng để đi như thế nào để đến được đích của sự giàu có thì đó mới là điều để chúng ta quan tâm. Trong thời đại sống với công nghệ, thì việc làm ra tiền là điều không hề khó, điều quan', N'dam-lam-giau.jpg',0, 7)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES (3, 9,2, N'Việt Nam Thi Ca Luận Và Văn Chương Xã Hội', 54000, N'Với Lương Đức Thiệp, Văn học là sản phẩm và vũ khí của đấu tranh đẳng cấp. Văn chương dùng để gieo rắc những ý tưởng vào ý thức dân chúng. Xung đột đẳng cấp càng gắt gao, đâu cũng phải chịu sức chi phối âm u của quyền lợi đẳng',  N'viet-nam.jpg',0, 4)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 10, 1, 8, N'Chuyên Đề Ôn Tập Và Luyện Thi Hóa Học 12 ', 77000.0000, N'Cuốn sách "Chuyên đề ôn tập và luyện thi hóa học 12" sẽ cung cấp tài liệu tham khảo cần thiết cho các thầy, cô giáo và các em học sinh ôn tập để nâng cao kiến thức chất lượng kỳ thi tốt nghiệp THPT và kỳ thi tuyển sinh Đại học, Cao đẳng, đảm ... Xem chi tiết', N'hoa-hoc-12.jpg',0,34)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon)VALUES ( 4, 9, 1, N'Đèn Không Hắt Bóng', 14800, N'Tinh hoa văn học của nhân loại nào cũng cần được khám phá và tái khám phá. Mỗi tác phẩm lớn là một sự kỳ diệu và mỗi lần ta tìm đến là thực hiện những cuộc phiêu lưu hoan lạc. Đến với tiểu thuyết Đèn Không Hắt Bóng là chúng ta đang bước', N'den-khong-hat-bong.jpg',0,  23)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 9, 1, 4, N'Mộng Đổi Đời ', 41900,N'Khát vọng đổi đời như một hạt giống được gieo mầm, truyền từ đời này sang đời khác.Đôi khi hạt giống nơi đất cằn cũng tự phát triển mập mạp, nhưng phần lớn nhanh chóng bị èo uột giữa chừng bởi những điều kiện khách quan. Vấn đề là ... Xem chi tiết',  N'mong-doi-doi.jpg',0,  22)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 5, 6, 8, N'Combo Chào Con', 12900, N'1. Chào Con! Ba Mẹ Đã Sẵn Sàng!"Chào con! Ba mẹ đã sẵn sàng!" - Cuốn sách không chỉ được viết trên nền tảng khoa học của một bác sĩ mà còn chứa chan tình yêu của một người mẹ.Chắc chắn bạn cũng sẽ cảm nhận được những điểm hay và thực', N'combo-chao-con.jpg',0, 22)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 11, 6, 11, N'Cô Gái Đan Mạch', 95000, N'Cô gái đan mạch là một câu chuyện cảm động về người chuyển giới đầu tiên trên thế giới, một họa sĩ  người đan mạch đã dũng cảm đối diện và tìm về với bản ngã của chính mình. Đây cũng là câu chuyện về lòng vị tha, đức hy sinh trong tình yêu.Tất cả đều được thể hiện bằng một văn phong trong sáng, đẹp đẽ.', N'co-gai-dan-mach.jpg',0, 6)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 6, 4, 9, N'Phát Triển Khả Năng Ngôn Ngữ', 36000, N'Bộ sách Phát Triển Trí Tuệ Của Trẻ Qua Trò Chơi Dán Hình (4-6 tuổi) giúp trẻ phát triển khả năng Sáng tạo, Toán học, Ngôn Ngữ, Tư duy, rèn trí thông minh, luyện tay khéo léo. Sách với 150-300 hình dán + câu chuyện + trò chơi giúp bé chơi mà học.Mời bạn ..', N'phat-trien-kha-nang-ngon-ngu.jpg',0, 16)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 8, 10, 10, N'Luyện Thi Toeic 750 Reading', 87000, N'5 TIẾNG MỖI NGÀY, ĐẠT NGAY 750 ĐIỂM• CUNG CẤP ĐỀ THI VÀ CÂU MẪU PHONG PHÚ, ĐA DẠNG• PHÂN TÍCH CHI TIẾT, HIỆU QUẢ CÁCH LÀM PHẦN 7HIỆU QUẢ TỨC THÌ – TỰ TIN HOÀN THÀNH BÀI THI TOEIC1. Dũng cảm phá bỏ quan niệm ‘lý thuyết là cơ bản’!Dù học thuộc ', N'luyen-thi-toeic.jpg',0, NULL)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES ( 9, 1, 11, N'Tam Tạng Pháp Số', 37400, N'Tam Tạng Pháp Số còn gọi Đại Minh Pháp Số hay Phật Học Từ Điển… là bộ sách giúp người học Phật dễ dàng tra cứu giáo lí Phật đà, phù hợp cho nhiều tầng lớp đối tượng: từ sơ học đến người đã có trình độ cao, do Nhất Như, Đạo ...', N'tam-tang-phap.jpg',0, NULL)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES( 12, 11, 5, N'Lịch Bloc Siêu Đại (20x30)', 20000, N'Lịch Bloc Siêu Đại (20x30) - Việt Nam Quê Hương Tôi', N'bloc-sieu-dai.jpg' ,0,13)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES( 6, 4, 5, N'Đi Qua Hoa Cúc', 56000, N'Cuốn Đi Qua Hoa Cúc là tập truyện dài của Nguyễn Nhật Ánh, mở đầu câu truyện tác giả kể lại tuổi ấu thơ hồn nhiên của nhân vật trong truyện, kết hợp với tả cảnh ở miền quê, những ngôi nhà nằm dọc hai bên đường đá sỏi dọc theo hai bên hàng dâm bụt và cả cây sứ cây bàng tỏa bóng mát, tỏa hương thơm trước sân nhà', N'diquahoacuc.jpg' ,0,12)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES( 7, 7, 8, N'Trên Đường Băng', 78000, N'Trên đường băng là tập hợp những bài viết được ưa thích trên Facebook của Tony Buổi Sáng. Nhưng khác với một tập tản văn thông thường, nội dung các bài được chọn lọc có chủ đích, nhằm chuẩn bị về tinh thần, kiến thức…cho các bạn trẻ vào đời. Sách gồm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.', N'trenduongbang.jpg' ,0,30)
INSERT THONGTINSACH(MaLoai,MaTG,MaNXB,TenSach,GiaSach,MoTa,HinhAnh,GiamGia,SLTon) VALUES( 5, 4,7, N'No Baked', 90000, N'Được biết đến là đơn vị tiên phong trong lĩnh vực xuất bản sách Cookbook cao cấp tại Việt Nam, IloveCookbook đã trở thành cái tên quen thuộc với tất cả những ai đam mê ẩm thực trên toàn quốc.', N'Banhngon.jpg' ,0,19)
--------------------them du lieu bang NHACUNGCAP
INSERT INTO NhaCungCap
VALUES('NCC01', N'Nhà cung cap Binh Duong', N'Di An, Thu Dau 1, Binh Duong',0123684273);
INSERT INTO NhaCungCap
VALUES	('NCC02',N'Nhà cung cap TP.HCM',N'Quan 11, TPHCM',0371231011);
INSERT INTO NhaCungCap
VALUES	('NCC03',N'Nhà cung cap Binh Chanh',N'Quan Binh Chanh, TP.HCM',0232391209);
INSERT INTO NhaCungCap
VALUES	('NCC04',N'Nhà cung cap Hà Noi',N'12 Nguyen Thi Sau, Hà Noi',0823481910);
INSERT INTO NhaCungCap
VALUES	('NCC05',N'Nhà cung cap Ninh Thuan',N'Nguyen Thái Tông,Ninh Thuan',NULL);
INSERT INTO NhaCungCap
VALUES	('NCC06',N'Nhà cung cap Tây Ninh ',N'11 Vo Sáu,Tây Ninh',0234731209);
INSERT INTO NhaCungCap
VALUES('NCC07',N'Nhà cung cap Dong Nai',N'1123 Hoàng Hoa Thám ,Dong Nai',NULL);
---------------------them du lieu b?ng HOA DON NHAP SACH VAO CUA HANG
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAPHANG
VALUES ('NH1','NCC01',1,N'21/9/2020',4,43000);
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAPHANG
VALUES('NH2','NCC02',2,N'21/4/2020',12,69000);
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAPHANG
VALUES	('NH3','NCC03',3,N'11/01/2021',65,77000);
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAPHANG
VALUES	('NH4','NCC01',1,N'26/09/2010',20,54000);
SET DATEFORMAT DMY
INSERT INTO PHIEUNHAPHANG
VALUES	('NH5','NCC05',2,N'13/7/2010',102,102000);
select * from PHIEUNHAPHANG
select * from CT_PHIEUNHAPHANG
INSERT INTO CT_PHIEUNHAPHANG
VALUES(1,'NH1',2,29000,120030);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(15,'NH4',2,15000,301200);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(2,'NH1',4,20000,11000);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(3,'NH2',50,10000,26500);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(4,'NH3',150,14000,31500);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(5,'NH3',10,21000,21000);
INSERT INTO CT_PHIEUNHAPHANG
VALUES(14,'NH5',50,30000,43000);
--******************************THONG TIN NHAP HANG HOA
--******************************PHIEU DAT HANG

INSERT CT_PHIEUDATHANG(MaPhieuDH,MaSach,SoLuong,DonGia) VALUES (2,14, 2, 47500)
INSERT CT_PHIEUDATHANG(MaPhieuDH,MaSach,SoLuong,DonGia) VALUES (1,16, 1, 60000)
INSERT CT_PHIEUDATHANG(MaPhieuDH,MaSach,SoLuong,DonGia) VALUES (2,16, 3, 60000)

GO
SET DATEFORMAT DMY
INSERT PHIEUDATHANG(MaKH,NgayDat,Tong_SL_Dat,ThanhTien,TinhTrang) VALUES (1,N'12/3/2020', 1,60000, 1)
INSERT PHIEUDATHANG(MaKH,NgayDat,Tong_SL_Dat,ThanhTien,TinhTrang) VALUES (2,N'10/9/2020', 5,540000,1)

UPDATE THONGTINSACH
SET GiamGia=0.1
WHERE MaSach=5
select * from PHIEUDATHANG
select * from CT_PHIEUDATHANG
select * from KHACHHANG
select * FROM THONGTINSACH
select * from NHACUNGCAP
order by MaNCC
SELECT * FROM NhanVien
select * from PHIEUDATHANG
update PHIEUDATHANG SET TinhTrang = 2 WHERE MaPhieuDH=1074
select * from CT_PHIEUNHAPHANG 

select * from NhanVien 

no baked sl 16

ptnn sl 15

use NHASACH
select THONGTINSACH.*,SPSALE.GIAMGIA from sale,SPSALE,THONGTINSACH
where SALE.MASL=SPSALE.MASL and SPSALE.MaSach=THONGTINSACH.MaSach and
getdate() between cast(NGAYBATDAU as date) and cast(NGAYKETTHUC as date)


select GIAMGIA
from SALE,SPSALE
where sale.MASL=SPSALE.MASL and SPSALE.MaSach=5
and GETDATE() between CAST(NGAYBATDAU as date) and CAST(NGAYKETTHUC as date)