delete Inventory
go
insert Inventory (Style, Size, Color, PurchasePrice, PurchaseDate, SalePrice, SaleDate, Returned, Sale, Salesperson, Company)
select 'loafer',   34, 'green', 94.99,  '08.30.2021', 100.99, '09.1.2021', 0, 0, 'Mr.Green', 'Venittini'
union select 'step in',  29, 'brown', 100.99, '08.25.2021', 110.99, '09.08.2021', 0, 0, 'Ms.Weiss', 'Venittini'
union select 'high top', 20, 'rust', 79.99,   '09.01.2020', 89.99, '06.23.2021', 1, 0, 'Mr.Shwartz', 'Jacadi'
union select 'high top', 23, 'pink',  79.99,  '09.01.2020', 89.99, '06.23.2021', 1, 0, 'Mr.Shwartz', 'Jacadi'
union select 'high top', 25, 'green',  79.99, '09.01.2020', 89.99, '06.23.2021', 1, 0, 'Mr.Shwartz', 'Jacadi'  
union select 'loafer',   5,  'tan', 120.99,   '08.01.2021', 130.99, '09.04.2021', 0, 0, 'Mr.Green', 'Michael Kors'
union select 'High heel', 7, 'black velvet', 100.00, '09.3.2019', 105.00, null, null,  1, '', 'Vince' 
union select 'loafer',   34, 'black', 95.00, '08.30.2021', 100.00, '01.02.2022', 0, 0, 'Mrs.Klein', 'Pardoo'
union select 'Bootie',   33, 'black', 90.99, '08.30.2021', 100.00, '01.01.2022', 0, 1, 'Ms.Weiss', 'Steve Madden'
union select 'loafer',   32, 'black', 90.99, '08.30.2021', 100.00, '09.02.2021', 1, 1, 'Ms.Weiss', 'Pardoo'
union select 'loafer',   22, 'black', 90.99, '08.30.2021', 100.00, '10.05.2021', 1, 1, 'Ms.Weiss', 'Pardoo'
union select 'lace up',  35, 'maroon', 100.00, '08.30.2021', 150.99, '09.07.2021', 0,0, 'Mrs.Klein', 'Lillie'
union select 'lace up',  35, 'maroon', 100.00, '08.30.2021', 150.99, '10.07.2021', 0,0, 'Mr.Green', 'Lillie'
union select 'Ballet flat', 8, 'luggage seude', 150.00, '08.30.1999', 175.99, null, null, 0, '', 'Sam Edelman'

select * from Inventory