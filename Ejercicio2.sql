-- 2. Crear una vista que retorne el listado de los libros, la vista debe mostrar tanto libros
-- que han sido vendido como los libros que no han sido vendidos. La vista debe retornar el id
-- del libro, el nombre del libro y las unidades vendidas.
-- Ejemplo: Id 1 Libro Harry Potter Unidades Vendidas 500

alter view dbo.ListaLibros
as
select
	b.BookID,
	b.Title,
	od.Quantity as UnidadesVendidas
from Books b
left join OrderDetails od on b.BookID = od.BookID

select * from dbo.ListaLibros