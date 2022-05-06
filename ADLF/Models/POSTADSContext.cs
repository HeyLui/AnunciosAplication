using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ADLF.Models
{
    public partial class POSTADSContext : DbContext
    {
        public POSTADSContext()
        {
        }

        public POSTADSContext(DbContextOptions<POSTADSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Anuncio> Anuncios { get; set; }
        public virtual DbSet<CategoriaAd> CategoriaAds { get; set; }
        public virtual DbSet<PuntajeUserAd> PuntajeUserAds { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Tuser> Tusers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(localdb)\\Servicios;Database=POSTADS;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Anuncio>(entity =>
            {
                entity.HasKey(e => e.IdAd);

                entity.Property(e => e.IdAd).HasColumnName("idAd");

                entity.Property(e => e.Calificacion).HasColumnType("decimal(18, 1)");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(700)
                    .IsUnicode(false);

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.Fecha)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("fecha");

                entity.Property(e => e.IdTipoad).HasColumnName("idTipoad");

                entity.Property(e => e.Imagen).HasColumnType("image");

                entity.Property(e => e.Imagen2).HasColumnType("image");

                entity.Property(e => e.Imagen3).HasColumnType("image");

                entity.Property(e => e.NombreAd)
                    .HasMaxLength(70)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdTipoadNavigation)
                    .WithMany(p => p.Anuncios)
                    .HasForeignKey(d => d.IdTipoad)
                    .HasConstraintName("FK_Anuncios_CategoriaAds");
            });

            modelBuilder.Entity<CategoriaAd>(entity =>
            {
                entity.HasKey(e => e.IdTipoad);

                entity.Property(e => e.IdTipoad).HasColumnName("idTipoad");

                entity.Property(e => e.CategoriaName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PuntajeUserAd>(entity =>
            {
                entity.HasKey(e => e.Idpuntajeusuario);

                entity.ToTable("Puntaje_User_Ads");

                entity.Property(e => e.Idpuntajeusuario).HasColumnName("idpuntajeusuario");

                entity.Property(e => e.IdAd).HasColumnName("idAd");

                entity.Property(e => e.IdUsers).HasColumnName("idUsers");

                entity.HasOne(d => d.IdAdNavigation)
                    .WithMany(p => p.PuntajeUserAds)
                    .HasForeignKey(d => d.IdAd)
                    .HasConstraintName("FK_Puntaje_User_Ads_Anuncios");

                entity.HasOne(d => d.IdUsersNavigation)
                    .WithMany(p => p.PuntajeUserAds)
                    .HasForeignKey(d => d.IdUsers)
                    .HasConstraintName("FK_Puntaje_User_Ads_TUsers");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdRol);

                entity.Property(e => e.IdRol).HasColumnName("idRol");

                entity.Property(e => e.DescripcionRol)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Tuser>(entity =>
            {
                entity.HasKey(e => e.IdUsers);

                entity.ToTable("TUsers");

                entity.Property(e => e.IdUsers).HasColumnName("idUsers");

                entity.Property(e => e.IdRol).HasColumnName("idRol");

                entity.Property(e => e.Pass)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .HasMaxLength(18)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.Tusers)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("FK_TUsers_Roles");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
