% -module(primes).
% -export([is_prime/1]).

is_prime(X) when X =< 0 ->
  throw("Number must be a positive integer.");
is_prime(1) ->
  false;
% test for 2 to start the loop with 3
is_prime(2) ->
  true;
is_prime(X) when X rem 2 == 0 ->
  false;
% start with 3 to be able to skip evens
is_prime(X) when X >= 3 ->
  is_prime(X, 3).

is_prime(X, Factor) when (Factor * Factor) > X ->
  true;
is_prime(X, Factor) when X rem Factor == 0 ->
  false;
% skip evens to go twice as fast
is_prime(X, Factor) ->
  is_prime(X, Factor + 2).
