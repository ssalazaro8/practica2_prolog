:- begin_tests(vehicle_system).
:- ensure_loaded('../src/queries').
:- ensure_loaded('../src/report_manager').

% Caso 1: Toyota SUV < 30,000
test(toyota_suv_under30k) :-
    findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), Result),
    assertion(Result == [rav4]).

% Caso 2: Vehículos Ford agrupados por tipo y año con bagof/3
test(ford_grouped) :-
    bagof((Type,Year,Ref), vehicle(ford, Ref, Type, _, Year), Result),
    assertion(Result \= []).

% Caso 3: Total de sedanes <= 500,000
test(sedan_total) :-
    findall((Brand,Ref,Type,Price,Year), vehicle(_, Ref, sedan, Price, Year), Sedans),
    sum_prices(Sedans, Total),
    assertion(Total =< 500000).

:- end_tests(vehicle_system).
