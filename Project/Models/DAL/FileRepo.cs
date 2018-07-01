using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Project.Models.BLL;

namespace Project.Models.DAL
{
    public class FileRepo : IRepo
    {
        public FileRepo()
        {
            CreateIfNotExists();
        }

        private void CreateIfNotExists()
        {
            if (!File.Exists(Constants.TEXT_PATH))
            {
                File.Create(Constants.TEXT_PATH).Close();                
            }
        }

        public bool AddPerson(Person person)
        {
            IList<Person> persons = GetPersons();
            foreach (var p in persons)
            {
                if (p.Equals(person))
                    return false;
            }
            persons.Add(person);
            File.WriteAllLines(Constants.TEXT_PATH, persons.Select(p => p.ToFile()));
            return true;
        }

        public bool DeletePerson(Guid id)
        {
            IList<Person> oldList = GetPersons();
            IList<Person> newList = new List<Person>();

            foreach (var o in oldList)
            {
                if (o.Id != id)
                    newList.Add(o);
            }

            try
            {
                File.WriteAllLines(Constants.TEXT_PATH, newList.Select(p => p.ToFile()));
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IList<Person> GetPersons()
        {
            IList<Person> persons = new List<Person>();
            IEnumerable<string> lines = File.ReadAllLines(Constants.TEXT_PATH);
            foreach (var line in lines)
            {
                if (line.Trim().Length != 0)
                    persons.Add(Person.FromFile(line));
            }
            return persons;
        }

        public bool UpdatePerson(Person p)
        {
            IList<Person> persons = GetPersons();
            for (int i = 0; i < persons.Count; i++)
            {
                if (persons[i].Id == p.Id)
                {
                    persons[i] = p;
                }
            }

            try
            {
                File.WriteAllLines(Constants.TEXT_PATH, persons.Select(pe => pe.ToFile()));
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Person GetPerson(Guid id)
        {
            IList<Person> persons = GetPersons();
            foreach (var p in persons)
            {
                if (p.Id.Equals(id))
                    return p;
            }
            return null;
        }
    }
}