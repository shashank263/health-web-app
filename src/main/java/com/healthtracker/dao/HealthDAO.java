package com.healthtracker.dao;

import com.healthtracker.model.HealthData;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

public class HealthDAO {
    // Thread-safe list for demo purposes
    private static final List<HealthData> STORE =
            Collections.synchronizedList(new LinkedList<>());

    public static void add(HealthData data) {
        STORE.add(0, data); // newest first
        if (STORE.size() > 50) { // keep last 50
            STORE.remove(STORE.size() - 1);
        }
    }

    public static List<HealthData> findAll() {
        return new LinkedList<>(STORE); // return a copy
    }
}

