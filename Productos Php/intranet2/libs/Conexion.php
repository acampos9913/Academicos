<?php 
class DBManager{
  var $conect;
     function DBManager(){
	 }
	 
	 function getCon(){
	 return $this->conect;
	 }
	 
	 function conectar() {
	     if(!($con=@mysql_connect("localhost","root","mysql")))
		 {
		     echo"Error al conectar a la base de datos";	
			 exit();
	      }
		  if (!@mysql_select_db("practica",$con)) {
		   echo "error al seleccionar la base de datos";  
		   exit();
		  }
	       $this->conect=$con;
		   return true;	
	 }
	 
	 function desconectar(){
		$this->conect = @mysql_close($con);
	 }
}

?>