package com.medisure.medisure_as.repository;

import com.medisure.medisure_as.entity.Doctors;
import com.medisure.medisure_as.entity.ImageSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ImageScheduleRepository extends JpaRepository<ImageSchedule,Long> {

    @Query("select i from ImageSchedule i where i.schedule.id = ?1")
    public List<ImageSchedule> findBySchedule(Long id);
}
