-module(demo).   
-export([sum/1]).    

sum([X|T]) -> X + sum(T);
sum([])    -> 0.
