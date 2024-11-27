package com.example.projectWork.dto;

public class UtenteDTO {
    private Long id;
    private String username;
    private String password;
    private Boolean amministratore;
    private ClienteDTO cliente;
    private AdminDTO admin;


    // Costruttore vuoto
    public UtenteDTO() {
    }

     // Getter e setter
    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }


    public Boolean getAmministratore() {
        return amministratore;
    }


    public void setAmministratore(Boolean amministratore) {
        this.amministratore = amministratore;
    }


    public ClienteDTO getCliente() {
        return cliente;
    }


    public void setCliente(ClienteDTO cliente) {
        this.cliente = cliente;
    }


    public AdminDTO getAdmin() {
        return admin;
    }


    public void setAdmin(AdminDTO admin) {
        this.admin = admin;
    }
}
