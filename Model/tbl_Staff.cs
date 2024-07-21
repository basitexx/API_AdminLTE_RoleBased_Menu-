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
    
    public partial class tbl_Staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Staff()
        {
            this.tbl_Appointment = new HashSet<tbl_Appointment>();
            this.tbl_Appointment1 = new HashSet<tbl_Appointment>();
            this.tbl_InjectionOrder = new HashSet<tbl_InjectionOrder>();
            this.tbl_InjectionOrder1 = new HashSet<tbl_InjectionOrder>();
            this.tbl_PatientHistory = new HashSet<tbl_PatientHistory>();
            this.tbl_Visit = new HashSet<tbl_Visit>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public string FullName { get; set; }
        public string JobTitle { get; set; }
        public string PhoneNo { get; set; }
        public Nullable<int> SubCity { get; set; }
        public string Woreda { get; set; }
        public string AccountID { get; set; }
        public Nullable<System.DateTime> RegisterDate { get; set; }
        public Nullable<int> RegStatus { get; set; }
        public Nullable<int> Department { get; set; }
        public string Email { get; set; }
        public byte[] Photo { get; set; }
        public string ContentType { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Appointment> tbl_Appointment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Appointment> tbl_Appointment1 { get; set; }
        public virtual tbl_Department tbl_Department { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_InjectionOrder> tbl_InjectionOrder { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_InjectionOrder> tbl_InjectionOrder1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_PatientHistory> tbl_PatientHistory { get; set; }
        public virtual tbl_SubCity tbl_SubCity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Visit> tbl_Visit { get; set; }
    }
}
