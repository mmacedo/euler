#!/usr/bin/env escript

% http://projecteuler.net/problem=6

-mode(compile).

square_of_sums(X) ->
  Numbers = lists:seq(1, X),
  Sum     = lists:sum(Numbers),
  Sum * Sum.

sum_of_squares(X) ->
  Numbers = lists:seq(1, X),
  Squares = lists:map(fun(X) -> X * X end, Numbers),
  lists:sum(Squares).

main(_) ->
  Result = square_of_sums(100) - sum_of_squares(100),
  io:format("~p~n", [Result]).
