package com.medisure.medisure_as.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "ImageSchedule")
@Getter
@Setter
@ToString
public class ImageSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String link;

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;
}
