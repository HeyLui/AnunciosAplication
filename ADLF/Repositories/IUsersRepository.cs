using ADLF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories
{
    public interface IUsersRepository
    {
        Task<IEnumerable<Tuser>> GetAll();
        Task<Tuser> GetById(int id);
        Task<Tuser> Insert(Tuser tentidad, string usernew, string passnew);
        Task<Tuser> Update(Tuser tentidad);
        Task Delete(int id);

        

    }
}
