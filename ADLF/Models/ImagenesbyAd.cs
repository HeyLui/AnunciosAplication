using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class ImagenesbyAd
    {
        public int Idimgad { get; set; }
        public byte[] Image { get; set; }
        public int? IdAd { get; set; }
        public bool? Portada { get; set; }

        public virtual Anuncio IdAdNavigation { get; set; }
    }
}
