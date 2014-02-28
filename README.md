# JSX language support in Atom

Adds syntax highlighting and snippets to JSX file in Atom.

[JSX](http://jsx.github.io/) language is alternative javascript.

important: this is **not** React-jsx plugin

Contributions are greatly appreciated. Please fork this repository and open a
pull request to add snippets, make grammar tweaks, etc.

# user can set node path

You can set the command that will run the script by editing `~/.atom/config.cson`
and adding:

```cson
'language-jsx':
  'nodepath': '/Users/furukawa.yosuke/.nodebrew/current/bin/node'
```

if you does not set the path, this plugin uses `ATOM_SHELL_INTERNAL_RUN_AS_NODE=1 '/Applications/Atom.app/Contents/Frameworks/Atom Helper.app/Contents/MacOS/Atom Helper'` instead of `node`.
