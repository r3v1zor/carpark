package com.ssu.carpark.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Data
@NoArgsConstructor
public class ServiceStation {
    private Integer id;
    private String address;
    private String phone;

    @ManyToOne
    @PrimaryKeyJoinColumn
    private BusCompany busCompany;
}
