package com.example.backendproject.api;

import com.example.backendproject.domain.PurchaseRecord;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PurchaseRecordRepository extends JpaRepository<PurchaseRecord,Long> {
    public List<PurchaseRecord> findAll();
}
