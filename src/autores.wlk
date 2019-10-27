import carpetas.*
import commits.*
import branch.*

class Usuario{
	var property clase 
	
	method crearBranch(colaboradores) {
			colaboradores.add(self)
			return new Branch(colaboradores=colaboradores)
		}
	method puedeRealizarCambiosEnBranch(branch) = clase.puedeRealizarCambios(branch,self)
	method hacerAdministradores(usuarios){
		clase.hacerAdministradores(usuarios)
	}
	method hacerUsuarioComun(usuario){
		clase.hacerUsuarioComun(usuario)
	}
	method hacerCommit(branch,descripcionCommit,cambiosCommit){
		if(self.puedeRealizarCambiosEnBranch(branch)){
			branch.commits().add(new Commit(autor = self,descripcion = descripcionCommit,cambios = cambiosCommit))
		}
	}
	method revertirUltimoCommit(branch){
		if(self.puedeRealizarCambiosEnBranch(branch)){
			branch.commits().add(branch.commits().last().revert(self))
		}
	}
}

object administrador{
	method puedeRealizarCambios(_1,_2) = true
	method hacerAdministradores(usuarios){
		usuarios.forEach({usuario => usuario.clase(self)})
	}
	method hacerUsuarioComun(usuario){
		usuario.clase(usuarioComun)
	}
	method cambioDeClase() = usuarioComun
}
object usuarioComun{
	method puedeRealizarCambios(branch,usuario) = branch.colaboradores().contains(usuario)
	method hacerAdministradores(usuario){}
	method hacerUsuarioComun(usuario){}	
}