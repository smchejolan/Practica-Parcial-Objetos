import carpetas.*

class Commit{
	var descripcion 
	const cambios  = []
	
	method aplicarCommit(carpeta){
		cambios.forEach({cambio=>cambio.aplicarCambio(carpeta)})
	}
}

class CrearArchivo{
	const archivo
	method aplicarCambio(carpeta){
		 var nuevoArchivo = new Archivo(nombre=archivo,contenido="")
		 carpeta.agregarArchivo(nuevoArchivo) 
	}
}
class CambiosSobreArchivos{
	const archivo
	method aplicarCambio(carpeta){
		if(!carpeta.contieneA(archivo)) self.error("El archivo que se quiere modificar NO existe")
		self.cambioEspecifico(carpeta)	
	}
	method cambioEspecifico(carpeta)
}
class EliminarArchivo inherits CambiosSobreArchivos{
	override method cambioEspecifico(carpeta){
		carpeta.borrarArchivo(archivo)
	}
}
class CambioAgregar inherits CambiosSobreArchivos{
	const texto
	override method cambioEspecifico(carpeta){
		carpeta.obtenerArchivo(archivo).agregarContenido(texto)
	}
}
class CambioSacar inherits CambiosSobreArchivos{
	const texto
	
	override method cambioEspecifico(carpeta){
		carpeta.obtenerArchivo(archivo).borrarContenido(texto)
	}
}