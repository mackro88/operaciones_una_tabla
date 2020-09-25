-- Parte 1
-- Crear base de datos "posts"
CREATE DATABASE posts;
\c posts;
-- Crear tabla "post"
CREATE TABLE post(
    id INT,
    nombre_de_usuario VARCHAR(30),
    -- año/ mes/ dia
    fecha_de_creacion DATE,
    contenido TEXT,
    descripcion VARCHAR (250)
);