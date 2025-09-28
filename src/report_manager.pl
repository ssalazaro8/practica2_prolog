:- ensure_loaded('./vehicle').

% Sumar precios
sum_prices([], 0).
sum_prices([(_,_,_,Price,_)|T], Total) :-
    sum_prices(T, Sub),
    Total is Sub + Price.

% Tomar vehículos hasta que el total no supere un límite
take_until_limit([], _, [], 0).
take_until_limit([H|T], Limit, [H|R], Total) :-
    H = (_,_,_,Price,_),
    Price =< Limit,
    NewLimit is Limit - Price,
    take_until_limit(T, NewLimit, R, SubTotal),
    Total is SubTotal + Price.
take_until_limit([H|_], Limit, [], 0) :-
    H = (_,_,_,Price,_),
    Price > Limit.

% Generar reporte con restricción de presupuesto y límite global
% generate_report(+Brand,+Type,+Budget,-Result).
generate_report(Brand, Type, Budget, (Selected, Total)) :-
    findall((Brand,Ref,Type,Price,Year),
            (vehicle(Brand, Ref, Type, Price, Year), Price =< Budget),
            Vehicles),
    sum_prices(Vehicles, Total0),
    MaxLimit = 1000000,
    ( Total0 =< MaxLimit ->
        Selected = Vehicles,
        Total = Total0
    ;   sort(4, @=<, Vehicles, Sorted),
        take_until_limit(Sorted, MaxLimit, Selected, Total)
    ).
