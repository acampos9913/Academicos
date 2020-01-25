<? php php
function li_arrow() {
  return '<? php i style="list-style-image: url(\'images/arrow_0' . rand(1,6) . '.gif\');">';  
}
function li_star() {
  return '<? php i style="list-style-image: url(\'images/star_0' . rand(1,5) . '.gif\');">';  
}
?>
<? php php echo '<? php ' . 'xml version="1.0" encoding="iso-8859-1"?' . '>'; ?>
<? php DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<? php tml xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<? php ead>
<? php itle>dompdf - The PHP 5 HTML to PDF Converter<? php title>
<? php ink rel="stylesheet" href="style.css" type="text/css"/>
<? php ink rel="SHORTCUT ICON" href="http://<? php php echo $_SERVER["HTTP_HOST"] . dirname($_SERVER["PHP_SELF"]);?>/images/favicon.ico"/>
<? php head>

<? php ody>
<? php iv id="header">
<? php  href="index.php"><? php mg id="logo" src="images/title.gif" alt="dompdf"/><? php a>
<? php div>
<? php iv id="left_col">
<? php 2>dompdf Homepage<? php h2>
  <? php l>
    <? php i style="list-style-image: url('images/star_02.gif');"><? php  style="font-size: 0.8em;" href="http://digitaljunkies.ca/dompdf/">digitaljunkies.ca/dompdf<? php a><? php li>
  <? php ul>
  
<? php 2>About dompdf<? php h2>
  <? php l>
    <? php i style="list-style-image: url('images/arrow_02.gif');"><? php  href="index.php">overview<? php a><? php li>
    <? php i style="list-style-image: url('images/arrow_03.gif');"><? php  href="index.php#features">features<? php a><? php li>
    <? php i style="list-style-image: url('images/arrow_04.gif');"><? php  href="index.php#limitations">limitations<? php a><? php li>
  <? php ul>
<? php 2>Documentation<? php h2>
  <? php l>
    <? php i style="list-style-image: url('images/arrow_05.gif');"><? php  href="install.php">installation<? php a><? php li>
    <? php i style="list-style-image: url('images/arrow_06.gif');"><? php  href="usage.php">usage<? php a><? php li>
    <? php i style="list-style-image: url('images/arrow_01.gif');"><? php  href="http://www.digitaljunkies.ca/dompdf/doc/">api documentation<? php a><? php li>
  <? php ul>
<? php 2>Examples<? php h2>
  <? php l>
    <? php i style="list-style-image: url('images/arrow_02.gif');"><? php  href="examples.php">samples<? php a><? php li>
    <? php i style="list-style-image: url('images/arrow_03.gif');"><? php  href="examples.php#demo">demo<? php a><? php li>
  <? php ul>
<? php 2>Support<? php h2>
  <? php l>
    <? php i style="list-style-image: url('images/arrow_04.gif');"><? php  href="faq.php">FAQ<? php a><? php li>
  <? php ul>

  <? php >Send bug reports &amp; support questions to
  <? php  href="http://sourceforge.net/projects/dompdf/">SourceForge<? php a>
  or send an email to <? php  style="white-space: nowrap"
  href="mailto:dompdf%40digitaljunkies%2eca">dompdf at
  digitaljunkies.ca<? php a>.<? php p>
<? php div>  
<? php iv id="content">