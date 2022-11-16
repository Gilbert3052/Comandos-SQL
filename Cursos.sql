-- Creando las Tablas --

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "role_id" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level_id" int,
  "teacher" varchar
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "course_category" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "category_id" int
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_category" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "course_category" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");





-- Creando cada tipo de Rol --

insert into roles (
	name
) values (
	'Student'
), (
	'Teacher'
), (
	'Admin'
);


-- Creando 2 Usuarios de cada tipo de Rol --

insert into users (
	id,
	name,
	email,
	"password",
	age,
	role_id
) values (
	'2c93bb6c-8370-4e8a-ba89-1d04417dc34f',
	'Gilbert',
	'gilbert@mail.com',
	'root',
	21,
	1
), (
	'1fbd584d-d23b-4913-b16e-e3620a58007d',
	'Diego',
	'diego@mail.com',
	'root',
	12,
	1
), (
	'32b74cb8-f006-488b-9f4b-ee1315c4854a',
	'Alejando',
	'alejandro@mail.com',
	'root',
	15,
	2
), (
	'dbc0fa3b-5781-4d01-bce6-3f9aa722573e',
	'Angie',
	'angie@mail.com',
	'root',
	20,
	2
), (
	'bf7059a0-b6f0-417e-ad94-4e0822c171b5',
	'Kelly',
	'kelly@mail.com',
	'root',
	19,
	3
), (
	'5b97899f-6692-4f9d-b0b6-2f7d7589ba19',
	'Ricardo',
	'ricardo@mail.com',
	'root',
	18,
	3
);

-- Creando Niveles de los Cursos --

insert into levels (
	name
) values (
	'Principiante'
), (
	'Intermedio'
), (
	'Avanzado'
);

-- Creando un Curso por cada Nivel --

insert into courses (
	id,
	title,
	description,
	level_id,
	teacher 
) values (
	'42b12e3b-3ed9-4ca0-857a-80c1b5f4c51a',
	'Historia de las bases de Datos',
	'Aprenderas sobre el comienzo de las bases de datos',
	1,
	'Angie'
), (
	'd65fd69e-64eb-4630-b01d-fc7165fd7cf6',
	'Curso SQL',
	'Aprenderas todo sobre SQL, hasta convertirte en un experto sobre el tema',
	2,
	'Alejandro'
), (
	'9935cae3-503e-457a-a1ae-4b6a229eb14b',
	'Curso NodeJs',
	'Aprenderas todo sobre NodeJs, hasta convertirte en un experto sobre el tema',
	3,
	'Angie'
);


-- Creando Categorias --

insert into categories (
	name
) values (
	'Programación'
), (
	'Historia de la programación'
);


-- Creando Videos de los Cursos --

insert into course_videos (
	id,
	title,
	url,
	course_id
) values (
	'f3977f31-8383-4535-869b-d8ba35bc305c',
	'Introducción a las Bases de Datos',
	'video_db.com',
	'42b12e3b-3ed9-4ca0-857a-80c1b5f4c51a'
), (
	'ea7219fe-3278-49fd-a6fb-069b5e90c9b3',
	'Comandos SQL',
	'video_comandos.com',
	'd65fd69e-64eb-4630-b01d-fc7165fd7cf6'
),(
	'795d18b9-43fd-440a-8def-f945f1d565f1',
	'Introducción a NodeJs',
	'video_node.com',
	'9935cae3-503e-457a-a1ae-4b6a229eb14b'
);




