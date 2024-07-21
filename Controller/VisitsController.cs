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
    public class VisitsController : ApiController
    {
        private readonly hawic_dbEntities _context;
        public VisitsController()
        {
            _context = new hawic_dbEntities();
        }

        // GET: api/Visits/id
        [HttpGet]
        [Route("api/visits/{patientId}")]
        public async Task<IHttpActionResult> GetPatientVisits(int patientId)
        {
            var visits = await _context.viewTimelines
                .Where(v => v.PatientID == patientId)
                .OrderByDescending(v => v.ID) // Order by VisitDate descending
                .Take(3)
                .Select(v => new
                {
                    v.VId,
                    v.VisitDate,
                    v.VisitType,
                    v.Diagnosis,
                    v.DoctorComment,
                    v.OpdName,
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
                    },

                    Orders = new
                    {
                        Laboratory = _context.tbl_LaboratoryOrder
                            .Where(l => l.VisitId == v.VId)                            
                            .Select(l => new
                            {
                                l.ID,
                                Parameters = _context.tbl_LabOrderLabparam
                                    .Where(ll => ll.LabOrderId == l.ID)
                                    .Take(3)
                                    .OrderBy(ll => ll.LabOrderParamId)
                                    .Select(ll => new
                                    {
                                        ParamName = _context.tbl_LabOrderparams
                                            .Where(p => p.ID == ll.LabOrderParamId)
                                            .OrderBy(p=> p.ID)
                                            .Select(p => p.ParamName)
                                            .FirstOrDefault(),
                                        ll.Result
                                    }).ToList()
                            }).ToList(), // Handle multiple orders

                Imaging = _context.tbl_ImagingOrder
                            .Where(i => i.VisitId == v.VId)
                            .Select(i => i.ID.ToString())
                            .ToList()
                    },

                    Prescriptions = _context.tbl_Prescription
                        .Where(p => p.VisitId == v.VId)
                        .Select(p => new
                        {
                            p.PrescriptionContent
                        }).ToList()
                }).ToListAsync();

            return Json(visits); // Explicitly return JSON
        }


        // GET: api/Visits      
        [HttpGet]
        [Route("api/visits")]
        public async Task<IHttpActionResult> GetAllVisits()
        {
            var visits = await _context.tbl_Visit
                .Select(v => new
                {
                    v.ID,
                    v.VisitDate,
                    v.VisitType,
                    v.Diagnosis,
                    v.DoctorComment,
                    tbl_Patient = new
                    {
                        v.tbl_Patient.ID,
                        v.tbl_Patient.FullName,
                        v.tbl_Patient.DateOfBirth,
                        v.tbl_Patient.Gender,
                        v.tbl_Patient.PhoneNo
                    },
                    Vitals = _context.tbl_Vital
                        .Where(vt => vt.VisitId == v.ID)
                        .Select(vt => new
                        {
                            vt.BloodPressure,
                            vt.PulseRate,
                            vt.OxygenLevel,
                            vt.BedyWeight,
                            vt.Temprature,
                            vt.Height,
                            vt.Allergic,
                            vt.Others
                        }).ToList()
                }).ToListAsync();

            return Json(visits); // Explicitly return JSON
        }
    }
}