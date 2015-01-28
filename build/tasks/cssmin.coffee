module.exports = ->
  @loadNpmTasks "grunt-contrib-cssmin"

  # Minify the distribution CSS.
  @config "cssmin",
    release:
      files:
        "dist/www/styles/styles.min.css": ["dist/www/styles/styles.css"]