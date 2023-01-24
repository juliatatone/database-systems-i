drop trigger logBookInsert;
drop trigger logBookInsertRow;

drop table logBooks; 
create table logBooks(
    logDateTime timestamp,
    logDescription varchar2(25)
);

-- Statement level trigger

create or replace trigger logBookInsert
after update on SFBooks
begin
    insert into logBooks values (systimestamp, 'Updated a book');
end;
/

select *
from SFBooks
where price < 25;
select * from logBooks;


--row level trigger
create or replace trigger logBookInsertRow
after update on SFBooks
for each row
begin
    insert into logBooks values (systimestamp, 'Updated a book row');
end;
/

update SFBooks set priceType = 'No Bargain'
where price >25;
select * from SFBooks;

create or replace trigger NewPrices
before insert on LitBooks 
FOR EACH ROW
--when the new price of the ***inserted record*** is over $25
when (new.price > 25)
begin
    update litBooks
    set priceType = 'New Prices';
end;
/

insert into LitBooks values('0393970194', 'Bram', 'Stoker', 'Vampires', 1897, 31.25, '', 102);
insert into LitBooks values('0393970195', 'Bram', 'Stoker', 'Frankenstein', 1897, 31.25, '', 102);
insert into LitBooks values('0393970165', 'Bram', 'Stoker', 'Mummies', 1897, 31.25, '', 102);

select * from LitBooks;

create or replace trigger AfterNewPrices
after insert on LitBooks 
FOR EACH ROW
--when the new price of the ***inserted record*** is over $25
when (new.price > 25)
begin
    update litBooks
    set priceType = 'New Prices';
end;
/