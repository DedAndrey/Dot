#
## releaselyrics.com support
#

use strict;
use warnings;

scalar {
    site => 'releaselyrics.com',
    code => sub {
        my ($content) = @_;

        if ($content =~ m{class="content-lyrics".*?>(.*?)</div>}is) {
            my $lyrics = $1;
            $lyrics =~ s{<.*?>}{}sg;
            return $lyrics;
        }

        return;
    }
  }
