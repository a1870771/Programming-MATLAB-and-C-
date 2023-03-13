clc;clear;

population = input("What is the population of the city? ");
waterPerHousehold = 200 / 365;
peoplePerHousehold = 2.6;
waterPerPerson = waterPerHousehold / peoplePerHousehold;

% Data from ABS Water Account 2015-2016 accessible at this URL: 
% https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/4610.02015-16?OpenDocument

totalWater = population * waterPerPerson;

if(population < 0)
    fprintf("Error: Population cannot be negative.\n");
    return;
end

fprintf("An estimate of the water use in a city of population %d is %fKL per day.\n", population, totalWater);
