-- 3. Crear una vista que retorne el listado de libros junto con la fecha en la que
-- se vendió la primera unidad de dicho libro. Debe incluir los libros que nunca han
-- sido vendidos, la consulta debe retornar el id del libro, el nombre, la fecha de la
-- primer venta y la cantidad de unidades vendidas. Debe ordenar los datos por orden 
-- alfabético según el nombre del libro

create view dbo.ListaLibrosPrimeraVenta
as
select
	b.BookID,
	b.Title,
	min(o.OrderDate) as FechaPrimeraVenta,
	coalesce(sum(od.Quantity), 0) as UnidadesVendidas
from Books b
left join OrderDetails od on b.BookID = od.BookID
left join Orders o on od.OrderID = o.OrderID
group by b.BookID, b.Title

select * from dbo.ListaLibrosPrimeraVenta order by Title asc
