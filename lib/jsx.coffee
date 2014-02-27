jsx_bin_path = "/node_modules/jsx/bin/jsx"

module.exports =

  activate: (state) ->
    atom.workspaceView.command "jsx:run", => @run()

  getNodePath: ->
    atom.config.get("language-jsx.nodepath")

  run: ->
    editor = atom.workspace.getActiveEditor()
    lang_jsx_path = atom.packages.resolvePackagePath("language-jsx")
    jsx_bin = lang_jsx_path + jsx_bin_path
    node_path = @getNodePath()
    unless node_path?
      console.error("Please set executable node directory in ~/.atom/config.cson")
      console.error(" 'language-jsx': ")
      console.error(" 'nodepath': '/usr/local/bin' ")
      return;


    uri = editor.getUri()
    child_process = require 'child_process'
    process.env.PATH = "#{process.env.PATH}:#{node_path}"
    command = "#{jsx_bin} --run " + uri
    options = {
      "cwd" : lang_jsx_path,
      "env" : process.env
    }
    child_process.exec(command, options, (error, stdout, stderr) ->
        console.error(error) if error
        console.error(stderr) if stderr
        console.log(stdout) if stdout
    )
    atom.openDevTools()
