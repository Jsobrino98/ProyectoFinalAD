package AD.SistemaTorneosCompeticions.Controllers.HTMLControllers;

import AD.SistemaTorneosCompeticions.Models.DTO.UsuarioDTO;
import AD.SistemaTorneosCompeticions.Models.Equipo;
import AD.SistemaTorneosCompeticions.Models.Jugador;
import AD.SistemaTorneosCompeticions.Models.Torneo;
import AD.SistemaTorneosCompeticions.Models.Usuario;
import AD.SistemaTorneosCompeticions.Services.EquipoService;
import AD.SistemaTorneosCompeticions.Services.JugadorService;
import AD.SistemaTorneosCompeticions.Services.TorneoService;
import AD.SistemaTorneosCompeticions.Services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private EquipoService equipoService;
    @Autowired
    private TorneoService torneoService;
    @Autowired
    private JugadorService jugadorService;
    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/home")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/equipos")
    public String equipos(Model model) {
        try {
            List<Equipo> equipos = equipoService.obtenerTodos();  // Verifica que esto no cause excepciones
            model.addAttribute("equipos", equipos);
            return "equipos";  // Devuelve la vista "equipos.html"
        } catch (Exception e) {
            e.printStackTrace();  // Esto ayudará a ver el error en los logs
            model.addAttribute("error", "Hubo un problema al cargar los equipos: " + e.getMessage());
            return "error";  // Redirige a una página de error personalizada
        }
    }


    @GetMapping("/torneos")
    public String torneos(Model model) {
        try {
            List<Torneo> torneos = torneoService.listarTorneos();
            model.addAttribute("torneos", torneos);
            return "torneos";  // Devuelve la vista "torneos.html"
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Hubo un problema al cargar los torneos: " + e.getMessage());
            return "error";  // Redirige a una página de error personalizada
        }
    }

    @GetMapping("/jugadores")
    public String jugadores(Model model) {
        try {
            List<Jugador> jugadores = jugadorService.obtenerTodos();
            model.addAttribute("jugadores", jugadores);
            return "jugadores";  // Devuelve la vista "jugadores.html"
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Hubo un problema al cargar los jugadores: " + e.getMessage());
            return "error";  // Redirige a una página de error personalizada
        }
    }

    @GetMapping("/usuarios")
    public String listarUsuarios(Model model) {
        List<Usuario> usuarios = usuarioService.listarTodosLosUsuarios();
        model.addAttribute("usuarios", usuarios);  // Asegúrate de que 'usuarios' es el nombre correcto en el modelo
        return "usuarios";  // Esto debe coincidir con tu vista 'usuarios.html'
    }


    // Mostrar el formulario de registro
    @GetMapping("/registro")
    public String registroForm(Model model) {
        model.addAttribute("usuario", new Usuario()); // Crea un objeto de usuario vacío para el formulario
        return "registro"; // Nombre de la vista Thymeleaf
    }

    // Procesar el formulario de registro
    @PostMapping("/registro")
    public String registrarUsuario(@ModelAttribute("usuario") Usuario usuario, Model model) {
        try {
            usuarioService.guardar(usuario);
            return "redirect:/home"; // Redirige a la página principal tras el registro exitoso
        } catch (Exception e) {
            model.addAttribute("error", "Hubo un error al registrar el usuario. Intenta de nuevo.");
            return "registro";
        }
    }


    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("usuario", new Usuario()); // Crea un objeto vacío para el formulario
        return "login"; // Devuelve la vista Thymeleaf "login.html"
    }


}
