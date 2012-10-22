%%%---------------------------------------------------------------------------------

%% editplus + 批处理 + 本文 实现简易编译

%% 作者：冷志峰

%% 2009，8，3

%% email：sunbo008@126.com

%% 谁给我个这个网站的邀请码 http://www.fpscript.com/bbs/forum-65-1.html

%%

%% 步骤1：编写批处理文件

%% erl -shell -s mycompile compile_debug %1 -s init stop

%% erl -shell -s mycompile compile_release %1 -s init stop

%% 步骤2：编译本文件，并将其放到 compile 模块相同目录，

%% 比如：D:\Program Files\erl5.7.1\lib\compiler-4.6.1\ebin\

%% 步骤3：配置editplus，详情见图《EditPlus配置图及编译输出.bmp》

%%

%% 接下来你就可以去爽了， 按 ctrl + 1 就可以编译 erl文件了

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