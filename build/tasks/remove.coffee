module.exports = ->
  @loadNpmTasks "grunt-remove"

  # Wipe out unminized styles build.
  @config "remove",
    default_options:
#        fileList: ['dist/www/styles/styles.css', 'dist/www/img/logo.png']
        fileList: ['dist/www/styles/styles.css']
#        dirList: ['dist/www/css','dist/www/js']