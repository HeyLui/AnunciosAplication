using ADLF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ADLF.Repositories.Implements
{
    public class GenericRepository<TEntidad> : IGenericRepository<TEntidad> where TEntidad : class
    {
        private readonly POSTADSContext _postadscontext;
        public GenericRepository(POSTADSContext _postadscontext)
        {
            this._postadscontext = _postadscontext;
        }


        public async Task<TEntidad> Update(TEntidad tentidad)
        {
            _postadscontext.Entry(tentidad).State = EntityState.Modified;
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<TEntidad> Insert(TEntidad tentidad)
        {
            _postadscontext.Set<TEntidad>().Add(tentidad);
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<TEntidad> GetById(int id)
        {
            return await _postadscontext.Set<TEntidad>().FindAsync(id);
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

                if (entity == null)
                throw new Exception("Esta entidad es nula");

            _postadscontext.Set<TEntidad>().Remove(entity);
            await _postadscontext.SaveChangesAsync();

        }

        public async Task<IEnumerable<TEntidad>> GetAll()
        {

            return await _postadscontext.Set<TEntidad>().ToListAsync();
        }


        
    }
}
