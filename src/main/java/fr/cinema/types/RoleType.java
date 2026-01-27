package fr.cinema.types;

public enum RoleType {

    ADMIN("ADMIN"),
    USER("USER");

    private final String value;

    RoleType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
