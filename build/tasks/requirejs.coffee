module.exports = ->
  @loadNpmTasks "grunt-contrib-requirejs"

  # This task uses James Burke's excellent r.js AMD builder to take all modules
  # and concatenate them into a single file.
  @config "requirejs",
    release:
      options:
        mainConfigFile: "app/config.js"
        # sourcemaps are needed to debug .min.js files
        generateSourceMaps: false 
        include: ["main","js/views/NotificationView","js/modules/Example","js/views/DialogView","js/models/Dialog","tpl!templates/confirmModal.html","tpl!templates/simpleModal.html"]
        out: "dist/www/source.min.js"
        optimize: "uglify2"
        uglify2:
          mangle: true
        baseUrl: "app"
#          namespace: "PlanetVA"

        paths:
#          "almond": "../bower_components/almond/almond"
          "almond": "../app/js/libs/almond"

        # Include a minimal AMD implementation shim.
        name: "almond"

        # Wrap everything in an IIFE.
        wrap: true
        # wrapShim: this will wrap shimmed dependencies in a define() call so that they work better after a build when their upstream dependencies are also AMD modules with dependencies. see also http://jrburke.com/2014/02/16/requirejs-2.1.11-released/
        wrapShim: true

        # Do not preserve any license comments when working with source maps.
        # These options are incompatible.
        preserveLicenseComments: false
