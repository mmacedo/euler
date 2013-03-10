#!/usr/bin/env escript

% http://projecteuler.net/problem=67

-mode(compile).

-record(node, {row = 1,
               col = 1,
               total}).

node_key(Node) ->
  integer_to_list(Node#node.row) ++ "." ++ integer_to_list(Node#node.col).

node_key2(Node) ->
  integer_to_list(Node#node.row) ++ "." ++ integer_to_list(Node#node.col) ++ "." ++ integer_to_list(Node#node.total).

make_triangle() ->
  ScriptFolder = filename:dirname(escript:script_name()),
  { ok, Binary } = file:read_file(filename:join(ScriptFolder, "data/triangle.txt")),
  Lines = string:tokens(binary_to_list(Binary), "\r\n"),
  [[list_to_integer(Number) || Number <- string:tokens(Line, " ")] || Line <- Lines].

largest_value(Triangle) ->
  MaxFunction = fun(A, B) when A > B -> A;
                   (_, B) -> B
                end,
  FlatTriangle = [ Value || Row <- Triangle, Value <- Row ],
  lists:foldl(MaxFunction, hd(FlatTriangle), tl(FlatTriangle)).

invert_triangle(Triangle) ->
  LargestValue = largest_value(Triangle),
  [lists:map(fun(A) -> LargestValue - A end, Row) || Row <- Triangle ].

explore_node(Triangle, Node) when Node#node.row == length(Triangle) - 1 ->
  [
    #node {
      row =   Node#node.row + 1,
      col =   0,
      total = Node#node.total
    }
  ];
explore_node(Triangle, Node) when Node#node.row < length(Triangle) - 1 ->
  Row = lists:nth(Node#node.row + 1, Triangle),
  [
    #node {
      row =   Node#node.row + 1,
      col =   Node#node.col,
      total = Node#node.total + lists:nth(Node#node.col, Row)
    },
    #node {
      row =   Node#node.row + 1,
      col =   Node#node.col + 1,
      total = Node#node.total + lists:nth(Node#node.col + 1, Row)
    }
  ].


close_node(Closed, Node) ->
  case orddict:find(node_key(Node), Closed) of
    { ok, Total } when Total > Node#node.total ->
      orddict:update(node_key(Node), Node#node.total, Closed);
    error ->
      orddict:store(node_key(Node), Node#node.total, Closed);
    _ -> Closed
  end.

open_nodes(Open, Closed, Nodes) ->
  OpenFoldFunction =
    fun(Node, OpenAcc) ->
      case orddict:find(node_key(Node), Closed) of
        {ok, _} -> OpenAcc;
        error -> orddict:store(node_key2(Node), Node, OpenAcc)
      end
    end,
  lists:foldl(OpenFoldFunction, Open, Nodes).

best_node([]) ->
  throw("No open node.");
best_node(Open) ->
  BestFunction =
    fun(_, Node, nil) -> Node;
       (_, Node, Acc) when Node#node.total < Acc#node.total -> Node;
       (_, _, Acc) -> Acc
    end,
  orddict:fold(BestFunction, nil, Open).

% Best-First Search
graph_traversal(Triangle, Start) ->
  Open = orddict:store(node_key2(Start), Start, orddict:new()),
  Closed = orddict:new(),
  graph_traversal(Triangle, Open, Closed).

graph_traversal(_Triangle, [], _Closed) ->
  not_found;
graph_traversal(Triangle, Open, Closed) ->
  Next = best_node(Open),
  Open2 = orddict:erase(node_key2(Next), Open),
  graph_traversal(Triangle, Open2, Closed, Next).

graph_traversal(Triangle, _Open, _Closed, Current) when Current#node.row == length(Triangle) ->
  {ok, Current};
graph_traversal(Triangle, Open, Closed, Current) ->
  Closed2 = close_node(Closed, Current),
  Open2 = open_nodes(Open, Closed2, explore_node(Triangle, Current)),
  graph_traversal(Triangle, Open2, Closed2).

main(_) ->
  Triangle = make_triangle(),
  LargestValue = largest_value(Triangle),
  ModifiedTriangle = invert_triangle(Triangle) ++ [[0]],
  Start = #node{ total = lists:nth(1, lists:nth(1, ModifiedTriangle)) },
  {ok, Best} = graph_traversal(ModifiedTriangle, Start),
  io:format("~p~n", [LargestValue * length(Triangle) - Best#node.total]).
