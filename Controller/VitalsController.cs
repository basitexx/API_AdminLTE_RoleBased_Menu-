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
    public class VitalsController : ApiController
    {
        private readonly hawic_dbEntities _context;
        public VitalsController()
        {
            _context = new hawic_dbEntities();
        }

        // GET: api/Vitals/id
        [HttpGet]
        [Route("api/Vitals/{VisitId}")]
        public async Task<IHttpActionResult> GetPatientVitals(int VisitId)
        {           
            var Vitals = await _context.tbl_Vital
                .Where(v => v.VisitId == VisitId)               
                .Select(v => new
                {
                    Vitals = new
                    {
                        v.BloodPressure,
                        v.PulseRate,
                        v.OxygenLevel,
                        v.BedyWeight,
                        v.Temprature,
                        v.Height,
                        v.Allergic,
                        v.Others
                    }
                }).ToListAsync();

            return Json(Vitals); // Explicitly return JSON
        }               
    }
}