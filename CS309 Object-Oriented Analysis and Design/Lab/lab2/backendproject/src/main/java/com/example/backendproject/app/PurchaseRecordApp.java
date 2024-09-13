package com.example.backendproject.app;

import com.example.backendproject.domain.PurchaseRecord;
import com.example.backendproject.service.PurchaseRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/exer")
public class PurchaseRecordApp {
    @Autowired
    private PurchaseRecordService purchaseRecordService;
    @GetMapping("/record")
    public List<PurchaseRecord> findAll(){
        System.out.println(purchaseRecordService.getClass().getName());
        return purchaseRecordService.findAll();
    }
}
