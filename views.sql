-- start with a select statement to make sure it is correct
select *
from SFBooks
where lastName = 'Asimov' or lastName = 'Heinlein';

-- then create the view
create or replace view SFMasters_v as
  select *
  from SFBooks
  where lastName = 'Asimov' or lastName = 'Heinlein';

-- now the view can be used like a table
select lastName, title, copyright, price, name, city
from Publishers P join SFMasters_v S
  on P.PubID = S.PubID;

-- Example 2
-- start with a select statement to make sure it is correct
select FirstName, LastName, Title, Copyright, Price, PubID
from SFBooks
where Copyright >= 1980
UNION
select FirstName, LastName, Title, Copyright, Price, PubID
from LitBooks
where Copyright < 1680;

-- then create the view
create or replace view oldLitandNewSF_v as
(select FirstName, LastName, Title, Copyright, Price, PubID
 from SFBooks
 where Copyright >= 1980) 
 UNION
(select FirstName, LastName, Title, Copyright, Price, PubID
 from LitBooks
 where Copyright < 1680)
;

-- now the view can be used like a table
select * from oldLitandNewSF_v;

select lastName, title, to_char(price, 990.99) as FPrice
from oldLitandNewSF_v
where price > 25;



