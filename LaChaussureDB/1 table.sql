use LaChaussureDB
go
drop table if exists dbo.Inventory
go
create table dbo.Inventory(
    ShoeId int not null identity primary key,
    Style varchar(50) not null constraint ck_Inventory_Style_must_have_at_least_three_characters check(len(Style) >= 3),
    Size int not null constraint ck_Inventory_Size_must_be_greater_than_Zero check(Size > 0),
    Color varchar(50) not null constraint ck_Inventory_Color_must_have_at_least_two_characters check(len(Color) >= 2),
    Company varchar(100) not null constraint ck_Inventory_Company_must_have_at_least_two_characters check(len(Company) >= 2),
    PurchasePrice decimal(5,2) not null constraint ck_Inventory_Purchase_Price_must_be_greater_than_0_and_less_than_451 check(PurchasePrice between 0.01 and 450.99),
    PurchaseDate date not null,
    SaleDate date,
    SalePrice decimal(5,2) constraint ck_Inventory_Sale_Price_must_be_between_0_and_450_dollars_and_99_cent check(SalePrice between 0.01 and 450.99),
    Returned bit,
    Sale bit not null constraint d_Shoe_sale default 0,
    SalesPerson varchar(100) not null constraint d_Inventory_Sales_person default '',
    StyleNumber as concat(SUBSTRING(style, 1, 3), '-', SUBSTRING(Company, len(Company) - 2, 2), Upper(SUBSTRING(color, 1, 2))) PERSISTED,-- constraint u_Shoe_Style_number unique,
    Sold as case when SaleDate is not null and Returned = 0 then 1 else 0 end,
    constraint ck_when_shoe_is_sold_all_related_fields_must_have_value check(
        (SalesPerson <> '' and SaleDate is not null and SalePrice is not null and Returned is not null)
        or (SalesPerson = '' and SaleDate is null and Returned is null)
    ),
    constraint ck_date_sold_must_be_after_or_on_purchase_date check(PurchaseDate <= SaleDate or SaleDate is null)
)