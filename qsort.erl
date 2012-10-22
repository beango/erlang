-module(qsort).
-export([sort/1]).

% qsort:sort([5,7,12,90,51,1,18]).
sort([X|T]) ->
    sort([K || K <- T, K<X]) ++ [X] ++ sort([K || K <- T, K>=X]);
sort([]) -> [].