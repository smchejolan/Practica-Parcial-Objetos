import carpetas.*
import commits.*

class Branch{
	const carpeta
	const property commits = []

	method hacerCheckout(){
		commits.forEach({commit=>commit.aplicarCommit(carpeta)})
	}
	method agregarCommit(commit){
		commits.add(commit)
	}
}

class Log{
	const archivo
	
	method obtenerCommits(branch) = branch.commits().filter({commit => commit.cambios().any({cambio=>cambio.archivo()==archivo})}) 	
}