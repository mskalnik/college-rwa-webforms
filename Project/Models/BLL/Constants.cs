using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Models.BLL
{
    public enum Repos
    {
        Database,
        File
    }

    public enum Toastr
    {
        Warning,
        Success,
        Error,
        Info
    }    

    public static class Constants
    {
        public static char DELIMITER = '|';
        public static char END_LINE = '\n';
        public static char EMAIL_DELIMITER = '~';
        public static string TEXT_PATH = @"C:\Users\mskalnik\Documents\Faculty\2nd-year\4\RWA\exam\web-forms\RwaWebForms\Project\Data\FileRepo.txt";
        public static List<string> CITIES = new List<string>
        {
            "Zagreb",
            "Varazdin",
            "Split",
            "Rijeka",
            "Osijek",
            "Helsinki"
        };
    }
}