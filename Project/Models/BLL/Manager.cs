using Project.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Models.BLL
{
    public class Manager : IRepo
    {
        private static IRepo repo = RepoFactory.GetRepo(Repos.File);

        //****************************Repo functions***************************************
        public IList<Person> GetPersons()       => repo.GetPersons();
        public Person GetPerson(Guid id)        => repo.GetPerson(id);
        public bool AddPerson(Person person)    => repo.AddPerson(person);
        public bool DeletePerson(Guid id)       => repo.DeletePerson(id);
        public bool UpdatePerson(Person p)      => repo.UpdatePerson(p);

        //****************************Manager functions*************************************
        public ISet<string> GetCities()
        {
            //ISet<string> cities = new HashSet<string>();
            //foreach (var p in persons)
            //{
            //    cities.Add(p.City);
            //}
            return Constants.CITIES;
        }        

        public ISet<string> GetEmails()
        {
            IList<Person> persons = repo.GetPersons();
            ISet<string> emails = new HashSet<string>();
            foreach (var p in persons)
            {
                foreach (var e in p.Email)
                {
                    emails.Add(e);
                }
            }
            return emails;
        }

        public bool IsLogged(string guid)
        {
            IList<Person> persons = repo.GetPersons();
            foreach (var p in persons)
            {
                if (p.Id.Equals(Guid.Parse(guid)))
                    return true;
            }
            return false;
        }

        public Person LoginInfo(string email)
        {
            IList<Person> persons = repo.GetPersons();
            foreach (var p in persons)
            {
                foreach (var e in p.Email)
                {
                    if (e == email)
                        return p;
                }
            }
            return null;
        }
    }
}