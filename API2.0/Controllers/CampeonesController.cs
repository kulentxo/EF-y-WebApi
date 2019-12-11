using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using API2._0.Models;
using System.Web.Http.Cors;

namespace API2._0.Controllers
{
    
    public class CampeonesController : ApiController
    {
        
        private DAM_JulenMartin_DEVEntities db = new DAM_JulenMartin_DEVEntities();

        // GET: api/Campeones
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<Campeones> GetCampeones()
        {
            return db.Campeones;
        }

        // GET: api/Campeones/5
        [ResponseType(typeof(Campeones))]
        public IHttpActionResult GetCampeones(int id)
        {
            Campeones campeones = db.Campeones.Find(id);
            if (campeones == null)
            {
                return NotFound();
            }

            return Ok(campeones);
        }

        // PUT: api/Campeones/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCampeones(int id, Campeones campeones)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != campeones.Id)
            {
                return BadRequest();
            }

            db.Entry(campeones).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CampeonesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Campeones
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Campeones))]
        public IHttpActionResult PostCampeones(Campeones campeones)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Campeones.Add(campeones);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (CampeonesExists(campeones.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = campeones.Id }, campeones);
        }

        // DELETE: api/Campeones/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Campeones))]
        public IHttpActionResult DeleteCampeones(int id)
        {
            Campeones campeones = db.Campeones.Find(id);
            if (campeones == null)
            {
                return NotFound();
            }

            db.Campeones.Remove(campeones);
            db.SaveChanges();

            return Ok(campeones);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CampeonesExists(int id)
        {
            return db.Campeones.Count(e => e.Id == id) > 0;
        }
    }
}