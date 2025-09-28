:- ensure_loaded('./vehicle').

% Filtrar por presupuesto
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

% Listar vehículos por marca (agrupados con findall/3)
vehicles_by_brand(Brand, References) :-
    findall(Reference, vehicle(Brand, Reference, _, _, _), References).
