//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAn_MonHoc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PHIEUGIAOHANG
    {
        public int MaGH { get; set; }
        public int MaPhieuDH { get; set; }
        public string TenKH { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
    
        public virtual PHIEUDATHANG PHIEUDATHANG { get; set; }
    }
}
