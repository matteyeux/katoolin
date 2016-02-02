#!/usr/bin/perl
#######################################################################
#  _         _              _ _
# | | ____ _| |_ ___   ___ | (_)_ __
# | |/ / _` | __/ _ \ / _ \| | | '_ \
# |   < (_| | || (_) | (_) | | | | | |
# |_|\_\__,_|\__\___/ \___/|_|_|_| |_|
#
#  Project......: katoolin.pl
#  Type.........: script
#  Creator......: Mathieu Hautebas
#  Description..: Katoolin écrit en Perl
#
######################################################################
# Language :
#               Perl
# Version : 0.1
#
#  Change Log
#  ==========
#
#   ===============================================================
#    Date     |       Who          |      What
#   ---------------------------------------------------------------
#    01/02/16 | Mathieu Hautebas   | Creation du script
#   ---------------------------------------------------------------
# Petit défi à moi même : Réécrire Katoolin en Perl, en soit c'est pas compliqué à faire
# Si j'ai le temps j'en ferais un post sur mon blog.
# http://perldoc.perl.org/perlfaq8.html#How-do-I-clear-the-screen%3f

use strict;
use warnings;
use Term::ANSIScreen qw(cls);
use Term::ANSIColor;

sub add_kali_repo {
        my $file = "/etc/apt/sources.list";

        system("apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6");
        if( -e $file)
        {
                print "Existing file\n";
                open(my $header, '>>', $file) or die "Can't open file, make sur you're root";
                print $header "# Kali linux repositories | Added by Katoolin Perl version\ndeb http://http.kali.org/kali sana main non-free contrib\ndeb http://security.kali.org/kali-security sana/updates main contrib non-free\ndeb http://repo.kali.org/kali kali-bleeding-edge main";
                close $header;
                print "Successfully added Kali Linux repositories !\n";
        }
        else
        {
                open (my $header, '>', $file) or die "Can't open file, make sur you're root";
                print $header "# Kali linux repositories | Added by Katoolin\ndeb http://http.kali.org/kali sana main non-free contrib\ndeb http://security.kali.org/kali-security sana/updates main contrib non-free\ndeb http://repo.kali.org/kali kali-bleeding-edge main";
                close $header;
        }
        system("apt-get update");
}

sub install_classic_menu {

        print "
ClassicMenu Indicator is a notification area applet (application indicator) for the top panel of Ubuntu's Unity desktop environment.

It provides a simple way to get a classic GNOME-style application menu for those who prefer this over the Unity dash menu.

Like the classic GNOME menu, it includes Wine games and applications if you have those installed.

For more information , please visit : http://www.florian-diesch.de/software/classicmenu-indicator/\n";
        print "Do you want to install classicmenu indicator ? [Y/N] > ";
        my $yesno = <>;
        chomp $ yesno;

        if ($yesno eq "y") {
                system("add-apt-repository ppa:diesch/testing && apt-get update");
                system("sudo apt-get install classicmenu-indicator");
        }
        else {
                print "ok"
        }
}

sub install_kali_menu {
        print "Do you want to install classicmenu indicator ? [Y/N] > ";
        my $yesno = <>;
        chomp $ yesno;

        if ($yesno eq "y") {
                system("add-apt-repository ppa:diesch/testing && apt-get update");
                system("sudo apt-get install kali-menu");
        }
        else {

                main();
        }
}

sub categories {
        print "**************************** All Categories *****************************\n";
        print     "1) Information Gathering      8) Exploitation Tools\n";
        print     "2) Vulnerability Analysis     9) Forensics Tools\n";
        print     "3) Wireless Attacks          10) Stress Testing\n";
        print     "4) Web Applications          11) Password Attacks\n";
        print     "5) Sniffing & Spoofing       12) Reverse Engineering\n";
        print     "6) Maintaining Access        13) Hardware Hacking\n";
        print     "7) Reporting Tools           14) Extra\n";

        print "\n0) All\n";

        print color("red"), "\nkat > ", color("reset");
        my $wat_kat <>;
        chomp $wat_kat;
}

sub main  {
        cls();
        print "1) Add Kali repositories\n";
        print "2) View Categories\n";
        print "3) Install classicmenu indicator\n";
        print "4) Install Kali Menu\n";
        print color("red"), "\nkat > ", color("reset");
        my $option = <>;
        chomp $option;

        switch (option)
        {
                case 1 {add_kali_repo()}
                case 2 {categories()} #I'll continue to work on tomorrow
                case 3 {install_classic_menu()}
                case 4 {install_kali_menu()}
        }
}
main();