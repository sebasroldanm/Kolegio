using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EUser
/// </summary>
public class EUser
{
    public EUser()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
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
    public string id_Acudiente;
    public string fecha_nacimiento;
    public string UserName;
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

    public string docestudiante
    {
        get
        {
            return userName;
        }

        set
        {
            userName = value;
        }
    }

    public string Clave
    {
        get
        {
            return clave;
        }

        set
        {
            clave = value;
        }
    }

    public string Rol
    {
        get
        {
            return rol;
        }

        set
        {
            rol = value;
        }
    }

    public string Nombre
    {
        get
        {
            return nombre;
        }

        set
        {
            nombre = value;
        }
    }

    public string Correo
    {
        get
        {
            return correo;
        }

        set
        {
            correo = value;
        }
    }

    public string Apellido
    {
        get
        {
            return apellido;
        }

        set
        {
            apellido = value;
        }
    }

    public string Telefono
    {
        get
        {
            return telefono;
        }

        set
        {
            telefono = value;
        }
    }

    public string Direccion
    {
        get
        {
            return direccion;
        }

        set
        {
            direccion = value;
        }
    }

    public string Documento
    {
        get
        {
            return documento;
        }

        set
        {
            documento = value;
        }
    }

    public string Foto
    {
        get
        {
            return foto;
        }

        set
        {
            foto = value;
        }
    }

    public string Departamento
    {
        get
        {
            return departamento;
        }

        set
        {
            departamento = value;
        }
    }

    public string Ciudad
    {
        get
        {
            return ciudad;
        }

        set
        {
            ciudad = value;
        }
    }

    public string Id_estudiante
    {
        get
        {
            return id_estudiante;
        }

        set
        {
            id_estudiante = value;
        }
    }

    public string Estado
    {
        get
        {
            return estado;
        }

        set
        {
            estado = value;
        }
    }

    public string Session
    {
        get
        {
            return session;
        }

        set
        {
            session = value;
        }
    }

    public string Ip
    {
        get
        {
            return ip;
        }

        set
        {
            ip = value;
        }
    }

    public string Mac
    {
        get
        {
            return mac;
        }

        set
        {
            mac = value;
        }
    }

    public string Observacion
    {
        get
        {
            return observacion;
        }

        set
        {
            observacion = value;
        }
    }

    public string Materia
    {
        get
        {
            return materia;
        }

        set
        {
            materia = value;
        }
    }

    public string Dia_materia
    {
        get
        {
            return dia_materia;
        }

        set
        {
            dia_materia = value;
        }
    }

    public string Hora_in
    {
        get
        {
            return hora_in;
        }

        set
        {
            hora_in = value;
        }
    }

    public string Hora_fin
    {
        get
        {
            return hora_fin;
        }

        set
        {
            hora_fin = value;
        }
    }

    public string Curso
    {
        get
        {
            return curso;
        }

        set
        {
            curso = value;
        }
    }

    public string Id_docente
    {
        get
        {
            return id_docente;
        }

        set
        {
            id_docente = value;
        }
    }

    public string Cur_mat
    {
        get
        {
            return cur_mat;
        }

        set
        {
            cur_mat = value;
        }
    }

    public string Año
    {
        get
        {
            return año;
        }

        set
        {
            año = value;
        }
    }

    public string IdNota
    {
        get
        {
            return idNota;
        }

        set
        {
            idNota = value;
        }
    }

    public string Nota1
    {
        get
        {
            return Nota11;
        }

        set
        {
            Nota11 = value;
        }
    }

    public string Nota11
    {
        get
        {
            return Nota12;
        }

        set
        {
            Nota12 = value;
        }
    }

    public string Nota12
    {
        get
        {
            return nota1;
        }

        set
        {
            nota1 = value;
        }
    }

    public string Nota3
    {
        get
        {
            return nota3;
        }

        set
        {
            nota3 = value;
        }
    }

    public string Notadef
    {
        get
        {
            return notadef;
        }

        set
        {
            notadef = value;
        }
    }

    public string Nota2
    {
        get
        {
            return nota2;
        }

        set
        {
            nota2 = value;
        }
    }

    public string Inicio
    {
        get
        {
            return inicio;
        }

        set
        {
            inicio = value;
        }
    }

    public string Mision
    {
        get
        {
            return mision;
        }

        set
        {
            mision = value;
        }
    }

    public string Vision
    {
        get
        {
            return vision;
        }

        set
        {
            vision = value;
        }
    }
}
