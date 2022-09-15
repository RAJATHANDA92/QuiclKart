package com.Gift.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Gift.models.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
