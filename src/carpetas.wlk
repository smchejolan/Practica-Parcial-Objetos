class Carpeta{
	var nombre
	const archivos = []
	method agregarArchivo(nuevoArchivo){
		if(archivos.any({archivo=>archivo.nombre()==nuevoArchivo.nombre()})) self.error("El archivo ya existe en la carpeta")
		archivos.add(nuevoArchivo)	
	}
	method contieneA(nombreDeArchivo) = archivos.any({archivo => nombreDeArchivo == archivo.nombre()})
	method obtenerArchivo(nombreDeArchivo) = archivos.find({archivo=>archivo.nombre()==nombreDeArchivo})
	method borrarArchivo(nombreDelArchivo){
		archivos.remove(self.obtenerArchivo(nombreDelArchivo))
	}
	method vacia() = archivos.isEmpty() 
}

class Archivo{
	var property nombre	
	var property contenido	
	
	method agregarContenido(texto){
		contenido = contenido + texto
	}
	method borrarContenido(texto){
		if(contenido.endsWith(texto)) 
			contenido = contenido.takeLeft(texto.size()) 
	}
}