-- CONSULTAS TIENDA
USE tienda;
-- Consulta 1
SELECT nombre FROM producto;
-- Consulta 2
SELECT nombre, precio FROM producto;
-- Consulta 3
SELECT * FROM producto;
-- Consulta 4
SELECT nombre, precio, ROUND(precio * 1.04, 2) AS 'precio en USD' FROM producto;
-- Consulta 5
SELECT nombre AS 'nombre de producto' , precio AS euros, ROUND(precio * 1.04, 2) AS 'dólares norteamericanos' FROM producto;
-- Consulta 6
SELECT UPPER(nombre), precio FROM producto;
-- Consulta 7
SELECT LOWER(nombre), precio FROM producto;
-- Consulta 8
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
-- Consulta 9
SELECT nombre, ROUND(precio, 0) FROM producto;
-- Consulta 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- Consulta 11
SELECT codigo_fabricante FROM producto;
-- Consulta 12
SELECT DISTINCT codigo_fabricante FROM producto;
-- Consulta 13
SELECT nombre FROM fabricante ORDER BY nombre;
-- Consulta 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- Consulta 15
SELECT nombre FROM producto ORDER BY nombre, precio DESC;
-- Consulta 16
SELECT * FROM fabricante LIMIT 5;
-- Consulta 17
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
-- Consulta 18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
-- Consulta 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- Consulta 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- Consulta 21
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- Consulta 22
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
-- Consulta 23
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- Consulta 24
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
-- Consulta 25
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- Consulta 26
SELECT p.codigo, p.codigo_fabricante, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'lenovo';
-- Consulta 27
SELECT p.codigo, p.codigo_fabricante, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'crucial' AND p.precio > 200;
-- Consulta 28
SELECT p.codigo, p.codigo_fabricante, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus' OR f.nombre = 'hewlett-packard' OR f.nombre = 'seagate';
-- Consulta 29
SELECT p.codigo, p.codigo_fabricante, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('asus', 'hewlett-packard', 'seagate');
-- Consulta 30
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP 'e$';
-- Consulta 31
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
-- Consulta 32
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;
-- Consulta 33
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Consulta 34
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Consulta 35
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
-- Consulta 36
SELECT * FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo');
-- Consulta 37
SELECT * FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1);
-- Consulta 38
SELECT nombre FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1;
-- Consulta 39
SELECT nombre FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'hewlett-packard') ORDER BY precio LIMIT 1;
-- Consulta 40
SELECT * FROM producto WHERE precio >= (SELECT precio FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1);
-- Consulta 41
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus' AND p.precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus');

-- CONSULTAS UNIVERSIDAD
USE universidad;
-- Consulta 1
SELECT apellido1, apellido2, nombre, tipo FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
-- Consulta 2
SELECT nombre, apellido1, apellido2, tipo, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- Consulta 3
SELECT nombre, apellido1, apellido2, tipo, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999-%%-%%';
-- Consulta 4
SELECT nombre, apellido1, apellido2, tipo, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
-- Consulta 5
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- Consulta 6
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre FROM profesor p JOIN departamento d ON p.id_departamento = d.id JOIN persona pe ON p.id_profesor = pe.id ORDER BY pe.apellido1, pe.apellido2, pe.nombre; 
-- Consulta 7
SELECT p.nif, a.nombre, a.curso, c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura aa JOIN persona p ON aa.id_alumno = p.id JOIN asignatura a ON aa.id_asignatura = a.id JOIN curso_escolar c ON aa.id_curso_escolar = c.id WHERE p.nif = '26902806M';
-- Consulta 8
SELECT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IN (
SELECT id_profesor FROM asignatura WHERE id_grado = (SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática (Plan 2015)'));
-- Consulta 9
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM alumno_se_matricula_asignatura aa JOIN persona p ON aa.id_alumno = p.id WHERE aa.id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018);
-- LEFT JOIN & RIGHT JOIN
-- Consulta 1
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id RIGHT JOIN persona p ON pr.id_profesor = p.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- Consulta 2
SELECT * FROM profesor WHERE id_departamento IS NULL;
-- Consulta 3
SELECT d.id, d.nombre AS departamento, p.id_profesor FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
-- Consulta 4
SELECT p.id_profesor, pe.apellido1, pe.apellido2, a.nombre AS asignatura FROM profesor p LEFT JOIN asignatura a USING (id_profesor) JOIN persona pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;
-- Consulta 5
SELECT nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;
-- Consulta 6
SELECT * from departamento WHERE id NOT IN (SELECT p.id_departamento FROM profesor p JOIN asignatura a USING (id_profesor));
-- CONSULTAS RESUMEN
-- Consulta 1
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id RIGHT JOIN persona p ON pr.id_profesor = p.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- Consulta 2
SELECT * FROM profesor WHERE id_departamento IS NULL;
-- Consulta 3
SELECT * FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
-- Consulta 4
SELECT d.nombre AS departamento, d.id AS 'id departamento', COUNT(p.id_profesor) AS 'número de profesores' FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id GROUP BY d.id ORDER BY COUNT(p.id_profesor) DESC;
-- Consulta 5
SELECT g.nombre AS grado, g.id AS 'id grado', COUNT(a.id) AS 'número de asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id ORDER BY COUNT(a.id) DESC;
-- Consulta 6
SELECT g.nombre AS grado, g.id AS 'id grado', COUNT(a.id) AS 'número de asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;
-- Consulta 7
SELECT g.nombre AS grado, SUM(CASE WHEN a.tipo = 'básica' THEN a.creditos ELSE 0 END) AS 'créditos asignaturas básicas', SUM(CASE WHEN a.tipo = 'obligatoria' THEN a.creditos ELSE 0 END) AS 'créditos asignaturas obligatorias', SUM(CASE WHEN a.tipo = 'optativa' THEN a.creditos ELSE 0 END) AS 'créditos asignaturas optativas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id;
-- Consulta 8
SELECT ce.anyo_inicio, COUNT(aa.id_alumno) AS 'número de alumnos' FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura aa ON ce.id = aa.id_curso_escolar GROUP BY ce.id;
-- Consulta 9
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS 'número de asignaturas' FROM profesor p LEFT JOIN asignatura a USING (id_profesor) LEFT JOIN persona pe ON p.id_profesor = pe.id GROUP BY p.id_profesor ORDER BY COUNT(a.id) DESC;
-- Consulta 10
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
-- Consulta 11
SELECT p.id_profesor, pe.apellido1, pe.apellido2, d.nombre AS departamento, a.nombre AS asignatura FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN asignatura a USING (id_profesor) LEFT JOIN persona pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;