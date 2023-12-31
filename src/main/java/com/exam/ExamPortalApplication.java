package com.exam;

import com.exam.model.Role;
import com.exam.model.User;
import com.exam.model.userRole;
import com.exam.repo.userRepository;
import com.exam.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashSet;
import java.util.Set;

@SpringBootApplication
public class ExamPortalApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(ExamPortalApplication.class, args);
    }

    @Autowired
    private UserService userService;
    @Override
    public void run(String... args) throws Exception {
 
        System.out.println("Project Running");
    }
}
