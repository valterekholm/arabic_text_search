#!/bin/perl

use warnings;
use strict;
use 5.010;
use List::MoreUtils qw(first_index);
use utf8;
use open ':std', ':encoding(UTF-8)';
use Encode::Locale;
use URI::Escape;
#use Encode;

use I18N::Langinfo qw(langinfo CODESET);
my $codeset = langinfo(CODESET);
use Encode qw(decode);
@ARGV = map { decode $codeset, $_ } @ARGV;

#TODO: att kunna söka på ord också , inte bara ensam bokstav

#file and character
my $arg1 = $ARGV[0];
my $arg2 = $ARGV[1];



#my $decoded_string = decode $ARGV[1];


print("arg1 is filename, arg2 is letter\n");
print("arg1 is ", $arg1, "\n");
print("arg2 is ", $arg2, "\n");
#print("arg2 is ", uri_escape_utf8($arg2), "\n");
#print("arg2 is ", chr(ord($arg2)), "\n");


# Open the text file with Arabic text
open(my $file, '<:encoding(UTF-8)', $arg1)
  or die "Could not open file $arg1 $!";

my $text = do { local $/; <$file> };

# Close the file
close($file);

my $count = 0;
#search for word in text

$count++ while ($text =~ /$arg2/g);


#if ($text =~ /$arg2/) {
#    print "Found $arg2 in the file\n";
#} else {
#    print "Did not find $arg2 in the file\n";
#}

print "Found $arg2 $count times in the file\n";


#print("Counted ", $count, "\n");
