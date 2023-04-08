using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_MonHoc.Models
{
    public class GioHang
    {
        NHASACHEntities1 db = new NHASACHEntities1();
       
        public THONGTINSACH sach { get; set; }
        public int iSoLuong{ get; set; }
        public float iGiamGia
        {
            get
            {
                var x = (from s in db.SALEs
                         join sps in db.SPSALEs on s.MASL equals sps.MASL
                         where sps.MaSach == sach.MaSach && (DateTime.Now > s.NGAYBATDAU && DateTime.Now < s.NGAYKETTHUC)
                         select sps.GIAMGIA).SingleOrDefault();
                if(x==null || x<=0)
                {
                    return 0;
                }
                return (float)x;
            }
        }
        public double? iThanhTien
        {
            get {
                
                if (iGiamGia == null || iGiamGia <= 0)
                {
                    return iSoLuong * sach.GiaSach; 
                }
                else
                {
                    return iSoLuong * (sach.GiaSach-(sach.GiaSach*iGiamGia)); 
                }
            }
        }
    }
}