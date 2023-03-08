clc;clear;

population = input("What is the population of the city? ");
waterPerHousehold = 200 / 365;
peoplePerHousehold = 2.6;
waterPerPerson = waterPerHousehold / peoplePerHousehold;

% Data from ABS Water Account 2015-2016 accessible at this URL: 
% https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/4610.02015-16?OpenDocument

totalWater = population * waterPerPerson;

if(population < 0)
    fprintf("Error: Population cannot be nagative.\n");
    return;
end


if(mod(population, 1) ~= 0)
  fprintf("Error: Population must be an integer.\n");
  return;
end

desalCapacity = 3e5; %kilolitres

desalCoverage = 100 * desalCapacity / totalWater;

fprintf("A desalination plant which a capacity of %dKL in such a " + ...
    "city can cover %f percent of the daily water use.\n", desalCapacity, desalCoverage);
