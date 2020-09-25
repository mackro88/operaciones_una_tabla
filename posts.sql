-- Parte 1
-- Crear base de datos "posts"
CREATE DATABASE posts;
\c posts;
-- Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido, descripción.
CREATE TABLE post(
    id SERIAL,
    nombre_de_usuario VARCHAR(30),
    fecha_de_creacion DATE,
    contenido TEXT,
    descripcion VARCHAR(250)
);
-- Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post(
    nombre_de_usuario,
    fecha_de_creacion,
    contenido,
    descripcion)
VALUES 
    ('Pamela', 
    '2020/03/12', 
    'El mosquito tiene 47 dientes, el tiburón ballena tiene más de 4,500 y el pez gato tiene 9,280. La jirafa duerme tan sólo 7 minutos por día y lo hace de pie. Una vaca emite a la atmósfera 182,500 litros de metano al año (una de las causas del agujero de la Capa de Ozono).', 
    'Datos curiosos animales.'),
    ('Pamela',
    '2020/04/18',
    'Las subespecies de lobos más pequeñas habitan en las regiones desérticas en el Medio Oriente, miden aproximadamente 66 centímetros parados y pesan menos de 20 kilogramos. Las subespecies más grandes de lobo viven en el norte de Asia y América del Norte. En general, estos caninos miden 96 centímetros parados hasta la altura de los hombros y pueden pesar hasta 79 kilogramos lo que los convierte en los miembros salvajes más grandes de la familia de los perros.',
    'Curiosidades de los lobos.'),
    ('Carlos',
    '2020/07/04',
    'Los quetzales (Pharomachrus) son un género de aves de colores muy llamativos y vistosos, habitantes de los bosques y las selvas de Centroamérica y de América del Sur, y que gozaron de una gran importancia en la cultura de las civilizaciones prehispánicas. En este sentido, los quetzales fueron considerados como aves sagradas, y sus plumas eran utilizadas por estas antiguos culturas para la fabricación de los ornamentos de los sacerdotes del dios Quetzalcóatl, o la Serpiente Emplumada. Las plumas de la cola de los machos pueden alcanzar casi un metro de longitud, siendo considerablemente más largas que el propio cuerpo.',
    'Las plumas de algunas aves sagradas y exóticas.');
-- Modificar la tabla post, agregando la columna título.
ALTER TABLE post ADD titulo VARCHAR(50);
-- Agregar título a las publicaciones ya ingresadas
UPDATE post SET titulo='¿Sabías qué?' WHERE id=1;
UPDATE post SET titulo='¿Cuánto miden los lobos?' WHERE id=2;
UPDATE post SET titulo='Plumas pintorescas' WHERE id=3;