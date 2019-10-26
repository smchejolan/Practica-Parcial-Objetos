import carpetas.*

class Commit{
	var descripcion 
	const property cambios  = []
	
	method aplicarCommit(carpeta){
		cambios.forEach({cambio=>cambio.aplicarCambio(carpeta)})
		//carpeta.branch().agregarCommit(self)
	}
	method revert() = new Commit(descripcion = "Revert " + descripcion,cambios=self.crearCambiosRevert())  
	method crearCambiosRevert() = cambios.map({cambio=>cambio.obtenerInverso()}).reverse()
}


class CrearArchivo{
	const property archivo
	method aplicarCambio(carpeta){
		 var nuevoArchivo = new Archivo(nombre=archivo,contenido="")
		 carpeta.agregarArchivo(nuevoArchivo) 
	}
	method obtenerInverso() = new EliminarArchivo(archivo=archivo)
}
class CambiosSobreArchivos{
	const property archivo
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
	method obtenerInverso() = new CrearArchivo(archivo=archivo)
}
class CambioAgregar inherits CambiosSobreArchivos{
	const texto
	override method cambioEspecifico(carpeta){
		carpeta.obtenerArchivo(archivo).agregarContenido(texto)
	}
	method obtenerInverso() = new CambioSacar(archivo=archivo,texto = texto)
}
class CambioSacar inherits CambiosSobreArchivos{
	const texto
	
	override method cambioEspecifico(carpeta){
		carpeta.obtenerArchivo(archivo).borrarContenido(texto)
	}
	method obtenerInverso() =  new CambioAgregar(archivo=archivo,texto = texto)
}