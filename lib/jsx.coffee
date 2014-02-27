child_process = require 'child_process'

module.exports =

  activate: (state) ->
    atom.workspaceView.command "jsx:run", => @run()

  run: ->
    editor = atom.workspace.getActiveEditor()
    package = atom.packages

    uri = editor.getUri()
    console.log(uri)
    console.log(process.env)
    process.env.PATH = process.env.PATH + ":" + "/Users/furukawa.yosuke/.nodebrew/current/bin/"
    command = ".jsx --run " + uri
    options = {
      "cwd" : "/Users/furukawa.yosuke/.nodebrew/current/bin/",
      "env" : process.env
    }
    packagePath = package.resolvePackagePath("language-jsx")
    console.log(packagePath)
    console.log(command)
    child_process.exec(command, options, (error, stdout, stderr) ->
      console.log("stdout: " + stdout)
      console.error("stderr: " + stderr)
      console.error("error: " + error)
    )
