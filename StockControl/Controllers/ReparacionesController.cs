using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class ReparacionesController : Controller
    {
        // GET: Reparaciones
        public ActionResult Index()
        {
            return View();
        }

        // GET: Reparaciones/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Reparaciones/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Reparaciones/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Reparaciones/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Reparaciones/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Reparaciones/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Reparaciones/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
