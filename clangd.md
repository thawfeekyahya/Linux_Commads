## Enable Compile commands for cmake project
By enabling this clangd LSP will be able to index the project files
```
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ln -s ../build/compile_commands.json .
```

