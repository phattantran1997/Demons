create database BTTH;
use BTTH;
create table KHACHHANG
(
	MAKH CHAR(4) primary key,
	HOTEN NVARCHAR(40),
	DCHI NVARCHAR(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	DOANHSO money,
	NGDK smalldatetime
)

create table NHANVIEN
(
	MANV CHAR(4) PRIMARY KEY,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20), 
	NGVL smalldatetime
)

create table SANPHAM
(
	MASP CHAR(4) PRIMARY KEY,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY
)
create table HOADON
(
	SOHD INT PRIMARY KEY,
	NGHD smalldatetime,
	MAKH CHAR(4) foreign key(MAKH) references KHACHHANG(MAKH),
	MANV CHAR(4) foreign key(MANV) references NHANVIEN(MANV),
	TRIGIA money
)

create table CTHD
(
	SOHD INT foreign key references HOADON(SOHD),
	--MASP CHAR(4) foreign key(MASP) references SANPHAM(MASP),
	MASP CHAR(4),
	SL int
	constraint PK_CTHD primary key(SOHD, MASP)
)
select *from SANPHAM;
alter table SANPHAM add GHICHU varchar(20);
alter table KHACHHANG add LOAIKH tinyint;
alter table SANPHAM alter column GHICHU varchar(100);
alter table SANPHAM drop column TENSP;
alter table SANPHAM add TENSP varchar(40)not null;
alter table SANPHAM alter column TENSP varchar(40) not null;
alter table KHACHHANG alter column LOAIKH varchar(10) not NULL;
alter table KHACHHANG ADD CONSTRAINT LOAIKH CHECK(LOAIKH IN('vang lai',
'thuong xuyen', 'vip','beo','dom'));
alter table SANPHAM ADD CONSTRAINT DVT CHECK(DVT IN('cay','hop', 'cai', 'quyen',
'chuc'));
alter table SANPHAM ADD CONSTRAINT GIA CHECK(GIA>500);
alter table CTHD ADD CONSTRAINT SL CHECK(SL>1);
alter table KHACHHANG add constraint NGDK check(year(NGDK)> year(NGSINH));
--nếu cột đã có trong table thì khi add thêm vào phải là tên khác
alter table NHANVIEN alter column NGVL datetime;
insert into NHANVIEN values('nv01', 'nguyen nhu nhut', '0932185223','1997-09-07')
delete from NHANVIEN where MANV='nv01';
select *from NHANVIEN;
drop database BTTH;
drop table NHANVIEN;
select * into sanpham1 from SANPHAM;-- tạo thêm 1 bảng copy của bảng SanPham
select *from sanpham1;