package br.com.voo.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.voo.bll.AeronaveBS;
import br.com.voo.bll.ItinerarioBS;
import br.com.voo.bll.VooBS;
import br.com.voo.model.Aeronave;
import br.com.voo.model.Itinerario;
import br.com.voo.model.Voo;

@WebServlet("/Voo")
public class VooController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String TELA = "/voo.jsp";
    private AeronaveBS aeronaveBS;
    private ItinerarioBS itinerarioBS;
    private VooBS vooBS;
	
    public VooController() {
        super();
        aeronaveBS = new AeronaveBS();
        itinerarioBS = new ItinerarioBS();
        vooBS = new VooBS();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		List<Voo> voos = new ArrayList<Voo>();
		List<Aeronave> aeronaves = new ArrayList<Aeronave>();
		List<Itinerario> itinerarios = new ArrayList<Itinerario>();
		
		
		if(acao.equals("listar")){
			try {
				voos = vooBS.listar();
				aeronaves = aeronaveBS.listar();
				itinerarios = itinerarioBS.listar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("aeronaves", aeronaves);
		request.setAttribute("itinerarios", itinerarios);
		request.setAttribute("voos", voos);
		RequestDispatcher view = request.getRequestDispatcher(TELA);
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Voo> voos = new ArrayList<Voo>();
		List<Aeronave> aeronaves = new ArrayList<Aeronave>();
		List<Itinerario> itinerarios = new ArrayList<Itinerario>();
		
		Long idVoo = new Long(0);
		Long idAeronave = new Long(0);
		Long idItinerario = new Long(0);
		LocalDate horario = LocalDate.now();
		
		String vooIdTela = request.getParameter("id");
		String aeronave = request.getParameter("aeronave");
		String itinerario = request.getParameter("itinerario");
		
		
		if(vooIdTela != null && !"".equals(vooIdTela)){
			idVoo = Long.parseLong(vooIdTela);
		}
		if(aeronave != null && !"".equals(aeronave)){
			idAeronave = Long.parseLong(aeronave);
		}
		if(itinerario != null && !"".equals(itinerario)){
			idItinerario = Long.parseLong(itinerario);
		}
		
		
		try {
			vooBS.salvar(
				new Voo(
					idVoo,
					horario,
					new Itinerario(idItinerario),
					new Aeronave(idAeronave)));
			
			voos = vooBS.listar();
			aeronaves = aeronaveBS.listar();
			itinerarios = itinerarioBS.listar();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("aeronaves", aeronaves);
		request.setAttribute("itinerarios", itinerarios);
		request.setAttribute("voos", voos);
		RequestDispatcher view = request.getRequestDispatcher(TELA);
		view.forward(request, response);
	}

}
