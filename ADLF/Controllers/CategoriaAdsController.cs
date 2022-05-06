using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ADLF.Models;
using ADLF.Repositories;

namespace ADLF.Controllers
{
    public class CategoriaAdsController : Controller
    {
        private ICategoriasRepository categoriasRepository;


        public CategoriaAdsController(ICategoriasRepository categoriasRepository)
        {
            this.categoriasRepository = categoriasRepository;
        }

        // GET: CategoriaAds
        public async Task<IActionResult> Index()
        {
            var addslist = await categoriasRepository.GetAll();
            return View(addslist);
        }

        // GET: CategoriaAds/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            
            var categoriaAd = await categoriasRepository.GetById(id.Value);
            if (categoriaAd == null)
            {
                return NotFound();
            }

            return View(categoriaAd);
        }

        // GET: CategoriaAds/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: CategoriaAds/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdTipoad,CategoriaName")] CategoriaAd categoriaAd)
        {
            if (ModelState.IsValid)
            {
                categoriaAd = await categoriasRepository.Insert(categoriaAd);
                var id = categoriaAd.IdTipoad;

                return RedirectToAction(nameof(Index));
            }
            return View(categoriaAd);
        }

        // GET: CategoriaAds/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categoriaAd = await categoriasRepository.GetById(id.Value);
            if (categoriaAd == null)
            {
                return NotFound();
            }
            return View(categoriaAd);
        }

        // POST: CategoriaAds/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdTipoad,CategoriaName")] CategoriaAd categoriaAd, string catename, int? idcate)
        {
            if (idcate == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                categoriaAd = await categoriasRepository.Update(categoriaAd, catename, idcate);
                return RedirectToAction(nameof(Index));
            }
            return View(categoriaAd);
        }

        // GET: CategoriaAds/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categoriaAd = await categoriasRepository.GetById(id.Value);
            if (categoriaAd == null)
            {
                return NotFound();
            }

            return View(categoriaAd);
        }

        // POST: CategoriaAds/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await categoriasRepository.Delete(id);
            return RedirectToAction(nameof(Index));
        }

        
    }
}
