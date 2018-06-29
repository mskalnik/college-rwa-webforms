using Project.Models.BLL;
using System;
using System.Collections.Generic;

namespace Project.Models.DAL
{
    public interface IRepo
    {
        IList<Person> GetPersons();
        Person GetPerson(Guid id);
        bool AddPerson(Person person);
        bool DeletePerson(Guid id);
        bool UpdatePerson(Person p);
    }
}