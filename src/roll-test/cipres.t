#!/usr/bin/perl -w
# cipres roll installation test.  Usage:
# cipres.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/fasttree';
my $output;

my $TESTFILE = 'tmpcipres';

# cipres-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'cipres installed');
} else {
  ok(! $isInstalled, 'cipres not installed');
}
SKIP: {

  skip 'cipres not installed', 4 if ! $isInstalled;
  $output = `module load fasttree; FastTree < /dev/null 2>&1`;
  like($output, qr/FastTree version \d+(\.\d+)*/i, 'FastTree test run');
  `/bin/ls /opt/modulefiles/applications/fasttree/[0-9]* 2>&1`;
  ok($? == 0, 'fasttree module installed');
  `/bin/ls /opt/modulefiles/applications/fasttree/.version.[0-9]* 2>&1`;
  ok($? == 0, 'fasttree version module installed');
  ok(-l '/opt/modulefiles/applications/fasttree/.version',
     'fasttree version module link created');

}

`rm -fr $TESTFILE*`;
