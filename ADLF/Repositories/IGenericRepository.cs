using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories
{
    public interface IGenericRepository<TEntidad> where TEntidad : class
    {
        Task<IEnumerable<TEntidad>> GetAll();
        Task<TEntidad> GetById(int id);
        Task<TEntidad> Insert(TEntidad tentidad);
        Task<TEntidad> Update(TEntidad tentidad);
        Task Delete (int id);
       

       
    }
}
