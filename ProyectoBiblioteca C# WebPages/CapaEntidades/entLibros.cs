using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class entLibros
    {
    public int  LibrosCodigo { get; set; }		
    public String LibrosDescripcion { get; set; }
    public String LibrosEstado { get; set; }
    public String LibrosTitulo { get; set; }
    public int LibrosEjemplares	{ get; set; }
    public String LibrosImagen { get; set; }
    public String LibrosObservaciones { get; set; }
    public int LibrosStock	{ get; set; }
    public entAutores Autores { get; set; }
    public entEditores Editores	{ get; set; }
    public entCategorias Categorias	{ get; set; }
	
    }
}
