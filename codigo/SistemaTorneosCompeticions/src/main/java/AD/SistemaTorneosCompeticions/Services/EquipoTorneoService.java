package AD.SistemaTorneosCompeticions.Services;

import AD.SistemaTorneosCompeticions.Models.*;
import AD.SistemaTorneosCompeticions.Models.DTO.EquipoTorneoDTO;
import AD.SistemaTorneosCompeticions.Repositories.EquipoRepository;
import AD.SistemaTorneosCompeticions.Repositories.EquipoTorneoRepository;
import AD.SistemaTorneosCompeticions.Repositories.TorneoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EquipoTorneoService {


    @Autowired
    private EquipoRepository equipoRepository;

    @Autowired
    private TorneoRepository torneoRepository;


    @Autowired
    private EquipoTorneoRepository equipoTorneoRepository;

    public List<EquipoTorneoDTO> obtenerEquiposPorTorneo(Long torneoId) {
        // Buscar equipos asociados al torneo
        List<EquipoTorneo> equiposTorneo = equipoTorneoRepository.findByTorneoId(torneoId);

        // Convertir la lista de equiposTorneo a DTO con los datos deseados
        return equiposTorneo.stream()
                .map(equipoTorneo -> new EquipoTorneoDTO(

                        equipoTorneo.getEquipo().getNombre(),
                        equipoTorneo.getTorneo().getNombre()
                ))
                .collect(Collectors.toList());
    }

}
