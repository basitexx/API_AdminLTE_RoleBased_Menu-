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
    
    public partial class tbl_labOrderparamGroup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_labOrderparamGroup()
        {
            this.tbl_LabOrderparams = new HashSet<tbl_LabOrderparams>();
        }
    
        public int ID { get; set; }
        public string GroupName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_LabOrderparams> tbl_LabOrderparams { get; set; }
    }
}
