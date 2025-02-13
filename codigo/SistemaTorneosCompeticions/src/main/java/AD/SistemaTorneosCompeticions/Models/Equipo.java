package AD.SistemaTorneosCompeticions.Models;

import jakarta.persistence.*;

@Entity(name = "equipos")
public class Equipo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String nombre;
    @Column
    private String ciudad;
    @Column
    private Long torneo_id;
    @Column
    private String escudoURL;
    @Column(nullable = true)
    private Long competicion_Secundaria_id;


    public Equipo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Long getTorneo_id() {
        return torneo_id;
    }

    public void setTorneo_id(Long torneo_id) {
        this.torneo_id = torneo_id;
    }

    public String getEscudoURL() {
        return escudoURL;
    }

    public void setEscudoURL(String escudoURL) {
        this.escudoURL = escudoURL;
    }

    public Long getCompeticionSecundaria_id() {
        return competicion_Secundaria_id;
    }

    public void setCompeticionSecundaria_id(Long competicionSecundaria_id) {
        this.competicion_Secundaria_id = competicionSecundaria_id;
    }
}
