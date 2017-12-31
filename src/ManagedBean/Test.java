package ManagedBean;

import java.util.ArrayList;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;

@SessionScoped
@ManagedBean(name = "test")
public class Test {
	
	
	
	private String nome;
	private ArrayList<String> lista = new ArrayList<>();

	public String addNome() {
		lista.add(nome);
		return "";
		
	}
	
	public ArrayList<String> getLista() {
		return lista;
	}
	
	public void setLista(ArrayList<String> lista) {
		this.lista = lista;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}	

}
