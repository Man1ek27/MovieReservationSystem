package src;

public class User {
    private int userId;
    private String name;
    private String email;
    private String password;
    private String phoneNumber;
    static private int id =0;

    /**
     * Klasa implementująca użytkownika
     * @param name nazwa użytkownika
     * @param email mail użytkownika
     * @param password hasło użytkownika
     * @param phone nr telefonu użytkownika
     */
    public User(String name, String email, String password, String phone){
        this.userId = ++id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phone;
    }

    public User(int UserId, String name, String email, String password, String phone){
        this.userId = UserId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phone;
    }

    //GETTERS
    /**
     * Lista Getterów
     */
    public int getUserId() {
        return userId;
    }
    public String getName() {return name;}
    public String getEmail() {return email;}
    public String getPassword() {return password;}
    public String getPhoneNumber() {return phoneNumber;}

    //SETTERS
    /**
     * Lista Setterów
     */
    public void setUserId(int userId) {this.userId = userId;}
    public void setName(String name) {this.name = name;}
    public void setEmail(String email) {this.email = email;}
    public void setPassword(String password) {this.password = password;}
    public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}

}
