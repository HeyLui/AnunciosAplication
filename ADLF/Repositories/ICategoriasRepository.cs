using ADLF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories
{
    public interface ICategoriasRepository 
    {
        Task<IEnumerable<CategoriaAd>> GetAll();
        Task<CategoriaAd> GetById(int id);
        Task<CategoriaAd> Insert(CategoriaAd tentidad);
        Task<CategoriaAd> Update(CategoriaAd tentidad, string catename,int? idcate);
        Task Delete(int id);
    }
}
