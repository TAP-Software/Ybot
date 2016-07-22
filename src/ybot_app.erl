%%%-----------------------------------------------------------------------------
%%% @author 0xAX <anotherworldofworld@gmail.com>
%%% @doc
%%% Ybot application.
%%% @end
%%%-----------------------------------------------------------------------------
-module(ybot_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    ybot_sup:start_link().

%% TODO is this the same as a NOOP ?
stop(_State) ->
    ok.
