@ECHO OFF

REM ######################################################
REM ## FILENAME: WINSTREAM.BAT
REM ## TITLE: WINSTREAM
REM ## AUTHOR: Endwall
REM ## Creation Date: January 27, 2018
REM ## Version: 0.05051
REM ## Revision Date: July  11, 2021
REM ##
REM ## Description:  Stream internet video channels with mpv and youtube-dl
REM ##
REM ## Dependencies: mpv, youtube-dl, 
REM ##
REM ######################################################
REM #################################################################################################################################################################
REM # Instructions:  
REM # make a directory C:\Users\%USERNAME%\bin and copy this file there, 
REM # File automatically adds this directory to the %PATH% . Or you may type in the prompt
REM # SET PATH=C:\Users\%USERNAME%\bin;%PATH%
REM # 
REM # Download mpv.exe from www.mpv.io or https://sourceforge.net/projects/mpv-player-windows/  
REM # and also download youtube-dl.exe from https://yt-dl.org/latest/youtube-dl.exe 
REM # then unpack the 7zip archive with mpv.exe and the dll files into C:\Users\%USERNAME%\bin  
REM # also make sure that youtube-dl.exe and mpv.exe are located in the bin directory
REM # now type winstream in cmd to call the file: 
REM # C:\Users\%USERNNAME%>  winstream
REM # or double click on the batch file which should work as well.  
REM # You may now place a shortcut to the file on your desktop by right clicking on the icon
REM # and selecting "Create Shortcut".
REM # 
REM ##############################################################################################################################################################################
REM #                                         ACKNOWLEDGMENTS
REM #############################################################################################################################################################################
REM #  The Endware Development Team would like to acknowledge the work and efforts of OdiliTime, Balrog and SnakeDude who graciously hosted and promoted this software project. 
REM #  We would also like to acknowledge the work and efforts of Stephen Lynx, the creator and maintainer of LynxChan.  
REM #  Without their efforts and their wonderful web site www.endchan.xyz, The Endware Suite would not exist in the public domain at all in any form. 
REM #
REM #  So thanks to OdiliTime, Balrog, SnakeDude, and Stephen Lynx for inspiring this work and for hosting and promoting it. 
REM #  
REM #  The Endware Suite including Endwall,Endsets,Endlists,Endtools,Endloads and Endtube are named in honor of Endchan.
REM #
REM #  The Endware Suite is available for download at the following locations:
REM #  https://gitgud.io/Endwall/ , https://github.com/endwall2/, https://www.endchan.xyz/os/, http://42xlyaqlurifvvtq.onion,
REM #
REM #  Special thanks to the designer of the current EndWare logo which replaces the previous logo. It looks great!
REM #  Thank you also to early beta testers including a@a, and to other contributors including Joshua Moon (for user_agents.txt split and other good suggestions) 
REM #  as well as to the detractors who helped to critique this work and to ultimately improve it.  
REM #  
REM #  We also acknowledge paste.debian.net, ix.io, gitgud and github for their hosting services, 
REM #  without which distribution would be limited, so thank you.
REM #
REM #  https://www.endchan.xyz, http://paste.debian.net, https://gitgud.io, https://github.com, http://ix.io  
REM #
REM #  We salute you! 
REM #  
REM #  In the end, may it all end well.
REM #
REM #  The Endware Development Team
REM ##############################################################################################################################################################################
REM ##############################################################################################################################################################################
REM #                                                              LICENSE AGREEMENT  
REM ##############################################################################################################################################################################
REM #  BEGINNING OF LICENSE AGREEMENT
REM #  TITLE:  THE ENDWARE END USER LICENSE AGREEMENT (EULA) 
REM #  CREATION DATE: MARCH 19, 2016
REM #  VERSION: 1.18
REM #  VERSION DATE: JUNE 28, 2018
REM #  COPYRIGHT: THE ENDWARE DEVELOPMENT TEAM, 2016-2018
REM #  ALL RIGHTS RESERVED  
REM #    
REM #  WHAT CONSTITUTES "USE"? WHAT IS A "USER"?
REM #  0) a) Use of this program means the ability to study, possess, run, copy, modify, publish, distribute and sell the code as included in all lines of this file,
REM #        in text format or as a binary file constituting this particular program or its compiled binary machine code form, as well as the the performance 
REM #        of these aforementioned actions and activities. 
REM #  0) b) A user of this program is any individual who has been granted use as defined in section 0) a) of the LICENSE AGREEMENT, and is granted to those individuals listed in section 1.
REM #  WHO MAY USE THIS PROGRAM ?
REM #  1) a) This program may be used by any living human being, any person, any corporation, any company, and by any sentient individual with the willingness and ability to do so.
REM #  1) b) This program may be used by any citizen or resident of any country, and by any human being without citizenship or residency.
REM #  1) c) This program may be used by any civilian, military officer, government agent, private citizen, government official, sovereign, monarch, head of state,
REM #        dignitary, ambassador, legislator,congressional representative, member of parliament, senator, judicial official, judge, prosecutor, lawyer, law enforcement officer, 
REM #        police constable, noble, commoner, clergy, laity, and generally all classes and ranks of people, persons, and human beings mentioned and those not mentioned.
REM #  1) d) This program may be used by any human being of any sex or gender, including men, women, or any other sex, or gender not mentioned.       
REM #  1) e) This program may be used by any human being of any affiliation, political viewpoint, political affiliation, religious belief, religious affiliation, and by those of non-belief or non affiliation.
REM #  1) f) This program may be used by any human being of any race, ethnicity, identity, origin, genetic makeup, physical appearance, mental ability, and by those of any other physical 
REM #        or non physical characteristics of differentiation.
REM #  1) g) This program may be used by any human being of any sexual orientation, including heterosexual, homosexual, bisexual, asexual, or any other sexual orientation not mentioned.
REM #  1) h) This program may be used by all business classes and business entities, including corporations, limited liability companies, sole proprietorships, partnerships, joint venture companies, private companies, publicly owned companies, and any other business class not specifically mentioned. 
REM #  1) i) This program may be used by anyone. 
REM #  WHERE MAY A USER USE THIS PROGRAM ?
REM #  2) a) This program may be used in any country, in any geographic location of the planet Earth, in any marine or maritime environment, at sea, sub-sea, in a submarine, underground,
REM #        in the air, in an airplane, dirigible, blimp, or balloon, in a car, bus, motor vehicle, armored transport vehicle, and at any distance from the surface of the planet Earth, including in orbit about the Earth or the Moon,
REM #        on a satellite orbiting about the Earth, the Moon, about any Solar System planet and its moons, on any space transport vehicle, and anywhere in the Solar System including the Moon, Mars, and all other Solar System planets not listed.  
REM #  2) b) This program may be used in any residential, commercial, business, and governmental property or location and in all public and private spaces. 
REM #  2) c) This program may be used anywhere.
REM #  IN WHAT CONTEXT OR CIRCUMSTANCES MAY A USER USE THIS PROGRAM?
REM #  3)  This program may be used by any person, human being or sentient individual for any purpose and in any context and in any setting including for personal use, academic use,
REM #      business use, commercial use, government use, non-governmental organization use, non-profit organization use, military use, civilian use, and generally any other use 
REM #      not specifically mentioned.
REM #  WHAT MAY A "USER" DO WITH THIS PROGRAM ?
REM #  4) Any user of this program is granted the freedom to read and study the code.
REM #  5) a) Any user of this program is granted the freedom to distribute, publish, and share the code with any recipient of their choice electronically or by any other method of transmission. 
REM #  5) b) The LICENCSE AGREEMENT, ACKNOWLEDGMENTS, Header and Instructions must remain attached to the code in their entirety when re-distributed.
REM #  5) c) Any user of this program is granted the freedom to sell this software as distributed or to bundle it with other software or saleable goods.
REM #  6) a) Any user of this program is granted the freedom to modify the code.
REM #  6) b) When modified, any user of this program is granted the freedom of re-distribution of their modified code if and only if the user attatchs the LICENSE AGREEMENT
REM #        in its entirety to their modified code before re-distribution.
REM #  6) c) Any user of this software is granted the freedom to sell their modified copy of this software or to bundle their modified copy with other software or saleable goods.
REM #  6) d) Any modified code shall be sublicensed by the modifier and distributor only under the original terms of the Endware End User License Agreement as presented in this LICENSE AGREEMENT.
REM #  6) e) Any user of this software agrees that any derivative works produced as a result of user modification will be sublicensed when re-distributed under the original terms of this LICENSE AGREEMENT exactly as presented.
REM #  7) a) Any user of this program is granted the freedom to run this code on any computer of their choice.
REM #  7) b) Any user of this program is granted the freedom to run as many simultaneous instances of this code, on as many computers as they are able to and desire, and for as long as they desire and are
REM #        able to do so with any degree of simultaneity in use. 
REM #  WHAT MUST A "USER" NOT DO WITH THIS PROGRAM ?
REM #  8) Any user of this program is not granted the freedom to procure a patent for the methods presented in this software, and agrees not to do so.
REM #  9) Any user of this program is not granted the freedom to arbitrarily procure a copyright on this software as presented, and agrees not to do so.
REM #  10) Any user of this program is not granted the freedom to obtain or retain intellectual property rights on this software as presented and agrees not to do so.
REM #  11) a) Any user of this program may use this software as part of a patented process, as a substitutable input into the process; however the user agrees not to attempt to patent this software as part of their patented process. 
REM #  11) b) This software is a tool, like a hammer, and may be used in a process which applies for and gains a patent, as a substitutable input into the process;
REM #         however the software tool itself may not be included in the patent or covered by the patent as a novel invention, and the user agrees not to do this and not to attempt to do this.
REM #  WHO GRANTS THESE FREEDOMS ?
REM #  12) The creators of this software are the original developer,"Endwall", and anyone listed as being a member of "The Endware Development Team" by "Endwall", as well as ancillary contributors, and user modifiers and developers of the software. 
REM #  13) The aforementioned freedoms of use listed in sections 4),5),6),and 7) are granted by the creators of this software and the Endware Development Team to any qualifying user listed in section 1) and 
REM #      comporting with any restrictions and qualifications mentioned in sections 2), 3), 8), 9), 10) and 11) of this LICENSE AGREEMENT.
REM #  WHAT RELATIONSHIP DO THE USERS HAVE WITH THE CREATORS OF THE SOFTWARE ?
REM #  14)  This software is distributed "AS IS" without any warranty and without any guaranty and the creators do not imply anything about its usefulness or efficacy.
REM #  15)  If the user suffers or sustains financial loss, informational loss, material loss, physical loss or data loss as a result of using, running, or modifying this software 
REM #       the user agrees that they will hold the creators of this software, "The Endware Development Team", "Endwall", and the programmers involved in its creation, free from prosecution, 
REM #       free from indemnity, and free from liability, and will not attempt to seek restitution, compensation, or payment for any such loss real or imagined.
REM #  16)  If a user makes a significant improvement to this software, and if this improvement is included in a release, the user agrees not to seek remuneration or payment 
REM #       from the creators of this software or from Endwall or from the Endware Development Team, for any such work contribution performed, and the user understands 
REM #       that there will be no such remuneration or payment rendered to them for any such contribution. 
REM #  END OF LICENSE AGREEMENT
REM ##################################################################################################################################################################################
REM #  ADDITIONAL NOTES:
REM #  17)  If a user finds a significant flaw or makes a significant improvement to this software, please feel free to notify the original developers so that we may also
REM #       include your user improvement in the next release; users are not obligated to do this, but we would enjoy this courtesy tremendously.
REM #
REM #  18)  Sections 0) a) 0) b) and 1) a) are sufficient for use; however sections 1) b) through 1) i) are presented to clarify 1 a) and to enforce non-discrimination and non-exclusion of use.  
REM #       For example some people may choose to redefine the meaning of the words "person" "human being" or "sentient individual" to exclude certain types of people.
REM #       This would be deemed unacceptable and is specifically rejected by the enumeration presented.  If the wording presented is problematic please contact us and suggest a change,
REM #       and it will be taken into consideration.  
REM #################################################################################################################################################################################

REM ################################### BEGINNING OF PROGRAM ###################################################

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION
SETLOCAL

REM # SET THE PATH
REM SET PATH=C:\Users\%USERNAME%\bin;%PATH%
SET PATH=C:\Users\%USERNAME%\bin;D:\gnuwin32\bin;%PATH%

SET PRODUCT=WINSTREAM
SET BRANCH="WINDOWS NT 6.x"
SET VERSION=0.05050
SET REV_DATE="02/11/2020"
SET MODE="VIDEO"


REM ## SET THE TITLE
TITLE ENDSTREAM %DATE%
REM ## CHANGE THE COLOUR
REM COLOR 1e
COLOR FF
REM cOLOR 07

REM ## Display the current date and time
REM DATE /T
REM TIME /T

set prior_num=1
set chan_num=1
set menu_num=0

set screen_num=0


