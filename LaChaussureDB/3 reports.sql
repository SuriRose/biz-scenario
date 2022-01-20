
--1. We would like a list of all the inventory that sold within a month of purchase, in order of size and style.
select *, MonthsSoldAfterPurchase = datediff(month, i.PurchaseDate, i.SaleDate)
from Inventory i
where datediff(month, i.PurchaseDate, i.SaleDate) <= 1 and Sold = 1
order by i.[Size], i.Style

--2. We would like to give a bonus to the salesperson that brings in the most sales, show which salesperson that is.
select top 1 SalesPerson, InventorySold = count(*)
from Inventory i
where Sold = 1
group by SalesPerson
order by InventorySold desc

--3. Which style, sold the most, so we know what to reorder more of.
select top 1 Style, InventorySold = count(*)
from Inventory i
where Sold = 1
group by Style
order by InventorySold desc

--4. Which shoes got returned the most.
select top 1 Style, Color, Company, InventoryReturned = count(*)
from Inventory i
where Returned = 1
group by Style, Color, Company
order by InventoryReturned desc

--5. The amount of profit we earn on each pair of shoes.
select ProfitAmount = i.SalePrice - PurchasePrice, *
from Inventory i
where i.Sold = 1

--6. The average amount of days it takes for inventory to be sold.
select AvgDaysForShoesToSell = avg(datediff(day, i.PurchaseDate, i.SaleDate))
from Inventory i
where i.SaleDate is not null

--7. Which month people buy the most.
select top 1 MonthMostShoesSold = DateName( month, SaleDate), InventorySold = count(*)
from Inventory i
where Sold = 1
group by DateName( month , SaleDate)
order by InventorySold desc
