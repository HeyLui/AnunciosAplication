using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ADLF.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using ADLF.Repositories;

namespace ADLF.Controllers
{
    public class UsersController : Controller
    {
        private  IUsersRepository usuariosRepository;
        POSTADSContext ivm = new POSTADSContext();

        public UsersController(IUsersRepository usuariosRepository)
        {
            this.usuariosRepository = usuariosRepository;
        }

        // GET: Users
        public async Task<IActionResult> Index()
        {
            var userlist = await usuariosRepository.GetAll();
            return View(userlist);
        }

        // GET: Users/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userid = await usuariosRepository.GetById(id.Value);
            if (userid == null)
            {
                return NotFound();
            }

            return View(userid);
        }

        // GET: Users/Create
        //public IActionResult Create()
        //{
        //    ViewData["IdRol"] = new SelectList(ivm.Roles, "IdRol", "DescripcionRol");
        //    return View();
        //}

        //// POST: Users/Create
        //// To protect from overposting attacks, enable the specific properties you want to bind to, for 
        //// more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("IdUsers,Username,Pass,IdRol")] Tuser tuser, string usernew, string passnew)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var useradd = await usuariosRepository.Insert(tuser, usernew, passnew);
        //        var id = tuser.IdUsers;
        //        return RedirectToAction(nameof(Index));
        //    }
        //    ViewData["IdRol"] = new SelectList(ivm.Roles, "IdRol", "DescripcionRol", tuser.IdRol);
        //    return View(tuser);
        //}

        // GET: Users/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userid = await usuariosRepository.GetById(id.Value);
            if (userid == null)
            {
                return NotFound();
            }
            ViewData["IdRol"] = new SelectList(ivm.Roles, "IdRol", "DescripcionRol", userid.IdRol);
            return View(userid);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int? id, [Bind("IdUsers,Username,Pass,IdRol")] Tuser tuser)
        {
            if (id == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var useredit = await usuariosRepository.Update(tuser);
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdRol"] = new SelectList(ivm.Roles, "IdRol", "DescripcionRol", tuser.IdRol);
            return View(tuser);
        }

        [HttpPost]
        public IActionResult Iniciar(Tuser tuser, string usuario, string contra)
        {
            //string pass = Helper.EncodePassword(contra);
            var objusu = (from a in ivm.Tusers where a.Username == usuario && a.Pass == contra select a).FirstOrDefault();
            if (objusu != null)
            {

                HttpContext.Session.SetString("usuariodata", JsonConvert.SerializeObject(objusu.Username));
                HttpContext.Session.SetString("usuarioidrec", JsonConvert.SerializeObject(objusu.IdUsers));
                HttpContext.Session.SetString("roluser", JsonConvert.SerializeObject(objusu.IdRol));
                
                //if (objusu.IdRol == 2)
                //{
                //    return RedirectToAction("Index", "Anuncios");
                //}
                

                return RedirectToAction("Index", "Anuncios");
            }
            return RedirectToAction("Index", "Anuncios");
        }
        [HttpPost]
        public async Task<IActionResult> Registrar(Tuser tuser, string usernew, string passnew)
        {
            //string pass = Helper.EncodePassword(contra);
            var votip = await usuariosRepository.Insert(tuser, usernew, passnew);
            return RedirectToAction("Login", "Home");
        }
        [HttpPost]
        public IActionResult Desconectarse()
        {

            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Anuncios");
        }

        // GET: Users/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var userid = await usuariosRepository.GetById(id.Value);
            if (userid == null)
            {
                return NotFound();
            }

            return View(userid);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await usuariosRepository.Delete(id);
            return RedirectToAction(nameof(Index));
        }

       
    }
}
