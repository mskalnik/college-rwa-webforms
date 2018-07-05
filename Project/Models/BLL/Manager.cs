using Project.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Project.Models.BLL
{
    public class Manager : IRepo
    {
        public static IRepo repo;

        public Manager()
        {
            repo = RepoFactory.GetRepo(MyPage.ChangeManager());
        }

        //****************************Repo functions***************************************
        public IList<Person> GetPersons()       => repo.GetPersons();
        public Person GetPerson(Guid id)        => repo.GetPerson(id);
        public bool AddPerson(Person person)    => repo.AddPerson(person);
        public bool DeletePerson(Guid id)       => repo.DeletePerson(id);
        public bool UpdatePerson(Person p)      => repo.UpdatePerson(p);

        //****************************Manager functions*************************************
        public IList<string> GetCities() => Constants.CITIES;        

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

        public bool IsLogged(Guid id)
        {
            IList<Person> persons = repo.GetPersons();
            foreach (var p in persons)
            {
                if (p.Id.Equals(id))
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