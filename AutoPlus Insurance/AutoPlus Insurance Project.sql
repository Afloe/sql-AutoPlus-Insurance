SELECT * FROM autoplus_insurance.customer;

#Average Income by Gender
select gender, avg(income) as average_income from autoplus_insurance.customer
group by gender;

#Average of Total claim amount by each policy type
select policy_type, avg(total_claim_amount) as average_claim 
from autoplus_insurance.policy
group by policy_type;

#Counting the number of people grouped by their marital status
select marital_status, count(customer) from autoplus_insurance.customer
group by marital_status;

#Counting the number of people in each state
select state, count(customer) from autoplus_insurance.customer
group by State;
#there are 5 states with Oregon and Califonia having the highest populations repectively

#Finding the average income of employed and unemployed customers grouped by their marital status
Select marital_status, employment_status, count(employment_status) as number_employment_status, 
avg(income) as average_income
from autoplus_insurance.customer
group by Marital_Status, Employment_Status
having Employment_Status in("Employed", "Unemployed")
order by Marital_Status desc;

#the average income of customers by their marital status
select marital_status, avg(income) as average_income
from autoplus_insurance.customer
group by Marital_Status;

#number of people on insurance by each state
select state, count(customer) from autoplus_insurance.customer
group by state;

#Number of policies made by each state
select aic.state, sum(number_of_policies) as number_of_policies from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state;

#Number of policies and total claim made by their marital status and employment status
select Marital_Status, employment_status, sum(number_of_policies) as number_of_policies, avg(Total_Claim_Amount) as total_claim from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by Employment_Status, Marital_Status
order by Employment_Status;

#Number of policies made by each state
select aic.state, policy, sum(number_of_policies) as number_of_policies from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state, Policy
order by state;

#Count of policy by marital status
select Marital_Status, policy, count(policy) as number_of_policies from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by Marital_Status, Policy
order by Marital_Status;

#Count of vehicle size under state, policy and vehicle size
select aic.state, policy, vehicle_size, count(Vehicle_Size) from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state, Policy, Vehicle_Size
order by state;

#sum of policies and average total claims made by state and vehicle size
select aic.state, Vehicle_Size, sum(number_of_policies) as number_of_policies,
avg(Total_Claim_Amount) as average_claim from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state, Vehicle_Size
order by state;

#Number of complaints made by state and policy
select aic.state, policy, sum(Number_of_Open_Complaints) as number_of_complaints from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state, Policy
order by state;

#Number of complaints received by each state
select aic.state, sum(Number_of_Open_Complaints) as number_of_complaints from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state
order by number_of_complaints;

#Percentage of complaints made by each policy
select policy, sum(number_of_open_complaints) as number_of_complaints, sum(Number_of_Policies) as number_of_policies,
(sum(Number_of_Open_Complaints)/sum(Number_of_Policies))*100 as Percentage_of_Complaints
from autoplus_insurance.policy
group by Policy
order by number_of_complaints;

#Number of policy type made by each state
select aic.state, Policy_Type, count(Policy_Type) as policy_type, sum(Number_of_Policies) as number_of_policies from autoplus_insurance.customer aic
join autoplus_insurance.policy aip
on aic.Customer = aip.Customer
group by state, Policy_Type
order by state;

