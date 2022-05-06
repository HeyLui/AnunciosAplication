using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class PuntajeUserAd
    {
        public int Idpuntajeusuario { get; set; }
        public int? IdUsers { get; set; }
        public int? IdAd { get; set; }
        public int? Puntaje { get; set; }

        public virtual Anuncio IdAdNavigation { get; set; }
        public virtual Tuser IdUsersNavigation { get; set; }
    }
}
