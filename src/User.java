package src;

public class User {
    private int userId;
    private String name;
    private String email;
    private String password;
    private String phoneNumber;

    //GETTERS
    public int getUserId() {
        return userId;
    }
    public String getName() {return name;}
    public String getEmail() {return email;}
    public String getPassword() {return password;}
    public String getPhoneNumber() {return phoneNumber;}

    //SETTERS
    public void setUserId(int userId) {this.userId = userId;}
    public void setName(String name) {this.name = name;}
    public void setEmail(String email) {this.email = email;}
    public void setPassword(String password) {this.password = password;}
    public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}

}
