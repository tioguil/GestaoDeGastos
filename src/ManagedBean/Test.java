package ManagedBean;

import javax.faces.bean.ManagedBean;

@ManagedBean(name = "test")
public class Test {
	
	
	
	private String nome, sobrenome, juntos;

	public String juntar() {
		juntos = nome + " " + sobrenome;
		return "";
		
		
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public String getJuntos() {
		return juntos;
	}

	public void setJuntos(String juntos) {
		this.juntos = juntos;
	}
	
	

}
