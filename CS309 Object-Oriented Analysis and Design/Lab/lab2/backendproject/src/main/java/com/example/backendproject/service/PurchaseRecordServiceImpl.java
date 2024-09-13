package com.example.backendproject.service;

import com.example.backendproject.api.PurchaseRecordRepository;
import com.example.backendproject.domain.PurchaseRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseRecordServiceImpl implements PurchaseRecordService{
    @Autowired
    private PurchaseRecordRepository purchaseRecordRepository;

    public List<PurchaseRecord> findAll(){
        return purchaseRecordRepository.findAll();
    }
}
