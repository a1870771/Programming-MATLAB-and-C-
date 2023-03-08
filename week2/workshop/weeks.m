clc; clear;

balance = input("Enter your balance: ");
expense = input("Enter your weekly expenditure: ");

weeksLeft = balance / expense;

fprintf("You have %.1f weeks left before your money runs out.\n", weeksLeft);