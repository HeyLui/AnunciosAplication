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
        Task<Anuncio> Insert(Anuncio tentidad, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo);
        Task<Anuncio> Update(Anuncio tentidad, IFormFile imgphoto, IFormFile imgphoto2, IFormFile imgphoto3, string nombre, string descripcion, int? idtipo, int? adid);
        Task Delete(int id);

        Task<IEnumerable<Anuncio>> Buscador(string buscador, string opcion, string btnfiltro, int? em);

        Task<Anuncio> Votacion(Anuncio anuncios, double voto, int? id, int? adid);
        Task<IEnumerable<Anuncio>> Destacados();
    }
}
