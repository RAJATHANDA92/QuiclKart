package com.Gift.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Gift.models.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, String>{

}
