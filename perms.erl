-module(perms).
-export([perms/1]).

%perms:perms("1235").
perms([]) -> [[]];
perms(L) -> 
    [ [T1|T2] ||
      T1 <- L,
      T2 <- perms(L--[T1])
    ].

