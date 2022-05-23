using ADLF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ADLF.Repositories;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Globalization;
using ImageMagick;

namespace ADLF.Repositories.Implements
{
    public class AnunciosRepository : IAnunciosRepository
    {
        private readonly POSTADSContext _postadscontext;
        public AnunciosRepository(POSTADSContext _postadscontext)
        {
            this._postadscontext = _postadscontext;
        }


        public async Task<Anuncio> Update(Anuncio tentidad, List<IFormFile> addmorephotos, string nombre, string descripcion, int? idtipo, int? adid, int? idimgadsaved, int? editarportada)
        {
            var busquedafotos = _postadscontext.Set<Anuncio>().Include(z => z.IdTipoadNavigation).Where(z => z.IdAd == adid).FirstOrDefault();

            if(editarportada != null)
            {
                var idpondelete = _postadscontext.Set<ImagenesbyAd>().Where(z => z.IdAd == adid && z.Portada == true).Select(z => z.Idimgad).FirstOrDefault();
                var cambiarestado = _postadscontext.Set<ImagenesbyAd>().Where(z => z.Idimgad == idpondelete).ToList();
                


                foreach (ImagenesbyAd cv in cambiarestado)
                {

                    cv.Portada = false;

                };
                
                var quer = from xv in _postadscontext.ImagenesbyAds where xv.Idimgad == editarportada select xv;
                foreach (ImagenesbyAd cv in quer)
                {

                    cv.Portada = true;

                };
                await _postadscontext.SaveChangesAsync();
            }
            if(addmorephotos != null)
            {
                List<IFormFile> uploadedFiles = new List<IFormFile>();
                foreach (IFormFile foto in addmorephotos)
                {

                    byte[] p1 = null;
                    using (var fs1 = foto.OpenReadStream())
                    using (var ms1 = new MemoryStream())
                    {
                        fs1.CopyTo(ms1);
                        p1 = ms1.ToArray();
                    }


                    var imageads = new ImagenesbyAd
                    {

                        Image = p1,
                        IdAd = adid,
                        Portada = false,

                    };
                    _postadscontext.Add(imageads);
                    await _postadscontext.SaveChangesAsync();





                }

               
            }
            var query = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

            foreach (Anuncio cv in query)
            {

                cv.NombreAd = nombre;
                cv.Descripcion = descripcion;
                cv.IdTipoad = idtipo;

            };
            await _postadscontext.SaveChangesAsync();



            return  tentidad;
        }

        public async Task<Anuncio> Insert(Anuncio tentidad, List<IFormFile> imgphoto, string nombre, string descripcion, int? idtipo, int portada)
        {
            //portada = portada + 1;
            var nuevad = new Anuncio
            {
                NombreAd = nombre,
                Descripcion = descripcion,
                IdTipoad = idtipo,
                Calificacion = 0,
                Estado = false,
                Fecha = Convert.ToString(DateTime.Now.ToString("g", CultureInfo.CreateSpecificCulture("en-US"))),

            };
            _postadscontext.Add(nuevad);
            await _postadscontext.SaveChangesAsync();


            List<IFormFile> uploadedFiles = new List<IFormFile>();
            foreach (IFormFile foto in imgphoto)
            {

                byte[] p1 = null;
                using (var fs1 = foto.OpenReadStream())
                using (var ms1 = new MemoryStream())
                {
                    fs1.CopyTo(ms1);
                    p1 = ms1.ToArray();
                }

                
                    var imageads = new ImagenesbyAd
                    {
                        Image = p1,
                        IdAd = nuevad.IdAd,
                        Portada = false,

                    };
                    _postadscontext.Add(imageads);
                await _postadscontext.SaveChangesAsync();

                


              
            }
            var xlist = _postadscontext.ImagenesbyAds.Where(s => s.IdAd == nuevad.IdAd ).Select(z => z.Portada == false);
            //var xlist = _postadscontext.ImagenesbyAds.Where(s => s.IdAd == nuevad.IdAd && s.Portada == false).ToList();
            if (xlist != null)
            {
                var xx = _postadscontext.ImagenesbyAds.Where(s => s.IdAd == nuevad.IdAd).FirstOrDefault().Idimgad;
                var x2 = _postadscontext.ImagenesbyAds.Where(s => s.IdAd == nuevad.IdAd).Skip(portada).Select(l => l.Idimgad).FirstOrDefault();
                var entity = await GetById(x2);

                var quer = (from xv in _postadscontext.ImagenesbyAds where xv.IdAd == nuevad.IdAd && xv.Portada == false select xv).Skip(portada).Take(1);

                foreach (ImagenesbyAd cv in quer)
                {

                    cv.Portada = true;

                };
            }
            await _postadscontext.SaveChangesAsync();




            return tentidad;
        }

        public async Task<Anuncio> GetById(int id)
        {

            return await _postadscontext.Set<Anuncio>().Include(z =>z.IdTipoadNavigation).FirstOrDefaultAsync(m => m.IdAd == id);
            
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);
            //--------------------------------SE ELIMINAN PRIMERO TODAS LAS IMAGENES DE ESTE ANUNCIO
            var images = from xv in _postadscontext.ImagenesbyAds where xv.IdAd == id select xv;
            _postadscontext.Set<ImagenesbyAd>().RemoveRange(images);
            //--------------------------------SE ELIMINAN PRIMERO TODOS LOS PUNTAJES DE ESTE ANUNCIO
            var puntaje = from xv in _postadscontext.PuntajeUserAds where xv.IdAd == id select xv;
            _postadscontext.Set<PuntajeUserAd>().RemoveRange(puntaje);
            //--------------------------------ELIMINAMOS EL ANUNCIO
            if (entity == null)
                throw new Exception("Esta entidad es nula");
            _postadscontext.Set<Anuncio>().Remove(entity);
            await _postadscontext.SaveChangesAsync();

        }

