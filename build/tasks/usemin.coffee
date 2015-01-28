module.exports = ->
  @loadNpmTasks "grunt-usemin"

  @config "usemin",
    html: 'dist/www/{,*/}*.html'
    css: 'dist/www/styles/{,*/}*.css'
    js: 'dist/www/{,*/}*.js'
    options:
      assetsDirs: ['dist/www', 'dist/www/img']