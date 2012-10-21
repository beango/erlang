-module(sp3).
-export([say/1,f1/0,f2/2,start_f1/0,start_f2/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 分布式编程
% 互相问候
% 开两个shell,先运行sp3:start_f1.再sp3:start_f2().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1()	->
	receive
		{Pid,done}	-> io:format("好的,既然你没有其他要说的,那我睡觉去了.~n",[]);
		{Pid,Msg}	-> Pid ! {self(), "f1:我接收你发来的消息."},
					   f1();
		_ -> io:format("什么也没说.~n",[])
	end.

f2(N,Word)	->
	{n1,N} ! {self(),Word},
	receive
		{Pid2,WordReturn}	->	
			io:format("是的,我知道了.~n",[]),
			Pid2 ! {self(),done}
	end.

start_f1() ->
    register(n1, spawn(sp3, f1, [])).

start_f2(Pong_Node) ->
    spawn(sp3, f2, [Pong_Node,"hello"]).