#!perl
use strict;
use warnings;

BEGIN {
    use Cwd;
    chdir '..' if getcwd =~ m@/t$@;
    use lib 'lib';
    use lib 't';
}

use Test::More;
use Compress::Zlib;
use WebserverTester;
use CPAN::Mini::Webserver;
use File::Slurp qw( read_file write_file );
use File::Path 'remove_tree';

my $server = setup_test_minicpan();
plan tests => 47;

my $name
    = ( $server->author_type eq 'Whois' )
    ? "L\x{e9}on Brocard"
    : 'Leon Brocard';

my $html;

# index
$html = html_page_ok('/');
like( $html, qr/Index/ );
like( $html, qr/Welcome to CPAN::Mini::Webserver/ );

# search for nothing
$html = html_page_ok( '/search/', q => '' );
like( $html, qr/No results found./ );

# search for buffy
$html = html_page_ok( '/search/', q => "buffy" );
like( $html, qr/Search for .buffy./ );
like( $html, qr/Acme-Buffy-1.5/ );
like( $html, qr/$name/ );

# show Leon
$html = html_page_ok( '~lbrocard/', 'q' => undef );
like( $html, qr/$name/ );
like( $html, qr/Acme-Buffy-1.5/ );
like( $html, qr/Tie-GHash-0.12/ );

# Show Acme-Buffy-1.5
$html = html_page_ok('~lbrocard/Acme-Buffy-1.5/');
like( $html, qr/$name &gt; Acme-Buffy-1.5/ );
like( $html, qr/CHANGES/ );
like( $html, qr/demo_buffy\.pl/ );

# Show Acme-Buffy-1.5 CHANGES
$html = html_page_ok('~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/CHANGES');
like( $html, qr{$name &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/CHANGES} );
like( $html, qr/Revision history for Perl extension Buffy/ );

# Show Acme-Buffy-1.5 CHANGES Buffy.pm
$html = html_page_ok(
    '~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm');
like( $html,
    qr{$name &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/lib/Acme/Buffy.pm} );
like( $html, qr{An encoding scheme for Buffy the Vampire Slayer fans} );
like( $html, qr{See raw file} );

# Show Acme-Buffy-1.5 CHANGES Buffy.pm
$html = html_page_ok(
    '/raw/~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm');
like( $html,
    qr{$name &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/lib/Acme/Buffy.pm} );
like( $html, qr{An encoding scheme for Buffy the Vampire Slayer fans} );

# Show package Acme::Buffy.pm
redirect_ok(
    '/~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm',
    '/package/lbrocard/Acme-Buffy-1.5/Acme::Buffy/'
);

# 'static' files
css_ok('/static/css/screen.css');
css_ok('/static/css/print.css');
css_ok('/static/css/ie.css');
png_ok('/static/images/logo.png');
png_ok('/static/images/favicon.png');
png_ok('favicon.ico');
opensearch_ok('/static/xml/opensearch.xml');

# 404
error404_ok('/this/doesnt/exist');

# downloads
$html
    = download_ok('/download/~LBROCARD/Acme-Buffy-1.5/Acme-Buffy-1.5/README');
like( $html, qr{Copyright \(c\) 2001} );

redirect_ok(
    '/authors/id/L/LB/LBROCARD/Acme-Buffy-1.5.tar.gz',
    '/download/~LBROCARD/Acme-Buffy-1.5',
);

# be like a CPAN mirror
$html = download_gzip_ok('/authors/id/L/LB/LBROCARD/Acme-Buffy-1.5.tar.gz');

$html = download_gzip_ok('/modules/02packages.details.txt.gz');
like( $html, qr{^\037\213} );

$html = download_gzip_ok('/authors/01mailrc.txt.gz');
like( $html, qr{^\037\213} );

$html = download_ok('/authors/id/L/LB/LBROCARD/CHECKSUMS');
like( $html, qr{this PGP-signed message is also valid perl} );

error404_ok('/authors/id/L/LB/LBROCARD/CHECKSUMZ');

sub setup_test_minicpan {
    $ENV{CPAN_MINI_CONFIG} = 't/mini/.minicpanrc';
    remove_tree( "t/mini/cache" );

    for my $file (qw( t/mini/authors/01mailrc.txt t/mini/modules/02packages.details.txt )) {
        my $gz_file = "$file.gz";
        unlink $gz_file if -e $gz_file;
        my $gz = Compress::Zlib::memGzip(read_file( $file, binmode => ':raw' )) or die "Cannot compress $file: $gzerrno\n";
        write_file( $gz_file, {binmode => ':raw'}, $gz ) ;
    }

    my $server = setup_server();
    return $server;
}
