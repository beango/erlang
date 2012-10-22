%%%---------------------------------------------------------------------------------

%% editplus + ������ + ���� ʵ�ּ��ױ���

%% ���ߣ���־��

%% 2009��8��3

%% email��sunbo008@126.com

%% ˭���Ҹ������վ�������� http://www.fpscript.com/bbs/forum-65-1.html

%%

%% ����1����д�������ļ�

%% erl -shell -s mycompile compile_debug %1 -s init stop

%% erl -shell -s mycompile compile_release %1 -s init stop

%% ����2�����뱾�ļ���������ŵ� compile ģ����ͬĿ¼��

%% ���磺D:\Program Files\erl5.7.1\lib\compiler-4.6.1\ebin\

%% ����3������editplus�������ͼ��EditPlus����ͼ���������.bmp��

%%

%% ��������Ϳ���ȥˬ�ˣ� �� ctrl + 1 �Ϳ��Ա��� erl�ļ���

%%%---------------------------------------------------------------------------------

-module(mycompile).

-export([compile_debug/1, compile_release/1]).

compile_debug(File) ->

begin

case compile:file(File, [verbose,report_errors,report_warnings, debug_info]) of

{ok, Reason} -> io:format("~p~n", [{ok, Reason}]);

Val -> io:format("~p~n", [Val])

end

end.

compile_release(File) ->

begin

case compile:file(File) of

{ok, Reason} -> io:format("~p~n", [{ok, Reason}]);

Val -> io:format("~p~n", [Val])

end

end.