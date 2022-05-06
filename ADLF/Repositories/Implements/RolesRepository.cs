using ADLF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ADLF.Repositories.Implements
{
    public class RolesRepository : IRolesRepository
    {
        private readonly POSTADSContext _postadscontext;
        public RolesRepository(POSTADSContext _postadscontext)
        {
            this._postadscontext = _postadscontext;
        }


        public async Task<Role> Update(Role tentidad)
        {
            _postadscontext.Entry(tentidad).State = EntityState.Modified;
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<Role> Insert(Role tentidad)
        {
            _postadscontext.Set<Role>().Add(tentidad);
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<Role> GetById(int id)
        {
            return await _postadscontext.Set<Role>().FirstOrDefaultAsync();
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

            if (entity == null)
                throw new Exception("Esta entidad es nula");

            _postadscontext.Set<Role>().Remove(entity);
            await _postadscontext.SaveChangesAsync();

        }

        public async Task<IEnumerable<Role>> GetAll()
        {

            return await _postadscontext.Set<Role>().ToListAsync();
        }
    }
}
