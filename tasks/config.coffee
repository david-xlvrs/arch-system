module.exports =
	paths:
		app:
			dst: './dist'
		closure:
			srcGlob: [
				'./node_modules/closure-library/**'
				'!./node_modules/closure-library/closure/**/*.html'
				'!./node_modules/closure-library/closure/alltests.js'
				'!./node_modules/closure-library/closure/closure/{bin,css,known_issues}{,/**}'
				'!./node_modules/closure-library/closure/closure/goog/testing/**/*.js'
				'!./node_modules/closure-library/closure/closure/goog/**/*_test.js'
			]
			dst: './dist/closure'
		img:
			srcGlob: './assets/img/*.*'
			dst: './dist/img'
		static:
			srcGlob: [
				'./assets/**/*.css'
				'!./assets/index.html'
				'./assets/**/.htaccess'
			]
		index:
			srcGlob: './assets/index.html'
		coffee:
			srcGlob: [
				'./src/**/*.coffee'
				'!./src/**/*_test.coffee'
				'!./src/test/*'
			]
		soy:
			srcGlob: [
				'./src/**/*.soy'
			]
			dst: './dist/js'
		js:
			srcGlob: [
				'./dist/js/**/*.js'
				'!./dist/js/**/*.min.js'
				'./node_modules/closure-library/closure/**/*.js'
				'!./node_modules/closure-library/closure/alltests.js'
				'!./node_modules/closure-library/closure/closure/goog/testing/**/*.js'
				'!./node_modules/closure-library/closure/closure/goog/**/*_test.js'
				'./dist/react/**/*.js'
			]
			srcDepsGlob: [
				'./dist/js/**/*.js'
				'!./dist/js/**/*.min.js'
				'./dist/react/**/*.js'
			]
			dst: './dist/js'
			depsDst: './dist/js/closure-deps.js'
			dstMinified: './dist/js/script.min.js'
			compiler: './bower_components/closure-compiler/compiler.jar'
		sprites:
			srcGlob: './assets/img/sprite-icons/*.png'
			template: 'tasks/templates/less.template.mustache'
			namePng: 'sprite-icons.png'
			nameLess: 'sprite-icons.less'
		less:
			srcGlob: './assets/style/**/*.less'
			dst: './dist/css'
			mapDst: './dist/css/map'
			nameConcatenatedLess: 'style.less'
			nameCSSMinified: 'style.min.css'
		react:
			src: './node_modules/react/dist/react-with-addons.min.js'
			dst: './dist/react'
