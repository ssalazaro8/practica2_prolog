% Utilidades para manejo de listas

% Comparador por precio (5º elemento: Price)
compare_price(<, A, B) :-
    nth1(5, A, PriceA),
    nth1(5, B, PriceB),
    PriceA =< PriceB.
compare_price(>, A, B) :-
    nth1(5, A, PriceA),
    nth1(5, B, PriceB),
    PriceA > PriceB.

% Ordenar vehículos por precio (ascendente)
sort_by_price(List, Sorted) :-
    predsort(compare_price, List, Sorted).

% Tomar los primeros N elementos de una lista
take(_, [], []).
take(0, _, []).
take(N, [H|T], [H|R]) :-
    N > 0,
    N1 is N - 1,
    take(N1, T, R).
