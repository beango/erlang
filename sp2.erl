-module(sp2).
-export([say/0,f1/0,f2/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 并行编程
% 互相问候
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

say()	->
	Pid = spawn(sp2,f1,[]),
	spawn(sp2,f2,[Pid,"hello f1~n"]).

f1()	->
	receive
		{Pid,done}	-> io:format("好的,既然你没有其他要说的,那我睡觉去了.~n",[]);
		{Pid,Msg}	-> Pid ! {self(), "f1:我接收你发来的消息."},
					   f1()
	end.

f2(Pid,Word)	->
	Pid ! {self(),Word},
	receive
		{Pid2,WordReturn}	->	
			io:format("是的,我知道了.~n",[]),
			Pid2 ! {self(),done}
	end.
