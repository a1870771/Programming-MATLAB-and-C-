clc;clear;

population = input("What is the population of the city? ");

if(population < 0)
    fprintf("Error: Population cannot be nagative.\n");
    return;
end


if(mod(population, 1) ~= 0)
  fprintf("Error: Population must be an integer.\n");
  return;
end

percentageDrivers = 0.687;

%Data from the following ABS Media Release: 
% https://www.abs.gov.au/ausstats/abs@.nsf/mediareleasesbyreleasedate/7DD5DC715B608612CA2581BF001F8404

numberDrivers = percentageDrivers * population;

commuteDistance = 13.4; %km

%Data from the following ABS Media Release:
%https://www.abs.gov.au/ausstats/abs@.nsf/mf/2071.0.55.001

fuelCost = 1.82;

%Data taken from average of current fuel costs around Adelaide

litrePerKm = 0.119;

%Data taken from the following CarsGuide article:
%https://www.carsguide.com.au/car-advice/what-is-average-fuel-consumption-88469

commuteCost = commuteDistance* fuelCost * litrePerKm;

parking = 15 * 0.5;

%Data taken from full day parking costs in Adelaide and the assumption that
%50% of worker's car parks are paid for.

annualRego = 850;

annualInsurance = 1200;

%Data taken from the following Canstar webpage:
%https://www.canstar.com.au/car-insurance/south-australia/

dailyRego = annualRego / 365;

dailyInsurance = annualInsurance / 365;

totalCost = numberDrivers * (commuteCost + parking + dailyRego +dailyInsurance);

perPersonCost = totalCost / numberDrivers;

%Hopefully the per person cost comes out around $20, as I feel this is a
%realistic value. From that it follows that the total cost should be in the
%ballpark of $20 * population.

fprintf("In a city with this population, each person will spend $%f on " + ...
    "transport each day, which means that overall $%f is spent on car-based " + ...
    "transport each day.\n", perPersonCost, totalCost);