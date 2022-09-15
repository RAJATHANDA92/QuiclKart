package com.Gift.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Gift.models.AdminUser;

@Repository
public interface AdminRepository extends JpaRepository<AdminUser, String>{

}
