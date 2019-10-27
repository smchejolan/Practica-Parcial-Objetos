import carpetas.*
import commits.*

class Branch{
	const property colaboradores = []
	const property commits = []

	method hacerCheckout(carpeta){
		commits.forEach({commit=>commit.aplicarCommit(carpeta)})
	}
	method agregarCommit(commit){
		commits.add(commit)
	}
	method blame(archivoAnalizado){
		var log = new Log(archivo = archivoAnalizado)
		return log.obtenerCommits(self).map({commit=>commit.autor()})
	}
}

class Log{
	const archivo
	
	method obtenerCommits(branch) = branch.commits().filter({commit => commit.cambios().any({cambio=>cambio.archivo()==archivo})}) 	
}