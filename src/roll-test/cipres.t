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

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
  mkdir $TESTFILE.dir
  cd $TESTFILE.dir
  curl http://www.microbesonline.org/fasttree/downloads/aa250.tar.gz | tar zxv COG1960.sim.p COG1960.sim.rose COG1960.sim.trim.tree
  module load fasttree
  FastTree COG1960.sim.p
END

# cipres-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'cipres installed');
} else {
  ok(! $isInstalled, 'cipres not installed');
}
SKIP: {

  skip 'cipres not installed', 4 if ! $isInstalled;
  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  like($output, qr/N63:0.476665887/, 'FastTree test run');
  `/bin/ls /opt/modulefiles/applications/fasttree/[0-9]* 2>&1`;
  ok($? == 0, 'fasttree module installed');
  `/bin/ls /opt/modulefiles/applications/fasttree/.version.[0-9]* 2>&1`;
  ok($? == 0, 'fasttree version module installed');
  ok(-l '/opt/modulefiles/applications/fasttree/.version',
     'fasttree version module link created');

}

`rm -fr $TESTFILE*`;
