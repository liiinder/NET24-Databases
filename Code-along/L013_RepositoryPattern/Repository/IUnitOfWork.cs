using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using L013_RepositoryPattern.Models;

namespace L013_RepositoryPattern.Repository
{
    internal interface IUnitOfWork : IDisposable
    {
        IMovieRepository Movies { get; }
        int Commit();
    }
}
