package service;

import dao.UsuarioDao;
import model.Usuario;

public class UsuarioService {
	
	
	public static void cadastrar(Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		dao.Cadastrar(usuario);
		
	}
	
	
	public static void main (String [] args ) {
		Usuario usuario = new Usuario();
		
		usuario.setNome("Guilherme");
		usuario.setEmail("guil@guil.com");
		usuario.setSenha("12345");
		usuario.setStatus(1);
		usuario.setTipo(1);
		
		
		cadastrar(usuario);
		
	}

}
