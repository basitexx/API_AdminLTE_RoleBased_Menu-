using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using ProjectAPI.Model;

namespace ProjectAPI.Controller
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class prescriptionController : ApiController
    {
        private readonly hawic_dbEntities _context;
        public prescriptionController()
        {
            _context = new hawic_dbEntities();
        }

        // GET: api/prescription
        [HttpGet]
        [Route("api/prescription/{visitId}")]
        public async Task<IHttpActionResult> GetPrescription(int visitId)
        {
            var prescription = await _context.tbl_Prescription
                .Where(v => v.VisitId == visitId)
                .OrderByDescending(v => v.Id) // Order by VisitDate descending                
                .Select(v => new
                {
                    Prescriptions = new
                    {
                        v.Id,
                        v.PrescriptionContent
                    }
                }).ToListAsync();
                   
            return Json(prescription); // Explicitly return JSON
        }

        // GET: api/prescription
        [HttpGet]
        [Route("api/prescription/")]
        public async Task<IHttpActionResult> GetPrescriptionAll()
        {
            var name = await _context.tbl_Prescription
                .OrderByDescending(v => v.Id) // Order by Id descending
                .Select(v => new
                {                                            
                   v.PrescriptionContent                    
                })
                .Distinct() // Ensure distinct PrescriptionContent values
                .ToListAsync();

            return Json(name); // Explicitly return JSON
        }
    }
}