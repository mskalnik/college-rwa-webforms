using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.ApplicationBlocks.Data;
using Project.Models.BLL;

namespace Project.Models.DAL
{
    public class DatabaseRepo : IRepo
    {
        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public bool AddPerson(Person p)
        {
            throw new NotImplementedException();
        }

        public bool DeletePerson(Guid id)
        {
            throw new NotImplementedException();
        }

        public Person GetPerson(Guid id)
        {
            DataRow row = SqlHelper.ExecuteDataset(cs, "GetPerson", id.ToString()).Tables[0].Rows[0];
            return new Person
            {
                Id = Guid.Parse(row["Id"].ToString()),
                Name = row["Name"].ToString(),
                Surname = row["Surname"].ToString(),
                Email = GetEmails(id),
                Telephone = row["Telephone"].ToString(),
                Password = row["Password"].ToString(),
                Admin = bool.Parse(row["Admin"].ToString()),
                City = Constants.CITIES[(int)row["CityId"] - 1]
            };
        }

        private List<string> GetEmails(Guid id)
        {
            List<string> emails = new List<string>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "GetEmails", id.ToString());
            DataTable tblEmails = ds.Tables[0];
            foreach (DataRow row in tblEmails.Rows)
            {
                emails.Add(row["Email"].ToString());
            }
            return emails;
        }

        public IList<Person> GetPersons()
        {
            IList<Person> persons = new List<Person>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "GetPersons");
            DataTable tblPersons = ds.Tables[0];
            foreach (DataRow row in tblPersons.Rows)
            {
                Person p = new Person();

                p.Id = Guid.Parse(row["Id"].ToString());
                p.Name = row["Name"].ToString();
                p.Surname = row["Surname"].ToString();
                p.Email = GetEmails(p.Id);
                p.Telephone = row["Telephone"].ToString();
                p.Password = row["Password"].ToString();
                p.Admin = bool.Parse(row["Admin"].ToString());
                p.City = Constants.CITIES[(int)row["CityId"]];
                persons.Add(p);
            }
            return persons;
        }

        public bool UpdatePerson(Person p)
        {
            throw new NotImplementedException();
        }


    }
}