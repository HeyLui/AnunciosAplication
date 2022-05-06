using System;
using System.Collections.Generic;

#nullable disable

namespace ADLF.Models
{
    public partial class Role
    {
        public Role()
        {
            Tusers = new HashSet<Tuser>();
        }

        public int IdRol { get; set; }
        public string DescripcionRol { get; set; }

        public virtual ICollection<Tuser> Tusers { get; set; }
    }
}
