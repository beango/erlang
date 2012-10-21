-module(sp).
-export([start/0,say/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 并行编程
% 每隔一段时间输出一句话
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

say(Word,Times)	when Times >0 ->
	io:format("~p~n",[Word]),
	say(Word,Times-1);
say(Word,0)		->
	done.

start()	->
	spawn(sp,say,[hello,3]),
	spawn(sp,say,[goodbye,3]).