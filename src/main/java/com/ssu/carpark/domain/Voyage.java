package com.ssu.carpark.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@Entity
public class Voyage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private Driver driver;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private Bus bus;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private Route route;

    private Date voyageDate;
}
