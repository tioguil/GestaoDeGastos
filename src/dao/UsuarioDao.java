package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Usuario;

public class UsuarioDao {

	public boolean Cadastrar(Usuario usuario) {

		String sql = "Insert into usuario (nome, email, senha, tipo, status) value (?, ?, ?, ?,? )";

		try (Connection con = ConnectionFactory.obtemConexao()) {
			con.setAutoCommit(false);

			try (PreparedStatement stm = (PreparedStatement) con.prepareStatement(sql);) {
				stm.setString(1, usuario.getNome());
				stm.setString(2, usuario.getEmail());
				stm.setString(3, usuario.getSenha());
				stm.setInt(4, usuario.getTipo());
				stm.setInt(5, usuario.getStatus());

				con.commit();
				con.setAutoCommit(true);

			} catch (Exception e) {
				con.rollback();
				con.setAutoCommit(true);
				e.printStackTrace();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return true;
	}

}
