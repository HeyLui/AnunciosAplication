using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class CategoriaAd
    {
        public CategoriaAd()
        {
            Anuncios = new HashSet<Anuncio>();
        }

        public int IdTipoad { get; set; }
        public string CategoriaName { get; set; }

        public virtual ICollection<Anuncio> Anuncios { get; set; }
    }
}
