-- Remove conflicting tables
DROP TABLE IF EXISTS coder CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS document CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS prog_language CASCADE;
DROP TABLE IF EXISTS rating CASCADE;
DROP TABLE IF EXISTS working CASCADE;
-- End of removing

CREATE TABLE coder (
    coder_id SERIAL NOT NULL,
    loc_id INTEGER NOT NULL,
    plang_id INTEGER NOT NULL,
    coder_username VARCHAR(256) NOT NULL,
    coder_email VARCHAR(256) NOT NULL,
    first_name VARCHAR(256) NOT NULL,
    last_name VARCHAR(256) NOT NULL,
    credit_card VARCHAR(256) NOT NULL
);
ALTER TABLE coder ADD CONSTRAINT pk_coder PRIMARY KEY (coder_id);
ALTER TABLE coder ADD CONSTRAINT uc_coder_coder_username UNIQUE (coder_username);
ALTER TABLE coder ADD CONSTRAINT uc_coder_coder_email UNIQUE (coder_email);

CREATE TABLE customer (
    cust_id SERIAL NOT NULL,
    cust_email VARCHAR(256) NOT NULL,
    cust_username VARCHAR(256) NOT NULL,
    first_name VARCHAR(256) NOT NULL,
    last_name VARCHAR(256) NOT NULL,
    credit_card VARCHAR(256) NOT NULL
);
ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY (cust_id);
ALTER TABLE customer ADD CONSTRAINT uc_customer_cust_email UNIQUE (cust_email);
ALTER TABLE customer ADD CONSTRAINT uc_customer_cust_username UNIQUE (cust_username);

CREATE TABLE document (
    doc_id SERIAL NOT NULL,
    coder_id INTEGER NOT NULL,
    document_type VARCHAR(256) NOT NULL,
    given_by VARCHAR(256) NOT NULL,
    is_diploma VARCHAR(256)
);
ALTER TABLE document ADD CONSTRAINT pk_document PRIMARY KEY (doc_id);

CREATE TABLE location (
    loc_id SERIAL NOT NULL,
    city VARCHAR(256) NOT NULL,
    country VARCHAR(256) NOT NULL,
    timezone VARCHAR(256) NOT NULL
);
ALTER TABLE location ADD CONSTRAINT pk_location PRIMARY KEY (loc_id);

CREATE TABLE orders (
    order_id SERIAL NOT NULL,
    coder_id INTEGER NOT NULL,
    cust_id INTEGER NOT NULL,
    cost VARCHAR(256) NOT NULL,
    description VARCHAR(256) NOT NULL
);
ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);

CREATE TABLE prog_language (
    plang_id SERIAL NOT NULL,
    plang VARCHAR(256) NOT NULL
);
ALTER TABLE prog_language ADD CONSTRAINT pk_prog_language PRIMARY KEY (plang_id);
ALTER TABLE prog_language ADD CONSTRAINT uc_prog_language_plang UNIQUE (plang);

CREATE TABLE rating (
    rate_id SERIAL NOT NULL,
    coder_id INTEGER NOT NULL,
    cust_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    comment VARCHAR(256) NOT NULL,
    rate VARCHAR(256) NOT NULL
);
ALTER TABLE rating ADD CONSTRAINT pk_rating PRIMARY KEY (rate_id);

CREATE TABLE working (
    work_id SERIAL NOT NULL,
    coder_id INTEGER NOT NULL,
    work_place VARCHAR(256) NOT NULL
);
ALTER TABLE working ADD CONSTRAINT pk_working PRIMARY KEY (work_id);

ALTER TABLE coder ADD CONSTRAINT fk_coder_location FOREIGN KEY (loc_id) REFERENCES location (loc_id) ON DELETE CASCADE;
ALTER TABLE coder ADD CONSTRAINT fk_coder_prog_language FOREIGN KEY (plang_id) REFERENCES prog_language (plang_id) ON DELETE CASCADE;

ALTER TABLE document ADD CONSTRAINT fk_document_coder FOREIGN KEY (coder_id) REFERENCES coder (coder_id) ON DELETE CASCADE;

ALTER TABLE orders ADD CONSTRAINT fk_orders_coder FOREIGN KEY (coder_id) REFERENCES coder (coder_id) ON DELETE CASCADE;
ALTER TABLE orders ADD CONSTRAINT fk_orders_customer FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON DELETE CASCADE;

ALTER TABLE rating ADD CONSTRAINT fk_rating_coder FOREIGN KEY (coder_id) REFERENCES coder (coder_id) ON DELETE CASCADE;
ALTER TABLE rating ADD CONSTRAINT fk_rating_customer FOREIGN KEY (cust_id) REFERENCES customer (cust_id) ON DELETE CASCADE;
ALTER TABLE rating ADD CONSTRAINT fk_rating_orders FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE;

ALTER TABLE working ADD CONSTRAINT fk_working_coder FOREIGN KEY (coder_id) REFERENCES coder (coder_id) ON DELETE CASCADE;
