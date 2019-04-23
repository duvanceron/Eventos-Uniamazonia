using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace EventosUniamazonia.Controllers
{
    public class Validations
    {
        Regex regLetter;
        public Validations()
        {
            regLetter = new Regex("^[A-Z & a-z]*$");
        }

        public Boolean validateEmpty(String word)
        {
            if (word == null || word.Equals(""))
            {
                return true;
            }
            return false;
        }
        public Boolean IsNumber(String word)
        {
            int letter;
            try
            {
                letter = Convert.ToInt32(word);
                return true;

            }
            catch
            {
                return false;
            }

        }

        public Boolean isLetter(String word)
        {
            if (regLetter.IsMatch(word))
            {
                return true;
            }
            return false;
        }

        public Boolean equalPassword(String word1, String word2)
        {
            if (word1.Equals(word2))
            {
                return true;
            }
            return false;
        }

        public Boolean IsLetterOrEmpty(String word)
        {

            if (regLetter.IsMatch(word) || !validateEmpty(word))
            {
                return true;
            }
            return false;
        }


    }
}