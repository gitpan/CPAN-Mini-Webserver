#!perl
use strict;
use warnings;
use CGI;
use IO::Capture::Stdout;
use Test::More;
eval 'use CPAN::Mini::Webserver;
my $server = CPAN::Mini::Webserver->new();
$server->after_setup_listener;
';
if ( $@ =~ /Please set up minicpan/ ) {
    plan skip_all => "CPAN::Mini mirror must be installed for testing: $@";
} else {
    plan tests => 21;
}

my $capture = IO::Capture::Stdout->new();

my $server = CPAN::Mini::Webserver->new(2963);
$server->after_setup_listener;

# index
my $cgi = CGI->new;
$cgi->path_info('/');
my $html = make_request();
like( $html, qr/Index/ );
like( $html, qr/Welcome to CPAN::Mini::Webserver/ );

# search for buffy
$cgi->path_info('/search/');
$cgi->param( 'q', 'buffy' );
$html = make_request();
like( $html, qr/Search for .buffy./ );
like( $html, qr/Acme-Buffy-1.5/ );
like( $html, qr/Leon Brocard/ );

# show Leon
$cgi->path_info('~lbrocard/');
$cgi->param( 'q', undef );
$html = make_request();
like( $html, qr/Leon Brocard/ );
like( $html, qr/Acme-Buffy-1.5/ );
like( $html, qr/Tie-GHash-0.12/ );

# Show Acme-Buffy-1.5
$cgi->path_info('~lbrocard/Acme-Buffy-1.5/');
$html = make_request();
like( $html, qr/Leon Brocard &gt; Acme-Buffy-1.5/ );
like( $html, qr/CHANGES/ );
like( $html, qr/demo_buffy\.pl/ );

# Show Acme-Buffy-1.5 CHANGES
$cgi->path_info('~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/CHANGES');
$html = make_request();
like( $html,
    qr{Leon Brocard &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/CHANGES} );
like( $html, qr/Revision history for Perl extension Buffy/ );

# Show Acme-Buffy-1.5 CHANGES Buffy.pm
$cgi->path_info('~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm');
$html = make_request();
like( $html,
    qr{Leon Brocard &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/lib/Acme/Buffy.pm}
);
like( $html, qr{An encoding scheme for Buffy the Vampire Slayer fans} );
like( $html, qr{See raw file} );

# Show Acme-Buffy-1.5 CHANGES Buffy.pm
$cgi->path_info(
    '/raw/~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm');
$html = make_request();
like( $html,
    qr{Leon Brocard &gt; Acme-Buffy-1.5 &gt; Acme-Buffy-1.5/lib/Acme/Buffy.pm}
);
like( $html, qr{An encoding scheme for Buffy the Vampire Slayer fans} );

# Show package Acme::Buffy.pm
$cgi->path_info('/package/lbrocard/Acme-Buffy-1.5/Acme::Buffy/');
$html = make_request();
like( $html, qr{HTTP/1.0 302 OK} );
like( $html, qr{Status: 302 Found} );
like( $html,
    qr{Location: http://localhost:2963/~lbrocard/Acme-Buffy-1.5/Acme-Buffy-1.5/lib/Acme/Buffy.pm}
);

sub make_request {
    $capture->start;
    $server->handle_request($cgi);
    $capture->stop;
    my $buffer = join '', $capture->read;
    return $buffer;
}
