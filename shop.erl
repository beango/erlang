-module(shop).   
-export([total/1]).    
-export([total1/1]).

% shop:total([{a,2},{c,5}]).
total(L) -> sum(lists:map(fun({X,Y})->price(X)*Y end,L)).

% shop:total1([{a,2},{c,5}]).
total1(L) -> sum([ price(X)*Y || {X,Y} <- L]).

sum([X|Y]) -> X+sum(Y);
sum([])    -> 0.

price(a) -> 1;
price(b) -> 2;
price(c) -> 2.5.