:MENU_0
CLS
ECHO "============================================ %PRODUCT% %VERSION% ==========================================================================="
ECHO "||=========ENGLISH=========||======ENGLISH II=======||=======FRENCH=======||=======SPANISH======||===EAST EUROPE=====||======EASTERN========"
ECHO "|| 1) France 24 Eng        ||41)QVC UK              ||81)FRANCE 24 FR     ||121)RT ESPANOL      ||161)VAR AZUR       ||201)RT Arabic      ||"
ECHO "|| 2) RT UK                ||42)QVC 1 USA           ||82)BFM TV FR        ||122)DW ESPANOL      ||162)MontBlanc 2    ||202)France24 Arab  ||"
ECHO "|| 3) DW DE                ||43)TSC USA             ||83)BMF BIZ FR       ||123)CGTN ES         ||163)Grenoble       ||203)DW Arabic      ||" 
ECHO "|| 4) RT RU                ||44)QVC 2 USA           ||84)RT FRANCE        ||124)FRANCE 24 ES    ||164)RTL 2          ||204)CCTV Arabic    ||" 
ECHO "|| 5) CBSN USA             ||45)QVC 3               ||85)FranceINFO FR    ||125)HISPAN TV       ||165)OUI FM         ||205)AlJazeera Arab ||"
ECHO "|| 6) Bloomberg USA        ||46)QVC 4               ||86)TV5 Monde Info   ||126)TeleSUR VE      ||166)D24TV          ||206)AlJazeera Docs ||" 
ECHO "|| 7) RT USA               ||47)TWIT                ||87)CGTN FRANCAIS    ||127)----------      ||167)8 Monte Blanc  ||207)AlJazeera Mubas||" 
ECHO "|| 8) Newsy USA            ||48)TVW Washington TV   ||88)AFRICA NEWS      ||128)----------      ||168)TopNews Albania||208)KSA1           ||" 
ECHO "|| 9) ABC USA              ||49)DCN Columbia        ||89)TVA CA           ||129)----------      ||169)-------------  ||209)KSA Sports     ||" 
ECHO "|| 10) Cheddar News        ||50)DCC Columbia        ||90)RDI ICI CA       ||130)----------      ||170)-------------  ||210)BBC Arabic     ||" 
ECHO "|| 11) TRT WORLD TK        ||51)DCKN Columbia       ||91)--------------   ||131)----------      ||171)WDR Germany    ||211)-------------- ||" 
ECHO "|| 12) Al Jazzera          ||52)Southeastern        ||92)FRANCE 2         ||132)----------      ||172)DW DE          ||212)-------------- ||" 
ECHO "|| 13) PRESSTV IR          ||53)Texas State         ||93)FRANCE 3         ||133)--------------  ||173)ZDF InfoKanal  ||213)-------------- ||" 
ECHO "|| 14) India Today         ||54)Temple University   ||94)ARTE Francais    ||134)--------------  ||174)QVC DE         ||214)-------------- ||" 
ECHO "|| 15) CGTN CN             ||55)BronxNET NY         ||95)France O         ||135)--------------  ||175)ADR Alpha DE   ||215)-------------- ||" 
ECHO "|| 16) NHK JP              ||56)BronxNET OMNI       ||96)Azur TV FR       ||136)--------------  ||176)DW + DE        ||216)-------------- ||" 
ECHO "|| 17) Arirang KR          ||57)BronxNET Culture    ||97)BFM TV PARIS     ||137)--------------  ||177)W24 AT         ||217)-------------- ||"  
ECHO "|| 18) CNA SG              ||58)BronxNET Life       ||98)Alsace 20 Fr     ||138)--------------  ||178)Tirol AT       ||218)-------------- ||"
ECHO "|| 19) ABC AU              ||59)CBSN NY             ||99)---------------  ||139)-------------   ||179)SRF CH         ||219)-------------- ||" 
ECHO "|| 20) ARISE NG            ||60)CBSN LA             ||100)LCP FR          ||140)-------------   ||180)-------------- ||220)-------------- ||" 
ECHO "|| 21) TeleSUR ENG VE      ||61)CBSN Bay Area       ||101)Public Senate   ||141)-------------   ||181)AT5 NL         ||221)-------------- ||" 
ECHO "|| 22) CBC NewsNet CA      ||62)CBSN Boston         ||102)CPAC 1 FR CA    ||142)-------------   ||182)Euronews RU    ||222)-------------- ||" 
ECHO "|| 23) NEWSMAX USA         ||63)CBSN Chicago        ||103)ASSEMBLE QUEBEC ||143)-------------   ||183)POCCNR 24 RU   ||223)-------------- ||" 
ECHO "|| 24) FREESPEECH          ||64)CBSN Dallas         ||104)------------    ||144)-------------   ||184)RBC RU         ||224)-------------- ||"
ECHO "|| 25) INFOWARS            ||65)CBSN Denver         ||105)GONG CINEMA     ||145)-------------   ||185)CCTV RU        ||225)-------------- ||"
ECHO "|| 26) Real News           ||66)CBSN Minnesota      ||106)GONG MAX        ||146)-------------   ||186)Vesti FM RU    ||226)-------------- ||" 
ECHO "|| 27) War Room            ||67)CBSN Phillidelphia  ||107)BX1 BE          ||147)-------------   ||187)CurrentTimeVOA ||227)-------------- ||" 
ECHO "|| 28) UN WEB TV           ||68)CBSN Pittsburgh     ||108)--------------  ||148)-------------   ||188)RTR Planeta RU ||228)-------------- ||" 
ECHO "|| 29) VOA USA             ||69)Fox News Talk       ||109)IL TV FRANCE    ||149)-------------   ||189)1 TV RU        ||229)-------------- ||" 
ECHO "|| 30) RT DOCUMENT         ||70)ET India            ||110)FranceInfo Radio||150)-------------   ||190)Music BOX RU   ||230)-------------- ||" 
ECHO "|| 31) CGTN DOCUMENT       ||71)NewsX India         ||111)Europe 1        ||151)-------------   ||191)MOSCKVA 24 RU  ||231)-------------- ||" 
ECHO "|| 32) CBC CA              ||72)NDTV IN             ||112)RTL Radio       ||152)-------------   ||192)POCCNR 1 HD    ||232)-------------- ||" 
ECHO "|| 33) CPAC 1 CA           ||73)NE News IN          ||113)RMC Talk        ||153)-------------   ||193)TV Publica MD  ||233)-------------- ||" 
ECHO "|| 34) AFRICA NEWS         ||74)Times IN            ||114)MB TV           ||154)-------------   ||194)UA TV          ||234)-------------- ||" 
ECHO "|| 35) -------------       ||75)BBC NEWS UK         ||115)Generations TV  ||155)-------------   ||195)SKY 24 IT      ||235)-------------- ||"
ECHO "|| 36) -------------       ||76)Made in Leeds       ||116)Tv Vendée       ||156)-------------   ||196)RSI LA CH      ||236)-------------- ||" 
ECHO "|| 37) -------------       ||77)Made in Tyne        ||117)OUATCH TV       ||157)-------------   ||197)Telecolor IT   ||237)-------------- ||"
ECHO "|| 38) -------------       ||78)Made in Cardiff     ||118)Telesud         ||158)-------------   ||198)Star Lamia GR  ||238)-------------- ||"
ECHO "|| 39) -------------       ||79)-------------       ||119)TV7 Bordeaux    ||159)-------------   ||199)Action 24 GR   ||239)-------------- ||"
ECHO "|| 40) -------------       ||80)-------------       ||120)VL              ||160)-------------   ||200)TRT Haber      ||240)-------------  ||" 
ECHO "=============================================================================================================================================="
PROMPT $LWINSTREAM$G$D$T$$
set /p chan_num="Select a Channel Number, press + or ] to increment, - or [ to decrement,m for main menu, n for next menu, or q to quit:"

echo %chan_num%
GOTO INPUT_SELECT

:MENU_1
CLS
ECHO "============================================ %PRODUCT% %VERSION% ==========================================================================="
ECHO "||=======ENTERTAINMENT======||======CANADA=========||======FRENCH II=====||======FilmOnTV=======||===================||=====RELIGIOUS======="
ECHO "|| 241) Music Choice Play   ||281)CBC Vancouver    ||321)Generations TV  ||361)BBC One         ||401)-------------- ||441)EWTN English   ||"
ECHO "|| 242) M20 Music           ||282)CBC Yellowknife  ||322)Suivez Telesud  ||362)BBC News        ||402)-------------- ||442)EWTN Ireland   ||"
ECHO "|| 243) Radio Monte Carlo   ||283)CBC Edmonton     ||323)VAR AZUR        ||363)BBC 1 Wales     ||403)-------------- ||443)EWTN Africa    ||" 
ECHO "|| 244) V2Beat TV           ||284)CBC Calgary      ||324)VL              ||364)BBC 1 Scotland  ||404)-------------- ||444)EWTN Asia      ||" 
ECHO "|| 245) DanceStart TV       ||285)CBC Regina       ||325)BFM TV          ||365)BBC 1 N Ireland ||405)-------------- ||445)Salt and Light ||"
ECHO "|| 246) Brit Asia TV        ||286)CBC Winnepeg     ||326)8 Mont Blanc 2  ||366)BBC Two         ||406)-------------- ||446)Catholic TV    ||" 
ECHO "|| 247) Hit Music TV        ||287)CBC Windsor      ||327)téléGrenoble    ||367)BBC Parliament  ||407)-------------- ||447)EWTN Espanol   ||" 
ECHO "|| 248) CMC California      ||288)CBC Toronto      ||328)RTL2            ||368)BBC Four        ||408)-------------- ||448)EWTN Deutsche  ||" 
ECHO "|| 249) Country Network     ||289)CBC Ottawa       ||329)OUI FM          ||369)ITV             ||409)-------------  ||449)KTO Catholique ||" 
ECHO "|| 250) Ditty TV            ||290)CBC Montreal     ||330)D24TV           ||370)ITV +1          ||410)-------------  ||450)TRWAM Poland   ||" 
ECHO "|| 251) Rockland Radio      ||291)CBC Frederickton ||331)Canal Savoir    ||371)ITV2            ||411)-------------- ||451)CBN            ||" 
ECHO "|| 252) Classic Arts        ||292)CBC Charlottetown||332)--------------  ||372)ITV2 +1         ||412)-------------- ||452)CBN News       ||" 
ECHO "|| 253) Fashion Europe      ||293)CBC Halifax      ||333)--------------  ||373)ITV3            ||413)-------------- ||453)IHOP           ||" 
ECHO "|| 254) Red Bull TV         ||294)CBC St. John's   ||334)--------------  ||374)ITV3 +1         ||414)-------------- ||454)LLBN His Word  ||" 
ECHO "|| 255) MLB Network         ||295)GLOBAL Vancouver ||335)--------------  ||375)ITV4            ||415)-------------- ||455)LLBN Smart Life||" 
ECHO "|| 256) 11 Sports Next      ||296)GLOBAL Calgary   ||336)--------------  ||376)ITV4 +1         ||416)-------------- ||456)LLBN His Light ||" 
ECHO "|| 257) Adult Swim          ||297)GLOBAL Edmonton  ||337)--------------  ||377)ITV Be          ||417)-------------- ||457)-------------- ||"  
ECHO "|| 258) Geek and Sundry     ||298)GLOBAL Toronto   ||338)--------------  ||378)Channel 4       ||418)-------------- ||458)-------------- ||"
ECHO "|| 259) Con TV              ||299)GLOBAL Halifax   ||339)--------------  ||379)E4              ||419)-------------- ||459)-------------- ||" 
ECHO "|| 260) Shout Factory       ||300)TELEQUEBEC CA    ||340)--------------  ||380)More4           ||420)-------------- ||460)-------------- ||" 
ECHO "|| 261) Retro TV            ||301)ICI CB-Yukon CA  ||341)--------------  ||381)Channel 5       ||421)-------------- ||461)-------------- ||" 
ECHO "|| 262) Robot Chicken       ||302)ICI Alberta CA   ||342)--------------  ||382)5*              ||422)-------------- ||462)-------------- ||" 
ECHO "|| 263) All Key Shop        ||303)ICI Saskatchewan ||343)--------------  ||383)5USA            ||423)-------------- ||463)-------------- ||" 
ECHO "|| 264) Amouranth           ||304)ICI Manitoba     ||344)--------------  ||384)Really          ||424)-------------- ||464)-------------- ||"
ECHO "|| 265) ET Live             ||305)ICI Ontario      ||345)--------------  ||385)Yesterday       ||425)-------------- ||465)-------------- ||"
ECHO "|| 266) BYUTV               ||306)ICI Ottawa       ||346)--------------  ||386)Pick TV         ||426)-------------- ||466)-------------- ||" 
ECHO "|| 267) TYT                 ||307)ICI Acadie       ||347)--------------  ||387)CBS Reality     ||427)-------------- ||467)-------------- ||" 
ECHO "|| 268) Skynyx              ||308)ICI Estrie       ||348)--------------  ||388)CBS Reality+1   ||428)-------------- ||468)-------------- ||" 
ECHO "|| 269) cristinascabbia     ||309)ICI Montreal     ||349)--------------  ||389)CBS Drama       ||429)-------------- ||469)-------------- ||" 
ECHO "|| 270) --------------      ||310)ICI Maurice      ||350)--------------  ||390)CBS Action      ||430)-------------- ||470)-------------- ||" 
ECHO "|| 271) --------------      ||311)ICI Sagueney     ||351)--------------  ||391)truTV           ||431)-------------- ||471)-------------- ||" 
ECHO "|| 272) --------------      ||312)ICI Quebec       ||352)--------------  ||392)FusionPlus TV   ||432)-------------- ||472)-------------  ||" 
ECHO "|| 273) --------------      ||313)ICI Est-Quebec CA||353)--------------  ||393)Forces TV       ||433)-------------- ||473)-------------  ||" 
ECHO "|| 274) --------------      ||314)CBCNews Montreal ||354)--------------  ||394)Challenge       ||434)-------------- ||474)-------------  ||" 
ECHO "|| 275) --------------      ||315)JUPITER BROAD    ||355)--------------  ||395)Pick TV         ||435)-------------- ||475)-------------  ||"
ECHO "|| 276) --------------      ||316)--------------   ||356)--------------  ||396)V Channel       ||436)-------------- ||476)-------------  ||" 
ECHO "|| 277) --------------      ||317)--------------   ||357)--------------  ||397)Really TV       ||437)-------------- ||477)-------------  ||"
ECHO "|| 278) --------------      ||318)--------------   ||358)--------------  ||398)My Face My Body ||438)-------------- ||478)-------------  ||"
ECHO "|| 279) --------------      ||319)--------------   ||359)--------------  ||399)Dr. Fab Show    ||439)-------------- ||479)-------------  ||"
ECHO "|| 280)--------------       ||320)--------------   ||360)--------------  ||400)-------------   ||440)-------------- ||480)-------------  ||" 
ECHO "=============================================================================================================================================="
PROMPT $LWINSTREAM$G$D$T$$
set /p chan_num="Select a Channel Number, press + or ] to increment, - or [ to decrement,m for main menu, n for next menu,or q to quit:"

echo %chan_num%
GOTO INPUT_SELECT

:MENU_2
CLS
ECHO "============================================ %PRODUCT% %VERSION% ==========================================================================="
ECHO "||=========================||=====================||===================||====================||===================||====================="
ECHO "|| 481) --------------      ||521)--------------  ||561)-------------- ||601)--------------  ||641)-------------- ||681)-------------- ||"
ECHO "|| 482) --------------      ||522)--------------  ||562)-------------- ||602)--------------  ||642)-------------- ||682)-------------- ||"
ECHO "|| 483) --------------      ||523)--------------  ||563)-------------- ||603)--------------  ||643)-------------- ||683)-------------- ||" 
ECHO "|| 484) --------------      ||524)--------------  ||564)-------------- ||604)--------------  ||644)-------------- ||684)-------------- ||" 
ECHO "|| 485) --------------      ||525)--------------  ||565)-------------- ||605)--------------  ||645)-------------- ||685)-------------- ||"
ECHO "|| 486) --------------      ||526)--------------  ||566)-------------- ||606)--------------  ||646)-------------- ||686)-------------- ||" 
ECHO "|| 487) --------------      ||527)--------------  ||567)-------------- ||607)--------------  ||647)-------------- ||687)-------------- ||" 
ECHO "|| 488) --------------      ||528)--------------  ||568)-------------- ||608)--------------  ||648)-------------- ||688)-------------- ||" 
ECHO "|| 489) --------------      ||529)--------------  ||569)-------------- ||609)--------------  ||649)-------------  ||689)-------------- ||" 
ECHO "|| 490) --------------      ||530)--------------  ||570)-------------- ||610)--------------  ||650)-------------  ||690)-------------- ||" 
ECHO "|| 491) --------------      ||531)--------------  ||571)-------------- ||611)--------------  ||651)-------------- ||691)-------------- ||" 
ECHO "|| 492) --------------      ||532)--------------  ||572)-------------- ||612)--------------  ||652)-------------- ||692)-------------- ||" 
ECHO "|| 493) --------------      ||533)--------------  ||573)-------------- ||613)--------------  ||653)-------------- ||693)-------------- ||" 
ECHO "|| 494) --------------      ||534)--------------  ||574)-------------- ||614)--------------  ||654)-------------- ||694)-------------- ||" 
ECHO "|| 495) --------------      ||535)--------------  ||575)-------------- ||615)--------------  ||655)-------------- ||695)-------------- ||" 
ECHO "|| 496) --------------      ||536)--------------  ||576)-------------- ||616)--------------  ||656)-------------- ||696)-------------- ||" 
ECHO "|| 497) --------------      ||537)--------------  ||577)-------------- ||617)--------------  ||657)-------------- ||697)-------------- ||"  
ECHO "|| 498) --------------      ||538)--------------  ||578)-------------- ||618)--------------  ||658)-------------- ||698)-------------- ||"
ECHO "|| 499) --------------      ||539)--------------  ||579)-------------- ||619)-------------   ||659)-------------- ||699)-------------- ||" 
ECHO "|| 500) --------------      ||540)--------------  ||580)-------------- ||620)-------------   ||660)-------------- ||700)-------------- ||" 
ECHO "|| 501) --------------      ||541)--------------  ||581)-------------- ||621)-------------   ||661)-------------- ||701)-------------- ||" 
ECHO "|| 502) --------------      ||542)--------------  ||582)-------------- ||622)-------------   ||662)-------------- ||702)-------------- ||" 
ECHO "|| 503) --------------      ||543)--------------  ||583)-------------- ||623)-------------   ||663)-------------- ||703)-------------- ||" 
ECHO "|| 504) --------------      ||544)--------------  ||584)-------------- ||624)-------------   ||664)-------------- ||704)-------------- ||"
ECHO "|| 505) --------------      ||545)--------------  ||585)-------------- ||625)-------------   ||665)-------------- ||705)-------------- ||"
ECHO "|| 506) --------------      ||546)--------------  ||586)-------------- ||626)-------------   ||666)-------------- ||706)-------------- ||" 
ECHO "|| 507) --------------      ||547)--------------  ||587)-------------- ||627)-------------   ||667)-------------- ||707)-------------- ||" 
ECHO "|| 508) --------------      ||548)--------------  ||588)-------------- ||628)-------------   ||668)-------------- ||708)-------------- ||" 
ECHO "|| 509) --------------      ||549)--------------  ||589)-------------- ||629)-------------   ||669)-------------- ||709)-------------- ||" 
ECHO "|| 510) --------------      ||550)--------------  ||590)-------------- ||630)-------------   ||660)-------------- ||710)-------------- ||" 
ECHO "|| 511) --------------      ||551)--------------  ||591)-------------- ||631)-------------   ||671)-------------- ||711)-------------- ||" 
ECHO "|| 512) --------------      ||552)--------------  ||592)-------------- ||632)-------------   ||672)-------------- ||712)-------------  ||" 
ECHO "|| 513) --------------      ||553)--------------  ||593)-------------- ||633)-------------   ||673)-------------- ||713)-------------  ||" 
ECHO "|| 514) --------------      ||554)--------------  ||594)-------------- ||634)-------------   ||674)-------------- ||714)-------------  ||" 
ECHO "|| 515) --------------      ||555)--------------  ||595)-------------- ||635)-------------   ||675)-------------- ||715)-------------  ||"
ECHO "|| 516) --------------      ||556)--------------  ||596)-------------- ||636)-------------   ||676)-------------- ||716)-------------  ||" 
ECHO "|| 517) --------------      ||557)--------------  ||597)-------------- ||637)-------------   ||677)-------------- ||717)-------------  ||"
ECHO "|| 518) --------------      ||558)--------------  ||598)-------------- ||638)-------------   ||678)-------------- ||718)-------------  ||"
ECHO "|| 519) --------------      ||559)--------------  ||599)-------------- ||639)-------------   ||679)-------------- ||719)-------------  ||"
ECHO "|| 520)--------------       ||560)--------------  ||600)-------------- ||640)-------------   ||680)-------------- ||720)-------------  ||" 
ECHO "=============================================================================================================================================="
PROMPT $LWINSTREAM$G$D$T$$
set /p chan_num="Select a Channel Number, press + or ] to increment, - or [ to decrement, m for main menu, n for next menu, or q to quit:"

