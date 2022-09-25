using Microsoft.EntityFrameworkCore;

namespace NavratanTechTask.Models
{
    public class DatabaseContext : DbContext
    {
        
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
        }
        public DbSet<User> User { get; set; }
        public DbSet<ApplicationLog> ApplicationLog { get; set; }
        public DbSet<Orders> Orders { get; set; }

    }
}
