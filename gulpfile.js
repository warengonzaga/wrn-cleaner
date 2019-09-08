/**
 * Gulpfile for WRN Cleaner
 * By Waren Gonzaga
 **/

const gulp = require("gulp");
const fs = require("fs");
const clean = require("gulp-clean");
const rename = require("gulp-rename");
const header = require("gulp-header");

//Gulp Paths
const path = {
  build: "./prod",
  source: "./src"
};

//White Label & Copyright Label
const whtlbl = JSON.parse(fs.readFileSync(path.source+'/config.json'));
const pkg = JSON.parse(fs.readFileSync('package.json'));
const whtlbldata = {
  whtlblbanner: [
    'cls',
    '@echo off',
    'REM =============================',
    'REM Setup Variables',
    'REM =============================',
    'set appname=<%= title %>',
    'set appvers=<%= version %>',
    'set appstat=<%= status %>',
    'set dev=<%= dev %>',
    'set desc=<%= description %>',
    'set uicolor=<%= uicolor %>',
    'set infouicolor=<%= infouicolor %>',
    'set erruicolor=<%= erruicolor %>',
    'set cliN=$%appname%Cleaner\n',
  ].join('\n'),
}
const copydata = {
  copybanner: [
    'REM =============================',
    'REM WRN Cleaner - <%= homepage %>',
    'REM <%= description %>',
    'REM Version: <%= version %>',
    'REM Github: <%= github %>',
    'REM Licensed Under The MIT License: http://opensource.org/licenses/MIT',
    'REM Copyright (c) <%= new Date().getFullYear() %> <%= author %>',
    'REM ',
    'REM Facebook: @warengonzagaofficialpage',
    'REM Twitter: @waren_gonzaga',
    'REM Github: @warengonzaga',
    'REM Website: warengonzaga.com',
    'REM =============================\n\n',
  ].join('\n'),
};

function whitelabel() {
  return gulp
    .src([path.source+'/core.bat'], {allowEmpty: true})
    .pipe(header(whtlbldata.whtlblbanner, whtlbl))
    .pipe(gulp.dest([path.build]));
}

function copyright() {
  return gulp
    .src([path.build+'/core.bat'], {allowEmpty: true})
    .pipe(header(copydata.copybanner, pkg))
    .pipe(rename(whtlbl.filename+'-'+whtlbl.version+'.bat'))
    .pipe(gulp.dest([path.build]));
}

function delcore() {
  return gulp
    .src(path.build+'/core.bat', {read: false})
    .pipe(clean());
}

function copytoroot() {
  return gulp
    .src(path.build+'/*.bat')
    .pipe(gulp.dest('./'));
}

function cleanprod() {
  return gulp
    .src('./prod')
    .pipe(clean());
}

function cleanroot() {
  return gulp
    .src('./*.bat')
    .pipe(clean());
}

//Gulp Series
const build = gulp.series([whitelabel, copyright, delcore, copytoroot]);
const cleandev = gulp.series([cleanprod, cleanroot]);

//Gulp Commands
exports.whitelabel = whitelabel;
exports.copyright = copyright;
exports.delcore = delcore;
exports.copytoroot = copytoroot;
exports.cleanprod = cleanprod;
exports.cleanroot = cleanroot;
exports.cleandev = cleandev;
exports.build = build;
exports.default = build;