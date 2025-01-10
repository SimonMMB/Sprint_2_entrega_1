-- CONSULTAS TIENDA
USE tienda;
-- CONSULTA 1
SELECT nombre FROM producto;
-- CONSULTA 2
SELECT nombre, precio FROM producto;
-- CONSULTA 3
SELECT * FROM producto;
-- CONSULTA 4
SELECT nombre, precio, ROUND(precio * 1.04, 2) AS 'precio en USD' FROM producto;
-- CONSULTA 5
SELECT nombre AS 'nombre de producto' , precio AS euros, ROUND(precio * 1.04, 2) AS 'dólares norteamericanos' FROM producto;
-- CONSULTA 6
SELECT UPPER(nombre), precio FROM producto;
-- CONSULTA 7
SELECT LOWER(nombre), precio FROM producto;
-- CONSULTA 8
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
-- CONSULTA 9
SELECT nombre, ROUND(precio, 0) FROM producto;
-- CONSULTA 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- CONSULTA 11
SELECT codigo_fabricante FROM producto;
-- CONSULTA 12
SELECT DISTINCT codigo_fabricante FROM producto;
-- CONSULTA 13
SELECT nombre FROM fabricante ORDER BY nombre;
-- CONSULTA 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- CONSULTA 15
SELECT nombre FROM producto ORDER BY nombre, precio DESC;
-- CONSULTA 16
SELECT * FROM fabricante LIMIT 5;
-- CONSULTA 17
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
-- CONSULTA 18
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
-- CONSULTA 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- CONSULTA 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- CONSULTA 21
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- CONSULTA 22
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
-- CONSULTA 23
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- CONSULTA 24
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
-- CONSULTA 25
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- CONSULTA 26
SELECT p.codigo, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'lenovo';
-- CONSULTA 27
SELECT p.codigo, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'crucial' AND p.precio > 200;
-- CONSULTA 28
SELECT p.codigo, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('asus', 'hewlett-packard', 'seagate');
-- CONSULTA 29
SELECT p.codigo, p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('asus', 'hewlett-packard', 'seagate');
-- CONSULTA 30
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP 'e$';
-- CONSULTA 31
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
-- CONSULTA 32
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;
-- CONSULTA 33
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
-- CONSULTA 34
SELECT f.nombre AS fabricante, p.nombre AS producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- CONSULTA 35
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
-- CONSULTA 36
SELECT * FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo');
-- CONSULTA 37
SELECT * FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1);
-- CONSULTA 38
SELECT nombre FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1;
-- CONSULTA 39
SELECT nombre FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'hewlett-packard') ORDER BY precio LIMIT 1;
-- CONSULTA 40
SELECT * FROM producto WHERE precio >= (SELECT precio FROM producto WHERE codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo') ORDER BY precio DESC LIMIT 1);
-- CONSULTA 41
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus' AND p.precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus');

-- CONSULTAS UNIVERSIDAD
USE universidad;
-- CONSULTA 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
-- CONSULTA 2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- CONSULTA 3
SELECT nombre, apellido1, apellido2, tipo, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- CONSULTA 4
SELECT nombre, apellido1, apellido2, tipo, telefono, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
-- CONSULTA 5
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- CONSULTA 6
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS departamento FROM profesor p JOIN departamento d ON p.id_departamento = d.id JOIN persona pe ON p.id_profesor = pe.id ORDER BY pe.apellido1, pe.apellido2, pe.nombre; 
-- CONSULTA 7
SELECT p.nif, a.nombre, a.curso, c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura aa JOIN persona p ON aa.id_alumno = p.id JOIN asignatura a ON aa.id_asignatura = a.id JOIN curso_escolar c ON aa.id_curso_escolar = c.id WHERE p.nif = '26902806M';
-- CONSULTA 8
SELECT DISTINCT d.nombre AS departamento FROM departamento d JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IN (SELECT id_profesor FROM asignatura WHERE id_grado = (SELECT id FROM grado WHERE nombre = 'Grado en Ingeniería Informática (Plan 2015)'));
-- CONSULTA 9
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM alumno_se_matricula_asignatura aa JOIN persona p ON aa.id_alumno = p.id WHERE aa.id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018);
-- LEFT JOIN & RIGHT JOIN
-- CONSULTA 1
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id RIGHT JOIN persona p ON pr.id_profesor = p.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- CONSULTA 2
SELECT * FROM profesor WHERE id_departamento IS NULL;
-- CONSULTA 3
SELECT d.id, d.nombre AS departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
-- CONSULTA 4
SELECT p.id_profesor, pe.apellido1, pe.apellido2, a.nombre AS asignatura FROM profesor p LEFT JOIN asignatura a USING (id_profesor) JOIN persona pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;
-- CONSULTA 5
SELECT nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;
-- CONSULTA 6
SELECT * from departamento WHERE id NOT IN (SELECT p.id_departamento FROM profesor p JOIN asignatura a USING (id_profesor));
-- CONSULTAS RESUMEN
-- CONSULTA 1
SELECT COUNT(*) AS 'total alumnos' FROM persona WHERE tipo = 'alumno';
-- CONSULTA 2
SELECT COUNT(*) AS 'alumnos categoría 99' FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- CONSULTA 3
SELECT d.nombre AS departamento, COUNT(*) AS numero_profesores FROM profesor p JOIN departamento d ON p.id_departamento = d.id GROUP BY p.id_departamento ORDER BY numero_profesores DESC;
-- CONSULTA 4
SELECT d.nombre AS departamento, d.id AS 'id departamento', COUNT(p.id_profesor) AS 'número de profesores' FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id GROUP BY d.id ORDER BY COUNT(p.id_profesor) DESC;
-- CONSULTA 5
SELECT g.nombre AS grado, g.id AS 'id grado', COUNT(a.id) AS 'número de asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id ORDER BY COUNT(a.id) DESC;
-- CONSULTA 6
SELECT g.nombre AS grado, g.id AS 'id grado', COUNT(a.id) AS 'número de asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.id HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;
-- CONSULTA 7
SELECT g.nombre AS grado, a.tipo AS 'tipo de asignatura', SUM(a.creditos) AS 'creditos totales' FROM asignatura a JOIN grado g ON a.id_grado = g.id GROUP BY a.id_grado, a.tipo;
-- CONSULTA 8
SELECT ce.anyo_inicio, COUNT(aa.id_alumno) AS 'número de alumnos' FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura aa ON ce.id = aa.id_curso_escolar GROUP BY ce.id;
-- CONSULTA 9
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS 'número de asignaturas' FROM profesor p LEFT JOIN asignatura a USING (id_profesor) LEFT JOIN persona pe ON p.id_profesor = pe.id GROUP BY p.id_profesor ORDER BY COUNT(a.id) DESC;
-- CONSULTA 10
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
-- CONSULTA 11
SELECT p.id_profesor, pe.apellido1, pe.apellido2, d.nombre AS departamento, a.nombre AS asignatura FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN asignatura a USING (id_profesor) LEFT JOIN persona pe ON p.id_profesor = pe.id WHERE a.nombre IS NULL;