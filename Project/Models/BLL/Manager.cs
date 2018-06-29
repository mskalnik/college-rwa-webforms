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
            IList<Person> persons = GetPersons();
            ISet<string> cities = new HashSet<string>();
            foreach (var p in persons)
            {
                cities.Add(p.City);
            }
            return cities;
        }        

        public ISet<string> GetEmails()
        {
            IList<Person> persons = GetPersons();
            ISet<string> emails = new HashSet<string>();
            persons.ToList().ForEach(p => emails.Add(p.Email.ToString()));
            //foreach (var p in persons)
            //{
            //    emails.Add(p.Email.ToString());
            //}
            return emails;
        }

        public bool IsLogged(string guid)
        {
            IList<Person> persons = GetPersons();
            foreach (var p in persons)
            {
                if (p.Id.Equals(Guid.Parse(guid)))
                    return true;
            }
            return false;
        }

        public bool LoginInfo(string email, string password)
        {
            throw new NullReferenceException();
        }
    }
}