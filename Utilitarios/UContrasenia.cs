using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class UContrasenia
    {
        private Int32 userId;
        private Int32 rol;
        private String session;
        private String ip;
        private String mac;
        private String clave;
        private String user_name;

        public int UserId { get => userId; set => userId = value; }
        public int Rol { get => rol; set => rol = value; }
        public string Session { get => session; set => session = value; }
        public string Ip { get => ip; set => ip = value; }
        public string Mac { get => mac; set => mac = value; }
        public string Clave { get => clave; set => clave = value; }
        public string User_name { get => user_name; set => user_name = value; }
    }
}
