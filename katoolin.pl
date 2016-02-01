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
		system("sudo apt-get install classicmenu-indicator");
	}
	else {
		print "ok\n"; #Je sais pas quoi faire encore
	}
}

print "1) Add Kali repositories\n";
print "2) Install classicmenu indicator\n";
print "3) Install Kali Menu\n";
print "4) Help\n";

my $option = <>;
chomp $option;

add_kali_repo();
