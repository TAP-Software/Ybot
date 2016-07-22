-module(first_tests).
-include_lib("eunit/include/eunit.hrl").

dumb_easy_pass_test() ->
  ?assertEqual(4, 2 + 2).

dumb_this_will_fail_test() ->
  ?assertEqual(1, 2).

?assertEqual(2, 1).
