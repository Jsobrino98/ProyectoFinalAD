package AD.SistemaTorneosCompeticions.Services;

import AD.SistemaTorneosCompeticions.Models.Usuario;
import AD.SistemaTorneosCompeticions.Repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;


    public Usuario guardar(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario findByUsernameOrEmail(String usernameOrEmail) {
        Optional<Usuario> usuario = usuarioRepository.findByNombreUsuarioOrEmail(usernameOrEmail, usernameOrEmail);
        return usuario.orElse(null); // Devuelve null si no se encuentra
    }

    public Optional<Usuario> findByUsername(String username) {
        return usuarioRepository.findByNombreUsuario(username);
    }
}
