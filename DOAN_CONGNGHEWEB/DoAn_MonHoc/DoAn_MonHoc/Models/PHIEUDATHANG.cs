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
    
    public partial class PHIEUDATHANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PHIEUDATHANG()
        {
            this.CT_PHIEUDATHANG = new HashSet<CT_PHIEUDATHANG>();
            this.PHIEUGIAOHANGs = new HashSet<PHIEUGIAOHANG>();
        }
    
        public int MaPhieuDH { get; set; }
        public Nullable<int> MaKH { get; set; }
        public Nullable<System.DateTime> NgayDat { get; set; }
        public Nullable<int> Tong_SL_Dat { get; set; }
        public Nullable<double> ThanhTien { get; set; }
        public Nullable<int> TinhTrang { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_PHIEUDATHANG> CT_PHIEUDATHANG { get; set; }
        public virtual KHACHHANG KHACHHANG { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PHIEUGIAOHANG> PHIEUGIAOHANGs { get; set; }
    }
}