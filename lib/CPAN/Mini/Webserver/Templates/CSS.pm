package CPAN::Mini::Webserver::Templates::CSS;
use strict;
use warnings;
use Template::Declare::Tags;
use base 'Template::Declare';

template 'css_ie' => sub {
    my $self = shift;
    my $css  = <<'END';
/* -----------------------------------------------------------------------

   Blueprint CSS Framework 0.7.1
   http://blueprintcss.googlecode.com

   * Copyright (c) 2007-2008. See LICENSE for more info.
   * See README for instructions on how to use Blueprint.
   * For credits and origins, see AUTHORS.
   * This is a compressed file. See the sources in the 'src' directory.

----------------------------------------------------------------------- */

/* ie.css */
body {text-align:center;}
.container {text-align:left;}
* html .column {overflow-x:hidden;}
* html legend {margin:-18px -8px 16px 0;padding:0;}
ol {margin-left:2em;}
sup {vertical-align:text-top;}
sub {vertical-align:text-bottom;}
html>body p code {*white-space:normal;}
hr {margin:-8px auto 11px;}
END
    outs_raw $css;
};

template 'css_print' => sub {
    my $self = shift;
    my $css  = <<'END';
/* -----------------------------------------------------------------------

   Blueprint CSS Framework 0.7.1
   http://blueprintcss.googlecode.com

   * Copyright (c) 2007-2008. See LICENSE for more info.
   * See README for instructions on how to use Blueprint.
   * For credits and origins, see AUTHORS.
   * This is a compressed file. See the sources in the 'src' directory.

----------------------------------------------------------------------- */

/* print.css */
body {line-height:1.5;font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;color:#000;background:none;font-size:10pt;}
.container {background:none;}
hr {background:#ccc;color:#ccc;width:100%;height:2px;margin:2em 0;padding:0;border:none;}
hr.space {background:#fff;color:#fff;}
h1, h2, h3, h4, h5, h6 {font-family:"Helvetica Neue", Arial, "Lucida Grande", sans-serif;}
code {font:.9em "Courier New", Monaco, Courier, monospace;}
img {float:left;margin:1.5em 1.5em 1.5em 0;}
a img {border:none;}
p img.top {margin-top:0;}
blockquote {margin:1.5em;padding:1em;font-style:italic;font-size:.9em;}
.small {font-size:.9em;}
.large {font-size:1.1em;}
.quiet {color:#999;}
.hide {display:none;}
a:link, a:visited {background:transparent;font-weight:700;text-decoration:underline;}
a:link:after, a:visited:after {content:" (" attr(href) ") ";font-size:90%;}
END
    outs_raw $css;
};

template 'css_screen' => sub {
    my $self = shift;
    my $css  = <<'END';
/* -----------------------------------------------------------------------

   Blueprint CSS Framework 0.7.1
   http://blueprintcss.googlecode.com

   * Copyright (c) 2007-2008. See LICENSE for more info.
   * See README for instructions on how to use Blueprint.
   * For credits and origins, see AUTHORS.
   * This is a compressed file. See the sources in the 'src' directory.

----------------------------------------------------------------------- */

/* reset.css */
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, code, del, dfn, em, img, q, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {margin:0;padding:0;border:0;font-weight:inherit;font-style:inherit;font-size:100%;font-family:inherit;vertical-align:baseline;}
body {line-height:1.5;}
table {border-collapse:separate;border-spacing:0;}
caption, th, td {text-align:left;font-weight:normal;}
table, td, th {vertical-align:middle;}
blockquote:before, blockquote:after, q:before, q:after {content:"";}
blockquote, q {quotes:"" "";}
a img {border:none;}

/* typography.css */
body {font-size:75%;color:#222;background:#fff;font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;}
h1, h2, h3, h4, h5, h6 {font-weight:normal;color:#111;}
h1 {font-size:3em;line-height:1;margin-bottom:0.5em;}
h2 {font-size:2em;margin-bottom:0.75em;}
h3 {font-size:1.5em;line-height:1;margin-bottom:1em;}
h4 {font-size:1.2em;line-height:1.25;margin-bottom:1.25em;height:1.25em;}
h5 {font-size:1em;font-weight:bold;margin-bottom:1.5em;}
h6 {font-size:1em;font-weight:bold;}
h1 img, h2 img, h3 img, h4 img, h5 img, h6 img {margin:0;}
p {margin:0 0 1.5em;}
p img {float:left;margin:1.5em 1.5em 1.5em 0;padding:0;}
p img.right {float:right;margin:1.5em 0 1.5em 1.5em;}
a:focus, a:hover {color:#000;}
a {color:#009;text-decoration:underline;}
blockquote {margin:1.5em;color:#666;font-style:italic;}
strong {font-weight:bold;}
em, dfn {font-style:italic;}
dfn {font-weight:bold;}
sup, sub {line-height:0;}
abbr, acronym {border-bottom:1px dotted #666;}
address {margin:0 0 1.5em;font-style:italic;}
del {color:#666;}
pre, code {margin:1.5em 0;white-space:pre;}
pre, code, tt {font:1em 'andale mono', 'lucida console', monospace;line-height:1.5;}
li ul, li ol {margin:0 1.5em;}
ul, ol {margin:0 1.5em 1.5em 1.5em;}
ul {list-style-type:disc;}
ol {list-style-type:decimal;}
dl {margin:0 0 1.5em 0;}
dl dt {font-weight:bold;}
dd {margin-left:1.5em;}
table {margin-bottom:1.4em;width:100%;}
th {font-weight:bold;background:#C3D9FF;}
th, td {padding:4px 10px 4px 5px;}
tr.even td {background:#E5ECF9;}
tfoot {font-style:italic;}
caption {background:#eee;}
.small {font-size:.8em;margin-bottom:1.875em;line-height:1.875em;}
.large {font-size:1.2em;line-height:2.5em;margin-bottom:1.25em;}
.hide {display:none;}
.quiet {color:#666;}
.loud {color:#000;}
.highlight {background:#ff0;}
.added {background:#060;color:#fff;}
.removed {background:#900;color:#fff;}
.first {margin-left:0;padding-left:0;}
.last {margin-right:0;padding-right:0;}
.top {margin-top:0;padding-top:0;}
.bottom {margin-bottom:0;padding-bottom:0;}

/* grid.css */
.container {width:950px;margin:0 auto;}
.showgrid {background:url(src/grid.png);}
body {margin:1.5em 0;}
div.span-1, div.span-2, div.span-3, div.span-4, div.span-5, div.span-6, div.span-7, div.span-8, div.span-9, div.span-10, div.span-11, div.span-12, div.span-13, div.span-14, div.span-15, div.span-16, div.span-17, div.span-18, div.span-19, div.span-20, div.span-21, div.span-22, div.span-23, div.span-24 {float:left;margin-right:10px;}
div.last {margin-right:0;}
.span-1 {width:30px;}
.span-2 {width:70px;}
.span-3 {width:110px;}
.span-4 {width:150px;}
.span-5 {width:190px;}
.span-6 {width:230px;}
.span-7 {width:270px;}
.span-8 {width:310px;}
.span-9 {width:350px;}
.span-10 {width:390px;}
.span-11 {width:430px;}
.span-12 {width:470px;}
.span-13 {width:510px;}
.span-14 {width:550px;}
.span-15 {width:590px;}
.span-16 {width:630px;}
.span-17 {width:670px;}
.span-18 {width:710px;}
.span-19 {width:750px;}
.span-20 {width:790px;}
.span-21 {width:830px;}
.span-22 {width:870px;}
.span-23 {width:910px;}
.span-24, div.span-24 {width:950px;margin:0;}
.append-1 {padding-right:40px;}
.append-2 {padding-right:80px;}
.append-3 {padding-right:120px;}
.append-4 {padding-right:160px;}
.append-5 {padding-right:200px;}
.append-6 {padding-right:240px;}
.append-7 {padding-right:280px;}
.append-8 {padding-right:320px;}
.append-9 {padding-right:360px;}
.append-10 {padding-right:400px;}
.append-11 {padding-right:440px;}
.append-12 {padding-right:480px;}
.append-13 {padding-right:520px;}
.append-14 {padding-right:560px;}
.append-15 {padding-right:600px;}
.append-16 {padding-right:640px;}
.append-17 {padding-right:680px;}
.append-18 {padding-right:720px;}
.append-19 {padding-right:760px;}
.append-20 {padding-right:800px;}
.append-21 {padding-right:840px;}
.append-22 {padding-right:880px;}
.append-23 {padding-right:920px;}
.prepend-1 {padding-left:40px;}
.prepend-2 {padding-left:80px;}
.prepend-3 {padding-left:120px;}
.prepend-4 {padding-left:160px;}
.prepend-5 {padding-left:200px;}
.prepend-6 {padding-left:240px;}
.prepend-7 {padding-left:280px;}
.prepend-8 {padding-left:320px;}
.prepend-9 {padding-left:360px;}
.prepend-10 {padding-left:400px;}
.prepend-11 {padding-left:440px;}
.prepend-12 {padding-left:480px;}
.prepend-13 {padding-left:520px;}
.prepend-14 {padding-left:560px;}
.prepend-15 {padding-left:600px;}
.prepend-16 {padding-left:640px;}
.prepend-17 {padding-left:680px;}
.prepend-18 {padding-left:720px;}
.prepend-19 {padding-left:760px;}
.prepend-20 {padding-left:800px;}
.prepend-21 {padding-left:840px;}
.prepend-22 {padding-left:880px;}
.prepend-23 {padding-left:920px;}
div.border {padding-right:4px;margin-right:5px;border-right:1px solid #eee;}
div.colborder {padding-right:24px;margin-right:25px;border-right:1px solid #eee;}
.pull-1 {margin-left:-40px;}
.pull-2 {margin-left:-80px;}
.pull-3 {margin-left:-120px;}
.pull-4 {margin-left:-160px;}
.pull-5 {margin-left:-200px;}
.pull-6 {margin-left:-240px;}
.pull-7 {margin-left:-280px;}
.pull-8 {margin-left:-320px;}
.pull-9 {margin-left:-360px;}
.pull-10 {margin-left:-400px;}
.pull-11 {margin-left:-440px;}
.pull-12 {margin-left:-480px;}
.pull-13 {margin-left:-520px;}
.pull-14 {margin-left:-560px;}
.pull-15 {margin-left:-600px;}
.pull-16 {margin-left:-640px;}
.pull-17 {margin-left:-680px;}
.pull-18 {margin-left:-720px;}
.pull-19 {margin-left:-760px;}
.pull-20 {margin-left:-800px;}
.pull-21 {margin-left:-840px;}
.pull-22 {margin-left:-880px;}
.pull-23 {margin-left:-920px;}
.pull-24 {margin-left:-960px;}
.pull-1, .pull-2, .pull-3, .pull-4, .pull-5, .pull-6, .pull-7, .pull-8, .pull-9, .pull-10, .pull-11, .pull-12, .pull-13, .pull-14, .pull-15, .pull-16, .pull-17, .pull-18, .pull-19, .pull-20, .pull-21, .pull-22, .pull-23, .pull-24 {float:left;position:relative;}
.push-1 {margin:0 -40px 1.5em 40px;}
.push-2 {margin:0 -80px 1.5em 80px;}
.push-3 {margin:0 -120px 1.5em 120px;}
.push-4 {margin:0 -160px 1.5em 160px;}
.push-5 {margin:0 -200px 1.5em 200px;}
.push-6 {margin:0 -240px 1.5em 240px;}
.push-7 {margin:0 -280px 1.5em 280px;}
.push-8 {margin:0 -320px 1.5em 320px;}
.push-9 {margin:0 -360px 1.5em 360px;}
.push-10 {margin:0 -400px 1.5em 400px;}
.push-11 {margin:0 -440px 1.5em 440px;}
.push-12 {margin:0 -480px 1.5em 480px;}
.push-13 {margin:0 -520px 1.5em 520px;}
.push-14 {margin:0 -560px 1.5em 560px;}
.push-15 {margin:0 -600px 1.5em 600px;}
.push-16 {margin:0 -640px 1.5em 640px;}
.push-17 {margin:0 -680px 1.5em 680px;}
.push-18 {margin:0 -720px 1.5em 720px;}
.push-19 {margin:0 -760px 1.5em 760px;}
.push-20 {margin:0 -800px 1.5em 800px;}
.push-21 {margin:0 -840px 1.5em 840px;}
.push-22 {margin:0 -880px 1.5em 880px;}
.push-23 {margin:0 -920px 1.5em 920px;}
.push-24 {margin:0 -960px 1.5em 960px;}
.push-1, .push-2, .push-3, .push-4, .push-5, .push-6, .push-7, .push-8, .push-9, .push-10, .push-11, .push-12, .push-13, .push-14, .push-15, .push-16, .push-17, .push-18, .push-19, .push-20, .push-21, .push-22, .push-23, .push-24 {float:right;position:relative;}
.box {padding:1.5em;margin-bottom:1.5em;background:#E5ECF9;}
hr {background:#ddd;color:#ddd;clear:both;float:none;width:100%;height:.1em;margin:0 0 1.45em;border:none;}
hr.space {background:#fff;color:#fff;}
.clearfix:after, .container:after {content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix, .container {display:inline-block;}
* html .clearfix, * html .container {height:1%;}
.clearfix, .container {display:block;}
.clear {clear:both;}

/* forms.css */
label {font-weight:bold;}
fieldset {padding:1.4em;margin:0 0 1.5em 0;border:1px solid #ccc;}
legend {font-weight:bold;font-size:1.2em;}
input.text, input.title, textarea, select {margin:0.5em 0;border:1px solid #bbb;}
input.text:focus, input.title:focus, textarea:focus, select:focus {border:1px solid #666;}
input.text, input.title {width:300px;padding:5px;}
input.title {font-size:1.5em;}
textarea {width:390px;height:250px;padding:5px;}
.error, .notice, .success {padding:.8em;margin-bottom:1em;border:2px solid #ddd;}
.error {background:#FBE3E4;color:#8a1f11;border-color:#FBC2C4;}
.notice {background:#FFF6BF;color:#514721;border-color:#FFD324;}
.success {background:#E6EFC2;color:#264409;border-color:#C6D880;}
.error a {color:#8a1f11;}
.notice a {color:#514721;}
.success a {color:#264409;}

/* /home/acme/git/cpan-mini-webserver/root/static/css/my-screen.css */
h1 {font-size:1.5em;line-height:1;margin-bottom:1em;clear:both;}
h2 {font-size:1.2em;line-height:1.25;margin-bottom:1.25em;height:1.25em;clear:both;}
body {background:#ffffff;font-size:100%;font-family:Georgia, "Times New Roman", Times, serif;}
pre, code, tt {font-size:80%;}
td.searchbar {vertical-align:middle;}
div#searchbar {min-height:10em;display:table-cell;vertical-align:middle;}
#code {font-size:120%;font-family:monospace;padding:10px 10px 10px 10px;}
#eval {font-family:monospace;border-width:1px;border-style:solid solid solid solid;border-color:#ccc;padding:5px 5px 5px 5px;}
.line_number {color:#aaaaaa;}
.comment {color:#228B22;}
.symbol {color:#00688B;}
.word {color:#8B008B;font-weight:bold;}
.structure {color:#000000;}
.number {color:#B452CD;}
.single {color:#CD5555;}
.double {color:#CD5555;}

/* buttons */
a.button, button {display:block;float:left;margin:0 0.583em 0.667em 0;padding:5px 10px 5px 7px;border:1px solid #dedede;border-top:1px solid #eee;border-left:1px solid #eee;background-color:#f5f5f5;font-family:"Lucida Grande", Tahoma, Arial, Verdana, sans-serif;font-size:100%;line-height:130%;text-decoration:none;font-weight:bold;color:#565656;cursor:pointer;}
button {width:auto;overflow:visible;padding:4px 10px 3px 7px;}
button[type] {padding:4px 10px 4px 7px;line-height:17px;}
*:first-child+html button[type] {padding:4px 10px 3px 7px;}
button img, a.button img {margin:0 3px -3px 0 !important;padding:0;border:none;width:16px;height:16px;float:none;}
button:hover, a.button:hover {background-color:#dff4ff;border:1px solid #c2e1ef;color:#336699;}
a.button:active {background-color:#6299c5;border:1px solid #6299c5;color:#fff;}
body .positive {color:#529214;}
a.positive:hover, button.positive:hover {background-color:#E6EFC2;border:1px solid #C6D880;color:#529214;}
a.positive:active {background-color:#529214;border:1px solid #529214;color:#fff;}
body .negative {color:#d12f19;}
a.negative:hover, button.negative:hover {background:#fbe3e4;border:1px solid #fbc2c4;color:#d12f19;}
a.negative:active {background-color:#d12f19;border:1px solid #d12f19;color:#fff;}
END
    outs_raw $css;
};

1;
