module.exports =
  paths:
    app:
      dst: './dist'
    closure:
      src: './node_modules/closure-library/'
      dst: './dist/_dev/closure-library/'
    img:
      srcGlob: './assets/img/**'
      dst: './dist/img'
    static:
      srcGlob: './assets/static/**'
    index:
      template: './tasks/templates/index.html'
    coffee:
      srcGlob: './src/**/*.coffee'
      lint: 'coffeelint.json'
    soy:
      srcGlob: './src/**/*.soy'
      dst: './dist/_dev/js'
    js:
      srcGlob: [
        './dist/_dev/js/**/*.js'
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
      srcDepsGlob: './dist/_dev/js/**/*.js'
      dst: './dist/js'
      devDst: './dist/_dev/js'
      devBuildDst: './dist/_dev/build'
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
      dst: './dist/css'
      mapDst: './dist/css/map'
      nameConcatenatedLess: 'style.less'
      nameCSSMinified: 'style.min.css'
    vendor:
      srcGlob: [
        './node_modules/react/dist/react-with-addons.js'
        './node_modules/classnames/index.js'
      ]
      dst: './dist/_dev/vendor/'
      concatName: 'vendor.js'
