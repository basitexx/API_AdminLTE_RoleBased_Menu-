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
    
    public partial class tbl_Prescription
    {
        public int Id { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
        public string PrescriptionContent { get; set; }
        public Nullable<int> OpdId { get; set; }
        public Nullable<int> VisitId { get; set; }
    
        public virtual tbl_Visit tbl_Visit { get; set; }
    }
}