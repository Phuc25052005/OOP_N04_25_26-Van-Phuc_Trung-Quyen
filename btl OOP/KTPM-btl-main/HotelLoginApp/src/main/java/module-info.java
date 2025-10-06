module com.example.hotelloginapp {
    requires spring.boot;
    requires spring.boot.autoconfigure;
    requires spring.context;
    requires spring.web;
    requires spring.data.jpa;
    requires jakarta.persistence;
    requires java.sql;

    opens com.example.hotelloginapp.model to spring.core, spring.beans, spring.context, jakarta.persistence;
    opens com.example.hotelloginapp.controller to spring.core, spring.beans, spring.web;
    exports com.example.hotelloginapp;
    exports com.example.hotelloginapp.controller;
}
