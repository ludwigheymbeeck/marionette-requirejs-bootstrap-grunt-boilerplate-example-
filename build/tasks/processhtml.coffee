module.exports = ->
  @loadNpmTasks "grunt-processhtml"

  # Convert the development sources to production in the HTML.
  @config "processhtml",
    release:
      files:
        "dist/www/index.html": ["app/index.html"]
