-module(sp).
-export([start/0,say/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���б��
% ÿ��һ��ʱ�����һ�仰
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

say(Word,Times)	when Times >0 ->
	io:format("~p~n",[Word]),
	say(Word,Times-1);
say(Word,0)		->
	done.

start()	->
	spawn(sp,say,[hello,3]),
	spawn(sp,say,[goodbye,3]).