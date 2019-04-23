using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace EventosUniamazonia.Conexion
{
    public class Encryption
    {
        Byte[] wordBytes;//Aqui se almacenara la matriz de bytes
        Byte[] hash;
        String hashInText;
        public Encryption()
        {
        }

        public String encrypt(String password)
        {
            wordBytes = new UnicodeEncoding().GetBytes(password);  //Unicode: representa caracteres en un valor numerico exclusivo
            hash = ((HashAlgorithm)CryptoConfig.CreateFromName("MD5")).ComputeHash(wordBytes); //Transformación de una cadena de caracteres en clave,(Quedo en formato bytes)
            hashInText = BitConverter.ToString(hash);
            return hashInText;
        }
    }
}