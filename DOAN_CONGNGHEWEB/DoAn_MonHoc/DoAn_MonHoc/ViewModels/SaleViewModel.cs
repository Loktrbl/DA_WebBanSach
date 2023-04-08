using DoAn_MonHoc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn_MonHoc.ViewModels
{
    public class SaleViewModel
    {
        public int MaSach { get; set; }
        public string TenSanPham { get; set; }
        public string HinhAnh { get; set; }

        public float GiamGia { get; set; }
        public double? Gia { get; set; }
        public int? SoLuong { get; set; }
        public int maSL { get; set; }
      
        //public double? iThanhTien
        //{
        //    get
        //    {
        //        if (sach.GiamGia <= 0)
        //        {
        //            return iSoLuong * sach.GiaSach;
        //        }
        //        else
        //        {
        //            return iSoLuong * (sach.GiaSach - (sach.GiaSach * sach.GiamGia));
        //        }
        //    }
        //}
    }
    public class ProductInSale
    {
        public THONGTINSACH THONGTINSACH { get; set; }
        public float GIAMGIA { get; set; }
    }
}