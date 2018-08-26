using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class UUser
    {
        //
        // Normal
        //
        private String url;
        private Int32 userId;
        private Int32 rolId;
        private String mensaje;
        //

        //
        // Session
        //
        private String sUserId;
        private String sUserName;
        private String sNombre;
        private String sApellido;
        private String sClave;
        private String sCorreo;
        private String sDocumento;
        private String sFoto;

        //

        private String userName;
        private String clave;
        private String rol;
        private String nombre;
        private String correo;
        private String apellido;
        private String telefono;
        private String direccion;
        private String documento;
        private String departamento;
        private String ciudad;
        private String foto;
        private String id_estudiante;
        private String estado;
        private string session;
        private string ip;
        private string mac;
        private string Id_Acudiente;
        private string Fecha_nacimiento;
        //public string UserName;
        private String observacion;
        private String materia;
        private String dia_materia;
        private String hora_in;
        private String hora_fin;
        private String curso;
        private String id_docente;
        private String cur_mat;
        private String año;
        private String idNota;
        private String nota1;
        private String nota2;
        private String nota3;
        private String notadef;
        private string inicio;
        private string mision;
        private string vision;

        public string UserName { get => userName; set => userName = value; }
        public string Clave { get => clave; set => clave = value; }
        public string Rol { get => rol; set => rol = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Documento { get => documento; set => documento = value; }
        public string Departamento { get => departamento; set => departamento = value; }
        public string Ciudad { get => ciudad; set => ciudad = value; }
        public string Foto { get => foto; set => foto = value; }
        public string Id_estudiante { get => id_estudiante; set => id_estudiante = value; }
        public string Estado { get => estado; set => estado = value; }
        public string Session { get => session; set => session = value; }
        public string Ip { get => ip; set => ip = value; }
        public string Mac { get => mac; set => mac = value; }
        public string id_Acudiente { get => Id_Acudiente; set => Id_Acudiente = value; }
        public string fecha_nacimiento { get => Fecha_nacimiento; set => Fecha_nacimiento = value; }
        public string Observacion { get => observacion; set => observacion = value; }
        public string Materia { get => materia; set => materia = value; }
        public string Dia_materia { get => dia_materia; set => dia_materia = value; }
        public string Hora_in { get => hora_in; set => hora_in = value; }
        public string Hora_fin { get => hora_fin; set => hora_fin = value; }
        public string Curso { get => curso; set => curso = value; }
        public string Id_docente { get => id_docente; set => id_docente = value; }
        public string Cur_mat { get => cur_mat; set => cur_mat = value; }
        public string Año { get => año; set => año = value; }
        public string IdNota { get => idNota; set => idNota = value; }
        public string Nota1 { get => nota1; set => nota1 = value; }
        public string Nota2 { get => nota2; set => nota2 = value; }
        public string Nota3 { get => nota3; set => nota3 = value; }
        public string Notadef { get => notadef; set => notadef = value; }
        public string Inicio { get => inicio; set => inicio = value; }
        public string Mision { get => mision; set => mision = value; }
        public string Vision { get => vision; set => vision = value; }



        public string Url { get => url; set => url = value; }
        public int UserId { get => userId; set => userId = value; }
        public int RolId { get => rolId; set => rolId = value; }
        public string Mensaje { get => mensaje; set => mensaje = value; }


        public string SUserId { get => sUserId; set => sUserId = value; }
        public string SUserName { get => sUserName; set => sUserName = value; }
        public string SNombre { get => sNombre; set => sNombre = value; }
        public string SApellido { get => sApellido; set => sApellido = value; }
        public string SClave { get => sClave; set => sClave = value; }
        public string SCorreo { get => sCorreo; set => sCorreo = value; }
        public string SDocumento { get => sDocumento; set => sDocumento = value; }
        public string SFoto { get => sFoto; set => sFoto = value; }
    }
}
