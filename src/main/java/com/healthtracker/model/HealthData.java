package com.healthtracker.model;

public class HealthData {
    private String name;
    private int age;
    private int steps;

    public HealthData(String name, int age, int steps) {
        this.name = name;
        this.age = age;
        this.steps = steps;
    }

    public String getName() { return name; }
    public int getAge() { return age; }
    public int getSteps() { return steps; }
}

