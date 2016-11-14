var gulp = require('gulp');
var htmlreplace = require('gulp-html-replace');
var glob = require('glob');

var staticAssets = [
  '**/*.html',
  '*.png',
  '*.ico',
  '**/*.svg'
];

gulp.task('copy', function() {
  return gulp.src(staticAssets)
    .pipe(gulp.dest('dist'));
});

gulp.task('hash', function() {

  glob('dist/*.js', function(err, files) {
    var hash = null;
    if (files.length === 1) {
      hash = files[0].split('.')[1];
    } else {
      console.log('Unable to find hash.');
    }

    gulp.src('index.html')
      .pipe(htmlreplace({
        'js': 'bundle.' + hash + '.js'
      }))
      .pipe(gulp.dest('dist'));

  });

});
