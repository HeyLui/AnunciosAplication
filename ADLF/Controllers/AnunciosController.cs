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

                var foto = (from i in context.ImagenesbyAds
                            where i.IdAd == codigo
                            select i).FirstOrDefault(z => z.Portada == true);

                //var picfoto = ivm.ImagenesbyAds.Where(y => y.IdAd == codigo && y.Portada == true).Select(i => i.Image);
                //Cont
                var contador = context.PuntajeUserAds.Where(x => x.IdAdNavigation.IdAd == codigo).Count();

                //ViewBag.fotoportada =  File(foto.Image, "Imagenes/jpg");

                if (foto != null)
                {
                    return File(foto.Image, "Imagenes/jpg");
                }
                else
                {
                    return View();
                }
                
            }



        }

        public ActionResult convertirImagenLista(int codigolista)
        {

            using (var context = new POSTADSContext())
            {

                var foto = (from i in context.ImagenesbyAds
                            where i.Idimgad == codigolista
                            select i).FirstOrDefault(o => o.Portada == false);

                //var picfoto = ivm.ImagenesbyAds.Where(y => y.IdAd == codigo && y.Portada == true).Select(i => i.Image);
                //Cont
                var contador = context.PuntajeUserAds.Where(x => x.IdAdNavigation.IdAd == codigolista).Count();

                //ViewBag.fotoportada =  File(foto.Image, "Imagenes/jpg");

                if (foto != null)
                {
                    return File(foto.Image, "Imagenes/jpg");
                }
                else
                {
                    return View();
                }

            }



        }




        //}

        //GET: Anuncios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var contaimagenes = ivm.ImagenesbyAds.Where(z => z.IdAd == id && z.Portada == false).Select(z => z.Image).Count();

            ViewBag.totalimagenes = contaimagenes;
            var idcate  = (from xv in ivm.Anuncios where xv.IdAd == id select xv.IdTipoad).FirstOrDefault();
            ///
            var anunciosrelevantes = ivm.Anuncios.Include(z => z.IdTipoadNavigation).Where(z => z.IdTipoadNavigation.IdTipoad == idcate).Take(5);
            ViewData["Relacionados"] =  anunciosrelevantes;
            ////
            /// ///
            /// 

            var listadeimagenesbyad = ivm.ImagenesbyAds.Include(z => z.IdAdNavigation).Where(z => z.IdAdNavigation.IdAd == id && z.Portada == false).ToList();
            ViewData["Listadeimagenesbyad"] = listadeimagenesbyad;
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
        public async Task<IActionResult> Create([Bind("IdAd,NombreAd,Descripcion,Imagen,Imagen2,Imagen3,IdTipoad,Calificacion,Estado,Fecha")] Anuncio anuncio,  List<IFormFile> imgphoto, string nombre, string descripcion, int? idtipo, int portada)
        {
            if (ModelState.IsValid)
            {
                //METODO CREATE "INSERT" DESDE EL REPOSITORIO
                anuncio = await anunciosRepository.Insert(anuncio, imgphoto, nombre, descripcion, idtipo, portada);
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
            var listadeimagenesbyad = ivm.ImagenesbyAds.Include(z => z.IdAdNavigation).Where(z => z.IdAdNavigation.IdAd == id && z.Portada == false).ToList();
            ViewData["Listadeimagenesbyad"] = listadeimagenesbyad;
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
        public async Task<IActionResult> Edit(int? id, [Bind("IdAd,NombreAd,Descripcion,Imagen,Imagen2,Imagen3,IdTipoad,Calificacion,Estado,Fecha")] Anuncio anuncio, List<IFormFile> addmorephotos,  string nombre, string descripcion, int? idtipo, int? adid , int? idimgadsaved, int? editarportada)
        {
            if (id == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                anuncio = await anunciosRepository.Update(anuncio, addmorephotos, nombre,  descripcion,  idtipo, adid, idimgadsaved, editarportada);
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

        //ELIMINAR UNA IMAGEN SOLA 
        [HttpPost]
        public async Task<IActionResult> ElimarUnaImagen(int idimgdelete, int adid)
        {
            await anunciosRepository.EliminarUnaImagen(idimgdelete);

            return RedirectToAction("Edit", "Anuncios", new { Id = adid });
        }
        //private bool AnuncioExists(int id)
        //{
        //    return _context.Anuncios.Any(e => e.IdAd == id);
        //}
    }
}
