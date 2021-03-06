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
    descripcion VARCHAR(300),
    post_comentario SERIAL,
    PRIMARY KEY (post_comentario)
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
-- Insertar 2 post para el usuario "Pedro"
INSERT INTO post(
    nombre_de_usuario,
    fecha_de_creacion,
    contenido,
    descripcion,
    titulo)
VALUES 
    ('Pedro', 
    '2020/08/22', 
    'Se encuentran situados sobre los ojos, debajo de la barbilla y a los lados de la cara, se encuentran repletos de haces de nervios y pueden detectar el movimiento má,s ligero. Los gatos que deambulan por la noche así, como los que tienen problemas de visión, los usan para "ver" por donde andan, es a travé,s de ellos como pueden maniobrar en espacios estrechos y controlar distancias en sus paseos nocturnos.', 
    'El nombre científico que se le da a los bigotes es vibrissae, que significa reconocer el más mínimo movimiento o vibració,n del aire en su alrededor.',
    '¿Para qué le sirven los bigotes al gato?'),
    ('Pedro',
    '2020/09/03',
    'La leyenda del gato sagrado de Birmania cuenta que en el templo de Lao-Tsun vivía un gato de ojos ámbar y con el pelo totalmente blanco llamado Sihn. Se dice que este gato era el más fiel compañero del sacerdote Mun-ha. Cierta noche, unos ladrones asaltaron el templo y mataron a Mun-ha, justo en el momento en que éste se encontraba rezando a los pies de la estatua de una diosa dorada con ojos de color azul zafiro. En el instante mismo de la muerte, Sihn saltó sobre el cadáver del sacerdote Mun-ha y el alma del religioso se instaló en el cuerpo del gato. Fue entonces cuando el manto blanco de Sihn adquirió un hermoso y muy suave tono dorado, procedente del reflejo de la estatua y sólo las cuatro patitas del gato, que estaban en contacto con el cuerpo de Mun-ha, permanecieron totalmente blancas. Los ojos ámbar pasaron a ser de color azul zafiro, como los de la diosa, y la cara, las orejas, la cola y las patas adquirieron el color de la tierra.',
    'Hay una leyenda en torno a esta raza de gato que pertenece al siglo IX, concretamente a la Edad Media y que se sitúa a la zona del sureste asiático que hoy corresponde a Myanmar, Tailandia y Camboya.',
    'La leyenda del gato sagrado de Birmania');
-- Eliminar el post de carlos
DELETE FROM post WHERE id=3;
-- Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO post(
    nombre_de_usuario,
    fecha_de_creacion,
    contenido,
    descripcion,
    titulo)
VALUES 
    ('Carlos', 
    '2020/09/07', 
    'Estas aves participaron en la Primera y Segunda Guerra Mundial, los pilotos las llevaban en una jaula, con el propósito de avisar en caso de que el avión sufriera algún accidente. En la actualidad los ejércitos francés, suizo, israelí, iraquí y chico continúan utilizandolas para el mismo fin.', 
    'Las palomas son empleadas como mensajeras.',
    '¿Palomas mensajeras?');
-- Parte 2
-- Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación, contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
    id SERIAL,
    fecha_y_hora TIMESTAMP, 
    contenido VARCHAR(300),
    post_comentario INT,
    FOREIGN KEY (post_comentario) REFERENCES post (post_comentario)
);
-- Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"
INSERT INTO comentarios(
    fecha_y_hora,
    contenido,
    post_comentario)
VALUES 
    ('2020/09/09 21:00:00.59', 
    'Sed id consectetur augue. Phasellus commodo dapibus lacus vitae bibendum.', 
    1),
    ('2020/09/11 13:00:00.59', 
    'Morbi eget egestas lorem. Aliquam id tempus mi.', 
    2),
    ('2020/09/14 14:00:00.59', 
    'Aliquam magna metus, imperdiet sit amet massa mattis, pharetra pulvinar turpis.', 
    6),
    ('2020/09/14 14:10:00.59', 
    'Cras id metus nec urna rhoncus sollicitudin.', 
    6),
    ('2020/09/15 14:12:00.59', 
    'Quisque et mauris dictum, cursus nisl et, faucibus sem.', 
    6),
    ('2020/09/16 14:16:00.59', 
    'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.', 
    6);
    -- Crear un nuevo post para "Margarita"
    INSERT INTO post(
    nombre_de_usuario,
    fecha_de_creacion,
    contenido,
    descripcion,
    titulo)
VALUES 
    ('Margarita', 
    '2020/09/17', 
    'Para descubrir sus efectos, Snowdon y Megan Savage científicos especialistas en otorrinolaringología, visitaron 47 hogares con gatos domésticos, a los que les pusieron cuatro muestras musicales: dos cortes de música clásica y dos de música para gatos. Los felinos respondieron más positivamente a estas últimas acercándose o frotándose con los altavoces de manera más pronta que cuando sonaron los cortes clásicos, según ha recogido un artículo de  la revista Applied Animal Behavior. Esta música especial podría calmar a los gatos que se de  la revista Applied Animal Behavior. Esta música especial podría calmar a los gatos que se encuentran en refugios o que se quedan solos en casa.', 
    'La forma en la que los animales reaccionan ante la música depende de lo que entendemos por música, esto lo explican psicólogos estadounidenses que estudian el comportamiento animal.',
    '¿Cómo reaccionan los animales ante la música?');
    -- Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios(
    fecha_y_hora,
    contenido,
    post_comentario)
VALUES 
    ('2020/09/17 09:10:00.59', 
    'Sed id contetur augue. Phasellus comodo dapibus lacus vitae bibendum.', 
    7),
    ('2020/09/17 10:23:30.59', 
    'Morbi eet egestas lorem. Aliquam id tempus mi.', 
    7),
    ('2020/09/17 10:40:33.49', 
    'Aliquam magna metus, imperdiet sit amet massa mattis, pretra pulvnar turpis.', 
    7),
    ('2020/09/17 11:10:00.59', 
    'Cras id metus ec urna rhoncus sollicudin.', 
    7),
    ('2020/09/17 12:32:00.59', 
    'Quisue et mauris dictum, cursus nisl et, faucbus sem.', 
    7);
