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
    
    public partial class tbl_LabOrderparams
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_LabOrderparams()
        {
            this.tbl_LabOrderLabparam = new HashSet<tbl_LabOrderLabparam>();
        }
    
        public int ID { get; set; }
        public string ParamName { get; set; }
        public string NormalValue { get; set; }
        public Nullable<int> GroupId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_LabOrderLabparam> tbl_LabOrderLabparam { get; set; }
        public virtual tbl_labOrderparamGroup tbl_labOrderparamGroup { get; set; }
    }
}
