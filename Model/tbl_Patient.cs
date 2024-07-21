//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectAPI.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Patient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Patient()
        {
            this.tbl_ImagingOrder = new HashSet<tbl_ImagingOrder>();
            this.tbl_InjectionOrder = new HashSet<tbl_InjectionOrder>();
            this.tbl_PatientHistory = new HashSet<tbl_PatientHistory>();
            this.tbl_Visit = new HashSet<tbl_Visit>();
        }
    
        public int ID { get; set; }
        public string FullName { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string Gender { get; set; }
        public string PhoneNo { get; set; }
        public int SubCity { get; set; }
        public string Woreda { get; set; }
        public int City { get; set; }
        public string Kebele { get; set; }
        public string HouseNo { get; set; }
        public Nullable<System.DateTime> RegisterDate { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
        public string CardNo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_ImagingOrder> tbl_ImagingOrder { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_InjectionOrder> tbl_InjectionOrder { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_PatientHistory> tbl_PatientHistory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Visit> tbl_Visit { get; set; }
    }
}
