use strict;
use warnings;

my $n_args = $#ARGV;

if($n_args != 0){
    warn "Invaild number of arguments.\n";
    exit 1;
}

my $filename = "$ARGV[0]";
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
open(my $fhw, '>', "$filename.temp") or die "Could not open file '$filename' $!";

while(my $row = <$fh>){
    $row =~ s/\t/    /g;
    print $fhw $row;
}


close $fhw;
close $fh;
my $mv_c = "mv $filename.temp $filename";
my $exec = `$mv_c`;
print "done\n";
