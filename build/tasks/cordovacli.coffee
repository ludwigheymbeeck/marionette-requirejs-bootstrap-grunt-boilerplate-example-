module.exports = ->
  @loadNpmTasks "grunt-cordovacli"

  # Wipe out unminized styles build.
  @config "cordovacli",
    cordova:
        options:
#            command: ['create','platform','plugin','build']
            command: ['create','plugin']
#            platforms: ['ios','android']
            platforms: 'android'
#            plugins: ['device','dialogs']
            plugins: [
#                      'battery-status',
                      'camera',
#                      'console',
#                      'contacts',
                      'device',
#                      'device-motion',
#                      'device-orientation',
                      'dialogs',
                      'file',
#                      'geolocation',
#                      'globalization',
#                      'inappbrowser',
#                      'media',
#                      'media-capture',
#                      'network-information',
#                      'splashscreen',
#                      'vibration',
                      'org.apache.cordova.file-transfer',
                      'org.apache.cordova.statusbar',
#                      'de.appplant.cordova.plugin.email-composer'
#                      'de.appplant.cordova.plugin.email-composer@0.8.2' # not working ... we need this for cordova.plugins.email to work!
                       'nl.x-services.plugins.socialsharing'
                      ]
            path: 'dist'
            id: 'com.planetva.vmretailer'
            name: 'vm retailer'
            version: '3.0.1'