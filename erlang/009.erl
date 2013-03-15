#!/usr/bin/env escript

% http://projecteuler.net/problem=9

-mode(compile).

pythagorean_triplet(Sum) ->
  pythagorean_triplet(Sum, 1, 2).

pythagorean_triplet(Sum, C1, _C2) when C1 >= Sum ->
  throw("There is no pythagorean triplet with that sum.");
pythagorean_triplet(Sum, C1, C2) when C1 + C2 >= Sum ->
  pythagorean_triplet(Sum, C1 + 1, C1 + 2);
pythagorean_triplet(Sum, C1, C2) ->
  H = Sum - C2 - C1,
  case (H * H) == (C1 * C1) + (C2 * C2) of
    true  -> {C1, C2, H};
    false -> pythagorean_triplet(Sum, C1, C2 + 1)
  end.

main(_) ->
  {A, B, C} = pythagorean_triplet(1000),
  io:format("~p~n", [A * B * C]).
