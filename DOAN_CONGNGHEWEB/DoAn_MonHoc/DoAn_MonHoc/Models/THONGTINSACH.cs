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
    
    public partial class THONGTINSACH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public THONGTINSACH()
        {
            this.CT_PHIEUDATHANG = new HashSet<CT_PHIEUDATHANG>();
            this.CT_PHIEUNHAPHANG = new HashSet<CT_PHIEUNHAPHANG>();
            this.SPSALEs = new HashSet<SPSALE>();
        }
    
        public int MaSach { get; set; }
        public Nullable<int> MaLoai { get; set; }
        public Nullable<int> MaTG { get; set; }
        public Nullable<int> MaNXB { get; set; }
        public string TenSach { get; set; }
        public Nullable<double> GiaSach { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; }
        public Nullable<double> GiamGia { get; set; }
        public Nullable<int> SLTon { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_PHIEUDATHANG> CT_PHIEUDATHANG { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_PHIEUNHAPHANG> CT_PHIEUNHAPHANG { get; set; }
        public virtual LOAISACH LOAISACH { get; set; }
        public virtual NHAXUATBAN NHAXUATBAN { get; set; }
        public virtual TACGIA TACGIA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPSALE> SPSALEs { get; set; }
    }
}
