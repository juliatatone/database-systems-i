drop trigger PDate
drop trigger CheckBus
drop trigger SeniorSalary
drop trigger NoDoubleShift

/* Trigger 1
   When a booked tour is created, the
   PurchaseDate is automatically set to 90 days
   after the creation date, i.e., D + 90 days.
 */	

create or replace trigger PDate
before insert on BookedTour
for each row
declare
    tempDate date;
begin
    select sysdate into tempDate 
    from Dual;
    
    :new.purchaseDate := tempDate + 90; --comparisons are =, assignments are := 
end;
/

INSERT INTO BookedTour VALUES(8, null, '3-Sep-16', 0, 3, 3, 'D4P', 4);
select * 
from bookedtour
where bookedtourid = 8;

/* Trigger 2  
   Buses must be made in 2010 or newer
 */


create or replace trigger CheckBus
before insert or update on Vehicle
for each row
declare 
    cursor bus1 is
        select vehicleType, Year
        from Vehicle;
begin
    if (:new.vehicleType = 'bus' and :new.year < 2010) then
        RAISE_APPLICATION_ERROR(-20003, 'INSERTED ROW ERROR: Bus must be made in 2010 or newer');
    end if;
    --test every existing record in the table 
    for vehicleRow in Bus1 loop
            if (vehicleRow.vehicleType = 'bus' and vehicleRow.year < 2010) then
            RAISE_APPLICATION_ERROR(-20003, 'INSERTED ROW ERROR: Bus must be made in 2010 or newer');
        end if;
    end loop;
end;
/


INSERT INTO Vehicle VALUES('S7M', 'bus', 'VW', 'Microbus', 2008, 10);
INSERT INTO Vehicle VALUES('L1Z', 'bus', 'Honda', 'Megabus', 2004, 30);

/* Trigger 3
   Senior guides must have a salary of at least $50,000
 */


INSERT INTO Guide VALUES(11, 'Maria', 'Martinez', 5088314993, 'car', 'Senior Guide', 48000, '23-Mar-16');

/* Trigger 4 
   A tour guide cannot be assigned to more than one booked tour in the same day.
 */	

create or replace trigger NoDoubleShift
before insert on BookedTour
for each row
declare
    tempDate date;
    tempGuide number(3);
    cursor B1 is 
        select driverLicense, travelDate
        from BookedTour;
begin
    tempDate := :new.travelDate;
    tempGuide := :new.driverLicense;
    for bookedTourRow in B1 loop
        if (bookedTourRow.driverLicense = tempGuide and bookedTourRow.travelDate = tempDate) then
            RAISE_APPLICATION_ERROR(-20007, 'ERROR: Tour Guide already assigned to that travel date');
        end if;
    end loop;
end;
/

select * from BookedTour;
INSERT INTO BookedTour VALUES(10, '19-Feb-16', '3-Jun-16', 0, 2, 4, 'A1K', 3);

