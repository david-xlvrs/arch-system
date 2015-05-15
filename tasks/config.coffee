buildDir = 'dist'

module.exports =
  paths:
    app:
      dst: './' + buildDir
    closure:
      src: './node_modules/closure-library/'
      dst: './' + buildDir + '/_dev/closure-library/'
    img:
      srcGlob: './assets/img/**'
      dst: './' + buildDir + '/img'
    static:
      srcGlob: './assets/static/**'
    index:
      template: './tasks/templates/index.html'
    coffee:
      srcGlob: './src/**/*.coffee'
      lint: 'coffeelint.json'
    soy:
      srcGlob: './src/**/*.soy'
      dst: './' + buildDir + '/_dev/js'
    js:
      srcGlob: [
        './' + buildDir + '/_dev/js/**/*.js'
        './node_modules/closure-library/closure/goog/**/*.js'
        './node_modules/closure-library/third_party/closure/goog/**/*.js'
        '!./node_modules/closure-library/**/*_test.js'
        '!./node_modules/closure-library/**/deps.js'
        '!./node_modules/closure-library/**/demos/**'
        '!./node_modules/closure-library/**/testdata/**'
        '!./node_modules/closure-library/**/testing/**'
        '!./node_modules/closure-library/**/i18n/*ext.js'
        '!./node_modules/closure-library/**/i18n/charpickerdata.js'
      ]
      srcDepsGlob: './' + buildDir + '/_dev/js/**/*.js'
      dst: './' + buildDir + '/js'
      devDst: './' + buildDir + '/_dev/js'
      devBuildDst: './' + buildDir + '/_dev/build'
      nameDeps: 'closure-deps.js'
      nameMinified: 'app.min.js'
      nameConcatenatedMinified: 'app_all.min.js'
      compiler: './bower_components/closure-compiler/compiler.jar'
      compiledManifest: 'manifest.txt'
      depsRelative: '../../../../../'
    sprites:
      srcGlob: './assets/img/sprite-icons/*.png'
      template: './tasks/templates/less.template.mustache'
      namePng: 'sprite-icons.png'
      nameLess: 'sprite-icons.less'
    less:
      srcGlob: './src/**/*.less'
      dst: './' + buildDir + '/css'
      mapDst: './' + buildDir + '/css/map'
      nameConcatenatedLess: 'style.less'
      nameCSSMinified: 'style.min.css'
    vendor:
      srcGlob: [
        './node_modules/react/dist/react-with-addons.min.js'
        './node_modules/classnames/index.js'
      ]
      dst: './' + buildDir + '/_dev/vendor/'
      concatName: 'vendor.js'
