#!/usr/bin/env escript

% http://projecteuler.net/problem=5

-mode(compile).

is_divisible_by(Factor) ->
  fun
    (X) -> X rem Factor == 0
  end.

divide_if_disible_by(Factor) ->
  fun
    (X) when X rem Factor == 0 -> X div Factor;
    (X) -> X
  end.

greater_than_one(X) ->
  X > 1.

% Least Common Multiple
lcm([]) ->
  throw("Empty array passed to lcm.");
lcm(Numbers) ->
  lcm(Numbers, 2, 1).

lcm([], _Factor, Result) ->
  Result;
lcm(Numbers, Factor, Result) ->
  case lists:any(is_divisible_by(Factor), Numbers) of
    true ->
      Numbers_After_Division   = lists:map(divide_if_disible_by(Factor), Numbers),
      Number_After_Elimination = lists:filter(fun greater_than_one/1, Numbers_After_Division),
      lcm(Number_After_Elimination, Factor, Result * Factor);
    _ ->
      lcm(Numbers, Factor + 1, Result)
  end.

main(_) ->
  Numbers = lists:seq(1, 20),
  Result = lcm(Numbers),
  io:format("~p~n", [Result]).
