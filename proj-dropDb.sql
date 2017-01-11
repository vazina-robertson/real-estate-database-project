--
--  Clean up the realty demo database
--

set termout on
prompt Removing sample realty database. Please wait ...
set termout off
set feedback off

drop table Branch 		 cascade constraint;
drop table Client   	 cascade constraint;
drop table Owner    	 cascade constraint;
drop table Renter   	 cascade constraint;
drop table Buyer    	 cascade constraint;
drop table Property 	 cascade constraint;
drop table Advertisement cascade constraint;
drop table Staff      	 cascade constraint;
drop table Sale      	 cascade constraint;

