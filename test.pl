# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use Data::Password qw(IsBadPassword);
$loaded = 1;
print "ok 1\n";

my %tests = qw(BlaBla 1 blabla 0 cleaner 0 qwerty 0 
	aB1234 0 xxxZZZ 1 xxxxZZ 0);

my $test = 1;

while (my ($pass, $good) = each %tests) {
	$test++;
	print "$pass: ";
	my $reason = IsBadPassword($pass);
	print $reason || "good";
	print ".\n";
	my $got = $reason ? 0 : 1;
	if ($got == $good) {
		print "ok $test\n";
		next;
	}
	print "not ok $test\n"; exit -1;
}

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

