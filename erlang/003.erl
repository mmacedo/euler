#!/usr/bin/env escript

% http://projecteuler.net/problem=3

-mode(compile).

is_prime(X) when X =< 0 ->
  throw("Number must be a natural number.");
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

largest_prime_factor(X) when X =< 0 ->
  throw("Number must be a natural number.");
largest_prime_factor(X) ->
  largest_prime_factor(X, 2).

largest_prime_factor(X, Factor) when Factor >= X ->
  throw("Number does not have a prime factor.");
% for bigger half of the factors it will take sqrt(N) steps
largest_prime_factor(X, SmallerFactor) when X rem SmallerFactor == 0 ->
  LargerFactor = X div SmallerFactor,
  case is_prime(LargerFactor) of
    true -> LargerFactor;
    false -> largest_prime_factor(X, SmallerFactor + 1)
  end;
largest_prime_factor(X, Factor) ->
  largest_prime_factor(X, Factor + 1).

main(_) ->
  Number = 600851475143,
  Largest = largest_prime_factor(Number),
  io:format("~p~n", [Largest]).
