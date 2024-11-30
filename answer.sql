--1 query to retrieve the provider_name and provider_specialty 
-- for each provider in the providers table.

select first_name, last_name, provider_specialty from providers;

--2 SQL query to find all patients who have visited a provider. 
-- Display the patient_id, first_name, last_name and provider_specialty.

select patients.first_name, patients.last_name, provider_specialty from 
patients inner join visits inner join providers
on patients.patient_id = visits.patient_id = visits.provider_id;


--3 SQL query to list all patients and their visit details, including those who have not had any visits. 
-- Display patient_id, first_name, last_name and date_of_visit. Include patients with no visits.

select patients.patient_id, patients.first_name, patients.last_name, visits.date_of_visit from 
patients left join visits
on patients.patient_id = visits.patient_id;

--4 SQL query to find the number of visits each provider has had. 
-- Display the provider_name and the count of visits.

select providers.first_name, providers.last_name, count(date_of_visit) as number_of_visits from 
visits join providers
on visits.provider_id = providers.provider_id
group by providers.first_name, providers.last_name
order by number_of_visits desc;

--5 SQL query to find all patients who have had visits that required admission. Display the patient_id, first_name, last_name, admission_date and discharge_date. 
-- Ensure you join all relevant tables to get this information.

select 
patients.patient_id, 
patients.first_name, 
patients.last_name, 
admission_date, 
discharge_date 
from patients 
join ed_visits on patients.patient_id = ed_visits.patient_id
 join admissions on ed_visits.patient_id = admissions.patient_id
 join discharges on admissions.patient_id = discharges.patient_id
where ed_visits.ed_disposition = "admitted";