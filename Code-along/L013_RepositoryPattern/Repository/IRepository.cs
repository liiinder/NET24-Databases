using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L013_RepositoryPattern.Repository
{
    internal interface IRepository<TEntity> where TEntity : class 
    {
        TEntity Get(int id);

        TEntity Get(string id);

        IEnumerable<TEntity> GetAll();

        IEnumerable<TEntity> Find(Func<TEntity, bool> predicate);

        void Add(TEntity entity);

        void AddRange(IEnumerable<TEntity> entities);

        void Remove(TEntity entity);

        void RemoveRange(IEnumerable<TEntity> entities);
    }
}
