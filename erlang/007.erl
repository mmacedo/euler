#!/usr/bin/env escript

% http://projecteuler.net/problem=7

-mode(compile).

-include_lib("primes.erl").

nth_prime(N) when N =< 0 ->
  throw("N must be a positive integer.");
nth_prime(N) ->
  nth_prime(N, 0, 1).

nth_prime(N, N, Number) ->
  Number - 1;
nth_prime(N, Index, Number) ->
  case is_prime(Number) of
    true  -> nth_prime(N, Index + 1, Number + 1);
    false -> nth_prime(N, Index,     Number + 1)
  end.

main(_) ->
  Result = nth_prime(10001),
  io:format("~p~n", [Result]).
