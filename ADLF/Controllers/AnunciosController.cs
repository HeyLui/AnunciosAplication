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
using ADLF.Repositories.Implements;

namespace ADLF.Controllers
{
    public class AnunciosController : Controller
    {
        
        private  IAnunciosRepository anunciosRepository;    
        POSTADSContext ivm = new POSTADSContext();

        public AnunciosController(IAnunciosRepository anunciosRepository)
        {
            this.anunciosRepository = anunciosRepository;
        }



        // GET: Anuncios


        public async Task<IActionResult> Index()
        {
            
            var addslist = await anunciosRepository.GetAll();
            return View(addslist);
        }
        [HttpPost]
        public async Task<IActionResult> Index(string buscador, string opcion, string btnfiltro, int em)
        {
            

            var addslist = await anunciosRepository.Buscador(buscador,opcion,btnfiltro,em);
            return View(addslist);
        }

        public async Task<IActionResult> AdDestacados()
        {

            var addslist = await anunciosRepository.Destacados();
            return View(addslist);
        }



        //ESTA ACCION SOLO CONVIERTE LA IMAGEN DE TIPO BYTE A MOSTRAR LA IMAGEN 
        public ActionResult convertirImagen(int codigo)
        {

            using (var context = new POSTADSContext())
            {
                
                var foto = (from i in context.Anuncios
                            where i.IdAd == codigo
                            select i).FirstOrDefault();
               // var contador = context.PuntajeUserAds.Where(x => x.IdAdNavigation.IdAd == codigo).Count();


                return File(foto.Imagen,  "Imagenes/jpg");
            }



        }
        public ActionResult convertirImagen2(int codigo2)
        {
            
            using (var context = new POSTADSContext())
              {

                 var foto = (from i in context.Anuncios
                                        where i.IdAd == codigo2
                                        select i).FirstOrDefault();

                    if (foto.Imagen2 == null)
                    {

                        return RedirectToAction("Index", "Details", new { codigo2 });
                    }
                    else
                    {
                        return File(foto.Imagen2, "Imagenes/jpg");
                    }

                    
               }

            
           

        }
        public ActionResult convertirImagen3(int codigo3)
        {

            
                using (var context = new POSTADSContext())
                {

                    var foto = (from i in context.Anuncios
                                where i.IdAd == codigo3
                                select i).FirstOrDefault();

                    if (foto.Imagen3 == null)
                    {

                        return RedirectToAction("Index", "Details", new { codigo3 });
                    }
                    else
                    {
                        return File(foto.Imagen3, "Imagenes/jpg");
                    }
                }

            
            
           

        }

        //GET: Anuncios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var contaimagenes1 = ivm.Anuncios.Where(z => z.IdAd == id).Select(z => z.Imagen).Count();
            var contaimagenes2 = ivm.Anuncios.Where(z => z.IdAd == id).Select(z => z.Imagen2).Count();
            var contaimagenes3 = ivm.Anuncios.Where(z => z.IdAd == id).Select(z => z.Imagen3).Count();
            ViewBag.totalimagenes = contaimagenes1 + contaimagenes2 + contaimagenes3;
            var idcate  = (from xv in ivm.Anuncios where xv.IdAd == id select xv.IdTipoad).FirstOrDefault();
            ///
            var anunciosrelevantes = ivm.Anuncios.Include(z => z.IdTipoadNavigation).Where(z => z.IdTipoadNavigation.IdTipoad == idcate).Take(5);
            ViewData["Relacionados"] =  anunciosrelevantes;
            ////
            
            var contador = ivm.CategoriaAds.ToList();

            ViewData["Categorialist"] = contador;
    
            var anuncio = await anunciosRepository.GetById(id.Value);

            ViewBag.data = HttpContext.Session.GetString("usuariodata");

            if (ViewBag.data != null)
            {

                ViewBag.buscar1 = HttpContext.Session.GetString("usuarioidrec");
                int buscador = Convert.ToInt32(ViewBag.buscar1);
                string datos = ViewBag.data;
                var buscar = from xv in ivm.PuntajeUserAds where xv.IdUsersNavigation.Username == datos select xv;
                if (buscar != null)
                {
                    

                    
                    var result = ivm.PuntajeUserAds.ToList().Where(x => x.IdUsers == buscador && x.IdAd == id).FirstOrDefault();
                    ViewBag.yaya = result;
                    
                }

            }
            if (anuncio == null)
            {
                return NotFound();
            }

            return View(anuncio);
        }

        [HttpPost]
        public async Task<IActionResult> Votacion(Anuncio anuncios, double voto, int? id, int? adid)
        {
            //string pass = Helper.EncodePassword(contra);
            var objusu = (from a in ivm.Tusers where a.IdUsers == id select a).FirstOrDefault();
            if(objusu == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                var votip = await anunciosRepository.Votacion(anuncios,voto, id, adid);

                  return RedirectToAction("Details", "Anuncios", new { Id = adid });
            }
            

        }

        //// GET: Anuncios/Create
        public IActionResult Create()
        {
            var addslist = anunciosRepository.GetAll();

           
            ViewData["IdTipoad"] = new SelectList(ivm.CategoriaAds, "IdTipoad", "CategoriaName");
            return View();
        }

        // POST: Anuncios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdAd,NombreAd,Descripcion,Imagen,Imagen2,Imagen3,IdTipoad,Calificacion,Estado,Fecha")] Anuncio anuncio, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo)
        {
            if (ModelState.IsValid)
            {
                //METODO CREATE "INSERT" DESDE EL REPOSITORIO
                anuncio = await anunciosRepository.Insert(anuncio, imgphoto, imgphoto2, imgphoto3, nombre, descripcion,  idtipo);
                var id = anuncio.IdAd;
                
                return RedirectToAction(nameof(Index));
            }
            //Llamamos al contexto para mostrar lista en selectbox
            ViewData["IdTipoad"] = new SelectList(ivm.CategoriaAds, "IdTipoad", "CategoriaName", anuncio.IdTipoad);
            return View(anuncio);
        }

        // GET: Anuncios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
           
            var anuncio = await anunciosRepository.GetById(id.Value);
            if (anuncio == null)
            {
                return NotFound();
            }
            ViewData["IdTipoad"] = new SelectList(ivm.CategoriaAds, "IdTipoad", "CategoriaName", anuncio.IdTipoad);
            return View(anuncio);
        }

        // POST: Anuncios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int? id, [Bind("IdAd,NombreAd,Descripcion,Imagen,Imagen2,Imagen3,IdTipoad,Calificacion,Estado,Fecha")] Anuncio anuncio, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo, int? adid)
        {
            if (id == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                anuncio = await anunciosRepository.Update(anuncio,  imgphoto, imgphoto2, imgphoto3, nombre,  descripcion,  idtipo, adid);
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdTipoad"] = new SelectList(ivm.CategoriaAds, "IdTipoad", "CategoriaName", anuncio.IdTipoad);
            return View(anuncio);
        }

        //// GET: Anuncios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var anuncio = await anunciosRepository.GetById(id.Value);
            if (anuncio == null)
            {
                return NotFound();
            }

            return View(anuncio);
        }

        // POST: Anuncios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await anunciosRepository.Delete(id);
            
            return RedirectToAction(nameof(Index));
        }

        //private bool AnuncioExists(int id)
        //{
        //    return _context.Anuncios.Any(e => e.IdAd == id);
        //}
    }
}
