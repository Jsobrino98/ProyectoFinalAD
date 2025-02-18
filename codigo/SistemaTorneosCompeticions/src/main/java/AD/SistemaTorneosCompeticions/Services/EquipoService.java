package AD.SistemaTorneosCompeticions.Services;

import AD.SistemaTorneosCompeticions.Models.DTO.EquipoTorneoDTO;
import AD.SistemaTorneosCompeticions.Models.Equipo;
import AD.SistemaTorneosCompeticions.Repositories.EquipoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EquipoService {

    @Autowired
    private EquipoRepository equipoRepository;

    public List<Equipo> obtenerTodos(){
        return equipoRepository.findAll();
    }

    public Equipo obtener(Long id){
        return equipoRepository.findById(id).orElse(null);
    }

    public Equipo guardar(Equipo equipo) {
        return equipoRepository.save(equipo);
    }

    public void eliminar(Long id) {
        equipoRepository.deleteById(id);
    }

//    public List<EquipoTorneoDTO> listarEquiposPorTorneo(Long torneoId) {
//        List<Equipo> equipos = equipoRepository.findByTorneo_id(torneoId);
//
//        // Mapear los equipos a DTOs
//        return equipos.stream().map(equipo -> new EquipoTorneoDTO(
//                equipo.getNombre(),
//                "Torneo con ID: " + equipo.getTorneo_id()
//        )).collect(Collectors.toList());
//    }

}
