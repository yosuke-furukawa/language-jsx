jsx_bin_path = "/node_modules/jsx/bin/jsx"
child_process = require 'child_process'

module.exports =

  activate: (state) ->
    atom.workspaceView.command "jsx:run", => @run()

  getExecPath: ->
    "ATOM_SHELL_INTERNAL_RUN_AS_NODE=1 '#{process.execPath}'"

  getNodePath: ->
    atom.config.get("language-jsx.nodepath")

  run: ->
    editor = atom.workspace.getActiveEditor()
    lang_jsx_path = atom.packages.resolvePackagePath("language-jsx")
    jsx_bin = lang_jsx_path + jsx_bin_path
    node_path = @getNodePath() || @getExecPath()

    uri = editor.getUri()
    command = "#{node_path} #{jsx_bin} --run #{uri}"
    options = {
      "cwd" : lang_jsx_path
    }
    child_process.exec(command, options, (error, stdout, stderr) ->
        console.error(error) if error
        console.error(stderr) if stderr
        console.log(stdout) if stdout
    )
    atom.openDevTools()
