package AD.SistemaTorneosCompeticions.Repositories;


import AD.SistemaTorneosCompeticions.Models.Equipo;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface EquipoRepository extends JpaRepository<Equipo, Long> {

//    // Buscar equipos por torneo_id
//    List<Equipo> findByTorneo_id(Long torneoId);


}
