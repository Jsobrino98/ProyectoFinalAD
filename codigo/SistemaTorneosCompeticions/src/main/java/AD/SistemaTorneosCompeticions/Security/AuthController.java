package AD.SistemaTorneosCompeticions.Security;

import AD.SistemaTorneosCompeticions.Models.Usuario;
import AD.SistemaTorneosCompeticions.Services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UsuarioService usuarioService;

    // Registro de usuario
    @PostMapping("/register")
    public String registerUser(@RequestBody Usuario user) {
        // Guardar el usuario en la base de datos
        usuarioService.guardar(user);
        return "Usuario registrado exitosamente";
    }

    // Login de usuario
    @PostMapping("/login")
    public String loginUser(@RequestBody Usuario usuario) {
        // Verificar si el usuario existe y si la contraseña es correcta
        Optional<Usuario> user = usuarioService.findByUsername(usuario.getNombreUsuario());
        if (user.isPresent() && user.get().getPassword().equals(usuario.getPassword())) {
            String token = jwtTokenUtil.generateToken(user.get().getNombreUsuario());
            return "Login exitoso: " + token;
        } else {
            return "Credenciales inválidas";
        }
    }
}
