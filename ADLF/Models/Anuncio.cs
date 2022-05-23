using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class Anuncio
    {
        public Anuncio()
        {
            ImagenesbyAds = new HashSet<ImagenesbyAd>();
            PuntajeUserAds = new HashSet<PuntajeUserAd>();
        }

        public int IdAd { get; set; }
        public string NombreAd { get; set; }
        public string Descripcion { get; set; }
        public int? IdTipoad { get; set; }
        public decimal? Calificacion { get; set; }
        public bool? Estado { get; set; }
        public string Fecha { get; set; }

        public virtual CategoriaAd IdTipoadNavigation { get; set; }
        public virtual ICollection<ImagenesbyAd> ImagenesbyAds { get; set; }
        public virtual ICollection<PuntajeUserAd> PuntajeUserAds { get; set; }
    }
}