echo %chan_num%
GOTO INPUT_SELECT

:INPUT_SELECT
IF "%chan_num%"=="1" ( 
set /A chan_num="%chan_num%"
GOTO CHAN_1 
) ELSE IF "%chan_num%"=="q" ( 
GOTO END_OF_PROGRAM 
) ELSE IF "%chan_num%"=="+" ( 
set /A chan_num=!prior_num!+1 
GOTO CHAN_!chan_num!
) ELSE IF "%chan_num%"=="n" ( 
chan_num=!prior_num%!
GOTO MENU_SELECT
) ELSE IF "%chan_num%"=="m" ( 
chan_num=!prior_num!
GOTO MENU_SELECT
) ELSE IF "%chan_num%"=="-" ( 
set /A chan_num=!prior_num!-1
GOTO CHAN_!chan_num!
) ELSE IF "%chan_num%"=="]" ( 
set /A chan_num=!prior_num!+1 
GOTO CHAN_!chan_num!
) ELSE IF "%chan_num%"=="[" ( 
set /A chan_num=!prior_num!-1
GOTO CHAN_!chan_num!  
) ELSE IF "%chan_num%" LSS "1" ( 
set /A chan_num="1"
GOTO CHAN_!chan_num!
) ELSE IF "%chan_num%" GTR "1" ( 
set /A chan_num="%chan_num%"
GOTO CHAN_!chan_num! 
) ELSE IF "%chan_num%"=="--audio" ( 
set MODE="AUDIO"
GOTO MENU_SELECT
) ELSE IF "%chan_num%"=="--no-video" ( 
set MODE="AUDIO"
GOTO MENU_!menu_num!
) ELSE IF "%chan_num%"=="--no-audio" ( 
set MODE="NOAUDIO"
GOTO MENU_!menu_num!
) ELSE IF "%chan_num%"=="--video" ( 
set MODE="VIDEO"
GOTO MENU_!menu_num!
) ELSE (
GOTO MENU_!menu_num!
)

