#!/usr/bin/env escript

% http://projecteuler.net/problem=3

-mode(native).

-include_lib("primes.erl").

largest_prime_factor(X) when X =< 0 ->
  throw("Number must be a positive integer.");
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
