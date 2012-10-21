-module(sp2).
-export([say/0,f1/0,f2/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���б��
% �����ʺ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

say()	->
	Pid = spawn(sp2,f1,[]),
	spawn(sp2,f2,[Pid,"hello f1~n"]).

f1()	->
	receive
		{Pid,done}	-> io:format("�õ�,��Ȼ��û������Ҫ˵��,����˯��ȥ��.~n",[]);
		{Pid,Msg}	-> Pid ! {self(), "f1:�ҽ����㷢������Ϣ."},
					   f1()
	end.

f2(Pid,Word)	->
	Pid ! {self(),Word},
	receive
		{Pid2,WordReturn}	->	
			io:format("�ǵ�,��֪����.~n",[]),
			Pid2 ! {self(),done}
	end.
