package Model;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String username;
    private String phone;
    private String email;
    private String password; // Hashed password
    private String address;
    private String gender; // Male, Female, Other
    private String role;   // Admin, Staff, Customer
    private String status; // Active, Inactive
    private String image_path;

    // ✅ Default Constructor
    public User() {}

    // ✅ Parameterized Constructor
    public User(int id, String firstName, String lastName, String username, String phone,
                String email, String password, String address, String gender,
                String role, String status, String image_path) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.address = address;
        this.gender = gender;
        this.role = role;
        this.status = status;
    }

    // ✅ Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getImage() {return image_path;}
    public void setImage(String image_path) {this.image_path = image_path;}
    


        
}
