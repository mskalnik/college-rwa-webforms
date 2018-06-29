using Project.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Models.BLL
{
    public static class RepoFactory
    {
        public static IRepo GetRepo(Repos repo)
        {
            switch (repo)
            {
                case Repos.Database:
                    //return new DatabaseRepo();
                case Repos.File:
                    return new FileRepo();
                default:
                    return null;
            }
        }
    }
}