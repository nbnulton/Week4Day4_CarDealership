--DDL

CREATE TABLE sales(
    salesperson_id SERIAL PRIMARY KEY,
    sale_id SERIAL,
    sale_amount DECIMAL(10,2)
);

CREATE TABLE vehicles(
    vin SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    color VARCHAR(50),
    salesperson_id INTEGER NOT NULL,

    FOREIGN KEY (salesperson_id) REFERENCES sales(salesperson_id) ON DELETE CASCADE
);

CREATE TABLE parts(
    part_id SERIAL PRIMARY KEY,
    part_amount DECIMAL(10,2)
);

CREATE TABLE mechanics(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE services(
    service_order SERIAL PRIMARY KEY,
    service_amount DECIMAL(10,2),
    service_id SERIAL,
    vin INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    part_id INTEGER NOT NULL,

    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE,
    FOREIGN KEY (mechanic_id) REFERENCES mechanics(mechanic_id) ON DELETE CASCADE,
    FOREIGN KEY (part_id) REFERENCES parts(part_id) ON DELETE CASCADE
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    vin INTEGER NOT NULL,
    service_order INTEGER NOT NULL,

    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE,
    FOREIGN KEY (service_order) REFERENCES services(service_order) ON DELETE CASCADE
);