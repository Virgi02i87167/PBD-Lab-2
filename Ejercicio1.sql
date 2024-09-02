-- 1. Crear una vista que devuelve los libros más vendidos por género basado en el total de las ventas, 
-- el resultado debe mostrar las siguiente información: Id del libro, titulo, genero y ventas totales.
-- Además de los campos mencionados debe mostrar la cantidad de unidades vendidas por libro. Ejemplo:
--  Libro Harry Potter Género Fantasía Ventas totales: $10000 Unidades Vendidas 500

create view dbo.LibrosMasVendidosGenero
as
select top 10
	b.BookID,
	b.Title,
	b.Genre,
	sum(od.Quantity * od.UnitPrice) as VentaTotal,
	sum(od.Quantity) as UnidadesVendidas
from Books b
inner join OrderDetails od on b.BookID = od.BookID
group by b.BookID, b.Genre, b.Title, b.Genre
order by VentaTotal desc;

select * from dbo.LibrosMasVendidosGenero