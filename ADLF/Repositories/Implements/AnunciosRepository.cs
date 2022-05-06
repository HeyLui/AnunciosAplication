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


        public async Task<Anuncio> Update(Anuncio tentidad, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo, int? adid)
        {
            var busquedafotos = _postadscontext.Set<Anuncio>().Include(z => z.IdTipoadNavigation).Where(z => z.IdAd == adid).FirstOrDefault();

            if (imgphoto != null)

            {
                if (imgphoto.Length > 0)

                //Convert Image to byte and save to database

                {
                    //VALIDAMOS SI IMAGE 2 VIENE NULLA 
                    if (imgphoto2 != null)
                    {
                        if (imgphoto.Length > 0)
                        {
                            if (imgphoto3 != null)
                            {
                                if (imgphoto3.Length > 0)
                                {
                                    byte[] p1 = null;
                                    using (var fs1 = imgphoto.OpenReadStream())
                                    using (var ms1 = new MemoryStream())
                                    {
                                        fs1.CopyTo(ms1);
                                        p1 = ms1.ToArray();
                                    }
                                    byte[] p2 = null;
                                    using (var fs2 = imgphoto2.OpenReadStream())
                                    using (var ms2 = new MemoryStream())
                                    {

                                        fs2.CopyTo(ms2);
                                        p2 = ms2.ToArray();

                                    }
                                    byte[] p3 = null;
                                    using (var fs3 = imgphoto3.OpenReadStream())
                                    using (var ms3 = new MemoryStream())
                                    {

                                        fs3.CopyTo(ms3);
                                        p3 = ms3.ToArray();

                                    }
                                    tentidad.Imagen = p1;
                                    tentidad.Imagen2 = p2;
                                    tentidad.Imagen3 = p3;

                                    var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                                    foreach (Anuncio cv in quer)
                                    {

                                        cv.NombreAd = nombre;
                                        cv.Descripcion = descripcion;
                                        cv.Imagen = p1;
                                        cv.Imagen2 = p2;
                                        cv.Imagen3 = p3;
                                        cv.IdTipoad = idtipo;

                                    };



                                    await _postadscontext.SaveChangesAsync();


                                }
                            }
                            else
                            {
                                byte[] p1 = null;
                                using (var fs1 = imgphoto.OpenReadStream())
                                using (var ms1 = new MemoryStream())
                                {
                                    fs1.CopyTo(ms1);
                                    p1 = ms1.ToArray();
                                }
                                byte[] p2 = null;
                                using (var fs2 = imgphoto2.OpenReadStream())
                                using (var ms2 = new MemoryStream())
                                {

                                    fs2.CopyTo(ms2);
                                    p2 = ms2.ToArray();

                                }
                                tentidad.Imagen = p1;
                                tentidad.Imagen2 = p2;


                                var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                                foreach (Anuncio cv in quer)
                                {

                                    cv.NombreAd = nombre;
                                    cv.Descripcion = descripcion;
                                    cv.Imagen = p1;
                                    cv.Imagen2 = p2;
                                    cv.Imagen3 = busquedafotos.Imagen3;
                                    cv.IdTipoad = idtipo;

                                };


                                await _postadscontext.SaveChangesAsync();

                            }

                        }

                    }
                    //SI VIENE IMAGEN 3 LLENO Y 2 NO 
                    else
                    {
                        if (imgphoto3 != null)
                        {
                            if (imgphoto3.Length > 0)
                            {
                                //SI VIENE IMAGEN VALIDA SI SOLO VIENE LA 3 I LA 2 VACIA 
                                //AQUI SOLO GUARDA IMAGEN 1 Y 3 
                                byte[] p1 = null;
                                using (var fs1 = imgphoto.OpenReadStream())
                                using (var ms1 = new MemoryStream())
                                {
                                    fs1.CopyTo(ms1);
                                    p1 = ms1.ToArray();
                                }
                                byte[] p3 = null;
                                using (var fs3 = imgphoto3.OpenReadStream())
                                using (var ms3 = new MemoryStream())
                                {

                                    fs3.CopyTo(ms3);
                                    p3 = ms3.ToArray();

                                }
                                tentidad.Imagen = p1;
                                tentidad.Imagen3 = p3;

                                var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                                foreach (Anuncio cv in quer)
                                {

                                    cv.NombreAd = nombre;
                                    cv.Descripcion = descripcion;
                                    cv.Imagen = p1;
                                    cv.Imagen2 = busquedafotos.Imagen2;
                                    cv.Imagen3 = p3;
                                    cv.IdTipoad = idtipo;

                                };

                                await _postadscontext.SaveChangesAsync();



                            }

                        }
                        //aqui solo muestra si solo cargamos una foto 
                        else
                        {
                            byte[] p1 = null;
                            using (var fs1 = imgphoto.OpenReadStream())
                            using (var ms1 = new MemoryStream())
                            {
                                fs1.CopyTo(ms1);
                                p1 = ms1.ToArray();
                            }

                            tentidad.Imagen = p1;

                            var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                            foreach (Anuncio cv in quer)
                            {

                                cv.NombreAd = nombre;
                                cv.Descripcion = descripcion;
                                cv.Imagen = p1;
                                cv.Imagen2 = busquedafotos.Imagen2;
                                cv.Imagen3 = busquedafotos.Imagen3;
                                cv.IdTipoad = idtipo;

                            };


                            await _postadscontext.SaveChangesAsync();

                        }
                    }





                }
            }
            else if (imgphoto2 != null)
            {
                if (imgphoto2.Length > 0)
                {
                    if (imgphoto3 != null)
                    {
                        if (imgphoto3.Length > 0)
                        {
                            
                            byte[] p2 = null;
                            using (var fs2 = imgphoto2.OpenReadStream())
                            using (var ms2 = new MemoryStream())
                            {

                                fs2.CopyTo(ms2);
                                p2 = ms2.ToArray();

                            }
                            byte[] p3 = null;
                            using (var fs3 = imgphoto3.OpenReadStream())
                            using (var ms3 = new MemoryStream())
                            {

                                fs3.CopyTo(ms3);
                                p3 = ms3.ToArray();

                            }
                            
                            tentidad.Imagen2 = p2;
                            tentidad.Imagen3 = p3;

                            var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                            foreach (Anuncio cv in quer)
                            {

                                cv.NombreAd = nombre;
                                cv.Descripcion = descripcion;
                                cv.Imagen = busquedafotos.Imagen;
                                cv.Imagen2 = p2;
                                cv.Imagen3 = p3;
                                cv.IdTipoad = idtipo;

                            };
                            await _postadscontext.SaveChangesAsync();


                        }
                    }
                    else
                    {
                        
                        byte[] p2 = null;
                        using (var fs2 = imgphoto2.OpenReadStream())
                        using (var ms2 = new MemoryStream())
                        {

                            fs2.CopyTo(ms2);
                            p2 = ms2.ToArray();

                        }
                        

                        tentidad.Imagen2 = p2;


                        var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                        foreach (Anuncio cv in quer)
                        {

                            cv.NombreAd = nombre;
                            cv.Descripcion = descripcion;
                            cv.Imagen = busquedafotos.Imagen;
                            cv.Imagen2 = p2;
                            cv.Imagen3 = busquedafotos.Imagen;
                            cv.IdTipoad = idtipo;

                        };
                        await _postadscontext.SaveChangesAsync();
                    }
                }
            }
            else if (imgphoto3 != null)
            {
                if (imgphoto3.Length > 0)
                {
                    
                    byte[] p3 = null;
                    using (var fs3 = imgphoto3.OpenReadStream())
                    using (var ms3 = new MemoryStream())
                    {

                        fs3.CopyTo(ms3);
                        p3 = ms3.ToArray();

                    }
                    
                    tentidad.Imagen3 = p3;

                    var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                    foreach (Anuncio cv in quer)
                    {

                        cv.NombreAd = nombre;
                        cv.Descripcion = descripcion;
                        cv.Imagen = busquedafotos.Imagen;
                        cv.Imagen2 = busquedafotos.Imagen2;
                        cv.Imagen3 = p3;
                        cv.IdTipoad = idtipo;

                    };
                    await _postadscontext.SaveChangesAsync();
                }
            }

            else
            {

                var quer = from xv in _postadscontext.Anuncios where xv.IdAd == adid select xv;

                foreach (Anuncio cv in quer)
                {

                    cv.NombreAd = nombre;
                    cv.Descripcion = descripcion;
                    cv.Imagen = busquedafotos.Imagen;
                    cv.Imagen2 = busquedafotos.Imagen2;
                    cv.Imagen3 = busquedafotos.Imagen3;
                    cv.IdTipoad = idtipo;

                };
                await _postadscontext.SaveChangesAsync();
            }

            
            return tentidad;
        }

        public async Task<Anuncio> Insert(Anuncio tentidad, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo)
        {
           
            {

            }
                if (imgphoto != null)

                {
                    if (imgphoto.Length > 0)

                    //Convert Image to byte and save to database

                    {
                        //VALIDAMOS SI IMAGE 2 VIENE NULLA 
                        if (imgphoto2 != null)
                        {
                            if (imgphoto.Length > 0)
                            {
                                if (imgphoto3 != null)
                                {
                                    if (imgphoto3.Length > 0)
                                    {
                                        byte[] p1 = null;
                                        using (var fs1 = imgphoto.OpenReadStream())
                                        using (var ms1 = new MemoryStream())
                                        {
                                            fs1.CopyTo(ms1);
                                            p1 = ms1.ToArray();
                                        }
                                        byte[] p2 = null;
                                        using (var fs2 = imgphoto2.OpenReadStream())
                                        using (var ms2 = new MemoryStream())
                                        {

                                            fs2.CopyTo(ms2);
                                            p2 = ms2.ToArray();

                                        }
                                        byte[] p3 = null;
                                        using (var fs3 = imgphoto3.OpenReadStream())
                                        using (var ms3 = new MemoryStream())
                                        {

                                            fs3.CopyTo(ms3);
                                            p3 = ms3.ToArray();

                                        }


                                        tentidad.Imagen = p1;
                                        tentidad.Imagen2 = p2;
                                        tentidad.Imagen3 = p3;







                                        var nuevad = new Anuncio
                                        {
                                            NombreAd = nombre,
                                            Descripcion = descripcion,
                                            Imagen = p1,
                                            Imagen2 = p2,
                                            Imagen3 = p3,
                                            IdTipoad = idtipo,
                                            Calificacion = 0,
                                            Estado = false,
                                            Fecha = Convert.ToString(DateTime.Now.ToString("g", CultureInfo.CreateSpecificCulture("en-US"))),

                                        };
                                        _postadscontext.Add(nuevad);
                                        await _postadscontext.SaveChangesAsync();
                                        return nuevad;

                                    }
                                }
                                else
                                {
                                    byte[] p1 = null;
                                    using (var fs1 = imgphoto.OpenReadStream())
                                    using (var ms1 = new MemoryStream())
                                    {
                                        fs1.CopyTo(ms1);
                                        p1 = ms1.ToArray();
                                    }
                                    byte[] p2 = null;
                                    using (var fs2 = imgphoto2.OpenReadStream())
                                    using (var ms2 = new MemoryStream())
                                    {

                                        fs2.CopyTo(ms2);
                                        p2 = ms2.ToArray();

                                    }
                                    tentidad.Imagen = p1;
                                    tentidad.Imagen2 = p2;



                                    var nuevad = new Anuncio
                                    {
                                        NombreAd = nombre,
                                        Descripcion = descripcion,
                                        Imagen = p1,
                                        Imagen2 = p2,
                                        Imagen3 = tentidad.Imagen3,
                                        IdTipoad = idtipo,
                                        Calificacion = 0,
                                        Estado = false,
                                        Fecha = Convert.ToString(DateTime.Now.ToString("g", CultureInfo.CreateSpecificCulture("en-US"))),

                                    };
                                    _postadscontext.Add(nuevad);
                                    await _postadscontext.SaveChangesAsync();
                                    return nuevad;
                                }

                            }

                        }
                        //SI VIENE IMAGEN 3 LLENO Y 2 NO 
                        else
                        {
                            if (imgphoto3 != null)
                            {
                                if (imgphoto3.Length > 0)
                                {
                                    //SI VIENE IMAGEN VALIDA SI SOLO VIENE LA 3 I LA 2 VACIA 
                                    //AQUI SOLO GUARDA IMAGEN 1 Y 3 
                                    byte[] p1 = null;
                                    using (var fs1 = imgphoto.OpenReadStream())
                                    using (var ms1 = new MemoryStream())
                                    {
                                        fs1.CopyTo(ms1);
                                        p1 = ms1.ToArray();
                                    }
                                    byte[] p3 = null;
                                    using (var fs3 = imgphoto3.OpenReadStream())
                                    using (var ms3 = new MemoryStream())
                                    {

                                        fs3.CopyTo(ms3);
                                        p3 = ms3.ToArray();

                                    }
                                    tentidad.Imagen = p1;
                                    tentidad.Imagen3 = p3;



                                    var nuevad = new Anuncio
                                    {
                                        NombreAd = nombre,
                                        Descripcion = descripcion,
                                        Imagen = p1,
                                        Imagen2 = tentidad.Imagen2,
                                        Imagen3 = p3,
                                        IdTipoad = idtipo,
                                        Calificacion = 0,
                                        Estado = false,
                                        Fecha = Convert.ToString(DateTime.Now.ToString("g", CultureInfo.CreateSpecificCulture("en-US"))),

                                    };
                                    _postadscontext.Add(nuevad);
                                    await _postadscontext.SaveChangesAsync();
                                    return nuevad;


                                }

                            }
                            //aqui solo muestra si solo cargamos una foto 
                            else
                            {
                                byte[] p1 = null;
                                using (var fs1 = imgphoto.OpenReadStream())
                                using (var ms1 = new MemoryStream())
                                {
                                    fs1.CopyTo(ms1);
                                    p1 = ms1.ToArray();
                                }

                                tentidad.Imagen = p1;




                                var nuevad = new Anuncio
                                {
                                    NombreAd = nombre,
                                    Descripcion = descripcion,
                                    Imagen = p1,
                                    Imagen2 = tentidad.Imagen2,
                                    Imagen3 = tentidad.Imagen3,
                                    IdTipoad = idtipo,
                                    Calificacion = 0,
                                    Estado = false,
                                    Fecha = Convert.ToString(DateTime.Now.ToString("g", CultureInfo.CreateSpecificCulture("en-US"))),

                                };
                                _postadscontext.Add(nuevad);
                                await _postadscontext.SaveChangesAsync();
                                return nuevad;
                            }
                        }





                    }
                }

            //_postadscontext.Set<Anuncio>().Add(tentidad);
            //await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<Anuncio> GetById(int id)
        {

            return await _postadscontext.Set<Anuncio>().Include(z =>z.IdTipoadNavigation).FirstOrDefaultAsync(m => m.IdAd == id);
            
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

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
    }
}
