using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class Tuser
    {
        public Tuser()
        {
            PuntajeUserAds = new HashSet<PuntajeUserAd>();
        }

        public int IdUsers { get; set; }
        public string Username { get; set; }
        public string Pass { get; set; }
        public int? IdRol { get; set; }

        public virtual Role IdRolNavigation { get; set; }
        public virtual ICollection<PuntajeUserAd> PuntajeUserAds { get; set; }
    }
}
