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
    
    public partial class SPSALE
    {
        public int MASPSALE { get; set; }
        public int MASL { get; set; }
        public int MaSach { get; set; }
        public Nullable<double> GIAMGIA { get; set; }
    
        public virtual SALE SALE { get; set; }
        public virtual THONGTINSACH THONGTINSACH { get; set; }
    }
}
