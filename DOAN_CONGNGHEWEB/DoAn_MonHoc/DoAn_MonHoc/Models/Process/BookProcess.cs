using DoAn_MonHoc.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_MonHoc.Models.Process
{
    public class BookProcess
    {
        //Khởi tạo biến dữ liệu : db
        NHASACHEntities1 db = null;

        //constructor :  khởi tạo đối tượng
        public BookProcess()
        {
            db = new NHASACHEntities1();
        }

        /// <summary>
        /// lay 8 cuon sach moi
        /// </summary>
        /// <param name="count">int</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> NewDateBook()
        {
            var a = db.THONGTINSACHes.Take(8).OrderBy(x => x.MaLoai).ToList();
          
            foreach(var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if(x == null || x<= 0 )
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
        }

        public double? GiaSach(int masach)
        {
            THONGTINSACH sach = db.THONGTINSACHes.Single(s => s.MaSach == masach);
            var x = (from s in db.SALEs
                    join sps in db.SPSALEs on s.MASL equals sps.MASL
                    where sps.MaSach == masach && (DateTime.Now > s.NGAYBATDAU && DateTime.Now < s.NGAYKETTHUC)
                    select sps.GIAMGIA).SingleOrDefault();
           if (x==null || x<=0)
               return sach.GiaSach;
           else
           {
               return sach.GiaSach-((double)x * sach.GiaSach);
           }          
        }

        /// <summary>
        /// lay 4  cuon sach ban chay
        /// </summary>
        /// <param name="count">int</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> TakeBook()
        {
            var a = db.THONGTINSACHes.Take(4).OrderByDescending(x => x.MaSach).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
        }

        public List<ProductInSale> getSaleBook()
        {
            //var spsale = (from sach in db.THONGTINSACHes join sale in db.SPSALEs on sach.MaSach equals sale.MaSach where sach.MaSach == sale.MaSach select new { sach.MaSach, sach.MaLoai, sach.MaTG, sach.MaNXB, sach.TenSach, sach.GiaSach, sach.MoTa, sach.HinhAnh, sale.GIAMGIA, sach.SLTon }).ToList();
            ////return db.THONGTINSACHes.OrderByDescending(x => x.MaSach).ToList();
            var x = (from s in db.SPSALEs
                    join sps in db.SALEs on s.MASL equals sps.MASL
                    join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                    where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC
                    select new ProductInSale
                    {
                        THONGTINSACH=tts,
                        GIAMGIA=(float)s.GIAMGIA
                    }).ToList();
            return x;
        }
        /// <summary>
        /// lay 4  cuon sach lien quan toi ma loai duoc truyen vao
        /// </summary>
        /// <param name="count">int</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> SachLienQuan(int LoaiSach)
        {
            var a = db.THONGTINSACHes.Where(x => x.MaLoai == LoaiSach).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
         

        }
        /// <summary>
        /// hàm xuất danh sách thể loại
        /// </summary>
        /// <returns></returns>
        public List<LOAISACH> ListLoaiSach()
        {

            return db.LOAISACHes.OrderBy(x => x.MaLoai).ToList();
        }
        /// <summary>
        /// hàm xuất danh sách NXB
        /// </summary>
        /// <returns></returns>
        public List<NHAXUATBAN> ListNXB()
        {
            return db.NHAXUATBANs.OrderBy(x => x.MaNXB).ToList();
        }
        /// <summary>
        /// Xem tất cả cuốn sách
        /// </summary>
        /// <returns>List</returns>
        public List<THONGTINSACH> ShowAllBook()
        {
            var a = db.THONGTINSACHes.OrderByDescending(x => x.MaSach).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
        
        }
        /// <summary>
        /// hàm lấy mã thể loại
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>TheLoai</returns>
        public LOAISACH LaymaloaiCD(int maCD)
        {
            return db.LOAISACHes.Find(maCD);
        }
        /// <summary>
        /// lọc sách theo chủ đề
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> SachtheoCD(int maCD)
        {
                 
             
            var a = db.THONGTINSACHes.Where(x => x.MaLoai == maCD).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;

        }
        /// <summary>
        /// hàm lấy mã thể loại
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>TheLoai</returns>
        public NHAXUATBAN LaymaloaiNXB(int maNXB)
        {
            return db.NHAXUATBANs.Find(maNXB);
        }
        /// <summary>
        /// lọc sách theo chủ đề
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> SachtheoNXB(int maNXB)
        {
            var a = db.THONGTINSACHes.Where(x => x.MaNXB == maNXB).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
            
        }
        /// <summary>
        /// hàm tìm kiếm tên sách
        /// </summary>
        /// <param name="key">string</param>
        /// <returns>List</returns>
        public List<THONGTINSACH> Search(string txt_Search)
        {
            var a = db.THONGTINSACHes.Where(x => x.TenSach.Contains(txt_Search)).OrderBy(x => x.TenSach).ToList();

            foreach (var item in a)
            {
                var x = (from s in db.SPSALEs
                         join sps in db.SALEs on s.MASL equals sps.MASL
                         join tts in db.THONGTINSACHes on s.MaSach equals tts.MaSach
                         where DateTime.Now > sps.NGAYBATDAU && DateTime.Now < sps.NGAYKETTHUC && s.MaSach == item.MaSach
                         select s.GIAMGIA).FirstOrDefault();
                if (x == null || x <= 0)
                {
                    item.GiamGia = 0;
                }
                else
                {
                    item.GiamGia = x;
                }
            }
            return a;
        }

        /// <summary>
        /// hàm lấy mã sách
        /// </summary>
        /// <param name="id">int</param>
        /// <returns>Sach</returns>
        public THONGTINSACH GetIdBook(int id)
        {
            return db.THONGTINSACHes.Find(id);
        }

     
    }
}