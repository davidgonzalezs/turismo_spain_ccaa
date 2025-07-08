CREATE TABLE comunidades_autonomas (
    id_ccaa INT PRIMARY KEY NOT NULL,
    nombre_ccaa VARCHAR(255) NOT NULL,
    CONSTRAINT unique_ccaa UNIQUE (nombre_ccaa)
);

CREATE TABLE provincias (
    id_provincia INT PRIMARY KEY NOT NULL,
    id_ccaa INT NOT NULL,
    nombre_provincia VARCHAR(255) NOT NULL,
    CONSTRAINT unique_provincia UNIQUE (id_ccaa, nombre_provincia),
    FOREIGN KEY (id_ccaa) REFERENCES comunidades_autonomas(id_ccaa)
);



CREATE TABLE flujos_turismo(
    id_flujo SERIAL PRIMARY KEY NOT NULL,
    periodo DATE NOT NULL,
    id_provincia_origen INT NOT NULL,
    id_provincia_destino INT NOT NULL,
    total INT NOT NULL,
    CONSTRAINT unique_flujos_turismo UNIQUE (periodo, id_provincia_origen, id_provincia_destino),
    FOREIGN KEY (id_provincia_origen) REFERENCES provincias(id_provincia),
    FOREIGN KEY (id_provincia_destino) REFERENCES provincias(id_provincia)
);


-- Índice para la clave foránea id_provincia → comunidades_autonomas.id_ccaa (esto parece un error, ver nota abajo)
CREATE INDEX idx_provincias_id_ccaa ON provincias(id_ccaa);

-- Índices para claves foráneas en flujos_turismo
CREATE INDEX idx_flujos_turismo_origen ON flujos_turismo(id_provincia_origen);
CREATE INDEX idx_flujos_turismo_destino ON flujos_turismo(id_provincia_destino);