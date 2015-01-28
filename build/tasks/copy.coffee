module.exports = ->
  @loadNpmTasks "grunt-contrib-copy"

  # copy images to distribution directory
  @config "copy",
    release:
      files: [{
          expand: true,
          src: '**/*',
          cwd: 'app/img/',
          dest: 'dist/www/img'
      },
      {
          expand: true,
          src: '**/*',
          cwd: 'app/fonts/',
          dest: 'dist/www/fonts'
      }
#      ,{
#          expand: true,
#          src: '**/*',
#          cwd: 'app/res/',
#          dest: 'dist/res'
#      }
#      ,{
#          expand: true,
#          src: 'config.xml',
#          cwd: 'app/',
#          dest: 'dist'
#      }
#      ,{
#          expand: true,
#          src: 'vmo.js',
#          cwd: 'app/modules/libs/planetva/',
#          dest: 'dist/www'
#      }
      ]