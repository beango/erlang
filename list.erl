-module(list).
-export([list_max/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 找出最大数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
list_max([L|Split]) -> list_max(Split,L).

list_max([L|Split],Max)	when L>Max	-> list_max(Split,L);
list_max([_|Split],Max)	-> list_max(Split,Max);
list_max([],Max)	-> Max.
	

