﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OfficeEquipmentRepair.DataBase
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DEMEntities : DbContext
    {
        public DEMEntities()
            : base("name=DEMEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DataComment> DataComments { get; set; }
        public virtual DbSet<DataRequest> DataRequests { get; set; }
        public virtual DbSet<DataUser> DataUsers { get; set; }
        public virtual DbSet<OrgTechType> OrgTechTypes { get; set; }
        public virtual DbSet<ProblemDescryption> ProblemDescryptions { get; set; }
        public virtual DbSet<RequestStatus> RequestStatuses { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Type> Types { get; set; }
    }
}