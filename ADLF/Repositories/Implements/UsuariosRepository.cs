using ADLF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories.Implements
{
    public class UsuariosRepository : IUsersRepository
    {
        private readonly POSTADSContext _postadscontext;
        public UsuariosRepository(POSTADSContext _postadscontext)
        {
            this._postadscontext = _postadscontext;
        }


        public async Task<Tuser> Update(Tuser tentidad)
        {
            _postadscontext.Set<Tuser>().Update(tentidad);
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<Tuser> Insert(Tuser tentidad, string usernew, string passnew)
        {
            var usergg = new Tuser
            {
                IdUsers = tentidad.IdUsers,
                Username = usernew,
                Pass = passnew,
                IdRol = 1
                
  
            };
           
            _postadscontext.Set<Tuser>().Add(usergg);
            await _postadscontext.SaveChangesAsync();
            return usergg;
        }

        public async Task<Tuser> GetById(int id)
        {
            return await _postadscontext.Set<Tuser>().Include(z => z.IdRolNavigation).FirstOrDefaultAsync(m => m.IdRol == id);
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

            if (entity == null)
                throw new Exception("Esta entidad es nula");

            _postadscontext.Set<Tuser>().Remove(entity);
            await _postadscontext.SaveChangesAsync();

        }

        public async Task<IEnumerable<Tuser>> GetAll()
        {

            return await _postadscontext.Set<Tuser>().Include(z => z.IdRolNavigation).ToListAsync();
        }

        
    }
}
