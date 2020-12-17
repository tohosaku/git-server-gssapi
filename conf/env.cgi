#!/usr/bin/perl

print "Content-type: text/html\n\n";
print "<table>\n";

for $key (sort(keys(%ENV))) {
    print "<tr><td>$key</td><td>$ENV{$key}</td></tr>\n";
}

print "</table>\n";
exit;
