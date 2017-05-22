package br.com.voo.bll;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.voo.dal.ItinerarioDAO;
import br.com.voo.model.Itinerario;

public class ItinerarioBS {

	ItinerarioDAO dao;

	public ItinerarioBS(ItinerarioDAO dao) {
		super();
		this.dao = dao;
	}

	public ItinerarioBS() {
		super();
		dao = new ItinerarioDAO();
	}

	public boolean salvar(Itinerario itinerario) {

		try {
			if (validarItinerario(itinerario)) {
				if (itinerario.getId() == 0) {
					return dao.incluir(itinerario);

				} else {
					return dao.alterar(itinerario);
				}
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean remover(Itinerario itinerario) {
		try {
			if ((itinerario.getId() != null) && (itinerario.getId() != 0)) {
				dao.remover(itinerario.getId());
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Itinerario> listar() {
		try {
			return dao.listar();
		} catch (SQLException e) {
			e.printStackTrace();
			return new ArrayList<Itinerario>();
		}
	}

	private boolean validarItinerario(Itinerario itinerario) {
		if (itinerario != null) {
			if (itinerario.getOrigem() != null && itinerario.getDestino() != null) {
				if (itinerario.getOrigem().isEmpty() || itinerario.getDestino().isEmpty()) {
					return false;
				}
			} else {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}
	
	public Itinerario consultar(Long id){
		try {
			return dao.consultar(id);
		} catch (Exception e) {
			e.printStackTrace();		}
			return new Itinerario();
	}
}
