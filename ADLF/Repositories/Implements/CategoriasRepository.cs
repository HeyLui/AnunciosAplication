using ADLF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADLF.Repositories.Implements
{
    public class CategoriasRepository : ICategoriasRepository
    {
        private readonly POSTADSContext _postadscontext;
        public CategoriasRepository(POSTADSContext _postadscontext)
        {
            this._postadscontext = _postadscontext;
        }


        public async Task<CategoriaAd> Update(CategoriaAd tentidad, string catename, int? idcate)
        {

            var quer = from xv in _postadscontext.CategoriaAds where xv.IdTipoad == idcate select xv;

            foreach (CategoriaAd cv in quer)
            {
                cv.CategoriaName = catename;
            };
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<CategoriaAd> Insert(CategoriaAd tentidad)
        {
            _postadscontext.Set<CategoriaAd>().Add(tentidad);
            await _postadscontext.SaveChangesAsync();
            return tentidad;
        }

        public async Task<CategoriaAd> GetById(int id)
        {
            return await _postadscontext.Set<CategoriaAd>().FindAsync(id);
        }

        public async Task Delete(int id)
        {
            var entity = await GetById(id);

            if (entity == null)
                throw new Exception("Esta entidad es nula");

            _postadscontext.Set<CategoriaAd>().Remove(entity);
            await _postadscontext.SaveChangesAsync();

        }

        public async Task<IEnumerable<CategoriaAd>> GetAll()
        {

            return await _postadscontext.Set<CategoriaAd>().ToListAsync();
        }
    }
}
