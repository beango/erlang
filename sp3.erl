-module(sp3).
-export([say/1,f1/0,f2/2,start_f1/0,start_f2/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �ֲ�ʽ���
% �����ʺ�
% ������shell,������sp3:start_f1.��sp3:start_f2().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f1()	->
	receive
		{Pid,done}	-> io:format("�õ�,��Ȼ��û������Ҫ˵��,����˯��ȥ��.~n",[]);
		{Pid,Msg}	-> Pid ! {self(), "f1:�ҽ����㷢������Ϣ."},
					   f1();
		_ -> io:format("ʲôҲû˵.~n",[])
	end.

f2(N,Word)	->
	{n1,N} ! {self(),Word},
	receive
		{Pid2,WordReturn}	->	
			io:format("�ǵ�,��֪����.~n",[]),
			Pid2 ! {self(),done}
	end.

start_f1() ->
    register(n1, spawn(sp3, f1, [])).

start_f2(Pong_Node) ->
    spawn(sp3, f2, [Pong_Node,"hello"]).