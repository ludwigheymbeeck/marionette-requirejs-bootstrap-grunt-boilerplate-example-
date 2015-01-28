module.exports = ->

  @loadNpmTasks "grunt-filerev"

    # Renames files for browser caching purposes
    rev:
      dist:
        files:
          src: [
            'dist/{,*/}*.js',
            'dist/{,*/}*.css',
            'dist/img/{,*/}*.{png,jpg,jpeg,gif,webp,svg}',
            'dist/fonts/*'
          ]