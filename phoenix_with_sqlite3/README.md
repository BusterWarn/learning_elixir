# Phoenix With Sqlite3

### Some problems with Sqlite3 on Windows

I had problems setting up Sqlite3 with Phoenix. First of all I downloaded `sqlite-tools-win32-x86-3430200.zip` from here: https://www.sqlite.org/download.html. After that just unzip it and add it to system path environment variable.

Create a new phoenix project:
```powershell
PS learning_elixir> mix.bat phx.new phoenix_with_sqlite3 --database sqlite3 --no-html
```

But this is where the pronblems began
```powershell
PS learning_elixir\phoenix_with_sqlite3> mix.bat ecto.create
==> exqlite
process_begin: CreateProcess(NULL, uname -s, ...) failed.
Makefile:46: pipe: No error
The syntax of the command is incorrect.
make: *** [Makefile:145: learning_elixir/phoenix_with_sqlite3/_build/dev/lib/exqlite/priv] Error 1
could not compile dependency :exqlite, "mix compile" failed. Errors may have been logged above. You can recompile this dependency with "mix deps.compile exqlite --force", update it with "mix deps.update exqlite" or clean it with "mix deps.clean exqlite"
...
```

However after reading [Cannot compile exqlite on Windows](https://stackoverflow.com/questions/69881330/cannot-compile-exqlite-on-windows) on stack overflow:
```powershell
PS learning_elixir\phoenix_with_sqlite3> cmd /k "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
**********************************************************************
** Visual Studio 2019 Developer Command Prompt v16.11.19
** Copyright (c) 2021 Microsoft Corporation
**********************************************************************
[vcvarsall.bat] Environment initialized for: 'x64'
```

Yeah and it's already mentioned in the [documentation](https://github.com/elixir-sqlite/exqlite/blob/main/guides/windows.md)...


### To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4040`](http://localhost:4040) from your browser. Or maybe even better: [`localhost:4040/dev/dashboard`](http://localhost:4040/dev/dashboard/home).

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
