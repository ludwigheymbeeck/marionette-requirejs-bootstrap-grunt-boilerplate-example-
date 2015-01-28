module.exports = ->
  @loadNpmTasks "grunt-usemin"

  @config "useminPrepare",
    html: 'index.html'
    options:
      dest: 'dist/www'