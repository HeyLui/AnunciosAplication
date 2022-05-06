using ADLF.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories
{
    public interface IRolesRepository
    {
        Task<IEnumerable<Role>> GetAll();
        Task<Role> GetById(int id);
        Task<Role> Insert(Role tentidad);
        Task<Role> Update(Role tentidad);
        Task Delete(int id);
    }
}
