using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace EventosUniamazonia.Controllers
{
    public class emailAplication
    {
        Boolean state;
        MailMessage email; //Representa un mensaje de correo electrónico que puede enviarse mediante el SmtpClient clase.
        SmtpClient protocolo;//Permite que las aplicaciones enviar correo electrónico mediante el protocolo Simple de transferencia de correo (SMTP).
        String merror;
        String emailUser;
        String password;
        string [] chain;
        public emailAplication()
        {
            state = true;
            email = new MailMessage();
            emailUser = "dceron10130204@gmail.com";
            password = "10130204";
            email.From = new MailAddress(emailUser, "Eventos Universidad de la Amazonia", System.Text.Encoding.UTF8);//un mensaje de correo con  la direccion, nombre y la codificacion del cuerpo del mensaje
            protocolo = new SmtpClient();
        }

        public Boolean IsCorrectEmail(string addressee, string affair, string body)
        {
            chain = addressee.Split(',');
            foreach (string word in chain) {
                email.To.Add(word.Trim());
            }
           
            email.Subject = affair;
            email.Body = body;
            //email.IsBodyHtml = false;
            protocolo.Credentials = new System.Net.NetworkCredential(emailUser, password);
            protocolo.Port = 587;
            protocolo.Host = "smtp.gmail.com";
            protocolo.EnableSsl = true;
            try
            {
                protocolo.Send(email);
            }
            catch (SmtpException error)
            {
                state = false;
                merror = error.Message.ToString();
                return state;
            }

            return state;
        }
    }
}