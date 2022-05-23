using ADLF.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories
{
    public interface IAnunciosRepository 
    {
        Task<IEnumerable<Anuncio>> GetAll();
        Task<Anuncio> GetById(int id);
        Task<Anuncio> Insert(Anuncio tentidad, List<IFormFile> proimage, string nombre, string descripcion, int? idtipo, int portada);
        Task<Anuncio> Update(Anuncio tentidad, List<IFormFile> addmorephotos, string nombre, string descripcion, int? idtipo, int? adid, int? idimgadsaved,int? editarportada);
        Task Delete(int id);

        Task<IEnumerable<Anuncio>> Buscador(string buscador, string opcion, string btnfiltro, int? em);

        Task<Anuncio> Votacion(Anuncio anuncios, double voto, int? id, int? adid);
        Task<IEnumerable<Anuncio>> Destacados();

        //APARTADO TABLA DE IMAGENES
        Task<ImagenesbyAd> Buscarimagenid(int idimgdelete);
        Task EliminarUnaImagen(int idimgdelete);
    }
}
