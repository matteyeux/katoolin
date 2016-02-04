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
#  Description..: Katoolin Perl version
#
######################################################################
# Language :
#               Perl
# Version : 0.2
#
#  Change Log
#  ==========
#
#   ===============================================================
#    Date     |       Who          |      What
#   ---------------------------------------------------------------
#    01/02/16 | Mathieu Hautebas   | Script creation
#   ---------------------------------------------------------------
#    03/02/16 | Mathieu Hautebas   | code modif 
#   ---------------------------------------------------------------
#    04/02/16 | Mathieu Hautebas   | Few fixes 
#   ---------------------------------------------------------------
# Here is the Kattolin written in Perl. 
# http://perldoc.perl.org/perlfaq8.html#How-do-I-clear-the-screen%3f just for reminder
# Running this script as root is the best way ;)

use strict;
use warnings;
use Term::ANSIScreen qw(cls);
use Term::ANSIColor;
use Switch;

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

   if ($yesno eq "y")
   {
      system("add-apt-repository ppa:diesch/testing && apt-get update");
      system("sudo apt-get install -y classicmenu-indicator");
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
      system("sudo apt-get install -y kali-menu");
   }
   else {
      main();
   }
}

sub categories {
   print "**************************** All Categories *****************************\n\n";
   print     "1) Information Gathering      8) Exploitation Tools\n";
   print     "2) Vulnerability Analysis     9) Forensics Tools\n";
   print     "3) Wireless Attacks          10) Stress Testing\n";
   print     "4) Web Applications          11) Password Attacks\n";
   print     "5) Sniffing & Spoofing       12) Reverse Engineering\n";
   print     "6) Maintaining Access        13) Hardware Hacking\n";
   print     "7) Reporting Tools           14) Extra\n";

   print "\n0) All\n";
   print "Select a category or press (0) to install all Kali linux tools.\n\n";
   print color("red"), "\nkat > ", color("reset");
   my $wat_kat = <>;
   chomp $wat_kat;

   switch($wat_kat) {

      case 1 {
         print color("green"), "Information Gathering\n\n", color("reset");
         print " 1) acccheck                                    30) lbd\n";
         print " 2) ace-voip                                    31) Maltego Teeth\n";
         print " 3) Amap                                        32) masscan\n";
         print " 4) Automater                                   33) Metagoofil\n";
         print " 5) bing-ip2hosts                               34) Miranda\n";
         print " 6) braa                                        35) Nmap\n";
         print " 7) CaseFile                                    36) ntop\n";
         print " 8) CDPSnarf                                    37) p0f\n";
         print " 9) cisco-torch                                 38) Parsero\n";
         print "10) Cookie Cadger                               39) Recon-ng\n";
         print "11) copy-router-config                          40) SET\n";
         print "12) DMitry                                      41) smtp-user-enum\n";
         print "13) dnmap                                       42) snmpcheck\n";
         print "14) dnsenum                                     43) sslcaudit\n";
         print "15) dnsmap                                      44) SSLsplit\n";
         print "16) DNSRecon                                    45) sslstrip\n";
         print "17) dnstracer                                   46) SSLyze\n";
         print "18) dnswalk                                     47) THC-IPV6\n";
         print "19) DotDotPwn                                   48) theHarvester\n";
         print "20) enum4linux                                  49) TLSSLed\n";
         print "21) enumIAX                                     50) twofi\n";
         print "22) exploitdb                                   51) URLCrazy\n";
         print "23) Fierce                                      52) Wireshark\n";
         print "24) Firewalk                                    53) WOL-E\n";
         print "25) fragroute                                   54) Xplico\n";
         print "26) fragrouter                                  55) iSMTP\n";
         print "27) Ghost Phisher                               56) InTrac\n";
         print "28) GoLismero                                   57) hping3\n\n";
         print "29) goofile\n\n";
         print "0) Install all Information Gathering tools\n\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");
         my $var_info = <>;
         chomp $var_info;

         switch ($var_info){

            case 1 {system ("apt-get install -y acccheck")}
            case 2 {system ("apt-get install -y ace-voip")}
            case 3 {system ("apt-get install -y amap")}
            case 4 {system ("apt-get install -y automater")}
            case 5 {system ("wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/")}
            case 6 {system ("apt-get install -y braa")}
            case 7 {system ("apt-get install -y casefile")}
            case 8 {system ("apt-get install -y cdpsnarf")}
            case 9 {system ("apt-get install -y cisco-torch")}
            case 10 {system ("apt-get install -y cookie-cadger")}
            case 11 {system ("apt-get install -y copy-router-config")}
            case 12 {system ("apt-get install -y dmitry")}
            case 13 {system ("apt-get install -y dnmap")}
            case 14 {system ("apt-get install -y dnsenum")}
            case 15 {system ("apt-get install -y dnsmap")}
            case 16 {system ("apt-get install -y dnsrecon")}
            case 17 {system ("apt-get install -y dnstracer")}
            case 18 {system ("apt-get install -y dnswalk")}
            case 19 {system ("apt-get install -y dotdotpwn")}
            case 20 {system ("apt-get install -y enum4linux")}
            case 21 {system ("apt-get install -y enumiax")}
            case 22 {system ("apt-get install -y exploitdb")}
            case 23 {system ("apt-get install -y fierce")}
            case 24 {system ("apt-get install -y firewalk")}
            case 25 {system ("apt-get install -y fragroute")}
            case 26 {system ("apt-get install -y fragrouter")}
            case 27 {system ("apt-get install -y ghost-phisher")}
            case 28 {system ("apt-get install -y golismero")}
            case 29 {system ("apt-get install -y goofile")}
            case 30 {system ("apt-get install -y lbd")}
            case 31 {system ("apt-get install -y maltego-teeth")}
            case 32 {system ("apt-get install -y masscan")}
            case 33 {system ("apt-get install -y metagoofil")}
            case 34 {system ("apt-get install -y miranda")}
            case 35 {system ("apt-get install -y nmap")}
            case 36 {system ("apt-get install -y ntop")}
            case 37 {system ("apt-get install -y p0f")}
            case 38 {system ("apt-get install -y parsero")}
            case 39 {system ("apt-get install -y recon-ng")}
            case 40 {system ("apt-get install -y set")}
            case 41 {system ("apt-get install -y smtp-user-enum")}
            case 42 {system ("apt-get install -y snmpcheck")}
            case 43 {system ("apt-get install -y sslcaudit")}
            case 44 {system ("apt-get install -y sslsplit")}
            case 45 {system ("apt-get install -y sslstrip")}
            case 46 {system ("apt-get install -y sslyze")}
            case 47 {system ("apt-get install -y thc-ipv6")}
            case 48 {system ("apt-get install -y theharvester")}
            case 49 {system ("apt-get install -y tlssled")}
            case 50 {system ("apt-get install -y twofi")}
            case 51 {system ("apt-get install -y urlcrazy")}
            case 52 {system ("apt-get install -y wireshark")}
            case 53 {system ("apt-get install -y wol-e")}
            case 54 {system ("apt-get install -y xplico")}
            case 55 {system ("apt-get install -y ismtp")}
            case 56 {system ("apt-get install -y intrace")}
            case 57 {system ("apt-get install -y hping3")}
            case 0 {system("apt-get install -y acccheck ace-voip amap automater braa casefile cdpsnarf cisco-torch cookie-cadger copy-router-config dmitry dnmap dnsenum dnsmap dnsrecon dnstracer dnswalk dotdotpwn enum4linux enumiax exploitdb fierce firewalk fragroute fragrouter ghost-phisher golismero goofile lbd maltego-teeth masscan metagoofil miranda nmap ntop p0f parsero recon-ng set smtp-user-enum snmpcheck sslcaudit sslsplit sslstrip sslyze thc-ipv6 theharvester tlssled twofi urlcrazy wireshark wol-e xplico ismtp intrace hping3 && wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 2 {
         print color("green"), "\t\tVulnerability Analysis\n", color("reset");
         print " 1) BBQSQL                                  18) ohrwurm\n";
         print " 2) BED                                     19) openvas-administrator\n";
         print " 3) cisco-auditing-tool                     20) openvas-cli\n";
         print " 4) cisco-global-exploiter                  21) openvas-manager\n";
         print " 5) cisco-ocs                               22) openvas-scanner\n";
         print " 6) cisco-torch                             23) Oscanner\n";
         print " 7) copy-router-config                      24) Powerfuzzer\n";
         print " 8) DBPwAudit                               25) sfuzz\n";
         print " 9) Doona                                   26) SidGuesser\n";
         print "10) DotDotPwn                               27) SIPArmyKnife\n";
         print "11) Greenbone Security Assistant            28) sqlmap\n";
         print "12) GSD                                     29) Sqlninja\n";
         print "13) HexorBase                               30) sqlsus\n";
         print "14) Inguma                                  31) THC-IPV6\n";
         print "15) jSQL                                    32) tnscmd10g\n";
         print "16) Lynis                                   33) unix-privesc-check\n";
         print "17) Nmap                                    34) Yersinia\n\n";

         print "0) Install all Vulnerability Analysis tools\n\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");
         my $var_vuln = <>;
         chomp $var_vuln;
         switch ($var_vuln){
            case 1 {system("apt-get install -y bbqsql")}
            case 2 {system("apt-get install -y bed")}
            case 3 {system("apt-get install -y cisco-auditing-tool")}
            case 4 {system("apt-get install -y cisco-global-exploiter")}
            case 5 {system("apt-get install -y cisco-ocs")}
            case 6 {system("apt-get install -y cisco-torch")}
            case 7 {system("apt-get install -y copy-router-config")}
            case 8 {print "download page : http://www.cqure.net/wp/tools/database/dbpwaudit/\n";}
            case 9 {system("apt-get install -y doona")}
            case 10 {system("apt-get install -y dotdotpwn")}
            case 11 {system("apt-get install -y greenbone-security-assistant")}
            case 12 {system("apt-get install -y git && git clone git://git.kali.org/packages/gsd.git")}
            case 13 {system("apt-get install -y hexorbase")}
            case 14 {system("apt-get install -y inguma")}
            case 15 {system("apt-get install -y jsql")}
            case 16 {system("apt-get install -y lynis")}
            case 17 {system("apt-get install -y nmap")}
            case 18 {system("apt-get install -y ohrwurm")}
            case 19 {system("apt-get install -y openvas-administrator")}
            case 20 {system("apt-get install -y openvas-cli")}
            case 21 {system("apt-get install -y openvas-manager")}
            case 22 {system("apt-get install -y openvas-scanner")}
            case 23 {system("apt-get install -y oscanner")}
            case 24 {system("apt-get install -y powerfuzzer")}
            case 25 {system("apt-get install -y sfuzz")}
            case 26 {system("apt-get install -y sidguesser")}
            case 27 {system("apt-get install -y siparmyknife")}
            case 28 {system("apt-get install -y sqlmap")}
            case 29 {system("apt-get install -y sqlninja")}
            case 30 {system("apt-get install -y sqlsus")}
            case 31 {system("apt-get install -y thc-ipv6")}
            case 32 {system("apt-get install -y tnscmd10g")}
            case 33 {system("apt-get install -y unix-privesc-check")}
            case 34 {system("apt-get install -y yersinia")}
            case 0 {system("apt-get install -y bbqsql bed cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch copy-router-config doona dotdotpwn greenbone-security-assistant hexorbase inguma jsql lynis nmap ohrwurm openvas-cli openvas-manager openvas-scanner oscanner powerfuzzer sfuzz sidguesser siparmyknife sqlmap sqlninja sqlsus thc-ipv6 tnscmd10g unix-privesc-check yersinia")}
            case "gohome" {main()}
            case "back" {categories()}
         }                                                             
      }
      case 3 {
         print color("green"), "\t\tWireless Attacks\n", color("reset");

         print " 1) Aircrack-ng                            17) KillerBee\n";
         print " 2) Asleap                                 18) Kismet\n";
         print " 3) Bluelog                                19) mdk3\n";
         print " 4) BlueMaho                               20) mfcuk\n";
         print " 5) Bluepot                                21) mfoc\n";
         print " 6) BlueRanger                             22) mfterm\n";
         print " 7) Bluesnarfer                            23) Multimon-NG\n";
         print " 8) Bully                                  24) PixieWPS\n";
         print " 9) coWPAtty                               25) Reaver\n";
         print "10) crackle                                26) redfang\n";
         print "11) eapmd5pass                             27) RTLSDR Scanner\n";
         print "12) Fern Wifi Cracker                      28) Spooftooph\n";
         print "13) Ghost Phisher                          29) Wifi Honey\n";
         print "14) GISKismet                              30) Wifitap \n";         
         print "15) gr-scan                                31) Wifite\n";
         print "16) kalibrate-rtl\n\n";

         print "0) Install all Wireless Attacks tools\n";
         print "Insert the number of the tool to install it\n";
         print "Insert the number of the tool to install it\n";
         
         print color("red"), "\nkat > ", color("reset");
         my $var_wireless = <>;
         chomp $var_wireless;
         switch ($var_wireless)
         {
            case 1 {system("apt-get install -y aircrack-ng")}
            case 2 {system("apt-get install -y asleap")}
            case 3 {system("apt-get install -y bluelog")}
            case 4 {system("apt-get install -y git && git clone git://git.kali.org/packages/bluemaho.git")}
            case 5 {system("apt-get install -y git && git clone git://git.kali.org/packages/bluepot.git")}
            case 6 {system("apt-get install -y blueranger")}
            case 7 {system("apt-get install -y bluesnarfer")}
            case 8 {system("apt-get install -y bully")}
            case 9 {system("apt-get install -y cowpatty")}
            case 10 {system("apt-get install -y crackle")}
            case 11 {system("apt-get install -y eapmd5pass")}
            case 12 {system("apt-get install -y fern-wifi-cracker")}
            case 13 {system("apt-get install -y ghost-phisher")}
            case 14 {system("apt-get install -y giskismet")}
            case 15 {system("apt-get install -y git && git cl}one git://git.kali.org/packages/gr-scan.git")}
            case 16 {system("apt-get install -y kalibrate-rtl")}
            case 17 {system("apt-get install -y killerbee")}
            case 18 {system("apt-get install -y kismet")}
            case 19 {system("apt-get install -y mdk3")}
            case 20 {system("apt-get install -y mfcuk")}
            case 21 {system("apt-get install -y mfoc")}
            case 22 {system("apt-get install -y mfterm")}
            case 23 {system("apt-get install -y multimon-ng")}
            case 24 {system("apt-get install -y pixiewps")}
            case 25 {system("apt-get install -y reaver")}
            case 26 {system("apt-get install -y redfang")}
            case 27 {system("apt-get install -y rtlsdr-scanner")}
            case 28 {system("apt-get install -y spooftooph")}
            case 29 {system("apt-get install -y wifi-honey")}
            case 30 {system("apt-get install -y wifitap")}
            case 31 {system("apt-get install -y wifite")}
            case 0 {system("apt-get install -y aircrack-ng asleap bluelog blueranger bluesnarfer bully cowpatty crackle eapmd5pass fern-wifi-cracker ghost-phisher giskismet gqrx kalibrate-rtl killerbee kismet mdk3 mfcuk mfoc mfterm multimon-ng pixiewps reaver redfang spooftooph wifi-honey wifitap wifite")}
            case "gohome" {main()}
            case "back" {categories()}
         }           
      }
      case 4 {
         print color("green"), "\t\tWeb Applications\n", color("reset");
         print "1) apache-users                       21) plecost\n";
         print "2) Arachni                            22) Powerfuzzer\n";
         print "3) BBQSQL                             23) ProxyStrike\n";
         print "4) BlindElephant                      24) Recon-ng\n";
         print "5) Burp Suite                         25) Skipfish\n";
         print "6) CutyCapt                           26) sqlmap\n";
         print "7) DAVTest                            27) Sqlninja\n";
         print "8) deblaze                            28) sqlsus\n";
         print "9) DIRB                               29) ua-tester\n";
         print "10) DirBuster                         30) Uniscan \n";
         print "11) fimap                             31) Vega\n";
         print "12) FunkLoad                          32) w3af\n";
         print "13) Grabber                           33) WebScarab\n";
         print "14) jboss-autopwn                     34) Webshag\n";
         print "15) joomscan                          35) WebSlayer\n";
         print "16) jSQL                              36) WebSploit\n";
         print "17) Maltego Teeth                     37) Wfuzz\n";
         print "18) PadBuster                         38) WPScan\n";
         print "19) Paros                             39) XSSer\n";
         print "20) Parsero                           40) zaproxy\n";
         print "0) Install all Web Applications tools\n";
         print "Insert the number of the tool to install it\n";

         print color("red"), "\nkat > ", color("reset");

         my $var_web = <>;
         chomp $var_web;
         switch ($var_web)
         {
            case 1 {system("apt-get install -y apache-users")}
            case 2 {system("apt-get install -y arachni")}
            case 3 {system("apt-get install -y bbqsql")}
            case 4 {system("apt-get install -y blindelephant")}
            case 5 {system("apt-get install -y burpsuite")}
            case 6 {system("apt-get install -y cutycapt")}
            case 7 {system("apt-get install -y davtest")}
            case 8 {system("apt-get install -y deblaze")}
            case 9 {system("apt-get install -y dirb")}
            case 10 {system("apt-get install -y dirbuster")}
            case 11 {system("apt-get install -y fimap")}
            case 12 {system("apt-get install -y funkload")}
            case 13 {system("apt-get install -y grabber")}
            case 14 {system("apt-get install -y jboss-autopwn")}
            case 15 {system("apt-get install -y joomscan")}
            case 16 {system("apt-get install -y jsql")}
            case 17 {system("apt-get install -y maltego-teeth")}
            case 18 {system("apt-get install -y padbuster")}
            case 19 {system("apt-get install -y paros")}
            case 20 {system("apt-get install -y parsero")}
            case 21 {system("apt-get install -y plecost")}
            case 22 {system("apt-get install -y powerfuzzer")}
            case 23 {system("apt-get install -y proxystrike")}
            case 24 {system("apt-get install -y recon-ng")}
            case 25 {system("apt-get install -y skipfish")}
            case 26 {system("apt-get install -y sqlmap")}
            case 27 {system("apt-get install -y sqlninja")}
            case 28 {system("apt-get install -y sqlsus")}
            case 29 {system("apt-get install -y ua-tester")}
            case 30 {system("apt-get install -y uniscan")}
            case 31 {system("apt-get install -y vega")}
            case 32 {system("apt-get install -y w3af")}
            case 33 {system("apt-get install -y webscarab")}
            case 34 {system("apt-get install -y webshag")}
            case 35 {system("apt-get install -y git && git clone case 1 {git://git.kali.org/packages/webslayer.git")}
            case 36 {system("apt-get install -y websploit")}
            case 37 {system("apt-get install -y wfuzz")}
            case 38 {system("apt-get install -y wpscan")}
            case 39 {system("apt-get install -y xsser")}
            case 40 {system("apt-get install -y zaproxy")}
            case 0 {system("apt-get install -y apache-users arachni bbqsql blindelephant burpsuite cutycapt davtest deblaze dirb dirbuster fimap funkload grabber jboss-autopwn joomscan jsql maltego-teeth padbuster paros parsero plecost powerfuzzer proxystrike recon-ng skipfish sqlmap sqlninja sqlsus ua-tester uniscan vega w3af webscarab webshag websploit wfuzz wpscan xsser zaproxy")}
            case "gohome" {main()}
            case "back" {categories()}
         }           
      }
      case 5 {
         print color("green"), "\t\tSniffing & Spoofing\n", color("reset");
         print " 1) Burp Suite                       17) rtpmixsound\n";
         print " 2) DNSChef                          18) sctpscan\n";
         print " 3) fiked                            19) SIPArmyKnife\n";
         print " 4) hamster-sidejack                 20) SIPp\n";
         print " 5) HexInject                        21) SIPVicious\n";
         print " 6) iaxflood                         22) SniffJoke\n";
         print " 7) inviteflood                      23) SSLsplit\n";
         print " 8) iSMTP                            24) sslstrip\n";
         print " 9) isr-evilgrade                    25) THC-IPV6\n";
         print "10) mitmproxy                        26) VoIPHopper\n";
         print "11) ohrwurm                          27) WebScarab\n";
         print "12) protos-sip                       28) Wifi Honey\n";
         print "13) rebind                           29) Wireshark\n";
         print "14) responder                        30) xspy\n";
         print "15) rtpbreak                         31) Yersinia\n";
         print "16) rtpinsertsound                   32) zaproxy\n\n";
         print "0) Install all Sniffing & Spoofing tools\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");
         my $var_sniff_spoof = <>;
         chomp $var_sniff_spoof;

         switch ($var_sniff_spoof)
         {
            case 1 {system("apt-get install -y burpsuite")}
            case 2 {system("apt-get install -y dnschef")}
            case 3 {system("apt-get install -y fiked")}
            case 4 {system("apt-get install -y hamster-sidejack")}
            case 5 {system("apt-get install -y hexinject")}
            case 6 {system("apt-get install -y iaxflood")}
            case 7 {system("apt-get install -y inviteflood")}
            case 8 {system("apt-get install -y ismtp")}
            case 9 {system("apt-get install -y git && git clone git://git.kali.org/packages/isr-evilgrade.git")}
            case 10 {system("apt-get install -y mitmproxy")}
            case 11 {system("apt-get install -y ohrwurm")}
            case 12 {system("apt-get install -y protos-sip")}
            case 13 {system("apt-get install -y rebind")}
            case 14 {system("apt-get install -y responder")}
            case 15 {system("apt-get install -y rtpbreak")}
            case 16 {system("apt-get install -y rtpinsertsound")}
            case 17 {system("apt-get install -y rtpmixsound")}
            case 18 {system("apt-get install -y sctpscan")}
            case 19 {system("apt-get install -y siparmyknife")}
            case 20 {system("apt-get install -y sipp")}
            case 21 {system("apt-get install -y sipvicious")}
            case 22 {system("apt-get install -y sniffjoke")}
            case 23 {system("apt-get install -y sslsplit")}
            case 24 {system("apt-get install -y sslstrip")}
            case 25 {system("apt-get install -y thc-ipv6")}
            case 26 {system("apt-get install -y voiphopper")}
            case 27 {system("apt-get install -y webscarab")}
            case 28 {system("apt-get install -y wifi-honey")}
            case 29 {system("apt-get install -y wireshark")}
            case 30 {system("apt-get install -y xspy")}
            case 31 {system("apt-get install -y yersinia")}
            case 32 {system("apt-get install -y zaproxy")}
            case 0 {system("apt-get install -y burpsuite dnschef fiked hamster-sidejack hexinject iaxflood inviteflood ismtp mitmproxy ohrwurm protos-sip rebind responder rtpbreak rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipvicious sniffjoke sslsplit sslstrip thc-ipv6 voiphopper webscarab wifi-honey wireshark xspy yersinia zaproxy")}
            case "gohome" {main()}
            case "back" {categories()}
         }           
      }
      case 6 {
         print color("green"), "\t\tMaintaining Access\n", color("reset");
         print " 1) CryptCat\n";
         print " 2) Cymothoa\n";
         print " 3) dbd\n";
         print " 4) dns2tcp\n";
         print " 5) http-tunnel\n";
         print " 6) HTTPTunnel\n";
         print " 7) Intersect\n";
         print " 8) Nishang\n";
         print " 9) polenum\n";
         print "10) PowerSploit\n";
         print "11) pwnat\n";
         print "12) RidEnum\n";
         print "13) sbd\n";
         print "14) U3-Pwn\n";
         print "15) Webshells\n";
         print "16) Weevely\n";
         print "17) Winexe\n\n";
         print "0) Install all Maintaining Access tools\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");
         my $var_acces = <>;
         chomp $var_acces;

         switch ($var_acces){
            case 1 {system("apt-get install -y cryptcat")}
            case 2 {system("apt-get install -y cymothoa")}
            case 3 {system("apt-get install -y dbd")}
            case 4 {system("apt-get install -y dns2tcp")}
            case 5 {system("apt-get install -y http-tunnel")}
            case 6 {system("apt-get install -y httptunnel")}
            case 7 {system("apt-get install -y intersect")}
            case 8 {system("apt-get install -y nishang")}
            case 9 {system("apt-get install -y polenum")}
            case 10 {system("apt-get install -y powersploit")}
            case 11 {system("apt-get install -y pwnat")}
            case 12 {system("apt-get install -y ridenum")}
            case 13 {system("apt-get install -y sbd")}
            case 14 {system("apt-get install -y u3-pwn")}
            case 15 {system("apt-get install -y webshells")}
            case 16 {system("apt-get install -y weevely")}
            case 17 {system("apt-get install -y winexe")}
            case 0 {system("apt-get install -y cryptcat cymothoa dbd dns2tcp http-tunnel httptunnel intersect nishang polenum powersploit pwnat ridenum sbd u3-pwn webshells weevely winexe")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 7 {
         print color("green"), "\t\tReporting Tools\n", color("reset");
         print "1) CaseFile\n";
         print "2) CutyCapt\n";
         print "3) dos2unix\n";
         print "4) Dradis\n";
         print "5) KeepNote\n";  
         print "6) MagicTree\n";
         print "7) Metagoofil\n";
         print "8) Nipper-ng\n";
         print "9) pipal\n";
         print "0) Install all Reporting Tools\n";
         print color("red"), "\nkat > ", color("reset");
         print "Insert the number of the tool to install it\n";
         my $var_report = <>;
         chomp $var_report;

         switch ($var_report){
            case 1 {system("apt-get install -y armitage")}
            case 2 {system("apt-get install -y backdoor-factory")}
            case 3 {system("apt-get install -y beef-xss")}
            case 4 {system("apt-get install -y cisco-auditing-tool")}
            case 5 {system("apt-get install -y cisco-global-exploiter")}
            case 6 {system("apt-get install -y cisco-ocs")}
            case 7 {system("apt-get install -y cisco-torch")}
            case 8 {system("apt-get install -y crackle")}
            case 9 {system("apt-get install -y jboss-autopwn")}
            case 10 {system("apt-get install -y linux-exploit-suggester")}
            case 11 {system("apt-get install -y maltego-teeth")}
            case 12 {system("apt-get install -y set")}
            case 13 {system("apt-get install -y shellnoob")}
            case 14 {system("apt-get install -y sqlmap")}
            case 15 {system("apt-get install -y thc-ipv6")}
            case 16 {system("apt-get install -y yersinia")}
            case 0 {system("apt-get install -y casefile cutycapt dos2unix dradis keepnote magictree metagoofil nipper-ng pipal")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }


      case 8 {
         print color("green"), "\t\tExploitation Tools\n", color("reset");
         print " 1) Armitage\n";
         print " 2) Backdoor Factory\n";
         print " 3) BeEF\n";
         print " 4) cisco-auditing-tool\n";
         print " 5) cisco-global-exploiter\n"; 
         print " 6) cisco-ocs\n";
         print " 7) cisco-torch\n";
         print " 8) crackle\n";
         print " 9) jboss-autopwn\n";
         print "10) Linux Exploit Suggester\n";
         print "11) Maltego Teeth\n";
         print "12) SET\n";
         print "13) ShellNoob\n";
         print "14) sqlmap\n";
         print "15) THC-IPV6\n";
         print "16) Yersinia\n\n";
         print "0) Install all Exploitation Tools\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");

         my $exploit_tool = <>;
         chomp $exploit_tool;

         switch (){
            case 1 {system("apt-get install -y armitage")}
            case 2 {system("apt-get install -y backdoor-factory")}
            case 3 {system("apt-get install -y beef-xss")}
            case 4 {system("apt-get install -y cisco-auditing-tool")}
            case 5 {system("apt-get install -y cisco-global-exploiter")}
            case 6 {system("apt-get install -y cisco-ocs")}
            case 7 {system("apt-get install -y cisco-torch")}
            case 8 {system("apt-get install -y crackle")}
            case 9 {system("apt-get install -y jboss-autopwn")}
            case 10 {system("apt-get install -y linux-exploit-suggester")}
            case 11 {system("apt-get install -y maltego-teeth")}
            case 12 {system("apt-get install -y set")}
            case 13 {system("apt-get install -y shellnoob")}
            case 14 {system("apt-get install -y sqlmap")}
            case 15 {system("apt-get install -y thc-ipv6")}
            case 16 {system("apt-get install -y yersinia")}
            case 0 {system("apt-get install -y armitage backdoor-factory cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch crackle jboss-autopwn linux-exploit-suggester maltego-teeth set shellnoob sqlmap thc-ipv6 yersinia beef-xss")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 9 {
         print color("green"), "\t\tForensics Tools\n", color("reset");
         print "1) Binwalk                       13) Galleta\n";
         print "2) bulk-extractor                14) Guymager\n";    
         print "3) Capstone                      15) iPhone Backup Analyzer\n";
         print "4) chntpw                        16) p0f\n";
         print "5) Cuckoo                        17) pdf-parser\n";
         print "6) dc3dd                         18) pdfid\n";
         print "7) ddrescue                      19) pdgmail\n";
         print "8) DFF                           20) peepdf\n";
         print "9) diStorm3                      21) RegRipper\n";
         print "10) Dumpzilla                    22) Volatility\n";
         print "11) extundelete                  23) Xplico\n";
         print "12) Foremost\n\n";                       
         print "0) Install all Forensics Tools\n";
         print "Insert the number of the tool to install it\n";
         print color("red"), "\nkat > ", color("reset");
         my $var_foren = <>;
         chomp $var_foren;

         switch ($var_foren) {
            case 1 {system("apt-get install -y binwalk")}
            case 2 {system("apt-get install -y bulk-extractor")}
            case 3 {system("apt-get install -y git && git clone git://git.kali.org/packages/capstone.git")}
            case 4 {system("apt-get install -y chntpw")}
            case 5 {system("apt-get install -y cuckoo")}
            case 6 {system("apt-get install -y dc3dd")}
            case 7 {system("apt-get install -y ddrescue")}
            case 8 {system("apt-get install -y dff")}
            case 9 {system("apt-get install -y git && git clone git://git.kali.org/packages/distorm3.git")}
            case 10 {system("apt-get install -y dumpzilla")}
            case 11 {system("apt-get install -y extundelete")}
            case 12 {system("apt-get install -y foremost")}
            case 13 {system("apt-get install -y galleta")}
            case 14 {system("apt-get install -y guymager")}
            case 15 {system("apt-get install -y iphone-backup-analyzer")}
            case 16 {system("apt-get install -y p0f")}
            case 17 {system("apt-get install -y pdf-parser")}
            case 18 {system("apt-get install -y pdfid")}
            case 19 {system("apt-get install -y pdgmail")}
            case 20 {system("apt-get install -y peepdf")}
            case 21 {system("apt-get install -y regripper")}
            case 22 {system("apt-get install -y volatility")}
            case 23 {system("apt-get install -y xplico")}
            case 0 {system("apt-get install -y binwalk bulk-extractor chntpw cuckoo dc3dd ddrescue dff dumpzilla extundelete foremost galleta guymager iphone-backup-analyzer p0f pdf-parser pdfid pdgmail peepdf regripper volatility xplico")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 10 {
         print color("green"), "\t\tStress Testing\n", color("reset");
         print " 1) DHCPig\n";
         print " 2) FunkLoad\n";
         print " 3) iaxflood\n";
         print " 4) Inundator\n";
         print " 5) inviteflood\n";   
         print " 6) ipv6-toolkit\n";
         print " 7) mdk3\n";
         print " 8) Reaver\n";
         print " 9) rtpflood\n";
         print "10) SlowHTTPTest\n";
         print "11) t50\n";
         print "12) Termineter\n";
         print "13) THC-IPV6\n";
         print "14) THC-SSL-DOS\n\n";      
         print "0) Install all Stress Testing tools\n";
         print "Insert the number of the tool to install it\n";
         
         print color("red"), "\nkat > ", color("reset");
         my $var_test = <>;
         chomp $var_test;

         switch ($var_test) {
            case 1 {system("apt-get install -y dhcpig")}
            case 2 {system("apt-get install -y funkload")}
            case 3 {system("apt-get install -y iaxflood")}
            case 4 {system("apt-get install -y git && git clone git://git.kali.org/packages/inundator.git")}
            case 5 {system("apt-get install -y inviteflood")}
            case 6 {system("apt-get install -y ipv6-toolkit")}
            case 7 {system("apt-get install -y mdk3")}
            case 8 {system("apt-get install -y reaver")}
            case 9 {system("apt-get install -y rtpflood")}
            case 10 {system("apt-get install -y slowhttptest")}
            case 11 {system("apt-get install -y t50")}
            case 12 {system("apt-get install -y termineter")}
            case 13 {system("apt-get install -y thc-ipv6")}
            case 14 {system("apt-get install -y thc-ssl-dos")}
            case 0 {system("apt-get install -y dhcpig funkload iaxflood inviteflood ipv6-toolkit mdk3 reaver rtpflood slowhttptest t50 termineter thc-ipv6 thc-ssl-dos")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 11 {
         print color("green"), "\t\tPassword Attacks\n", color("reset");

         print " 1) acccheck                     19) Maskprocessor\n";
         print " 2) Burp Suite                   20) multiforcer\n";
         print " 3) CeWL                         21) Ncrack\n";
         print " 4) chntpw                       22) oclgausscrack\n";
         print " 5) cisco-auditing-tool          23) PACK\n";
         print " 6) CmosPwd                      24) patator\n";
         print " 7) creddump                     25) phrasendrescher\n";
         print " 8) crunch                       26) polenum\n";
         print " 9) DBPwAudit                    27) RainbowCrack\n";
         print "10) findmyhash                   28) rcracki-mt\n";
         print "11) gpp-decrypt                  29) RSMangler\n";
         print "12) hash-identifier              30) SQLdict\n";
         print "13) HexorBase                    31) Statsprocessor\n";
         print "14) THC-Hydra                    32) THC-pptp-bruter\n";
         print "15) John the Ripper              33) TrueCrack\n";
         print "16) Johnny                       34) WebScarab\n";
         print "17) keimpx                       35) wordlists\n";
         print "18) Maltego Teeth                36) zaproxy\n\n";
         print "0) Install all Password Attacks tools\n";
         print "Insert the number of the tool to install it\n";
         
         print color("red"), "\nkat > ", color("reset");
         my $var_pass = <>;
         chomp $var_pass;

         switch ($var_pass) {
            case 1 {system("apt-get install -y acccheck")}
            case 2 {system("apt-get install -y burpsuite")}
            case 3 {system("apt-get install -y cewl")}
            case 4 {system("apt-get install -y chntpw")}
            case 5 {system("apt-get install -y cisco-auditing-tool")}
            case 6 {system("apt-get install -y cmospwd")}
            case 7 {system("apt-get install -y creddump")}
            case 8 {system("apt-get install -y crunch")}
            case 9 {system("apt-get install -y git && git clone git://git.kali.org/packages/dbpwaudit.git")}
            case 10 {system("apt-get install -y findmyhash")}
            case 11 {system("apt-get install -y gpp-decrypt")}
            case 12 {system("apt-get install -y hash-identifier")}
            case 13 {system("apt-get install -y hexorbase")}
            case 14 {print "please visit : https://www.thc.org/thc-hydra/\n"}
            case 15 {system("apt-get install -y john")}
            case 16 {system("apt-get install -y johnny")}
            case 17 {system("apt-get install -y keimpx")}
            case 18 {system("apt-get install -y maltego-teeth")}
            case 19 {system("apt-get install -y maskprocessor")}
            case 20 {system("apt-get install -y multiforcer")}
            case 21 {system("apt-get install -y ncrack")}
            case 22 {system("apt-get install -y oclgausscrack")}
            case 23 {system("apt-get install -y pack")}
            case 24 {system("apt-get install -y patator")}
            case 25 {print "please visit : http://www.leidecker.info/projects/phrasendrescher/index.shtml\n"}
            case 26 {system("apt-get install -y polenum")}
            case 27 {system("apt-get install -y rainbowcrack")}
            case 28 {system("apt-get install -y rcracki-mt")}
            case 29 {system("apt-get install -y rsmangler")}
            case 30 {system("apt-get install -y sqldict")}
            case 31 {system("apt-get install -y statsprocessor")}
            case 32 {system("apt-get install -y thc-pptp-bruter")}
            case 33 {system("apt-get install -y truecrack")}
            case 34 {system("apt-get install -y webscarab")}
            case 35 {system("apt-get install -y wordlists")}
            case 36 {system("apt-get install -y zaproxy")}
            case 0 {system("apt-get install -y acccheck burpsuite cewl chntpw cisco-auditing-tool cmospwd creddump crunch findmyhash gpp-decrypt hash-identifier hexorbase john johnny keimpx maltego-teeth maskprocessor multiforcer ncrack oclgausscrack pack patator polenum rainbowcrack rcracki-mt rsmangler sqldict statsprocessor thc-pptp-bruter truecrack webscarab wordlists zaproxy")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 12 {
         print color("green"), "\t\tReverse Engineering\n", color("reset");
         print " 1) apktool\n";
         print " 2) dex2jar\n";
         print " 3) diStorm3\n";
         print " 4) edb-debugger\n";
         print " 5) jad\n";  
         print " 6) javasnoop\n";
         print " 7) JD-GUI\n";
         print " 8) OllyDbg\n";
         print " 9) smali\n";
         print "10) Valgrind\n";
         print "11) YARA\n\n";
         print "0) Install all Reverse Engineering tools\n";
         print "Insert the number of the tool to install it\n";
         
         print color("red"), "\nkat > ", color("reset");
         my $var_reverse = <>;
         chomp $var_reverse;

         switch () {
            case 1 {system("apt-get install -y dex2jar")}
            case 2 {system("apt-get install -y python-diStorm3")}
            case 3 {system("apt-get install -y edb-debugger")}
            case 4 {system("apt-get install -y jad")}
            case 5 {system("apt-get install -y javasnoop")}
            case 6 {system("apt-get install -y JD")}
            case 7 {system("apt-get install -y OllyDbg")}
            case 8 {system("apt-get install -y smali")}
            case 9 {system("apt-get install -y Valgrind")}
            case 10 {system("apt-get install -y YARA")}
            case 0 {system("apt-get install -y apktool dex2jar python-diStorm3 edb-debugger jad javasnoop JD OllyDbg smali Valgrind YARA")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }
      case 13 {
         print color("green"), "\t\tHardware Hacking\n", color("reset");
         print "1) android-sdk\n";
         print "2) apktool\n";
         print "3) Arduino\n";
         print "4) dex2jar\n";
         print "5) Sakis3G\n"; 
         print "6) smali\n\n";
         print "0) Install all Hardware Hacking tools\n";
         print "Insert the number of the tool to install it\n";
                  
         print color("red"), "\nkat > ", color("reset");
         my $var_hard = <>;
         chomp $var_hard;

         switch ($var_hard) {
            case 1 {system("apt-get install -y android-sdk")}
            case 2 {system("apt-get install -y apktool")}
            case 3 {system("apt-get install -y arduino")}
            case 4 {system("apt-get install -y dex2jar")}
            case 5 {system("apt-get install -y sakis3g")}
            case 6 {system("apt-get install -y smali")}
            case 0 {system("apt-get install -y android-sdk apktool arduino dex2jar sakis3g smali")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }

      case 14 {
         print color("green"), "\t\tExtra\n", color("reset");
         print "1) Wifresti\n";
         print "2) Squid3\n";
         
         print color("red"), "\nkat > ", color("reset");
         my $var_extra = <>;
         chomp $var_extra;

         switch ($var_extra) {
            case 1 {system("git clone https://github.com/LionSec/wifresti.git && cp wifresti/wifresti.py /usr/bin/wifresti && chmod +x /usr/bin/wifresti && wifresti")}
            case 2 {system("apt-get install -y squid3")}
            case "gohome" {main()}
            case "back" {categories()}
         }
      }

      case 0 {
         system("apt-get install -y acccheck ace-voip amap automater braa casefile cdpsnarf cisco-torch cookie-cadger copy-router-config dmitry dnmap dnsenum dnsmap dnsrecon dnstracer dnswalk dotdotpwn enum4linux enumiax exploitdb fierce firewalk fragroute fragrouter ghost-phisher golismero goofile lbd maltego-teeth masscan metagoofil miranda nmap ntop p0f parsero recon-ng set smtp-user-enum snmpcheck sslcaudit sslsplit sslstrip sslyze thc-ipv6 theharvester tlssled twofi urlcrazy wireshark wol-e xplico ismtp intrace hping3 bbqsql bed cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch copy-router-config doona dotdotpwn greenbone-security-assistant hexorbase inguma jsql lynis nmap ohrwurm openvas-cli openvas-manager openvas-scanner oscanner powerfuzzer sfuzz sidguesser siparmyknife sqlmap sqlninja sqlsus thc-ipv6 tnscmd10g unix-privesc-check yersinia aircrack-ng asleap bluelog blueranger bluesnarfer bully cowpatty crackle eapmd5pass fern-wifi-cracker ghost-phisher giskismet gqrx kalibrate-rtl killerbee kismet mdk3 mfcuk mfoc mfterm multimon-ng pixiewps reaver redfang spooftooph wifi-honey wifitap wifite apache-users arachni bbqsql blindelephant burpsuite cutycapt davtest deblaze dirb dirbuster fimap funkload grabber jboss-autopwn joomscan jsql maltego-teeth padbuster paros parsero plecost powerfuzzer proxystrike recon-ng skipfish sqlmap sqlninja sqlsus ua-tester uniscan vega w3af webscarab webshag websploit wfuzz wpscan xsser zaproxy burpsuite dnschef fiked hamster-sidejack hexinject iaxflood inviteflood ismtp mitmproxy ohrwurm protos-sip rebind responder rtpbreak rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipvicious sniffjoke sslsplit sslstrip thc-ipv6 voiphopper webscarab wifi-honey wireshark xspy yersinia zaproxy cryptcat cymothoa dbd dns2tcp http-tunnel httptunnel intersect nishang polenum powersploit pwnat ridenum sbd u3-pwn webshells weevely winexe casefile cutycapt dos2unix dradis keepnote magictree metagoofil nipper-ng pipal armitage backdoor-factory cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch crackle jboss-autopwn linux-exploit-suggester maltego-teeth set shellnoob sqlmap thc-ipv6 yersinia beef-xss binwalk bulk-extractor chntpw cuckoo dc3dd ddrescue dff dumpzilla extundelete foremost galleta guymager iphone-backup-analyzer p0f pdf-parser pdfid pdgmail peepdf regripper volatility xplico dhcpig funkload iaxflood inviteflood ipv6-toolkit mdk3 reaver rtpflood slowhttptest t50 termineter thc-ipv6 thc-ssl-dos acccheck burpsuite cewl chntpw cisco-auditing-tool cmospwd creddump crunch findmyhash gpp-decrypt hash-identifier hexorbase john johnny keimpx maltego-teeth maskprocessor multiforcer ncrack oclgausscrack pack patator polenum rainbowcrack rcracki-mt rsmangler sqldict statsprocessor thc-pptp-bruter truecrack webscarab wordlists zaproxy apktool dex2jar python-distorm3 edb-debugger jad javasnoop jd ollydbg smali valgrind yara android-sdk apktool arduino dex2jar sakis3g smali&& wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/");
      }
      case "gohome" {main()}
      case "back" {main()}
   }
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

   switch ($option)
   {
      case 1 {add_kali_repo()}
      case 2 {categories()} #I'll continue to work on tomorrow
      case 3 {install_classic_menu()}
      case 4 {install_kali_menu()}
   }
}
main();