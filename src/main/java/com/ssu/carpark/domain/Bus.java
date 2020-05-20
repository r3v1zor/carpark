package com.ssu.carpark.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
public class Bus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private BusCompany busCompany;

    private Date dateOfLastRepair;
    private String mark;
    private String registrationNumber;

    public Bus(BusCompany busCompany, String mark, String registrationNumber, Date date) {
        this.busCompany = busCompany;
        this.mark = mark;
        this.registrationNumber = registrationNumber;
        this.dateOfLastRepair = date;
    }
}
