using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using L011_MongoDB_EFcore.Models;
using L013_RepositoryPattern.Repository;

namespace L013_RepositoryPattern.Models
{
    internal interface IUnitOfWork : IDisposable
    {
        IRepository<Movie> Movies { get; }
        int Commit();
    }
}
