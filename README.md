https://hexdocs.pm/phoenix/installation.html#elixir-1-14-or-later

mix local.hex
mix archive.install hex phx_new

-> to open a terminal: iex

-> new project: mix new <project name> --sup
-> to deploy the declared dependencies: mix deps.get
-> to run tests: mix test
-> to run the app: iex -S mix run
-> to apply new changes: recompile (within the shell)/mix compile (stoping the execution, so using mix)

-> to see the project's documentation: h<project name>
-> to see a function's documentation: h<project name>.<function name>
-> all the public functions in a project: export <project name>