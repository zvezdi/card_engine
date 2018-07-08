# Ui

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ui` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ui, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ui](https://hexdocs.pm/ui).

## Test with websocket client
1. Run the elixir ui from `card_engine/ui` run
```bash
iex -S mix
```
2. Run websocket client (wrapped in rlwrap for convenience)
```bash
rlwrap telsocket -url ws://localhost:4000/ws
```
3. Preform action in websocket client
```json
{"action": "register_room", "arguments": {"name": "Room 1"}}
{"action": "list_rooms"}
```