using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Models.BLL
{
    public class Person
    {
        //***********************************************
        public Guid             Id          { get; set; }
        public string           Name        { get; set; }
        public string           Surname     { get; set; }
        public List<string>     Email       { get; set; }
        public string           Telephone   { get; set; }
        public string           Password    { get; set; }
        public bool             Admin       { get; set; }
        public string           City        { get; set; }
        //***********************************************

        public Person()
        {
            Id = Guid.NewGuid();
        }

        public override string ToString() => $"{Id} {Name} {Surname} {EmailsFromFile()} {Telephone} {Password} {Admin} {City}";
        public override int GetHashCode() => this.Id.GetHashCode();
        private bool CompareEmails(List<string> first, List<string> second) => first.Intersect(second).Any();

        public string ToFile()
        {
            return
            $"{Id}{Constants.DELIMITER}"                +
            $"{Name}{Constants.DELIMITER}"              +
            $"{Surname}{Constants.DELIMITER}"           +
            $"{EmailsFromFile()}{Constants.DELIMITER}"  +
            $"{Telephone}{Constants.DELIMITER}"         +
            $"{Password}{Constants.DELIMITER}"          +
            $"{Admin}{Constants.DELIMITER}"             +
            $"{City}{Constants.END_LINE}"               ;
        }

        private string EmailsFromFile()
        {
            string s = "";
            foreach (var e in Email)
            {
                if (e.Trim().Length > 0)
                    s += e + Constants.EMAIL_DELIMITER;
            }
            return s;
        }

        public override bool Equals(object obj)
        {
            if (!(obj is Person other))
                return false;

            return CompareEmails(this.Email, other.Email);
        }        

        public static Person FromFile(string line)
        {
            string[] details = line.Split(Constants.DELIMITER);
            return new Person
            {
                Id          = Guid.Parse(details[0]),
                Name        = details[1],
                Surname     = details[2],
                Email       = EmailFromFile(details[3]),
                Telephone   = details[4],
                Password    = details[5],
                Admin       = bool.Parse(details[6]),
                City        = details[7]
            };
        }

        public static List<string> EmailFromFile(string line)
        {
            List<string> emails = new List<string>();
            string[] email = line.Split(Constants.EMAIL_DELIMITER);
            foreach (var e in email)
            {
                if (e.Trim().Length > 0)
                    emails.Add(e);
            }
            return emails;
        }
    }
}