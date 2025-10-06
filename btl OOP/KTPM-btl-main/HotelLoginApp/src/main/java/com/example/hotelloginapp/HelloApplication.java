package com.example.hotelloginapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.persistence.*;
import java.util.Optional;

@SpringBootApplication
@RestController
@RequestMapping("/api/login")
public class HotelLoginAppApplication {

    @Autowired
    private UserRepository userRepository;

    @PostMapping
    public String login(@RequestParam String username, @RequestParam String password) {
        Optional<User> user = userRepository.findByUsernameAndPassword(username, password);
        return user.isPresent() ? "Đăng nhập thành công!" : "Sai tài khoản hoặc mật khẩu!";
    }

    public static void main(String[] args) {
        SpringApplication.run(HotelLoginAppApplication.class, args);
    }
}

@Entity
class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String password;

    // Getters và Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}

@Repository
interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsernameAndPassword(String username, String password);
}
