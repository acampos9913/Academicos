<? php php include("head.inc");?>

<? php iv id="toc">
<? php 2>On this page:<? php h2>
<? php l>
<? php php echo li_arrow() ?><? php  href="#requirements">Requirements<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#installation">Installation<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#fonts">Font Installation<? php a><? php li>
<? php l>
<? php php echo li_arrow() ?><? php  href="#all_platforms">Note for all platforms<? php a><? php li>
<? php php echo li_arrow() ?><? php  href="#unix">Linux/Unix<? php a><? php li>
<? php l><? php php echo li_arrow() ?><? php  href="#load_font"><? php re>load_font.php<? php pre><? php a><? php li><? php ul>
<? php php echo li_arrow() ?><? php  href="#windows">Windows<? php a><? php li>
<? php ul>
<? php php echo li_arrow() ?><? php  href="#hacking">Hacking<? php a><? php li>
<? php ul>
<? php div>

<? php  name="requirements"> <? php a>
<? php 2>Requirements<? php h2>

<? php l>

<? php i style="list-style-image: url('images/star_03.gif');">PHP 5.0.0+
(although most later pre-5.0 snaps should work as well) with the DOM
extension enabled.<? php li>

<? php i style="list-style-image: url('images/star_05.gif');">Some fonts.  PDFs
internally support Helvetica, Times-Roman, Courier &amp; Zapf-Dingbats, but
if you wish to use other fonts you will need to install some fonts.  dompdf
supports the same fonts as the underlying PDF backends: Type 1 (.pfb
with the corresponding .afm) and TrueType (.ttf).  At the minimum, you
should probably have the Microsoft core fonts (now available at: <? php 
href="http://corefonts.sourceforge.net/">http://corefonts.sourceforge.net/<? php a>).
See <? php  href="#fonts">below<? php a> for font installation instructions.<? php li>

<? php i style="list-style-image: url('images/star_04.gif');">ttf2pt1 (available
at <? php 
href="http://ttf2pt1.sourceforge.net">http://ttf2pt1.sourceforge.net<? php a>) is
required to install new ttf fonts when using the CPDF backend.<? php li>

<? php ul>

<? php  name="installation"> <? php a>
<? php 2>Installation<? php h2>

<? php l>
<? php i>Untar/unzip the source package in a directory accessible by your webserver.<? php li>

<? php i>Edit dompdf_config.inc.php to fit your installation.  If you leave
the DOMPDF_PDF_BACKEND setting at 'auto' dompdf will use PDFLib if it
is installed, otherwise it will use the bundled R&amp;OS CPDF class.<? php li>

<? php i><? php >Give your webserver write permission on the path specified in
<? php ode>DOMPDF_FONT_DIR<? php code> (lib/fonts by default).  Under *nix, ideally
you can make the webserver group the owner of this directory and give the
directory group write permissions.  For example, on Debian systems, apache
runs as the www-data user:<? php p>
<? php re>
   $ chgrp www-data lib/fonts
   $ chmod g+w lib/fonts
<? php pre>
<? php >If your user is not a member of the www-data group or you do not have
root priviledges, you can make the directory world writable and set the
sticky bit:<? php p>
<? php re>   
   $ chmod 1777 lib/fonts
<? php pre>
<? php li>
<? php ol>

<? php  name="fonts"> <? php a>
<? php 2>Font Installation<? php h2>

<? php  name="all_platforms"> <? php a>
<? php 3>Note for all platforms<? php h3>

<? php >PDFs include support by default for Helvetica, Times-Roman, Courier and
ZapfDingbats.  You do not need to install any font files if you wish to use
these fonts.  This has the advantage of reducing the size of the resulting
PDF, because additional fonts must be embedded in the PDF.<? php p>

<? php >Also, if you have problems installing the font files, you can try and use
the distributed dompdf_font_family_cache.dist file in lib/fonts.  Copy this
file to lib/fonts/dompdf_font_family_cache and edit it directly to match the
files present in your lib/fonts directory.<? php p>

<? php  name="unix"> <? php a>
<? php 3>Linux/Unix<? php h3>

<? php >The load_font.php utility installs and converts TrueType fonts for use with
dompdf.  Since CSS uses the concept of font families (i.e. the same face can
be rendered in differnt styles &amp; weights) dompdf needs to know which actual
font files belong to which font family and which style.  For example, the
Microsoft core font pack includes the files Verdana.ttf, Verdana_Italic.ttf,
Verdana_Bold.ttf and Verdana_Bold_Italic.ttf.  All four of these files need
to be present in the dompdf font directory (<? php ode>DOMPDF_FONT_DIR<? php code>), and entries
need to be made in the dompdf_font_family_cache file.<? php p>

<? php >Given the font family name and the path to the 'normal' font face file
(Verdana.ttf, in our example), load_font.php will search for the bold,
italic and bold italic font face files in the same directory as the
specified file.  It searches for files with the same base name followed by
'_Bold', 'B', or 'b' (similarly for italic and bold italic).  If it can not
find the correct files, you can specify them on the command line.<? php p>

<? php >In addition to copying the files to the dompdf font directory, it also
generates .afm files.  The R&amp;OS CPDF class requires both the ttf file and an
afm file, which describes glyph metrics.  The afm file is generated using
the ttf2pt1 utlity (available at <? php 
href="http://ttf2pt1.sourceforge.net">http://ttf2pt1.sourceforge.net<? php a>).  
If you are using the PDFLib backend, you will not need to create afm
files for the fonts.<? php p>

<? php  name="load_font"> <? php a>
<? php >load_font.php usage:<? php p>

<? php able>
<? php r><? php d class="bar1" colspan="2">&nbsp;<? php td><? php tr>
<? php r>
<? php d colspan="2" class="input">$ ./load_font.php font-family n_file [b_file] [i_file] [bi_file]<? php td>
<? php tr>

<? php r>
<? php d class="input">font_family<? php td>
<? php d class="description">the name of the font, e.g. Verdana, 'Times New Roman', monospace, sans-serif.<? php td>
<? php tr>

<? php r>
<? php d class="input">n_file<? php td>
<? php d class="description">the .pfb or .ttf file for the normal, non-bold, non-italic face of the font.<? php td>
<? php tr>

<? php r>
<? php d class="input">{b|i|bi}_file<? php td>
<? php d class="description">the files for each of the respective (bold, italic, bold-italic) faces.<? php td>
<? php tr>

<? php r><? php d class="bar2" colspan="2">&nbsp;<? php td><? php tr>
<? php table>

<? php >Examples:<? php p>
<? php re>
$ ./load_font.php silkscreen /usr/share/fonts/truetype/slkscr.ttf

$ ./load_font.php 'Times New Roman' /mnt/c_drive/WINDOWS/Fonts/times.ttf

$ php -f load_font.php -- sans-serif /home/dude_mcbacon/myfonts/Verdana.ttf \
                                     /home/dude_mcbacon/myfonts/V_Bold.ttf
<? php pre>

<? php  name="windows"> <? php a>
<? php 3>Windows<? php h3>

<? php >(Note I don't have a windows test box at the moment, so these instructions
may not work...  If someone has tried this and has any suggestions for me,
please send me an email!)<? php p>

<? php >Read the Linux/Unix section above first, as most of it applies.  The main
difference is the ttf2pt1 utility.  Fortunately, there is a windows version,
available at <? php 
href="http://gnuwin32.sourceforge.net/packages/ttf2pt1.htm">http://gnuwin32.sourceforge.net/packages/ttf2pt1.htm<? php a>.
You will have to edit your dompdf_config.inc.php file to point to the path
where you installed ttf2pt1.<? php p>

<? php >You will also need the cli version of PHP in order to execute
load_font.php, however it's usage is the same (see the last example above).<? php p>



<? php php include("foot.inc");?>