        public async Task<IEnumerable<Anuncio>> GetAll()
        {

            return await _postadscontext.Set<Anuncio>().Include(z => z.IdTipoadNavigation).ToListAsync();
        }

        public async Task<IEnumerable<Anuncio>> Buscador(string buscador, string opcion, string btnfiltro, int? em)
        {
            if (btnfiltro != null)
            {
                //var ftft = from xv in _context.Anuncios where xv.IdTipoadNavigation.CategoriaName == btnfiltro select xv.IdTipoad;
                var result = _postadscontext.Anuncios.Where(x => x.IdTipoadNavigation.CategoriaName.Contains(btnfiltro));

                //var filtroboton = from a in _context.Anuncios
                //                  orderby a.IdTipoad == em ascending
                //                  select a;
                return await result.Include(a => a.IdTipoadNavigation).ToListAsync();

            }

            if (opcion == "Categoria")
            {
                var categorias = from a in _postadscontext.Anuncios
                                 orderby a.IdTipoadNavigation.CategoriaName ascending
                                 select a;
                return await categorias.Include(a => a.IdTipoadNavigation).ToListAsync();
            }

            else if (opcion == "Mayor votado")
            {
                var fc = from a in _postadscontext.Anuncios
                         orderby a.Calificacion descending
                         select a;
                return await fc.Include(a => a.IdTipoadNavigation).ToListAsync();
            }
            else if (opcion == "Menor votado")
            {
                var fc = from a in _postadscontext.Anuncios
                         orderby a.Calificacion ascending
                         select a;
                return await fc.Include(a => a.IdTipoadNavigation).ToListAsync();
            }
            else if (opcion == "A - Z")
            {
                var mc = from a in _postadscontext.Anuncios
                         orderby a.NombreAd ascending
                         select a;
                return await mc.Include(a => a.IdTipoadNavigation).ToListAsync();
            }
            
            else if (!string.IsNullOrEmpty(buscador))
            {
                var buscar = from a in _postadscontext.Anuncios
                             where a.NombreAd.Contains(buscador) || a.IdTipoadNavigation.CategoriaName.Contains(buscador)
                             select a;
                return await buscar.Include(a => a.IdTipoadNavigation).ToListAsync();

            }
            else
            {
                return await _postadscontext.Anuncios.Include(a => a.IdTipoadNavigation).ToListAsync();
            }
        }

        public async Task<Anuncio> Votacion(Anuncio anuncios, double voto, int? id, int? adid)
        {
            var objusu = (from a in _postadscontext.Tusers where a.IdUsers == id select a).FirstOrDefault();
            int votoconvert = Convert.ToInt32(voto);

            var first = _postadscontext.PuntajeUserAds.ToList().Where(x => x.IdAd == adid).Count();
            var userad = new PuntajeUserAd
            {
                IdUsers = objusu.IdUsers,
                IdAd = adid,
                Puntaje = votoconvert

            };
            _postadscontext.Add(userad);
            await _postadscontext.SaveChangesAsync();

            var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

            var ret = _postadscontext.PuntajeUserAds.Where(x => x.IdAd == adid).Select(z => z.IdAd).Count();
            var rel2 = _postadscontext.PuntajeUserAds.Where(x => x.IdAd == adid).Select(z => z.Puntaje).Sum();
            

            if (first == 0)
                {
                    foreach (Anuncio cv in quer)
                    {
                    
                    cv.Calificacion = Convert.ToDecimal(voto);
                    }

                }
                else
                {
                    foreach (Anuncio cv in quer)
                    {
                    var vototo = rel2 / ret;

                    cv.Calificacion = vototo;
                        
                    }
                }

           
            
            await _postadscontext.SaveChangesAsync();





            return await _postadscontext.Set<Anuncio>().Include(z => z.IdTipoadNavigation).FirstOrDefaultAsync(m => m.IdAd == adid);

        }

        public async Task<IEnumerable<Anuncio>> Destacados()
        {
            return await _postadscontext.Set<Anuncio>().Where(z => z.Calificacion > 2).Include(z => z.IdTipoadNavigation).ToListAsync();
        }

        public async Task<ImagenesbyAd> Buscarimagenid(int idimgdelete)
        {

            return await _postadscontext.Set<ImagenesbyAd>().Include(z => z.IdAdNavigation).FirstOrDefaultAsync(m => m.Idimgad == idimgdelete);

        }

        public async Task EliminarUnaImagen(int idimgdelete)
        {
            var entity = await Buscarimagenid(idimgdelete);
            //--------------------------------SE ELIMINAN PRIMERO TODAS LAS IMAGENES EN ESE ANUNCIO
            

            if (entity == null)
                throw new Exception("Esta entidad es nula");
            _postadscontext.Set<ImagenesbyAd>().Remove(entity);
            await _postadscontext.SaveChangesAsync();





        

        }
    }
}
