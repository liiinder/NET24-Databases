using L011_MongoDB_EFcore.Models;
using L013_RepositoryPattern.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L013_RepositoryPattern.Models
{
    internal class UnitOfWork : IUnitOfWork
    {
        private readonly MongoDbContext context;
        public UnitOfWork(MongoDbContext context)
        {
            this.context = context;
            Movies = new Repository<Movie>(context);
        }

        public IRepository<Movie> Movies { get; private set; }

        public int Commit()
        {
            return context.SaveChanges();
        }

        public void Dispose()
        {
            context.Dispose();
        }
    }
}
