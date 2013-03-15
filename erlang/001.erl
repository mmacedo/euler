#!/usr/bin/env escript

% http://projecteuler.net/problem=1

-mode(compile).

sum_multiples_of_3_and_5_below(Limit) when Limit =< 1 ->
  throw("Limit must be a natural number.");
sum_multiples_of_3_and_5_below(Limit) ->
  Numbers = lists:seq(1, Limit - 1),
  IsMultipleOf3And5 = fun (X) -> (X rem 3 == 0) or (X rem 5 == 0) end,
  MultiplesOf3And5 = lists:filter(IsMultipleOf3And5, Numbers),
  lists:sum(MultiplesOf3And5).

main(_) ->
  Sum = sum_multiples_of_3_and_5_below(1000),
  io:format("~p~n", [Sum]).
