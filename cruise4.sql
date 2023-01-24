--#3

Select portName as Location, count(firstName) as NumberOfPassengers 
from Booking B Join location L 
	on B.cruiseID = L.cruiseID
Join passenger P 
	on P.passengerID = B.passengerID
Group By Rollup(portName)
Order By NumberOfPassengers;

--#4

Select restaurantName, sum(fee) AS Sales
From DiningReservation Natural Join Dining
Natural Join Passenger
Where isBuffet = 'Y'
Group By restaurantName
Having sum(fee) > 100
Order By Sales desc;

--#5

Select shipName, count(bookingID) as NumberOfBookings
From Cruise C Join Booking B 
	on C.cruiseID = B.cruiseID
Join Ship S 
	on S.shipID = C.shipID
Group By shipName
Having count(bookingID) = 
	(select max(CNT) as Max from(
		select shipName, count(bookingID) as CNT 
		from Cruise C Join Booking B
			on C.cruiseID = B.cruiseID
		Join Ship S 
			on S.shipID = C.shipID
		Group By shipName
		)
	);

--#6

update Location
set Excursion = 'N'
where excursionPrice in( 
select excursionPrice  from Location  
where excursionPrice < 50);

update Location
set excursionPrice = 0
where excursion in( 
select excursion  from Location  
where excursion = 'N');

--#7

Select B.bookingID, P.firstName, P.lastName, S.shipName, P.city, B.price, B.cabin
From Cruise C Join Ship S  
    On C.shipID = S.shipID
Join Booking B
	On B.cruiseID = C.cruiseID 
Join Passenger P
    On P.passengerID = B.PassengerID
Where shipName like '%away'
and cabin LIKE  'A%'
Order By city, lastName;