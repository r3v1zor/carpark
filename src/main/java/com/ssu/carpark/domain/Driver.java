package com.ssu.carpark.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Data
@NoArgsConstructor
@Entity
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String firstName;
    private String lastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;
    private boolean isStillWorking;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startWorkingDay;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date finalWorkingDay;

    public Driver(String firstName, String lastName, Date dateOfBirth, Date startWorkingDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.startWorkingDay = startWorkingDate;
        isStillWorking = true;
    }
}
