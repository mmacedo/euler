#!/usr/bin/env escript

% http://projecteuler.net/problem=2

-mode(compile).

sum_even_fibonacci(Limit) when Limit =< 0 ->
  throw("Limit must be a natural number.");
sum_even_fibonacci(Limit) ->
  sum_even_fibonacci(Limit, 0, 1, 0).

sum_even_fibonacci(Limit, _Previous, Current, Sum) when Current > Limit ->
  Sum;
sum_even_fibonacci(Limit, Previous, Current, Sum) when Current rem 2 == 0 ->
  sum_even_fibonacci(Limit, Current, Previous + Current, Sum + Current);
sum_even_fibonacci(Limit, Previous, Current, Sum) ->
  sum_even_fibonacci(Limit, Current, Previous + Current, Sum).

main(_) ->
  Sum = sum_even_fibonacci(4000000),
  io:format("~p~n", [Sum]).