:MENU_SELECT
IF "%chan_num%"=="m" ( 
set /A menu_num=0
GOTO MENU_!menu_num!
) ELSE IF "%chan_num%"=="n" (
  IF "%menu_num%"=="2" ( 
  set /A menu_num=0
  )ELSE (
  set /A menu_num=!menu_num!+1
  )
GOTO MENU_!menu_num!
ELSE (
GOTO MENU_!menu_num!
)


REM #############################  CHANNELS ########################################


:CHAN_0

REM set link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=673025,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/05.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1081720,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=720x576
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/04.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2512155,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/03.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5270851,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080
set link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/01.m3u8"

set chan_name="France 24"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_1

REM set link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=673025,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/05.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1081720,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=720x576
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/04.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2512155,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720
REM link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/03.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5270851,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080
set link="http://f24hls-i.akamaihd.net/hls/live/221147/F24_EN_HI_HLS/01.m3u8"
set chan_name="France 24"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_2
REM set link=https://www.rt.com/on-air/rt-uk-air/ 
REM set link="https://rt-uk.secure.footprint.net/1106.m3u8"
set link="https://rt-uk.secure.footprint.net/1106_2500Kb.m3u8"
REM set link="https://rt-uk.secure.footprint.net/1106_1600Kb.m3u8"
REM set link="https://rt-uk.secure.footprint.net/1106_800Kb.m3u8"
REM set link="https://rt-uk.secure.footprint.net/1106_400Kb.m3u8"
REM set link="https://rt-uk.secure.footprint.net/1106_64Kb.m3u8"
set chan_name="RT UK" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_3
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_5_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_5_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_4_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_3_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_1_av-b.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_5_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream4-lh.akamaihd.net/i/dwstream4_live@131329/index_5_a-b.m3u8?sd=10&rebase=on"
REM set link="https://dwstream1-lh.akamaihd.net/i/dwstream1_live@120422/master.m3u8"

set chan_name="Deutsche Welle English DE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_4
REM set link=https://rt-news.secure.footprint.net/1103.m3u8
set link="https://rt-news.secure.footprint.net/1103_2500Kb.m3u8"
REM set link="https://rt-news.secure.footprint.net/1103_1600Kb.m3u8"
REM set link="https://rt-news.secure.footprint.net/1103_800Kb.m3u8"
REM set link="https://rt-news.secure.footprint.net/1103_400Kb.m3u8"
REM set link="https://rt-news.secure.footprint.net/1103_64Kb.m3u8"
set chan_name="RT RUSSIA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_5
REM set link=https://www.cbsnews.com/common/video/dai_prod.m3u8
set link="https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8"
REM for /f "tokens=*" %%a in ( 'curl -L "https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8" ^| grep 1689600.m3u8 ^| tail -n 1' ) do set link=%%a
REM set link="https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8"
REM BANDWIDTHS: 3009600 2481600 1689600 1029600 580800 264000 
REM set link="https://cbsnewshd-lh.akamaihd.net/i/CBSNHD_7@199302/master.m3u8"

set chan_name="CBSN" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_6
set link="https://liveproduseast.akamaized.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8"
set chan_name="Bloomberg USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_7

REM set link="https://rt-usa.secure.footprint.net/1105.m3u8"
set link="https://rt-usa.secure.footprint.net/1105_2500Kb.m3u8"
REM set link="https://rt-usa.secure.footprint.net/1105_1600Kb.m3u8"
REM set link="https://rt-usa.secure.footprint.net/1105_800Kb.m3u8"
REM set link="https://rt-usa.secure.footprint.net/1105_400Kb.m3u8"
REM set link="https://rt-usa.secure.footprint.net/1105_64Kb.m3u8"

set chan_name="RT USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_8
set link="https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"
REM for /f "tokens=*" %%a in ( 'curl -L "https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8" ^| grep f.m3u8 ^| tail -n 1' ) do set link=%%a

set chan_name="NEWSY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_9
set link="https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8"
REM for /f "tokens=*" %%a in ( 'curl -L "https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8" ^| grep f.m3u8 ^| tail -n 1' ) do set link=%%a
set chan_name="ABC USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_10
REM set link="https://live.chdrstatic.com/cbn/index.m3u8"
REM set link="https://live.chdrstatic.com/cbn/primary/index.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=5341484,AVERAGE-BANDWIDTH=5341484,CODECS="avc1.4d4028,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1920x1080
REM set link="https://live.chdrstatic.com/cbn/primary/1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3297996,AVERAGE-BANDWIDTH=3297996,CODECS="avc1.4d401f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1280x720
REM set link="https://live.chdrstatic.com/cbn/primary/2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2276268,AVERAGE-BANDWIDTH=2276268,CODECS="avc1.4d401f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=960x540
REM set link="https://live.chdrstatic.com/cbn/primary/3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1356684,AVERAGE-BANDWIDTH=1356684,CODECS="avc1.4d401e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=768x432
REM set link="https://live.chdrstatic.com/cbn/primary/4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=945948,AVERAGE-BANDWIDTH=945948,CODECS="avc1.4d401e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=640x360
REM set link="https://live.chdrstatic.com/cbn/primary/5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=573012,AVERAGE-BANDWIDTH=573012,CODECS="avc1.4d4015,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=480x270
REM set link="https://live.chdrstatic.com/cbn/primary/6.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=404428,AVERAGE-BANDWIDTH=404428,CODECS="avc1.4d400d,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=416x234
REM set link="https://live.chdrstatic.com/cbn/primary/7.m3u8"

REM ##################### ALTERNATE STREAM 
REM set link="https://live.chdrstatic.com/cheddar/index.m3u8"
REM set link="https://live.chdrstatic.com/cheddar/primary/index.m3u8"

REM $EXT-X-STREAM-INF:BANDWIDTH=5341484,AVERAGE-BANDWIDTH=5341484,CODECS="avc1.4d4028,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1920x1080,FRAME-RATE=29.970
set link="https://live.chdrstatic.com/cheddar/primary/1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3297996,AVERAGE-BANDWIDTH=3297996,CODECS="avc1.4d401f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1280x720,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2276268,AVERAGE-BANDWIDTH=2276268,CODECS="avc1.4d401f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=960x540,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1356684,AVERAGE-BANDWIDTH=1356684,CODECS="avc1.4d401e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=768x432,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=978652,AVERAGE-BANDWIDTH=978652,CODECS="avc1.4d401e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=640x360,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=573012,AVERAGE-BANDWIDTH=573012,CODECS="avc1.4d4015,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=480x270,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/6.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=380916,AVERAGE-BANDWIDTH=380916,CODECS="avc1.4d400d,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=416x234,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/7.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=348212,AVERAGE-BANDWIDTH=348212,CODECS="avc1.4d400d,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=416x234,FRAME-RATE=29.970
REM set link="https://live.chdrstatic.com/cheddar/primary/8.m3u8"

set chan_name="Cheddar News"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_11
REM set link="https://tv-trtworld.live.trt.com.tr/master.m3u8"
REM set link="https://tv-trtworld.live.trt.com.tr/master_1080.m3u8"
set link="https://tv-trtworld.live.trt.com.tr/master_720.m3u8"
REM set link="https://tv-trtworld.live.trt.com.tr/master_480.m3u8"
REM set link="https://tv-trtworld.live.trt.com.tr/master_360.m3u8"

set chan_name="TRT WORLD" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_12

REM set link="https://live-hls-web-aje.getaj.net/AJE/index.m3u8"
REM set link="https://live-hls-web-aje.getaj.net/AJE/01.m3u8"
set link="https://live-hls-web-aje.getaj.net/AJE/02.m3u8"
REM set link="https://live-hls-web-aje.getaj.net/AJE/03.m3u8"
REM set link="https://live-hls-web-aje.getaj.net/AJE/04.m3u8"

REM set link="https://players.brightcove.net/665003303001/SkrZHHcl_default/index.html?videoId=4865263685001"
REM set link="https://players.brightcove.net/665003303001/SkrZHHcl_default/index.html?videoId=4865263685001"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index4147.m3u8"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index2073.m3u8"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index1296.m3u8"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index783.m3u8"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index576.m3u8"
REM set link="https://english.streaming.aljazeera.net/aljazeera/english2/index255.m3u8"

REM ##############################
REM set link="http://aljazeera-eng-apple-live.adaptive.level3.net/apple/aljazeera/english/160audio.m3u8"
REM set link="http://aljazeera-eng-apple-live.adaptive.level3.net/apple/aljazeera/english/800.m3u8"


set chan_name="Al Jazzera" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_13
REM set link=https://www.filmon.com/tv/press-tv

REM set link="https://live.presstv.ir/liveprs/smil:liveprs.smil/playlist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=344100,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=426x240
REM set link="https://live.presstv.ir/liveprs/smil:liveprs.smil/chunklist_w1365570665_b344100_slen.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=394100,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360
REM set link="https://live.presstv.ir/liveprs/smil:liveprs.smil/chunklist_w1365570665_b394100_slen.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644100,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=854x480
REM set link="https://live.presstv.ir/liveprs/smil:liveprs.smil/chunklist_w1365570665_b644100_slen.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=944100,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720
set link="https://live.presstv.ir/liveprs/smil:liveprs.smil/chunklist_w1365570665_b944100_slen.m3u8"

set chan_name="PRESS TV IRAN" 
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_14
REM for /f "tokens=*" %%a in ( 'curl -L "https://player-api.new.livestream.com/accounts/11965022/events/4086327/" ^| grep "secure_play_url" ^| cut -d ] -f 7 ^| cut -d ? -f 2 ^| cut -d : -f 3' ) do set link=https:%%a
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/playlist.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=255178,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_1/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=255178,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/indiatoday_1/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343162,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=416x234
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_2/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343162,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=416x234
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/indiatoday_2/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=661008,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=640x360
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_3/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=661008,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=640x360
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/indiatoday_3/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=814666,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=720x404
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_4/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=814666,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=720x404
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/indiatoday_4/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1442805,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720
set link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_5/chunklist.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1442805,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720
REM set link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/indiatoday_5/chunklist.m3u8"

echo !link!
set chan_name="India Today"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_15
REM set link="https://live.cgtn.com/manifest.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,NAME="720p HD"
set link="https://live.cgtn.com/1000/prog_index.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=2,BANDWIDTH=564000,NAME="360p SD"
REM set link="https://live.cgtn.com/500/prog_index.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=3,BANDWIDTH=192000,NAME="180p 3G"
REM set link="https://live.cgtn.com/200/prog_index.m3u8"
REM set link="https://www.filmon.com/tv/cctv-news"
REM set link="https://api.new.livestream.com/accounts/7082210/events/7115682/live.m3u8?BANDWIDTH=1756000"

set chan_name="CGTN Beijing" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_16

REM set link="https://nhkworld.webcdn.stream.ne.jp/www11/nhkworld-tv/global/2003458/live.m3u8"

set link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_2M.m3u8"
REM set link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_2M.m3u8"
REM set link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_1M.m3u8"
REM set link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_1M.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=1086734,AVERAGE-BANDWIDTH=1240800,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=1280x720,FRAME-RATE=29.970
REM set link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_1M.m3u8"
REM set EXT-X-STREAM-INF:BANDWIDTH=1086734,AVERAGE-BANDWIDTH=1240800,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=1280x720,FRAME-RATE=29.970
REM set link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_1M.m3u8"

REM set #EXT-X-STREAM-INF:BANDWIDTH=708360,AVERAGE-BANDWIDTH=800800,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=640x360,FRAME-RATE=29.970
REM set link=https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_600k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=708360,AVERAGE-BANDWIDTH=800800,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=640x360,FRAME-RATE=29.970
REM set link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_600k.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=294786,AVERAGE-BANDWIDTH=325600,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=320x180,FRAME-RATE=29.970
REM link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_200k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=294786,AVERAGE-BANDWIDTH=325600,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=320x180,FRAME-RATE=29.970
REM set link-="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_200k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=70400,CODECS="mp4a.40.5"
REM set link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_audio.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=70400,CODECS="mp4a.40.5"
REM set link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_audio.m3u8"

set chan_name="NHK WORLD" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_17
REM http://vietcago.net/vstv/arirang.m3u8
REM set link="https://amdlive.ctnd.com.edgesuite.net/arirang_1ch/smil:arirang_1ch.smil/playlist.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=3256000,RESOLUTION=1920x1080
set link="https://amdlive.ctnd.com.edgesuite.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b3256000_sleng.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=2256000,RESOLUTION=1280x720
REM set link="https://amdlive.ctnd.com.edgesuite.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b2256000_sleng.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=1256000,RESOLUTION=960x540
REM set link="https://amdlive.ctnd.com.edgesuite.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b1256000_sleng.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=656000,RESOLUTION=640x360
REM set link="https://amdlive.ctnd.com.edgesuite.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b656000_sleng.m3u8"
set chan_name="Arirang South Korea"
set /A prior_num="%chan_num%"
REM goto MENU_!menu_num!
goto PLAY_CASE

:CHAN_18
REM set link="https://drsh196ivjwe8.cloudfront.net/hls/cnai/03.m3u8"
REM set link="https://drsh196ivjwe8.cloudfront.net/hls/cnai/02.m3u8"
REM set link="https://drsh196ivjwe8.cloudfront.net/hls/cnai/01.m3u8"

REM set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=670208,AVERAGE-BANDWIDTH=563200,RESOLUTION=480x270,FRAME-RATE=25.000,CODECS="avc1.4D4015,mp4a.40.2"
REM set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_1.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1120768,AVERAGE-BANDWIDTH=915200,RESOLUTION=640x360,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_2.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1931776,AVERAGE-BANDWIDTH=1548800,RESOLUTION=854x480,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_3.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=4026880,AVERAGE-BANDWIDTH=3185600,RESOLUTION=1280x720,FRAME-RATE=25.000,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_4.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=6420449,AVERAGE-BANDWIDTH=5055564,RESOLUTION=1920x1080,FRAME-RATE=25.000,CODECS="avc1.4D4028,mp4a.40.2"
set link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_5.m3u8"

set chan_name="Channel News Asisa Singapore" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_19

set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=1910176,AVERAGE-BANDWIDTH=1825989,RESOLUTION=1024x576,FRAME-RATE=25.000,CODECS="avc1.4D401F,mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_21.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1323537,AVERAGE-BANDWIDTH=1276024,RESOLUTION=800x450,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_22.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=993810,AVERAGE-BANDWIDTH=966897,RESOLUTION=640x360,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_24.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=736841,AVERAGE-BANDWIDTH=725989,RESOLUTION=512x288,FRAME-RATE=25.000,CODECS="avc1.4D4015,mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_25.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=400389,AVERAGE-BANDWIDTH=400389,RESOLUTION=320x180,FRAME-RATE=25.000,CODECS="avc1.4D400C,mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_23.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=140824,AVERAGE-BANDWIDTH=140824,CODECS="mp4a.40.2",SUBTITLES="subtitles"
REM set link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/6e1cc6d25ec0480ea099a5399d73bc4b/index_6.m3u8"
REM #EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subtitles",NAME="English",DEFAULT=YES,AUTOSELECT=YES,FORCED=NO,LANGUAGE="eng",URI="index_7_0.m3u8"

set chan_name="ABC Australia" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_20
REM set link="http://contributionstreams.ashttp9.visionip.tv/live/visiontv-contributionstreams-arise-tv-hsslive-25f-16x9-SD/chunklist.m3u8"
set link="https://contributionstreams.sechls01.visionip.tv/live/visiontv-contributionstreams-arise-tv-25f-16x9-SD/chunklist.m3u8"
set chan_name="ARISE NEWS NIGERIA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_21
set link=https://d7g1ebft2592.cloudfront.net/mblivev3/hd/playlist.m3u8
REM set link=https://d7g1ebft2592.cloudfront.net/mblivev3/480p/playlist.m3u8
REM set link=https://d7g1ebft2592.cloudfront.net/mblivev3/360p/playlist.m3u8
set chan_name="TeleSUR English Veneuzula" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_22
REM set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master6.m3u8"
set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master5.m3u8"
REM set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master4.m3u8"
REM set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master3.m3u8"
REM set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master2.m3u8"
REM set link="https://livecbcdai-i.akamaihd.net/hls/live/567245/event2/CBCNN/master1.m3u8"
set chan_name="CBC News Network"
set /A prior_num="%chan_num%"
goto PLAY_CASE



:CHAN_23
REM set link="http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/a.m3u8"
REM set link="http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_720.m3u8"
REM set link="http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_480.m3u8"
REM set link="http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_360.m3u8"
set link="https://nmxlive.akamaized.net/hls/live/529965/Live_1/index.m3u8"
set chan_name="NEWS MAX" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_24
REM set link="https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1692100,RESOLUTION=848x480,CODECS="avc1.4D401F,mp4a.40.5"
set link="https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1191846,RESOLUTION=640x360,CODECS="avc1.4D401F,mp4a.40.5"
REM set link="https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=791856,RESOLUTION=512x288,CODECS="avc1.42C01E,mp4a.40.5"
REM set link="https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=191727,CODECS="mp4a.40.5"
REM set link="https://edge.free-speech-tv-live.top.comcast.net/out/u/fstv_6.m3u8"

set chan_name="FREE SPEECH TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_25

REM set link="https://freespeech.akamaized.net/hls/live/2016712-b/live2/playlist.m3u8"
REM set link="https://freespeech.akamaized.net/hls/live/2016712/live2/playlist.m3u8"
set link="https://freespeech.akamaized.net/hls/live/2016712/live1/playlist.m3u8"

set chan_name="INFOWARS" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_26

set link="https://freespeech.akamaized.net/hls/live/2016873-b/live4/playlist.m3u8"
REM set link="https://freespeech.akamaized.net/hls/live/2016873/live4/playlist.m3u8"

set chan_name="Infowars Real News Infostream 2"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_27

REM set link="https://freespeech.akamaized.net/hls/live/2016873-b/live3/playlist.m3u8"
set link="https://freespeech.akamaized.net/hls/live/2016873/live3/playlist.m3u8"

set chan_name="Infowars WarRoom Infostream 3"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_28

set link="https://cdnapisec.kaltura.com/p/2503451/sp/250345100/playManifest/entryId/1_gb6tjmle/format/applehttp/protocol/https/uiConfId/43914941/a.m3u8"

set chan_name="United Nations TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE 

:CHAN_29
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/master.m3u8"

REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=613000,RESOLUTION=426x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0240_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=613000,RESOLUTION=426x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0240_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0360_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0360_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1589000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0480_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1589000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0480_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2859000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0720_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2859000,RESOLUTION=1280x720,CODECS="avc1.640029, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_0720_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5789000,RESOLUTION=1920x1080,CODECS="avc1.640028, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_1080_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5789000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/index_1080_av-b.m3u8?sd=10&rebase=on"

REM set link=https://www.filmon.com/tv/voa-english

set chan_name="VOA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_30
REM set link="https://rtd.rt.com/on-air/"

REM link=https://rt-doc.secure.footprint.net/1101.m3u8
set link=https://rt-doc.secure.footprint.net/1101_2500Kb.m3u8
REM link=https://rt-doc.secure.footprint.net/1101_1600Kb.m3u8
REM link=https://rt-doc.secure.footprint.net/1101_800Kb.m3u8
REM link=https://rt-doc.secure.footprint.net/1101_400Kb.m3u8
REM #link=https://rt-doc.secure.footprint.net/1101_64Kb.m3u8

set chan_name="RT DOCUMENTARY" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_31
REM set link="https://live.cgtn.com/cctv-d.m3u8" 
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,RESOLUTION=1280x720,NAME="720p HD"
set link=https://livedoc.cgtn.com/1000d/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=640x360,NAME="360p SD"
REM set link=https://livedoc.cgtn.com/500d/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=320x180,NAME="180p 3G"
REM set link=https://livedoc.cgtn.com/200d/prog_index.m3u8

set chan_name="CGTN DOCUMENTARY" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_32
set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master5.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master4.m3u8"
REM set 41
link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master3.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master2.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master1.m3u8"
REM set link="http://cbcnewshd-f.akamaihd.net/i/cbcnews_1@8981/index_2500_av-p.m3u8"
set chan_name="CBC CANADA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_33

set link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/.m3u8"
REM #AUDIO groups
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",LANGUAGE="en",NAME="English",DEFAULT=YES,AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_0_0_eng=96000.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",LANGUAGE="fr",NAME="French",AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_1_1_fre=96000.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",NAME="audio_track_2_2_und",AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_2_2_und=96000.m3u8"

REM # CLOSED-CAPTIONS groups
REM #EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="textstream",NAME="textstream",DEFAULT=YES,AUTOSELECT=YES,INSTREAM-ID="CC1"

REM # variants
REM #EXT-X-STREAM-INF:BANDWIDTH=807000,AVERAGE-BANDWIDTH=733000,CODECS="mp4a.40.2,avc1.4D401E",RESOLUTION=640x360,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
REM set link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=600000.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1740000,AVERAGE-BANDWIDTH=1581000,CODECS="mp4a.40.2,avc1.4D401F",RESOLUTION=960x540,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
REM set link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=1400000.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2906000,AVERAGE-BANDWIDTH=2641000,CODECS="mp4a.40.2,avc1.4D401F",RESOLUTION=1280x720,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
REM set link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=2400000.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=6404000,AVERAGE-BANDWIDTH=5821000,CODECS="mp4a.40.2,avc1.4D4028",RESOLUTION=1920x1080,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
REM set link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=5400000.m3u8"

REM # keyframes
REM #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=88000,CODECS="avc1.4D401E",RESOLUTION=640x360,URI="keyframes/live-video_track=600000.m3u8"REM 
REM #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=205000,CODECS="avc1.4D401F",RESOLUTION=960x540,URI="keyframes/live-video_track=1400000.m3u8"R
REM #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=350000,CODECS="avc1.4D401F",RESOLUTION=1280x720,URI="keyframes/live-video_track=2400000.m3u8"
REM #EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=788000,CODECS="avc1.4D4028",RESOLUTION=1920x1080,URI="keyframes/live-video_track=5400000.m3u8"


set chan_name="CPAC 1 CANADA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_34

REM "https://www.africanews.com/api/watchlive.json" |
set link="https://www.dailymotion.com/video/x6i7vf8"
set chan_name="Africa News" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_35
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_36
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_37
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_38
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_39
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_40
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!


REM ###########################  ENGLISH II  #########################################

:CHAN_41
set link="https://d1txbbj1u9asam.cloudfront.net/live/qvcuk_main_clean/bitrate1.isml/3/prog_index.m3u8"
REM set link="https://d1txbbj1u9asam.cloudfont.net/live/qvcuk_main_clean/bitrate2.isml/3/prog_index.m3u8"
REM set link="https://d1txbbj1u9asam.cloudfont.net/live/qvcuk_main_clean/bitrate3.isml/3/prog_index.m3u8"
set chan_name="QVC UK" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_42

REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/master.m3u8"

REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=354000,RESOLUTION=480x270,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=354000,RESOLUTION=480x270,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=678000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=678000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_1000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_1000_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1687000,RESOLUTION=960x540,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_1600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1687000,RESOLUTION=960x540,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_1600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2566000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_2500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2566000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_2500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=62000,CODECS="mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_300_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=62000,CODECS="mp4a.40.2"
REM set link="https://lsqvc1uscln-lh.akamaihd.net/i/lsqvc1uscln_01@809410/index_300_a-b.m3u8?sd=10&rebase=on"
set chan_name="QVC USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_43
REM set link=https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=992000,RESOLUTION=848x480,CODECS="avc1.640029, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2200000,RESOLUTION=1280x720,CODECS="avc1.640029, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2200000,RESOLUTION=1280x720,CODECS="avc1.640029, mp4a.40.2"
set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1428000,RESOLUTION=848x480,CODECS="avc1.640029, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2564000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_3_av-b.m3u8?sd=10&rebase=on"

set chan_name="TSC The Shopping Channel CA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_44

REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=696000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=696000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1128000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_1000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1128000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_1000_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1728000,RESOLUTION=960x540,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_1600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1728000,RESOLUTION=960x540,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_1600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.66.30, mp4a.40.2"
set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_2500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_2500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_300_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://lsqvc2us-lh.akamaihd.net/i/lsqvc2us_01@809440/index_300_a-b.m3u8?sd=10&rebase=on"

set chan_name="QVC 2 USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_45
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/master.m3u8"

REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=696000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=696000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1128000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_1000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1128000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_1000_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1728000,RESOLUTION=960x540,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_1600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1728000,RESOLUTION=960x540,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_1600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.66.30, mp4a.40.2"
set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_2500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_2500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_300_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://lsqvc3us-lh.akamaihd.net/i/lsqvc3us_01@809459/index_300_a-b.m3u8?sd=10&rebase=on"

set chan_name="QVC 3" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_46
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/master.m3u8"

REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=354000,RESOLUTION=480x270,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=354000,RESOLUTION=480x270,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=678000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=678000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_1000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1101000,RESOLUTION=768x432,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_1000_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1687000,RESOLUTION=960x540,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_1600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1687000,RESOLUTION=960x540,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_1600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2566000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_2500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2566000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://lsqvc4us-lh.akamaihd.net/i/lsqvc4us_01@802711/index_2500_av-b.m3u8?sd=10&rebase=o"

set chan_name="QVC 4" 
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_47
set link=https://www.twitch.tv/twit 
REM set link="http://iphone-streaming.ustream.tv/uhls/1524/streams/live/iphone/playlist.m3u8"
set chan_name="TWIT" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_48

set link="https://wowzaprod13-i.akamaihd.net/hls/live/254985/29c28f19/persisTarget_9375922947_TVWAIR_247/chunklist.m3u8"

set chan_name="TVW Washington State TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_49
REM set link=https://video.oct.dc.gov/out/u/DCN.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=364035,RESOLUTION=416x234,CODECS="avc1.4D400D,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/21_1.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=664059,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/21_2.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=864061,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/21_3.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1064061,RESOLUTION=1920x1080,CODECS="avc1.4D4028,mp4a.40.2"
set link=https://video.oct.dc.gov/out/u/21_4.m3u8
set chan_name="DCN District of Columbia Network" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_50
REM set link=https://video.oct.dc.gov/out/u/DCC.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=364063,RESOLUTION=416x234,CODECS="avc1.4D400D,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/15_1.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=664058,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/15_2.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=864062,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/15_3.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1064088,RESOLUTION=1920x1080,CODECS="avc1.4D4028,mp4a.40.2"
set link=https://video.oct.dc.gov/out/u/15_12.m3u8
set chan_name="DCC District of Columbia Channel" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_51
REM set link=https://video.oct.dc.gov/out/u/DKN.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=428009,RESOLUTION=416x234,CODECS="avc1.4D400D,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/96_7.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=728053,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/96_8.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=927908,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link=https://video.oct.dc.gov/out/u/96_9.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1127917,RESOLUTION=1920x1080,CODECS="avc1.4D4028,mp4a.40.2"
set link=https://video.oct.dc.gov/out/u/96_10.m3u8
set chan_name="DCKN District of Columbia Knowledge Network Channel" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_52
set link="http://147.174.13.196/live/WIFI-1296k-540p/WIFI-1296k-540p.m3u8"
set chan_name="Southeastern University Television Channel" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_53
set link="http://tstv-stream.tsm.utexas.edu/hls/livestream_hi/index.m3u8"
REM set link="http://tstv-stream.tsm.utexas.edu/hls/livestream_low/index.m3u8"
set chan_name="Texas State University Channel" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_54
set link="https://streaming.temple.edu/tutvlive/_definst_/mp4:8BRYCQMB/chunklist.m3u8"
set chan_name="Temple University TUTV Philidelphia" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_55
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/live.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/CELL-496k-270p/CELL-496k-270p.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
set link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"

set chan_name="BronxNET NY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_56
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/live.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=570400,RESOLUTION=480x270,NAME="CELL-496k-270p"
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/CELL-496k-270p/CELL-496k-270p.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
set link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"
set chan_name="BronxNET OMNI NY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_57
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/live.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/CELL-496k-270p/CELL-496k-270p.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
set link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"
set chan_name="BronxNET Culture NY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_58
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/live.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
REM set link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/CELL-496k-270p/CELL-496k-270p.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
set link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"
set chan_name="BronxNET Culture NY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_59
REM set link="https://www.cbsnews.com/common/video/cbsn-ny-prod.m3u8"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2209451,AVERAGE-BANDWIDTH=2196101,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_7.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2768101,AVERAGE-BANDWIDTH=2768101,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_13.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1690136,AVERAGE-BANDWIDTH=1690136,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_8.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1030136,AVERAGE-BANDWIDTH=1030136,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_9.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=581336,AVERAGE-BANDWIDTH=581336,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_10.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=264536,AVERAGE-BANDWIDTH=264536,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master_12.m3u8"

set chan_name="CBSN NY USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_60
REM set link="https://dai.google.com/linear/hls/event/TxSbNMu4R5anKrjV02VOBg/master.m3u8"
REM set link="https://dai.google.com/linear/hls/pa/event/TxSbNMu4R5anKrjV02VOBg/stream/7fece08f-0ca5-4cbe-9545-0e1d733a9661:DLS/master.m3u8"

REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2544960,AVERAGE-BANDWIDTH=2191200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3072960,AVERAGE-BANDWIDTH=2631200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1752960,AVERAGE-BANDWIDTH=1531200,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1092929,AVERAGE-BANDWIDTH=981164,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644160,AVERAGE-BANDWIDTH=607200,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343200,AVERAGE-BANDWIDTH=343200,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master_6.m3u8"

set chan_name="CBSN LA USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_61
REM set link="https://dai.google.com/linear/hls/event/VE8b4n-YStusEGv5Z2NmsQ/master.m3u8"

REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2544960,AVERAGE-BANDWIDTH=2191200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3072960,AVERAGE-BANDWIDTH=2631200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1752960,AVERAGE-BANDWIDTH=1531200,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1092929,AVERAGE-BANDWIDTH=981164,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644160,AVERAGE-BANDWIDTH=607200,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_5.m3u8"
REM  #EXT-X-STREAM-INF:BANDWIDTH=343200,AVERAGE-BANDWIDTH=343200,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master_6.m3u8"

set chan_name="CBSN Bay Area"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_62
REM set link="https://dai.google.com/linear/hls/pa/event/26FJK7wRSo6RhPsK70XS_w/master.m3u8"
REM set link="https://dai.google.com/linear/hls/pa/event/26FJK7wRSo6RhPsK70XS_w/stream/1c87cbac-cf6f-442c-82b2-fff231ed3aa4:DLS/master.m3u8"

REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2460480,AVERAGE-BANDWIDTH=2085600,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2988480,AVERAGE-BANDWIDTH=2525600,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1668480,AVERAGE-BANDWIDTH=1425600,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1008449,AVERAGE-BANDWIDTH=875564,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=559680,AVERAGE-BANDWIDTH=501600,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=242880,AVERAGE-BANDWIDTH=237600,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master_6.m3u8"

set chan_name="CBSN Boston"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_63
REM set link="https://dai.google.com/linear/hls/pa/event/DWt8iR1YQ-OJQsxczu8KfQ/master.m3u8"
REM set link="https://dai.google.com/linear/hls/pa/event/DWt8iR1YQ-OJQsxczu8KfQ/stream/3e6dc6fd-ea1b-4786-a9c5-8f48bd105847:DLS/master.m3u8"

REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2808286,AVERAGE-BANDWIDTH=2191680,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_7.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3394718,AVERAGE-BANDWIDTH=2631680,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_8.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1928638,AVERAGE-BANDWIDTH=1531680,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_9.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1195572,AVERAGE-BANDWIDTH=981645,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_10.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=697131,AVERAGE-BANDWIDTH=607680,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_11.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=345272,AVERAGE-BANDWIDTH=343680,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master_12.m3u8"

set chan_name="CBSN Chicago"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_64
REM set link="https://dai.google.com/linear/hls/pa/event/o5J3g4U9T16CvYnS7Qd86Q/master.m3u8"
REM set link="https://dai.google.com/linear/hls/pa/event/o5J3g4U9T16CvYnS7Qd86Q/stream/29108445-1259-4926-b94c-cfb8296069f4:DLS/master.m3u8"

REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2808084,AVERAGE-BANDWIDTH=2191424,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3394516,AVERAGE-BANDWIDTH=2631424,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1928432,AVERAGE-BANDWIDTH=1531424,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1195365,AVERAGE-BANDWIDTH=981389,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=696924,AVERAGE-BANDWIDTH=607424,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=345065,AVERAGE-BANDWIDTH=343424,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master_6.m3u8"

set chan_name="CBSN Dallas Fort Worth"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_65
REM set link="https://dai.google.com/linear/hls/pa/event/EUo67MWSRh6toPi0heJKnQ/master.m3u8
REM set link="https://dai.google.com/linear/hls/pa/event/EUo67MWSRh6toPi0heJKnQ/stream/d8c0a401-725c-488a-9d4b-39976b1bf679:DLS/master.m3u8

REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2807978,AVERAGE-BANDWIDTH=2191294,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3394410,AVERAGE-BANDWIDTH=2631294,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1928330,AVERAGE-BANDWIDTH=1531294,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1195260,AVERAGE-BANDWIDTH=981259,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=696823,AVERAGE-BANDWIDTH=607294,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=344964,AVERAGE-BANDWIDTH=343294,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master_6.m3u8"

set chan_name="CBSN Denver"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_66
REM set link="https://dai.google.com/linear/hls/pa/event/zcWPVCfURNSPxeidcckQLA/master.m3u8"
REM set link="https://dai.google.com/linear/hls/pa/event/zcWPVCfURNSPxeidcckQLA/stream/c8d93a89-21b3-49ee-8a81-ebfae0b39fde:DLS/master.m3u8"

REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2544960,AVERAGE-BANDWIDTH=2191200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3072960,AVERAGE-BANDWIDTH=2631200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_7.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1752960,AVERAGE-BANDWIDTH=1531200,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1092929,AVERAGE-BANDWIDTH=981164,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644160,AVERAGE-BANDWIDTH=607200,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343200,AVERAGE-BANDWIDTH=343200,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master_6.m3u8"

set chan_name="CBSN Minnesota"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_67
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=2544960,AVERAGE-BANDWIDTH=2191200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_1.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3072960,AVERAGE-BANDWIDTH=2631200,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1752960,AVERAGE-BANDWIDTH=1531200,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_3.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1092929,AVERAGE-BANDWIDTH=981164,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_4.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644160,AVERAGE-BANDWIDTH=607200,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_5.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343200,AVERAGE-BANDWIDTH=343200,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master_6.m3u8"

set chan_name="CBSN Philladelphia"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_68
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2545092,AVERAGE-BANDWIDTH=2191367,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_7.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3073092,AVERAGE-BANDWIDTH=2631367,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_8.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1753092,AVERAGE-BANDWIDTH=1531367,RESOLUTION=960x540,FRAME-RATE=29.970,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_9.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1093065,AVERAGE-BANDWIDTH=981332,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_10.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=644292,AVERAGE-BANDWIDTH=607367,RESOLUTION=640x360,FRAME-RATE=29.970,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_11.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=343367,AVERAGE-BANDWIDTH=343367,RESOLUTION=320x180,FRAME-RATE=29.970,CODECS="avc1.4D400D,mp4a.40.2"
REM set link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master_12.m3u8"
set chan_name="CBSN Pittsburgh"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_69
set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=476x268,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=728000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_1200_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_2500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_a-b.m3u8?sd=10&rebase=on"
set chan_name="FOX NEWS TALK USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_70
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=446000,RESOLUTION=360x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_288_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=446000,RESOLUTION=360x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_288_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=793000,RESOLUTION=544x432,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_432_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=793000,RESOLUTION=544x432,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_432_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1325000,RESOLUTION=720x576,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_576_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1325000,RESOLUTION=720x576,CODECS="avc1.77.30, mp4a.40.2"
set link="https://etnowweblive-lh.akamaihd.net/i/ETN_1@348070/index_576_av-b.m3u8?sd=10&rebase=on"
set chan_name="Economic Times of India"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_71
set link="https://multitvido.c.s73cdn.net/idvo/newsx_360p/index.m3u8"
REM set link="https://multitvido.c.s73cdn.net/idvo/newsx_240p/index.m3u8"
set chan_name="NEWSX INDIA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_72
set link="https://dai.google.com/linear/hls/event/FbL8YN7tSnqysJ6wVjKW7A/master.m3u8"
set chan_name="NDTV INDIA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_73
set link="https://multitvido.c.s73cdn.net/idvo/newsxkannada_360p/index.m3u8"
REM set link="https://multitvido.c.s73cdn.net/idvo/newsxkannada_240p/index.m3u8"
set chan_name="NewsX India NE News"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_74
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=262000,RESOLUTION=256x144,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_144_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=262000,RESOLUTION=256x144,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_144_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=593000,RESOLUTION=424x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_240_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=593000,RESOLUTION=424x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_240_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1293000,RESOLUTION=854x480,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_480_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1293000,RESOLUTION=854x480,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_480_av-b.m3u8?sd=10&rebase=on
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2125000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_720_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3125000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
set link="https://timesnow-lh.akamaihd.net/i/TNHD_1@129288/index_720_av-b.m3u8?sd=10&rebase=on"
set chan_name="TIMES OF INDIA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_75
set link="https://www.filmon.com/tv/bbc-news"
set chan_name="BBC LONDON"
set /A prior_num="%chan_num%" 
goto PLAY_CASE

:CHAN_76
set link="https://www.dailymotion.com/video/x5eva58"
set chan_name="Made in Leeds UK" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_77
set link="https://www.dailymotion.com/video/x5eva8m"
set chan_name="Made in Tyne and Wear UK" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_78
set link="https://www.dailymotion.com/video/x5ev9xg"
set chan_name="Made in Cardiff" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_77
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_78
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_79
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_80
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

REM ################################ FRENCH #########################################

:CHAN_81

REM set link=http://static.france24.com/live/F24_FR_HI_HLS/live_tv.m3u8

REM set link=http://www.dailymotion.com/video/xigbvx_live-france-24_news
REM set link=http://static.france24.com/live/F24_FR_LO_HLS/live_ios.m3u8
REM REM EXT-X-STREAM-INF:BANDWIDTH=1095600,AVERAGE-BANDWIDTH=1095600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=25.000,AUDIO="program_audio"
REM set link=http://f24hls-i.akamaihd.net/hls/live/221192/F24_FR_LO_HLS/master_900.m3u8
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_1",AUTOSELECT=YES,DEFAULT=YES,URI="master_96.m3u8"
REM set link=http://f24hls-i.akamaihd.net/hls/live/221192/F24_FR_LO_HLS/master_96.m3u8

REM #link=http://static.france24.com/live/F24_FR_HI_HLS/live_tv.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=673025,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146/F24_FR_HI_HLS/05.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=673025,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146-b/F24_FR_HI_HLS/05.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1081720,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=720x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146/F24_FR_HI_HLS/04.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1081720,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=720x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146-b/F24_FR_HI_HLS/04.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2512155,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146/F24_FR_HI_HLS/03.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2512155,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146-b/F24_FR_HI_HLS/03.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5270851,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080
REM set link="http://f24hls-i.akamaihd.net/hls/live/221146/F24_FR_HI_HLS/01.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5270851,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080
set link="http://f24hls-i.akamaihd.net/hls/live/221146-b/F24_FR_HI_HLS/01.m3u8"

set chan_name="FRANCE 24 FRANCAIS" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_82
set link="https://players.brightcove.net/876450610001/HJeY2afE_default/index.html?videoId=5615950982001"
REM set link="https://www.dailymotion.com/video/xgz4t1"
set chan_name="BFM TV FRANCE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_83
set link="https://players.brightcove.net/876450612001/HycrnmXI_default/index.html?videoId=1920204345001"
set chan_name="BFM BUSINESS FRANCE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_84
REM set link="https://rt-france.secure.footprint.net/1107.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3765520,AVERAGE-BANDWIDTH=2501400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=24.000
set link="https://rt-france.secure.footprint.net/1107_2500Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2397824,AVERAGE-BANDWIDTH=1601600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=854x480,FRAME-RATE=24.000
REM set link="https://rt-france.secure.footprint.net/1107_1600Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1181444,AVERAGE-BANDWIDTH=801350,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=24.000
REM set link="https://rt-france.secure.footprint.net/1107_800Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=572000,AVERAGE-BANDWIDTH=400400,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=428x240,FRAME-RATE=24.000
REM set link="https://rt-france.secure.footprint.net/1107_400Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
REM set link="https://rt-france.secure.footprint.net/1107_64Kb.m3u8"
set chan_name="RT FRANCE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_85
set link="https://videos.francetv.fr/video/SIM_Franceinfo"
set chan_name="France Info" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_86
REM set link=https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=362435,RESOLUTION=640x360,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_6.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=362435,RESOLUTION=640x360,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_6.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=571616,RESOLUTION=640x360,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_5.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=571616,RESOLUTION=640x360,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_5.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764771,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_4.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764771,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_4.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1088642,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_3.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1088642,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_3.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1378624,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_2.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1378624,RESOLUTION=1280x720,CODECS="mp4a.40.2,avc1.4d401f"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_2.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2196150,RESOLUTION=1920x1080,CODECS="mp4a.40.2,avc1.4d4029"
set link="https://tv5infohls-i.akamaihd.net/hls/live/631613/tv5infohls/v3plusinfo247hls_1_1.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2196150,RESOLUTION=1920x1080,CODECS="mp4a.40.2,avc1.4d4029"
REM set link="https://v3plusinfo247hls-i.akamaihd.net/hls/live/218877/v3plusinfo247hls/v3plusinfo247hls_1_1.m3u8"

set chan_name="TV5 Monde FR" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_87
REM set link=https://live.cgtn.com/cctv-f.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,RESOLUTION=1280x720,NAME="720p HD"
set link=https://livefr.cgtn.com/1000f/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=640x360,NAME="360p SD"
REM set link=https://livefr.cgtn.com/500f/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=320x180,NAME="180p 3G"
REM set link=https://livefr.cgtn.com/200f/prog_index.m3u8
set chan_name="CGTN Francais" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_88
set link="https://www.dailymotion.com/video/x6i37o5"
set chan_name="Africa News" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_89
set link="https://players.brightcove.net/5481942443001/r1t0JFRjG_default/index.html?videoId=5827595278001"	
set chan_name="TVA CA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_90
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
set chan_name="RADIO CANADA RDI ICI CA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_91
set link=https://www.filmon.com/tv/rts-un	
set chan_name="RTS UN" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_92
set link=https://www.filmon.com/tv/france-2	
set chan_name="FRANCE 2" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_93
set link=https://www.filmon.com/tv/france-3-rhone-alpes	
set chan_name="FRANCE 3" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_94
set link=https://www.filmon.com/tv/arte-francais	
set chan_name="ARTE Francais" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_95
set link=https://www.filmon.com/tv/france-0	
set chan_name="France O" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_96
set link=https://www.dailymotion.com/video/x13x1q2 
set chan_name="Azur TV FR" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_97
set link=https://players.brightcove.net/5132998232001/H1bPo8t6_default/index.html?videoId=5152968636001  
REM set link="https://www.dailymotion.com/video/x3wqv8b"
set chan_name="BFM TV PARIS" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_98
REM set link="https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=716736,CODECS="avc1.42801e,mp4a.40.2",RESOLUTION=640x360
REM set link=https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/chunklist_w357100756_b657536.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=355936,CODECS="avc1.428015,mp4a.40.2",RESOLUTION=480x270
REM set link=https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/chunklist_w357100756_b329536.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1550536,CODECS="avc1.428020,mp4a.40.2",RESOLUTION=1280x720
set link=https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/chunklist_w357100756_b1415536.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=175536,CODECS="avc1.42800d,mp4a.40.2",RESOLUTION=416x234
REM set link=https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/chunklist_w357100756_b165536.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3211264,CODECS="avc1.4d4028,mp4a.40.2",RESOLUTION=1920x1080
REM set link=https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/chunklist_w357100756_b3211264.m3u8
set chan_name="Alsace 20 Fr" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_99
set link=https://www.filmon.com/tv/rts-deux
set chan_name="RTS DEUX" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_100
set link=https://www.dailymotion.com/video/xji3qy
set chan_name="LCP Assemblee National France" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_101
set link=https://www.dailymotion.com/video/xkxbzc
set chan_name="Public Senate France" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_102
set link=https://bcoveliveios-i.akamaihd.net/hls/live/248520/1242843915001_2/master.m3u8
set chan_name="CPAC 1 Francais Canada" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_103
set link="http://diffusionm4.assnat.qc.ca/canal9/250.sdp/playlist.m3u8"   
set chan_name="ASSEMBLEE NATIONAL DU QUEBEC" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_104
set link="http://stream.canalsavoir.tv/livestream/stream.m3u8"   
set chan_name="CANAL SAVOIR QUEBEC" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_105
set link="https://ec.playmedia.fr/gong-base/live/playlist.m3u8"   
set chan_name="GONG CINEMA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_106
set link="http://51.254.215.79/appflux/gongmax/GONGMAX/gongmax_1280/chunks.m3u8"   
set chan_name="GONG MAX" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_107
set link=http://149.202.81.107:1935/stream/live/playlist.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1638908,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=960x540
REM set link=http://149.202.81.107:1935/stream/live/chunklist_w635316941.m3u8
set chan_name="BX1 BE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_108
set link="http://vm109.imust.org:1935/live/livestream/HasBahCa.m3u8"   
set chan_name="ANTENNA CENTER FRANCE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_109
set link="rtmp://str81.creacast.com:80/iltv/high"   
set chan_name="ILTV FRANCE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_110
set link="https://www.dailymotion.com/video/x26eox4_live-franceinfo-direct-radio_news"
set chan_name="France Info Radio" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_111
set link="https://www.dailymotion.com/video/xqjkfz_europe-1-live_news"
set chan_name="Europe 1 Radio" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_112
set link="https://www.dailymotion.com/video/xl1km0_regardez-rtl-en-direct-et-en-video_news"
set chan_name="RTL Radio" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_113
set link=https://players.brightcove.net/876630703001/SkKvZlxI_default/index.html?videoId=2623007265001
set chan_name="RMC Talk" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_114
set link="https://www.dailymotion.com/video/x6142rr"
set chan_name="MB TV Monte Blanc
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_115
set link="https://www.dailymotion.com/video/x2fxcwq"
set chan_name="Generations TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_116
set link="https://www.dailymotion.com/video/x38yjeb"
set chan_name="Tv Vendée"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_117
set link="https://www.dailymotion.com/video/xuw47s"
set chan_name="OUATCH TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_118
set link="https://www.dailymotion.com/video/x52et3w"
set chan_name="Suivez Telesud"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_119
set link="https://www.dailymotion.com/video/x46ancl"
set chan_name="TV7 Bordeaux"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_120
set link="https://www.dailymotion.com/video/x35m6bz"
set chan_name="VL"
set /A prior_num="%chan_num%"
goto PLAY_CASE



REM ################################# SPANISH ######################################

:CHAN_121
REM set link="https://rt-esp.secure.footprint.net/1102.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3765520,AVERAGE-BANDWIDTH=2501400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=24.000
set link="https://rt-esp.secure.footprint.net/1102_2500Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2397824,AVERAGE-BANDWIDTH=1601600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=854x480,FRAME-RATE=24.000
REM set link="https://rt-esp.secure.footprint.net/1102_1600Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1181444,AVERAGE-BANDWIDTH=801350,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=24.000
REM set link="https://rt-esp.secure.footprint.net/1102_800Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=572000,AVERAGE-BANDWIDTH=400400,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=428x240,FRAME-RATE=24.000
REM set link="https://rt-esp.secure.footprint.net/1102_400Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
REM set link="https://rt-esp.secure.footprint.net/1102_64Kb.m3u8"

set chan_name="RT ESPANOL" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_122
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_5_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_5_av-b.m3u8?sd=10&rebase=on"
REM EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_4_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_3_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
REM set link=https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_1_av-b.m3u8?sd=10&rebase=on
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_5_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream3-lh.akamaihd.net/i/dwstream3_live@124409/index_5_a-b.m3u8?sd=10&rebase=on"

set chan_name="DW ESPANOL" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_123
REM set link="https://live.cgtn.com/cctv-e.m3u8" 
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,RESOLUTION=1280x720,NAME="720p HD"
set link="https://livees.cgtn.com/1000e/prog_index.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=640x360,NAME="360p SD"
REM set link="https://livees.cgtn.com/500e/prog_index.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=320x180,NAME="180p 3G"
REM set link="https://livees.cgtn.com/200e/prog_index.m3u8"

set chan_name="CGTN ESPANOL" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_124
REM set link=:http://static.france24.com/live/F24_ES_HI_HLS/live_tv.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=655600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845/F24_ES_HI_HLS/master_500.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=655600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845-b/F24_ES_HI_HLS/master_500.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=875600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845/F24_ES_HI_HLS/master_700.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=875600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845-b/F24_ES_HI_HLS/master_700.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1095600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845/F24_ES_HI_HLS/master_900.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1095600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845-b/F24_ES_HI_HLS/master_900.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1425600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845/F24_ES_HI_HLS/master_1200.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1425600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845-b/F24_ES_HI_HLS/master_1200.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2305600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
set link="http://f24hls-i.akamaihd.net/hls/live/520845/F24_ES_HI_HLS/master_2000.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2305600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/520845-b/F24_ES_HI_HLS/master_2000.m3u8"

set chan_name="FRANCE 24 ESPANOL" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_125
set link="https://5a61de8ed719d.streamlock.net/live/smil:live.smil/playlist.m3u8"
set link="https://5a61de8ed719d.streamlock.net/live/smil:live.smil/chunklist_w2093826190_b644100_slen.m3u8"
set chan_name="HISPAN TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_126
REM set link="http://cdn2.telesur.ultrabase.net/livecf/telesurLive/master.m3u8"
set link="https://d2ajt1gpdtnw25.cloudfront.net/mbliveMain/hd/playlist.m3u8"
REM set link="https://d2ajt1gpdtnw25.cloudfront.net/mbliveMain/480p/playlist.m3u8"
REM set link="https://d2ajt1gpdtnw25.cloudfront.net/mbliveMain/360p/playlist.m3u8"
set chan_name="TeleSUR VE"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_128
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_129
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_130
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_131
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_132
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_133
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_134
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_135
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_136
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_137
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_138
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_139
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_140
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_141
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_142
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_143
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_144
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_145
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_146
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_147
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_148
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_149
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_150
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_151
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_152
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_153
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_154
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_155
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_156
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_157
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_158
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
:CHAN_159
set /A prior_num="%chan_num%"
set chan_name="UNASSIGNED"
goto MENU_!menu_num!
:CHAN_160
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

REM #################################  OTHER ###########################################

:CHAN_161
set link="https://www.dailymotion.com/video/x630wrb"
set chan_name="VAR AZUR"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_162
set link="https://www.dailymotion.com/video/x6nhqs0"
set chan_name="8 Mont Blanc Live 2"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_163
set link="https://www.dailymotion.com/video/x128fjo"
set chan_name="téléGrenoble Isère"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_164
set link="https://www.dailymotion.com/video/x2tzzpj"
set chan_name="RTL2"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_165
set link="https://www.dailymotion.com/video/x10990v"
set chan_name="OUI FM"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_166
set link="https://www.dailymotion.com/video/x6cq41k"
set chan_name="D24TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_167
set link="https://www.dailymotion.com/video/x3wqv8b"
set chan_name="8 Mont Blanc"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_168
set link="https://www.dailymotion.com/video/x6inuzo"
set chan_name="Top News Albania"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_169
set chan_name="Unassigned"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!


:CHAN_170
chan_name="WDR Germany"
REM set link=http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=184000,RESOLUTION=320x180,CODECS="avc1.66.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_184_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=184000,RESOLUTION=320x180,CODECS="avc1.66.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_184_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_320_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_320_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=608000,RESOLUTION=512x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_608_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=608000,RESOLUTION=512x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_608_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1216000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_1216_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1216000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_1216_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1992000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_1992_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1992000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_1992_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2691000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_2692_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2691000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_2692_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3776000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_3776_av-p.m3u8?sd=10&rebase=on"
REM set #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3776000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_3776_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=56000,CODECS="mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_184_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=56000,CODECS="mp4a.40.2"
REM set link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/index_184_a-b.m3u8?sd=10&rebase=on"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_171
REM set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/master.m3u8"   
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_5_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
set link="https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_1_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
set chan_name="DW Deutsche"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_172
set link=https://www.filmon.com/tv/zdf-infokanal
set chan_name="ZDF InfoKanal"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_173
REM set link=https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=184000,RESOLUTION=320x180,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_184_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=184000,RESOLUTION=320x180,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_184_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=608000,RESOLUTION=512x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_608_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=608000,RESOLUTION=512x288,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_608_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1152000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1152_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1152000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1152_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1992000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1992_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1992000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1992_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3776000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_3776_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3776000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_3776_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=56000,CODECS="mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_184_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=56000,CODECS="mp4a.40.2"
REM set link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_184_a-b.m3u8?sd=10&rebase=on"
set chan_name="Tagesschau/MOMA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_174
set link="https://llnw.live.qvc.simplestream.com/hera/remote/qvcde_primary_sdi7/2/prog_index.m3u8"
set chan_name="QVC DE"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_175
set link="https://br-i.akamaihd.net/i/tafeln/br-fernsehen/br-fernsehen-tafel_,0,A,B,E,C,X,.mp4.csmil/index_2_av.m3u8?null=0"
set chan_name="ADR Alpha Live DE"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_176
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/master.m3u8" 
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_5_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_5_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_4_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_3_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_1_av-b.m3u8?sd=10&rebase=on"
REM EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_5_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream5-lh.akamaihd.net/i/dwstream5_live@124540/index_5_a-b.m3u8?sd=10&rebase=on"
set chan_name="DW + Deutsche"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_177
set link="https://ms03.w24.at/W24/smil:liveevent.smil/chunklist_w1902571248_b1088000_slger.m3u8"
REM set link="https://ms03.w24.at/W24/smil:liveevent.smil/chunklist_w1902571248_b448000_slger.m3u8"
set chan_name="W24 Wein Austria"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_178
REM set link=http://lb.hd-livestream.de:1935/live/TirolTV/playlist.m3u8
set link="http://lb.hd-livestream.de:1935/live/TirolTV/chunklist_w1916857628.m3u8"
set chan_name="Tirol TV Austria"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_179
set link=https://www.filmon.com/tv/srf-1
set chan_name="SRF CH"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_180
set chan_name="Unassigned"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_181
REM set link="https://ngx.cr6.streamzilla.xlcdn.com/session/9a63fab68b13d1eca45acd9e1b890d70/sz/atvijf/wowza4/live/live.smil/playlist.m3u8"
REM set link="https://ngx.cr2.streamzilla.xlcdn.com/session/cfe18ffd42a318a654dd596ef2097868/sz/atvijf/wowza4/live/live.smil/chunklist_b1048576.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1153433,RESOLUTION=640x512
REM set link="https://ngx.cr6.streamzilla.xlcdn.com/session/9a63fab68b13d1eca45acd9e1b890d70/sz/atvijf/wowza4/live/live.smil/chunklist_b1048576.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2306867,RESOLUTION=768x608
set link="https://ngx.cr6.streamzilla.xlcdn.com/session/9a63fab68b13d1eca45acd9e1b890d70/sz/atvijf/wowza4/live/live.smil/chunklist_b2097152.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3460300,RESOLUTION=1920x1536
REM set link="https://ngx.cr6.streamzilla.xlcdn.com/session/9a63fab68b13d1eca45acd9e1b890d70/sz/atvijf/wowza4/live/live.smil/chunklist_b3145728.m3u8"
set chan_name="AT5 Netherlands"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_182
REM set link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist.m3u8
set link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist_2m.m3u8
REM set link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist_1m.m3u8
set chan_name="Euronews Russian"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_183
REM set link=https://live.russia.tv/index/index/channel_id/3
set link=https://www.filmon.com/tv/rossiya-24
set chan_name="POCCNR 24 RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_184
set link=http://online.video.rbc.ru/online/rbctv_480p/index.m3u8
REM set link=http://online.video.rbc.ru/online/rbctv_360p/index.m3u8
set chan_name="RBC RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_185
REM set link=https://live.cgtn.com/cctv-r.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,RESOLUTION=1280x720,NAME="720p HD"
set link=https://liveru.cgtn.com/1000r/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=640x360,NAME="360p SD"
REM set link=https://liveru.cgtn.com/500r/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=320x180,NAME="180p 3G"
REM set link=https://liveru.cgtn.com/200r/prog_index.m3u8
set chan_name="CCTV RUSSIAN"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_186
set link=https://live.russia.tv/index/index/channel_id/199
set chan_name="Vesti FM RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_187
set link=https://www.filmon.com/tv/current-time-tv
set chan_name="Current TIme VOA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_188
set link=https://live.russia.tv/index/index/channel_id/82
set chan_name="RTR Planeta RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_189
REM set link=https://www.filmon.com/tv/perviy-kanal-europa
set link=https://edge1.1internet.tv/dash-live11/streams/1tv/1tvdash.mpd
set chan_name="1 Europa RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_190
set link=https://www.filmon.com/tv/music-box-russia
set chan_name="Music Box Russia"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_191
set link=https://live.russia.tv/index/index/channel_id/76
set chan_name="MOSCKVA 24 RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_192
set link=http://live.russia.tv/index/index/channel_id/1
set chan_name="POCCNR 1 HD RU"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_193
set link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_mid/index.m3u8
REM set link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_hi/index.m3u8
REM set link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_low/index.m3u8
set chan_name="UA TV Ukraine"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_194
set link="http://livebeta.publika.md/LIVE/P/6810.m3u8"
set chan_name="TV Publica Moldova"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_195
set link="http://skyianywhere2-i.akamaihd.net/hls/live/200275/tg24/playlist.m3u8"
set chan_name="SKY 24 Italian"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_196
set link=http://www.filmon.com/tv/rsi-la-1
set chan_name="RSI LA 1 CH"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_197
REM set link="http://telecolor.econcept.it/live/telecolor.isml/manifest\(format=m3u8-aapl\).m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=313356,RESOLUTION=320x240
REM set link="http://telecolor.econcept.it/live/telecolor.isml/QualityLevels\(298000\)/manifest\(format=m3u8-aapl\).m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=466656,RESOLUTION=400x300
REM set link="http://telecolor.econcept.it/live/telecolor.isml/QualityLevels\(448000\)/manifest\(format=m3u8-aapl\).m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=671056,RESOLUTION=640x480
set link="http://telecolor.econcept.it/live/telecolor.isml/QualityLevels\(648000\)/manifest\(format=m3u8-aapl\).m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=53456
REM set link="http://telecolor.econcept.it/live/telecolor.isml/QualityLevels\(48000\)/manifest\(format=m3u8-aapl\).m3u8"
set chan_name="Telecolor Lombardia IT"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_198
set link="http://www.dailymotion.com/video/xqjey2_star-lamia-live-streaming_news"
set chan_name="Star Lamia"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_199
set link="http://www.dailymotion.com/video/x61fbhs"
set chan_name="Action 24 Greece"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_200
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=624000,RESOLUTION=640x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=124000,RESOLUTION=640x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_600_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=822000,RESOLUTION=852x480,CODECS="avc1.66.30, mp4a.40.2"
set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_900_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=124000,RESOLUTION=852x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_900_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1017000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_1500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=124000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
REM set link="https://trtcanlitv-lh.akamaihd.net/i/TRTHABERHD_1@181942/index_1500_av-b.m3u8?sd=10&rebase=on"
set chan_name="TRT HABER"
goto PLAY_CASE

REM ############################## EASTERN  ##########################################
:CHAN_201
REM set link="https://rt-arab.secure.footprint.net/1104.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3765520,AVERAGE-BANDWIDTH=2501400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=24.000
set link="https://rt-arab.secure.footprint.net/1104_2500Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2397824,AVERAGE-BANDWIDTH=1601600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=854x480,FRAME-RATE=24.000
REM set link=https://rt-arab.secure.footprint.net/1104_1600Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1181444,AVERAGE-BANDWIDTH=801350,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=24.000
REM set link="https://rt-arab.secure.footprint.net/1104_800Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=572000,AVERAGE-BANDWIDTH=400400,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=428x240,FRAME-RATE=24.000
REM set link="https://rt-arab.secure.footprint.net/1104_400Kb.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
REM set link=https://rt-arab.secure.footprint.net/1104_64Kb.m3u8
set chan_name="RT Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_202
REM set link="http://static.france24.com/live/F24_AR_HI_HLS/live_tv.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=655600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148/F24_AR_HI_HLS/master_500.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=655600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148-b/F24_AR_HI_HLS/master_500.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=875600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148/F24_AR_HI_HLS/master_700.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=875600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148-b/F24_AR_HI_HLS/master_700.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1095600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148/F24_AR_HI_HLS/master_900.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1095600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148-b/F24_AR_HI_HLS/master_900.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1425600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148/F24_AR_HI_HLS/master_1200.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1425600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148-b/F24_AR_HI_HLS/master_1200.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2305600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
set link="http://f24hls-i.akamaihd.net/hls/live/221148/F24_AR_HI_HLS/master_2000.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2305600,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1024x576
REM set link="http://f24hls-i.akamaihd.net/hls/live/221148-b/F24_AR_HI_HLS/master_2000.m3u8"
set chan_name="France24 Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_203
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_5_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=163000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_5_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_4_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_3_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=864000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_2_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1664000,RESOLUTION=720x400,CODECS="avc1.77.30, mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_1_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_5_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
REM set link="https://dwstream2-lh.akamaihd.net/i/dwstream2_live@124400/index_5_a-b.m3u8?sd=10&rebase=on"
set chan_name="DW Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_204
REM set link=https://live.cgtn.com/cctv-a.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1096000,RESOLUTION=1280x720,NAME="720p HD"
set link=https://livear.cgtn.com/1000a/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=640x360,NAME="360p SD"
REM set link=https://livear.cgtn.com/500a/prog_index.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=320x180,NAME="180p 3G"
REM link=https://livear.cgtn.com/200a/prog_index.m3u8
set chan_name="CCTV Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_205
REM set link="https://live-hls-web-aja.getaj.net/AJA/index.m3u8"
set link="https://live-hls-web-aja.getaj.net/AJA/01.m3u8"
REM set link="https://live-hls-web-aja.getaj.net/AJA/02.m3u8"
REM set link="https://live-hls-web-aja.getaj.net/AJA/03.m3u8"
REM set link="https://live-hls-web-aja.getaj.net/AJA/04.m3u8"
REM set link="https://live-hls-web-aja.getaj.net/AJA/05.m3u8"
REM set link="https://live-hls-web-aja.getaj.net/AJA/06.m3u8"

set chan_name="Al Jazeera Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_206
set link=http://aljazeera-doc-apple-live.adaptive.level3.net/apple/aljazeera/hq-doc/1600kStream.m3u8
REM set link=http://aljazeera-doc-apple-live.adaptive.level3.net/apple/aljazeera/hq-doc/1200kStream.m3u8
REM set link=http://aljazeera-doc-apple-live.adaptive.level3.net/apple/aljazeera/hq-doc/800kStream.m3u8
REM set link=http://aljazeera-doc-apple-live.adaptive.level3.net/apple/aljazeera/hq-doc/600kStream.m3u8
set chan_name="Al Jazeera Docs"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_207
REM set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/appleman.m3u8
set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/800.m3u8
REM set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/600.m3u8
REM set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/300.m3u8
REM set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/160.m3u8
REM set link=http://aljazeera-mubasher-apple-live.adaptive.level3.net/apple/aljazeera/mubasher/160audio.m3u8
set chan_name="Al Jazeera Mubasher"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_208
set link=https://www.filmon.com/tv/saudi-arabian-tv-1
set chan_name="Saudia Arabia KSA1"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_209
set link=https://www.filmon.com/tv/saudi-arabian-tv-sports
set chan_name="Saudi Arabia Sports"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_210
REM set link=https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=256x144,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_192_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=400000,RESOLUTION=512x288,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_400_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=800000,RESOLUTION=640x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_800_av-p.m3u8?sd=10&rebase=on"

set link="https://vs-dash-ww-live.akamaized.net/pool_902/live/nonuk/bbc_arabic_tv/bbc_arabic_tv.isml/pc_hd_abr_v2_dash.mpd"

set chan_name="BBC Arabic"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_211
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_212
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_213
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_214
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_215
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_216
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_217
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_218
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_219
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_220
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_222
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_223
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_224
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_225
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_226
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
REM ################################### MENU PAGE 2 #########################################################

REM ####################################  ENTERTAINMENT ##########################################
:CHAN_241
REM set link=http://edge.music-choice-play-chaina1.top.comcast.net/PlayMetadataInserter/play/playlist.m3u8
set link=http://edge.music-choice-play-chaina1.top.comcast.net/PlayMetadataInserter/play/chunklist.m3u8
set chan_name="Music Choice Play"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_242
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=48000,CODECS="mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_48_a-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=48000,CODECS="mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_48_a-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=150000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_110_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=150000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_110_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=240000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_200_av-p.m3u8?sd=10&rebase=on"
REM EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=240000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_200_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=440000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_400_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=440000,RESOLUTION=400x224,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_400_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=640000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_600_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=640000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://m2otv-lh.akamaihd.net/i/m2oTv_1@186074/index_600_av-b.m3u8?sd=10&rebase=on"
set chan_name="M2O"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_243
REM set link=http://wow01.105.net/live/rmc1/playlist.m3u8  
REM #EXT-X-STREAM-INF:BANDWIDTH=1009334,CODECS="avc1.66.31,mp4a.40.2",RESOLUTION=720x432
set link=http://wow01.105.net/live/rmc1/chunklist_w1187407711.m3u8
REM set link=rtmp://fms.105.net:1935/live/rmc1
set chan_name="Radio Monte Carlo TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_244
set link="https://abr.de1se01.v2beat.live/live/live6/chunks.m3u8"
set chan_name="V2Beat"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_245
REM set link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/playlist.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3686400,RESOLUTION=1280x720
set link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_720p.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3439489,RESOLUTION=960x540
REM set link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_540p.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=921600,RESOLUTION=640x360
REM set link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_360p.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=331776,RESOLUTION=384x216
REM set link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_216p.m3u8
set chan_name="DanceStart TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_246
set link="https://www.dailymotion.com/video/x6s18p8"
set chan_name="BritAsia TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_247
set link=http://1mstream.digicable.hu/hitmusic/hitmusic.m3u8
set chan_name="Hit Music Channel"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_248
set link=https://cmctv.ios.internapcdn.net/cmctv_vitalstream_com/live_1/CMC-TV/chunklist.m3u8
set chan_name="California Music Channel"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_249
set link="https://dcunilive2-lh.akamaihd.net/i/dclive_1@390829/master.m3u8"
set chan_name="Country Network"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_250
REM set link="https://azroe0x-lh.akamaihd.net/i/test_1@775856/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2536000,RESOLUTION=640x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://azroe0x-lh.akamaihd.net/i/test_1@775856/index_1000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3536000,RESOLUTION=1280x720,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://azroe0x-lh.akamaihd.net/i/test_1@775856/index_2000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=5036000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
set link="https://azroe0x-lh.akamaihd.net/i/test_1@775856/index_3500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1536000,CODECS="mp4a.40.2"
REM set link="https://azroe0x-lh.akamaihd.net/i/test_1@775856/index_1000_a-p.m3u8?sd=10&rebase=on"
set chan_name="DITTY TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_251
link="https://livestream.com/accounts/22300522/events/6680139"
set chan_name="Rockland Radio TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_252
REM set link=https://classicarts.global.ssl.fastly.net/live/cas/master.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=745800,AVERAGE-BANDWIDTH=745800,CODECS="avc1.42c015,mp4a.40.2",RESOLUTION=430x240,FRAME-RATE=29.970
REM set link="https://classicarts.global.ssl.fastly.net/live/cas/master_550k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1240800,AVERAGE-BANDWIDTH=1240800,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970
REM set link="https://classicarts.global.ssl.fastly.net/live/cas/master_1000k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1790800,AVERAGE-BANDWIDTH=1790800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970
REM set link="https://classicarts.global.ssl.fastly.net/live/cas/master_1500k.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=3440800,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
set link="https://classicarts.global.ssl.fastly.net/live/cas/master_3000k.m3u8"
set chan_name="Classic ARTS"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_253
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=334400,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=416x234
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer0.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=554400,CODECS="avc1.66.30,mp4a.40.5",RESOLUTION=416x234
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer1.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=884400,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=640x360
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer2.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1445400,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=640x360
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer3.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=2050400,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=852x480
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer4.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=2820400,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=960x540
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer5.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3920400,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=1280x720
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer6.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=5570400,CODECS="avc1.4d4028,mp4a.40.5",RESOLUTION=1920x1080
set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer7.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=140800,CODECS="mp4a.40.2"
REM set link=http://adultswimhls-i.akamaihd.net/hls/live/238460/adultswim/main/1/master_Layer8.m3u8
set chan_name="Adult Swim"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_254
set link=http://www.dailymotion.com/video/x3m6nld
set chan_name="Fashion TV Europe"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_255
REM set link=https://dms.redbull.tv/v3/linear-borb/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjYXRlZ29yeSI6InBlcnNvbmFsX2NvbXB1dGVyIiwiY291bnRyeV9jb2RlIjoidXMiLCJleHBpcmVzIjoiMjAxNy0wOS0xNlQxNzo0NjowMy45NjM0NjI4NDJaIiwib3NfZmFtaWx5IjoiaHR0cCIsInJlbW90ZV9pcCI6IjEwLjE1Ny4xMTIuMTQ4IiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xMl81KSBBcHBsZVdlYktpdC82MDMuMi40IChLSFRNTCwgbGlrZSBHZWNrbykgVmVyc2lvbi8xMC4xLjEgU2FmYXJpLzYwMy4yLjQiLCJ1aWQiOiJkOGZiZWYzMC0yZDhhLTQwYTUtOGNjNy0wNzgxNGJhMTliNzMifQ.Q_38FNpW3so5yrA5FQt9qBuix3dTulKpb6uQ0dRjrtY/playlist.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=290400,AVERAGE-BANDWIDTH=290400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
REM set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_264.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=635800,AVERAGE-BANDWIDTH=635800,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=426x240,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
REM set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_578.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1020800,AVERAGE-BANDWIDTH=1020800,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
REM set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_928.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1826000,AVERAGE-BANDWIDTH=1826000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_1660.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3696000,AVERAGE-BANDWIDTH=3696000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
REM set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_3360.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=7326000,AVERAGE-BANDWIDTH=7326000,CODECS="avc1.4d4028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
REM set link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_6660.m3u8
REM set link="https://www.twitch.tv/redbull"
set chan_name="RED Bull TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_256
set link="http://mlblive-akc.mlb.com/ls01/mlbam/mlb_network/NETWORK_LINEAR_1/master_wired.m3u8"
set chan_name="MLB Network"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_257
set link="https://www.twitch.tv/elevensportsnext"
set chan_name="ElevenSportNext"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_258
set link="https://www.twitch.tv/geekandsundry"
set chan_name="Geek and Sundry"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_259
set link="https://www.twitch.tv/contv"
set chan_name="Con TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_260
set link="https://www.twitch.tv/shoutfactorytv"
set chan_name="Shout Factory TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_261
set link="http://247retrotv.com:1935/live/smil:247retro.smil/playlist.m3u8"
set chan_name="Retro TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_262
set link="https://adultswim-vodlive.cdn.turner.com/live/robot-chicken/stream.m3u8"
set chan_name="Robot Chicken"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_263
set link="https://www.twitch.tv/allkeyshop_tv"
set chan_name="All Key Shop"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_264
set link=https://www.twitch.tv/amouranth
set chan_name="Amouranth"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_265
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest.m3u8"

REM #EXT-X-STREAM-INF:BANDWIDTH=497952,AVERAGE-BANDWIDTH=347440,RESOLUTION=400x224,FRAME-RATE=15.000,CODECS="avc1.4D400C,mp4a.40.2"
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_85.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=761965,AVERAGE-BANDWIDTH=512458,RESOLUTION=512x288,FRAME-RATE=15.000,CODECS="avc1.4D4015,mp4a.40.2"
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_86.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=1641934,AVERAGE-BANDWIDTH=1062422,RESOLUTION=640x360,FRAME-RATE=30.000,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_81.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=3225965,AVERAGE-BANDWIDTH=2052458,RESOLUTION=960x540,FRAME-RATE=30.000,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_82.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=6217934,AVERAGE-BANDWIDTH=3922422,RESOLUTION=1280x720,FRAME-RATE=30.000,CODECS="avc1.4D401F,mp4a.40.2"
REM set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_84.m3u8
REM #EXT-X-STREAM-INF:BANDWIDTH=8857965,AVERAGE-BANDWIDTH=5572458,RESOLUTION=1920x1080,FRERAME-RATE=30.000,CODECS="avc1.4D4028,mp4a.40.2"
set link="https://etlive-mediapackage-fastly.cbsaavideo.com/dvr/manifest_83.m3u8"

set chan_name="Entertaintment Tonight Live ET USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_266
REM set link="https://content.uplynk.com/channel/2bb01dbf7c9b425db6854a4e45a57af8.m3u8"
set link="https://content-ausw1-up-vmg1.uplynk.com/channel/2bb01dbf7c9b425db6854a4e45a57af8.mpd?tc=1&ct=c&rn=2130849654&exp=1567481039&cid=2bb01dbf7c9b425db6854a4e45a57af8&sig=0a5dcc15dbdca41d843d245e21ec6c8c855e6b4168635f5f15ac6b0589cfc4d8&pbs=8fa0751fdf3949b0a40a5416d6e00148"
set chan_name="BYUTV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_267
set link=https://www.twitch.tv/tyt
set chan_name="The Young Turks TYT"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_268
set link=https://www.twitch.tv/skynyx
set chan_name="Skynyx"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_269
set link=https://www.twitch.tv/cristinascabbia
set chan_name="Cristina Scabbia"
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_269
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_270
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_271
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_272
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_273
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_274
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_275
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_276
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_277
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

REM ####################################  CANADA  ##########################################################

:CHAN_281
set link="https://cbclivedai2-i.akamaihd.net/hls/live/566968/event2/CBUT/master5.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566968/event2/CBUT/master4.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566968/event2/CBUT/master3.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566968/event2/CBUT/master2.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566968/event2/CBUT/master1.m3u8"
set chan_name="CBC Vancouver British Columbia Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_282
set link="https://cbclivedai7-i.akamaihd.net/hls/live/567240/event2/CFYK/master5.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567240/event2/CFYK/master4.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567240/event2/CFYK/master3.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567240/event2/CFYK/master2.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567240/event2/CFYK/master1.m3u8"
set chan_name="CBC Yellowknife Northwest Territories Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_283
set link="https://cbclivedai4-i.akamaihd.net/hls/live/567231/event2/CBXT/master5.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567231/event2/CBXT/master4.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567231/event2/CBXT/master3.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567231/event2/CBXT/master2.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567231/event2/CBXT/master1.m3u8"
set chan_name="CBC Edmonton Alberta Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_284
set link="https://cbclivedai4-i.akamaihd.net/hls/live/567230/event2/CBRT/master5.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567230/event2/CBRT/master4.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567230/event2/CBRT/master3.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567230/event2/CBRT/master2.m3u8"
REM set link="https://cbclivedai4-i.akamaihd.net/hls/live/567230/event2/CBRT/master1.m3u8"
set chan_name="CBC Calgary Alberta Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_285
set link="https://cbclivedai2-i.akamaihd.net/hls/live/566969/event2/CBKT/master5.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566969/event2/CBKT/master4.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566969/event2/CBKT/master3.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566969/event2/CBKT/master2.m3u8"
REM set link="https://cbclivedai2-i.akamaihd.net/hls/live/566969/event2/CBKT/master1.m3u8"
set chan_name="CBC Regina Saskatchewan Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_286
set link="https://cbclivedai6-i.akamaihd.net/hls/live/567237/event2/CBWT/master5.m3u8"
REM set link="https://cbclivedai6-i.akamaihd.net/hls/live/567237/event2/CBWT/master4.m3u8"
REM set link="https://cbclivedai6-i.akamaihd.net/hls/live/567237/event2/CBWT/master3.m3u8"
REM set link="https://cbclivedai6-i.akamaihd.net/hls/live/567237/event2/CBWT/master2.m3u8"
REM set link="https://cbclivedai6-i.akamaihd.net/hls/live/567237/event2/CBWT/master1.m3u8"
set chan_name="CBC Winnepeg Manitoba Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_287
set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master5.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master4.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master3.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master2.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master1.m3u8"
set chan_name="CBC Windsor, Ontario, Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_288
set link="https://cbclivedai1-i.akamaihd.net/hls/live/566940/event2/CBLT/master5.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566940/event2/CBLT/master4.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566940/event2/CBLT/master3.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566940/event2/CBLT/master2.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566940/event2/CBLT/master1.m3u8"
set chan_name="CBC Toronto, Ontario, Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_289
set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master5.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master4.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master3.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master2.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567235/event2/CBOT/master1.m3u8"
REM set link="http://cbcnewshd-f.akamaihd.net/i/cbcnews_1@8981/index_2500_av-p.m3u8"
set chan_name="CBC Ottawa Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_290
set link="https://cbclivedai3-i.akamaihd.net/hls/live/566976/event2/CBMT/master5.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566976/event2/CBMT/master4.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566976/event2/CBMT/master3.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566976/event2/CBMT/master2.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566976/event2/CBMT/master1.m3u8"
set chan_name="CBC Montreal, Quebec, Canada "
set /A prior_num="%chan_num%"
goto PLAY_CASE


:CHAN_291
set link="https://cbclivedai7-i.akamaihd.net/hls/live/567244/event2/CBAT/master5.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567244/event2/CBAT/master4.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567244/event2/CBAT/master3.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567244/event2/CBAT/master2.m3u8"
REM set link="https://cbclivedai7-i.akamaihd.net/hls/live/567244/event2/CBAT/master1.m3u8"
set chan_name="CBC Frederickton New Brunswick Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_292
set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master5.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master4.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master3.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master2.m3u8"
REM set link="https://cbclivedai1-i.akamaihd.net/hls/live/566941/event2/CBET/master1.m3u8"
set chan_name="CBC Charlottetown, Prince Edward Island, Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_293
set link="https://cbclivedai3-i.akamaihd.net/hls/live/566977/event2/CBHT/master5.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566977/event2/CBHT/master4.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566977/event2/CBHT/master3.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566977/event2/CBHT/master2.m3u8"
REM set link="https://cbclivedai3-i.akamaihd.net/hls/live/566977/event2/CBHT/master1.m3u8"
set chan_name="CBC Halifax Nova Scotia Canada "
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_294
set link="https://cbclivedai5-i.akamaihd.net/hls/live/567236/event2/CBNT/master5.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567236/event2/CBNT/master4.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567236/event2/CBNT/master3.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567236/event2/CBNT/master2.m3u8"
REM set link="https://cbclivedai5-i.akamaihd.net/hls/live/567236/event2/CBNT/master1.m3u8"
set chan_name="CBC St. John's Newfoundland Canada "
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_295
set link="https://glblvestu-f.akamaihd.net/i/glblvPSTu_1@80128/master.m3u8"
set chan_name="Global Vancouver CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_296
set link="https://glblvmstu-f.akamaihd.net/i/glblvMSTu_1@80127/master.m3u8"
set chan_name="Global Calgary CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_297
set link="https://glblvedmonton-lh.akamaihd.net/i/glblvEdmonton_1@119844/master.m3u8"
set chan_name="Global Edmonton CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_298
set link="https://glblvestu-f.akamaihd.net/i/glblvestu_1@78149/master.m3u8"
set chan_name="Global Toronto CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_299
set link="https://glblvhalifax-lh.akamaihd.net/i/glblvHalifax_1@119843/master.m3u8"
set chan_name="Global Halifax CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_300
set link="http://1-fss-fso35.streamhoster.com/lv_ntv/_definst_/broadcast1/chunklist.m3u8"
set chan_name="NTV Newfoundland CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_301
set link="https://teleqmmd.mmdlive.lldns.net/teleqmmd/f386e3b206814e1f8c8c1c71c0f8e748/chunklist_b2592000.m3u8"
set chan_name="TELEQUEBEC CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_302
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_400.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI CB-Yukon CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_303

REM set link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1800.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Alberta CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_304
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_2500.m3u8"
REM set EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM set EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Saskatchewan CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_305
REM link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
set chan_name="ICI Tele Saskatchewan CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_306
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
set chan_name="ICI Tele Ontario CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_307
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Ottawa-Gatineau CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_308
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master.m3u8"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_2500.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_256.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_400.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_700.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1100.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1800.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_2500.m3u8"
REM EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
set chan_name="ICI Tele Acadie CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_309
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Estrie CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_310
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Mauricie CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_311
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_2500.m3u8"
set link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_5000.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Montreal CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_312
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele  Saguenay CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_313
REM ste link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Quebec CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_314
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_256.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_400.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_700.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_1100.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
REM set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_1800.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
set link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_2500.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
REM #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"

set chan_name="ICI Tele Est-Quebec CA"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_315
set link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_2500_av-p.m3u8?sd=10&rebase=on"
REM set link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_1800_av-p.m3u8?sd=10&rebase=on"
REM set link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_700_av-p.m3u8?sd=10&rebase=on"
REM set link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_400_av-p.m3u8?sd=10&rebase=on"
REM set link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_256_av-p.m3u8?sd=10&rebase=on"
REM set link="http://cbcnewshd-f.akamaihd.net/i/cbcnews_1@8981/index_2500_av-p.m3u8"
set chan_name="CBC News Montreal Canada "
set /A prior_num="%chan_num%"
goto PLAY_CASE


REM ###########################  FRENCH II   ######################################################



REM ###############################################################################################

:CHAN_321
set link="https://www.dailymotion.com/video/x2fxcwq"
set chan_name="Generations TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_322
set link="https://www.dailymotion.com/video/x52et3w"
set chan_name="Suivez Telesud"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_323
set link="https://www.dailymotion.com/video/x630wrb"
set chan_name="VAR AZUR"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_324
set link="https://www.dailymotion.com/video/x35m6bz"
set chan_name=" VL"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_325
set link="https://www.dailymotion.com/video/xgz4t1"
set chan_name="BFM TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_326
set link="https://www.dailymotion.com/video/x6nhqs0"
set chan_name="8 Mont Blanc Live 2"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_327
set link="https://www.dailymotion.com/video/x128fjo"
set chan_name="téléGrenoble Isère"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_328
set link="https://www.dailymotion.com/video/x2tzzpj"
set chan_name="RTL2 "
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_329
set link="https://www.dailymotion.com/video/x10990v"
set chan_name="OUI FM"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_330
set link="https://www.dailymotion.com/video/x6cq41k"
set chan_name="D24TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_331
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_332
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_333
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!

:CHAN_334
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!
REM ###################################  FILMON TV ################################################################

:CHAN_361
set link="https://www.filmon.com/tv/bbc-one" 
set chan_name="BBC ONE" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_362
set link="https://www.filmon.com/tv/bbc-news"
set chan_name="BBC NEWS" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_363
set link="https://www.filmon.com/tv/bbc-1-wales"
set chan_name="BBC 1 Wales" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_364
set link="https://www.filmon.com/tv/bbc-1-scotland"
set chan_name="BBC 1 Scotland" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_365
set link="https://www.filmon.com/tv/bbc-1-north-ireland"
set chan_name="BBC 1 North Ireland" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_366
set link="https://www.filmon.com/tv/bbc-two"
set chan_name="BBC TWO" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_367
set link="https://www.filmon.com/tv/bbc-parliament"
set chan_name="BBC Parliament" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_368
set link="https://www.filmon.com/tv/cbeebiesbbc-four"
set chan_name="BBC Four" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_369
set link="https://www.filmon.com/tv/itv1"
set chan_name="BBC Four" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_370
set link="https://www.filmon.com/tv/itv-plus-1"
set chan_name="ITV + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_371
set link="https://www.filmon.com/tv/itv2"
set chan_name="ITV + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_372
set link="https://www.filmon.com/tv/itv2-plus-1"
set chan_name="ITV 2 + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_373
set link="https://www.filmon.com/tv/itv3"
set chan_name="ITV 2 + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_374
set link="https://www.filmon.com/tv/itv3-plus-1"
set chan_name="ITV 3 + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_375
set link="https://www.filmon.com/tv/itv4"
set chan_name="ITV 4" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_376
set link="https://www.filmon.com/tv/itv4-plus-1"
set chan_name="ITV 4 + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_377
set link="https://www.filmon.com/tv/itvbe"
set chan_name="ITV Be" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_378
set link="https://www.filmon.com/tv/channel-4"
set chan_name="Channel 4" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_379
set link="https://www.filmon.com/tv/e4"
set chan_name="E4" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_380
set link="https://www.filmon.com/tv/more4"
set chan_name="More4" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_381
set link="https://www.filmon.com/tv/channel-5"
set chan_name="Channel 5" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_382
set link="https://www.filmon.com/tv/5-star"
set chan_name="5\*" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_383
set link="https://www.filmon.com/tv/5usa"
set chan_name="5 USA" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_384
set link="https://www.filmon.com/tv/really"
set chan_name="Really" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_385
set link="https://www.filmon.com/tv/yesterday"
set chan_name="Yesterday" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_386
set link="https://www.filmon.com/tv/pick-tv"
set chan_name="Pick TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_387
set link="https://www.filmon.com/tv/cbs-reality"
set chan_name="CBS Reality" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_388
set link="https://www.filmon.com/tv/cbs-reality1"
set chan_name="CBS Reality + 1" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_389
set link="https://www.filmon.com/tv/cbs-drama"
set chan_name="CBS Drama" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_390
set link="https://www.filmon.com/tv/cbs-action"
set chan_name="CBS Action" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_391
set link="https://www.filmon.com/tv/tru-tv"
set chan_name="TruTV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_392
set link="https://www.filmon.com/tv/fusionplus"
set chan_name="FusionPlus TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_393
set link="https://www.filmon.com/tv/forces-tv"
set chan_name="Forces TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_394
set link="https://www.filmon.com/tv/challenge"
set chan_name="Challenge " 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_395
set link="https://www.filmon.com/tv/pick-tv"
set chan_name="Pick TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_396
set link="https://www.filmon.com/tv/v-channel"
set chan_name="V Channel" 
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_397
set link="https://www.filmon.com/tv/reality-tv"
set chan_name="Really TV" 
set /A prior_num="%chan_num%"
goto PLAY_CASE  
:CHAN_398
set link="https://www.filmon.com/tv/my-face-my-body "
set chan_name="My Face My Body " 
set /A prior_num="%chan_num%"
goto PLAY_CASE  

:CHAN_399
set link="https://www.filmon.com/tv/dr-fab-show"
set chan_name="Dr. Fab Show" 
set /A prior_num="%chan_num%"
goto PLAY_CASE
  
:CHAN_400
set link="https://www.filmon.com/tv/drama"
set chan_name="Drama" 
set /A prior_num="%chan_num%"
goto PLAY_CASE  
 
REM ####################################RELIGIOUS PROGRAMS #########################################################
:CHAN_441
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409283781001
set chan_name="EWTN English"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_442
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409261120001
set chan_name="EWTN Ireland"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_443
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409267772001
set chan_name="EWTN Africa"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_444
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5405034951001
set chan_name="EWNT Asia"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_445

set link="https://zm6gdaxeyn93-hls-live.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/chunks.m3u8"

REM set link="https://livestream.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/tracks-v1a1/index.m3u8"
REM set link="https://livestream.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/index.m3u8"
REM #EXT-X-STREAM-INF:CLOSED-CAPTIONS=NONE,RESOLUTION=1280x720,FRAME-RATE=29.970,CODECS="avc1.64001f,mp4a.40.2",AVERAGE-BANDWIDTH=1712766,BANDWIDTH=2140957
REM set link="https://livestream.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/tracks-v1a1/tracks-v1a1/mono.m3u8"
set chan_name="Salt and Light TV Canada"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_446
REM set link=http://catholictvhd-lh.akamaihd.net:80/i/ctvhd_1@88148/master.m3u8
REM set link=http://catholictvhd-lh.akamaihd.net:80/i/ctvhd_1@88148/index_1_av-p.m3u8 
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=645000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_5_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=646000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_5_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_4_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_4_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1296000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_3_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1296000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_3_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1896000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_2_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1896000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_2_av-b.m3u8?sd=10&rebase=on"
REM EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2496000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_1_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2496000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://catholictvhd-lh.akamaihd.net/i/ctvhd_1@88148/index_1_av-b.m3u8?sd=10&rebase=on"
set chan_name="Catholic TV"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_447
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409267805001
set chan_name="EWTN Espanol"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_448
set link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409283775001
set chan_name="EWTN Deutsche"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_449
REM set link=http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/master.m3u8
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x178,CODECS="avc1.66.30, mp4a.40.2"
REM set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x178,CODECS="avc1.66.30, mp4a.40.2"
REM set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_300_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_800_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_800_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=720x404,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_1200_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=720x404,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_1200_av-b.m3u8?sd=10&rebase=on"
set chan_name="KTO Cahtolique"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_450
REM set link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam.mpd"
REM set link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=646449,RESOLUTION=426x240,CODECS="avc1.4D4015,mp4a.40.2"
REM set link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_1.m3u8"
REM EXT-X-STREAM-INF:BANDWIDTH=1240417,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
REM set link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_2.m3u8"
REM #EXT-X-STREAM-INF:BANDWIDTH=1900417,RESOLUTION=854x480,CODECS="avc1.4D401E,mp4a.40.2"
set link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_3.m3u8"
set chan_name="TRWAM Poland"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_451
set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/master.m3u8"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_1200_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_1200_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2064000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_2000_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2064000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_2000_av-b.m3u8?sd=10&rebase=on"
set chan_name="CBN"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_452
REM set link=http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/master.m3u8
REM EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_150_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_150_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_500_av-b.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_900_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
REM set link="http://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_900_av-b.m3u8?sd=10&rebase=on"
set chan_name="CBN News"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_453
set link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/playlist.m3u8"

set chan_name="International House of Prayer IHOP"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_454
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_800_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1496000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
set link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_1400_av-p.m3u8?sd=10&rebase=on"
set chan_name="LLBN His Word"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_455
set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&set-akamai-hls-revision=5&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_700_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:BANDWIDTH=522665,RESOLUTION=320x240,CODECS="avc1.42001e, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_300_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
REM #EXT-X-STREAM-INF:BANDWIDTH=1102504,RESOLUTION=480x360,CODECS="avc1.42001e, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_700_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
REM #EXT-X-STREAM-INF:BANDWIDTH=1462188,RESOLUTION=640x480,CODECS="avc1.42001e, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
set chan_name="LLBN Smart Lifestyle"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_456
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_300_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_500_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
REM set link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_800_av-p.m3u8?sd=10&rebase=on"
REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1496000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
set link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_1400_av-p.m3u8?sd=10&rebase=on"
set chan_name="LLBN His Light"
set /A prior_num="%chan_num%"
goto PLAY_CASE

:CHAN_457
set chan_name="Wrap Around"
set /A menu_num=0
set /A prior_num="%chan_num%"
set /A chan_num=1
goto MENU_!menu_num!


:CHAN_458
set chan_name="UNASSIGNED"
set /A prior_num="%chan_num%"
goto MENU_!menu_num!



REM ####################################################################################################

:PLAY_CASE
TITLE %PRODUCT% %chan_name% on Channel %chan_num%

ECHO Playing %chan_name% on Channel %chan_num%

IF !MODE!=="VIDEO" ( 
mpv --fs --fs-screen=%screen_num% --resume-playback=no --loop-playlist=inf %link%
) ELSE IF !MODE!=="AUDIO" ( 
mpv --fs --fs-screen=%screen_num% --resume-playback=no --loop-playlist=inf --no-video %link%
) ELSE IF !MODE!=="NOAUDIO" ( 
mpv --fs --fs-screen=%screen_num% --resume-playback=no --loop-playlist=inf --no-audio %link%
) ELSE (
mpv --fs --fs-screen=%screen_num% --resume-playback=no --loop-playlist=inf %link%
)

ECHO You were watching %chan_name% on Channel %chan_num%

goto MENU_!menu_num!

:END_OF_PROGRAM
ECHO TYPE WINSTREAM TO START AGAIN: BYE FOR NOW!
REM ## SET THE TITLE
REM ## CHANGE PROMPT
PROMPT $P$G
TITLE CMD %DATE%
REM ## CHANGE THE COLOUR BACK
COLOR 07

ENDLOCAL

REM ####################################   END OF PROGRAM #####################################################
