package com.ssu.carpark.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date voyageDate;
}
