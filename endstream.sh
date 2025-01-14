#! /bin/bash
######################################################################
# Title: endstream.sh
# Description:  Clearnet streaming from youtube of selected news
#               stations using mpv and youtube-dl
# Author: The Endware Development Team
# Copyright: 2017-2023, The Endware Development Team,
# All Rights Reserved
# Creation Date: February 22, 2017
# Version: 0.63594
# Revision Date: January 07, 2024
#####################################################################
# Dependencies: youtube-dl, mpv, streamlink, read , curl, sed, awk, grep
#####################################################################
# Instructions:  make a directory ~/bin and copy this file there, add this to the $PATH
#                then make the file executable and run it.
# $ mkdir ~/bin
# $ cp endstream.sh ~/bin/endstream
# $ cd ~/bin
# $ chmod u+wrx endstream
# $ export PATH=~/bin:"$PATH"
#
# Run ENDSTREAM
# $ endstream
#
####################################################################
#############################################################################################################################################################################
#                                         ACKNOWLEDGMENTS
#############################################################################################################################################################################
#  The Endware Development Team would like to acknowledge the work and efforts of OdiliTime, Balrog and SnakeDude who graciously hosted and promoted this software project.
#  We would also like to acknowledge the work and efforts of Stephen Lynx, the creator and maintainer of LynxChan.
#  Without their efforts and their wonderful web site www.endchan.xyz, The Endware Suite would not exist in the public domain at all in any form.
#
#  So thanks to OdiliTime, Balrog, SnakeDude, and Stephen Lynx for inspiring this work and for hosting and promoting it.
#
#  The Endware Suite including Endwall,Endsets,Endlists,Endtools,Endloads and Endtube are named in honor of Endchan.
#
#  The Endware Suite is available for download at the following locations:
#  https://gitgud.io/Endwall/ , https://github.com/endwall2/, https://www.endchan.xyz/os/, http://42xlyaqlurifvvtq.onion,
#
#  Special thanks to the designer of the current EndWare logo which replaces the previous logo. It looks great!
#  Thank you also to early beta testers including a@a, and to other contributors including Joshua Moon (for user_agents.txt split and other good suggestions)
#  as well as to the detractors who helped to critique this work and to ultimately improve it.
#
#  We also acknowledge paste.debian.net, ix.io, gitgud and github for their hosting services,
#  without which distribution would be limited, so thank you.
#
#  https://www.endchan.xyz, http://paste.debian.net, https://gitgud.io, https://github.com, http://ix.io
#
#  We salute you!
#
#  In the end, may it all end well.
#
#  The Endware Development Team
##############################################################################################################################################################################
##############################################################################################################################################################################
#                                                              LICENSE AGREEMENT  
##############################################################################################################################################################################
#  BEGINNING OF LICENSE AGREEMENT
#  TITLE:  THE ENDWARE END USER LICENSE AGREEMENT (EULA) 
#  CREATION DATE: MARCH 19, 2016
#  VERSION: 1.19
#  VERSION DATE: JUNE 23, 2022
#  COPYRIGHT: THE ENDWARE DEVELOPMENT TEAM, 2016-2018
#  ALL RIGHTS RESERVED  
#    
#  WHAT CONSTITUTES "USE"? WHAT IS A "USER"?
#  0) a) Use of this program means the ability to study, possess, run, copy, modify, publish, distribute and sell the code as included in all lines of this file,
#        in text format or as a binary file constituting this particular program or its compiled binary machine code form, as well as the the performance 
#        of these aforementioned actions and activities. 
#  0) b) A user of this program is any individual who has been granted use as defined in section 0) a) of the LICENSE AGREEMENT, and is granted to those individuals listed in section 1.
#  WHO MAY USE THIS PROGRAM ?
#  1) a) This program may be used by any living human being, any person, any corporation, any company, and by any sentient individual with the willingness and ability to do so.
#  1) b) This program may be used by any citizen or resident of any country, and by any human being without citizenship or residency.
#  1) c) This program may be used by any civilian, military officer, government agent, private citizen, government official, sovereign, monarch, head of state,
#        dignitary, ambassador, legislator,congressional representative, member of parliament, senator, judicial official, judge, prosecutor, lawyer, law enforcement officer, 
#        police constable, noble, commoner, clergy, laity, and generally all classes and ranks of people, persons, and human beings mentioned and those not mentioned.
#  1) d) This program may be used by any human being of any sex or gender, including men, women, or any other sex, or gender not mentioned.       
#  1) e) This program may be used by any human being of any affiliation, political viewpoint, political affiliation, religious belief, religious affiliation, and by those of non-belief or non affiliation.
#  1) f) This program may be used by any human being of any race, ethnicity, identity, origin, genetic makeup, physical appearance, mental ability, and by those of any other physical 
#        or non physical characteristics of differentiation.
#  1) g) This program may be used by any human being of any sexual orientation, including heterosexual, homosexual, bisexual, asexual, or any other sexual orientation not mentioned.
#  1) h) This program may be used by all business classes and business entities, including corporations, limited liability companies, sole proprietorships, partnerships, joint venture companies, private companies, publicly owned companies, and any other business class not specifically mentioned. 
#  1) i) This program may be used by anyone. 
#  WHERE MAY A USER USE THIS PROGRAM ?
#  2) a) This program may be used in any country, in any geographic location of the planet Earth, in any marine or maritime environment, at sea, sub-sea, in a submarine, underground,
#        in the air, in an airplane, dirigible, blimp, or balloon, in a car, bus, motor vehicle, train, armored transport vehicle, and at any distance from the surface of the planet Earth, including in orbit about the Earth, the Moon, or the planet Mars,
#        on a satellite orbiting about the Earth, the Moon, the planet Mars, and about any Solar System planet and its moons, on any space transport vehicle, and anywhere in the Solar System including the Moon, Mars, and all other Solar System planets not listed.  
#  2) b) This program may be used in any residential, commercial, business, and governmental property or location and in all public and private spaces. 
#  2) c) This program may be used anywhere.
#  IN WHAT CONTEXT OR CIRCUMSTANCES MAY A USER USE THIS PROGRAM?
#  3)  This program may be used by any person, human being or sentient individual for any purpose and in any context and in any setting including for personal use, academic use,
#      business use, commercial use, government use, non-governmental organization use, non-profit organization use, military use, civilian use, and generally any other use 
#      not specifically mentioned.
#  WHAT MAY A "USER" DO WITH THIS PROGRAM ?
#  4) Any user of this program is granted the freedom to read and study the code.
#  5) a) Any user of this program is granted the freedom to distribute, publish, and share the code with any recipient of their choice electronically or by any other method of transmission. 
#  5) b) The LICENCSE AGREEMENT, ACKNOWLEDGMENTS, Header and Instructions must remain attached to the code in their entirety when re-distributed.
#  5) c) Any user of this program is granted the freedom to sell this software as distributed or to bundle it with other software or saleable goods.
#  6) a) Any user of this program is granted the freedom to modify the code.
#  6) b) When modified, any user of this program is granted the freedom of re-distribution of their modified code if and only if the user attatchs the LICENSE AGREEMENT
#        in its entirety to their modified code before re-distribution.
#  6) c) Any user of this software is granted the freedom to sell their modified copy of this software or to bundle their modified copy with other software or saleable goods.
#  6) d) Any modified code shall be sublicensed by the modifier and distributor only under the original terms of the Endware End User License Agreement as presented in this LICENSE AGREEMENT.
#  6) e) Any user of this software agrees that any derivative works produced as a result of user modification will be sublicensed when re-distributed under the original terms of this LICENSE AGREEMENT exactly as presented.
#  7) a) Any user of this program is granted the freedom to run this code on any computer of their choice.
#  7) b) Any user of this program is granted the freedom to run as many simultaneous instances of this code, on as many computers as they are able to and desire, and for as long as they desire and are
#        able to do so with any degree of simultaneity in use. 
#  WHAT MUST A "USER" NOT DO WITH THIS PROGRAM ?
#  8) Any user of this program is not granted the freedom to procure a patent for the methods presented in this software, and agrees not to do so.
#  9) Any user of this program is not granted the freedom to arbitrarily procure a copyright on this software as presented, and agrees not to do so.
#  10) Any user of this program is not granted the freedom to obtain or retain intellectual property rights on this software as presented and agrees not to do so.
#  11) a) Any user of this program may use this software as part of a patented process, as a substitutable input into the process; however the user agrees not to attempt to patent this software as part of their patented process. 
#  11) b) This software is a tool, like a hammer, and may be used in a process which applies for and gains a patent, as a substitutable input into the process;
#         however the software tool itself may not be included in the patent or covered by the patent as a novel invention, and the user agrees not to do this and not to attempt to do this.
#  12) a) Any user of this program is not granted the freedom to remove, replace, alter or modify the LICENSE AGREEMENT, ACKNOWLEDGMENTS, or the Header and Instructions from the file, if being re-distributed without modification of the program code. 
#         The LICENSE AGREEMENT, ACKKNWLEGEMENTS and Header and Instructions sections must remain attached to the code in their entirety when re-distributed without modification. 
#      b) If the code is moodified, by a user, as permitted and allowed under section 6) a),b),c),d),e) of this LICENSE AGREEMENT, then 
#         the user of this program who made the program code modifications may modify or alter the ACKNKOWLEGEMENTS, or the Header and Instructions sections to document these new modifications and their authorship, and to acknowledge any asistance in doing so, 
#         however, these user modifiers are not granted the freedom to removem, replace, alter or modify the LICENSE AGREEMENT which must remain attached to the code in their entirety when re-distributed without modification.
#  WHO GRANTS THESE FREEDOMS ?
#  13) The creators of this software are the original developer,"Endwall", and anyone listed as being a member of "The Endware Development Team" by "Endwall", as well as ancillary contributors, and user modifiers and developers of the software. 
#  14) The aforementioned freedoms of use listed in sections 4),5),6),and 7) are granted by the creators of this software and the Endware Development Team to any qualifying user listed in section 1) and 
#      comporting with any restrictions and qualifications mentioned in sections 2), 3), 8), 9), 10) and 11) of this LICENSE AGREEMENT.
#  WHAT RELATIONSHIP DO THE USERS HAVE WITH THE CREATORS OF THE SOFTWARE ?
#  15)  This software is distributed "AS IS" without any warranty and without any guaranty and the creators do not imply anything about its usefulness or efficacy.
#  16)  If the user suffers or sustains financial loss, informational loss, material loss, physical loss or data loss as a result of using, running, or modifying this software 
#       the user agrees that they will hold the creators of this software, "The Endware Development Team", "Endwall", and the programmers involved in its creation, free from prosecution, 
#       free from indemnity, and free from liability, and will not attempt to seek restitution, compensation, or payment for any such loss real or imagined.
#  17)  If a user makes a significant improvement to this software, and if this improvement is included in a release, the user agrees not to seek remuneration or payment 
#       from the creators of this software or from Endwall or from the Endware Development Team, for any such work contribution performed, and the user understands 
#       that there will be no such remuneration or payment rendered to them for any such contribution. 
#  END OF LICENSE AGREEMENT
##################################################################################################################################################################################
#  ADDITIONAL NOTES:
#  18)  If a user finds a significant flaw or makes a significant improvement to this software, please feel free to notify the original developers so that we may also
#       include your user improvement in the next release; users are not obligated to do this, but we would enjoy this courtesy tremendously.
#
#  19)  Sections 0) a) 0) b) and 1) a) are sufficient for use; however sections 1) b) through 1) i) are presented to clarify 1 a) and to enforce non-discrimination and non-exclusion of use.  
#       For example some people may choose to redefine the meaning of the words "person" "human being" or "sentient individual" to exclude certain types of people.
#       This would be deemed unacceptable and is specifically rejected by the enumeration presented.  If the wording presented is problematic please contact us and suggest a change,
#       and it will be taken into consideration.  
#################################################################################################################################################################################

######################################## BEGINNING OF PROGRAM    ##########################################################

###############  VERSION INFORMATION  ##############
version="0.63594"
rev_date="07/01/2025"
branch="gnu/linux"
product="ENDSTREAM"
##########################################################
max_menu=7
max_chan=1930
##################################################..
temp_pl="$HOME/tmp/master.m3u8"
USERAGENTS="$HOME/bin/user_agents.txt"
chan_columns="$HOME/bin/streams.txt"
cookie="$HOME/bin/cookies.txt"
cache_size="4096"
use_cookies="no"
audio_track="1"
# define the current tor browser user agent
UA_torbrowser="Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101 Firefox/60.0"
# define default headers
HEAD1="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
HEAD2="Accept-Language: en-US,en;q=0.5"
HEAD3="Accept-Encoding: gzip, deflate"
HEAD4="Connection: keep-alive"
HEAD5="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7"

uamode="off"
headmode="off"
#uamode="on"
#headmode="on"

#http_proxy_port=3128
#http_proxy_ip=192.168.2.5

torsocks_ip=127.0.0.1
#torsocks_ip=192.168.2.5
torsocks_port=9050

screen_num=1
fs_screen_num=1
#######################################################################
### Define function for displaying channels  CHANGE MENU HERE
channel_matrix_0()
{
   echo "============================================================ "$product" "$version" page:"$men_num" =========================================================================="
   echo "||     ENGLISH        ||    ENGLISH II    ||     FRANCAIS      ||      ESPANOL     ||      EAST EUROPE      ||   SOUTH EUROPE/TURK      ||  ARABIC/FARSI/Pashtun/||"
   echo "============================================================================================================================================================="
   echo "1)CBSN USA            41)VOA USA          81)France 24 FR      121)RT Espanol       161)WDR DE            201)QVC Italian               241)RT Arabic"
   echo "2)NBC News Live       42)CBC Explore      82)BFM TV FR         122)DW Espanol       162)DW Deutsch        202)Mediaon BergamoTV IT      242)France 24 Arabic"
   echo "3)ABC News USA        43)RT Documentary   83)BFM Business FR   123)CGTN Espanol     163)ZDK InfoKanal     203)Radio TV Rome IT          243)BBC Arabic"
   echo "4)Bloomberg USA       44)CGTN Documentary 84)RT France         124)France24 Espanol 164)Tagesschau/MOMA DE204)RTM Arcevia IT            244)DW Arabic"
   echo "5)Newsy USA           45)CBC CA           85)France Info TV    125)TeleSUR VE       165)RT DE             205)Udinese IT                245)CGTN Arabic"
   echo "6)Cheddar News        46)CPAC 1 CA        86)CGTN Francais     126)Hispan TV IR     166)QVC DE            206)50NewsVersiliaViareggio IT246)Al Jazeera QA"
   echo "7)CBC NewsNet CA      47)DC Network       87)Africa News       127)Malaga TV ES     167)ADR Alpha DE      207)50 Canale Pisa IT         247)Al Jazeera Mubasher QA"
   echo "8)Global News CA      48)DC Capitol       88)RDI ICI CA        128)C5N AR           168)Radio 21 DE       208)Teleliberta Piacenza IT   248)Al Arabiya AE"
   echo "9)CityNews East CA    49)DC Knowledge     89)ICI Tele AB CA    129)AcequiaMendozaAR 169)DW Deutsch + DE   209)Top News Albania          249)Al Mayadeen LB"
   echo "10)CityNews West CA   50)MNN HD NY USA    90)TVA CA            130)Todo Noticias AR 170)Baden TV DE       210)Star Lamia GR             250)Belqees TV YE"
   echo "11)TeleSUR Eng VE     51)MNN 1 NY USA     91)France 2          131)La Nacion AR     171)W24 Wein AT       211)Action 24 GR              251)Sky Arabic AE"
   echo "12)Euronews EN        52)MNN 2 NY USA     92)France 3          132)A24 AR           172)Tirol TV AT       212)TRT Haber TR              252)Alghad EG"
   echo "13)GB News            53)MNN 3 NY USA     93)ARTE Francais     133)KZO AR           173)Musig24 CH        213)NTV TR                    253)Extra News EG"
   echo "14)France 24 EN       54)MNN 4 NY USA     94)IL TV FR          134)Canal 2 AR       174)RTL LU            214)HaberTurk TV              254)CBC Sofra EG"
   echo "15)DW English         55)BronxNet NY USA  95)BFM Paris FR      135)TV5 AR           175)TV OOST BE        215)Star TV TR                255)CBC Drama EG"
   echo "16)Russia Today EN    56)BronxNet Culture 96)Alsace 20 FR      136)Canal 7 AR       176)RTV OOST NL       216)KRT Kulture TR            256)DMC Live EG"
   echo "17)TRT World TK       57)BronxNet Life    97)Mosaik TV FR      137)Canal 13 AR      177)AT5 NL            217)TGRT Haber TR             257)AFAQ TV IQ"
   echo "18)i24 News IL        58)BronxNet Omni    98)La Vendee         138)CN23 AR          178)Euronews Russian  218)TVNET Canali TR           258)BBC Persian"
   echo "19)Al Jazeera QA      59)LUTV             99)8 Monte Blanc FR  139)Telemax AR       179)POCCNR 24 RU      219)Show TV TR                259)Iran Aryaee"
   echo "20)Press TV IR        60)Southeastern TV  100)TV7 Bordeaux FR  140)Vorterix AR      180)RBC TV RU         220)-------------             260)DidgahNew TV IR"
   echo "21)WION IN            61)Texas State TV   101)teleGrenoble     141)TV Publica AR *  181)CGTN Russian      221)-------------             261)PTN PARS TV USA"
   echo "22)India Today        62)Temple U TUTV    102)LCP FR           142)Mega CL          182)Vesti FM RU       222)-------------             262)TOLO NEWS AF"
   echo "23)CGTN CN            63)Bloomberg AU     103)Public Senate FR 143)Telemedeline CO  183)Perviy RU         223)-------------             263)KSA 1 SA"
   echo "24)Arirang KR         64)Bloomberg EU     104)CPAC 1 CA        144)Telecafe CO      184)Current Time VOA  224)-------------             264)KSA Sports SA"
   echo "25)NHK World JP       65)Bloomberg Charts 105)Assemblee QC CA  145)Globovision VE   185)5 Live RU         225)-------------             265)KSA Sports 2 SA"
   echo "26)CNA SG             66)CBSN NY USA      106)BX1 BE           146)VPItv VE         186)News 24 UA        226)-------------             266)KSA Quaran SA"
   echo "27)ABC AU             67)CBSN LA USA      107)France Info      147)TeleDiario MX    187)UA TV UA          227)-------------             267)KSA Sunna SA"
   echo "28)Ticker News AU     68)CBSN Bay Area    108)CNEWS FR         148)Excelsior MX *   188)News 1 UA         228)-------------             268)KSA Al Ekhbariya SA"
   echo "29)Arise News NG      69)CBSN Boston      109)RTL BE           149)Brighteon ES     189)UA 5  UA          229)-------------             269)KSA Zikrayat SA"
   echo "30)Africa News Eng    70)CBSN Chicago     110)RTL 2 BE         150)-------------    190)TV Publica Moldova230)-------------             270)KSA SBC SA"
   echo "31)United Nations TV  71)CBSN Dallas      111)Europe 1 FR      151)-------------    191)RT Docs RU        231)-------------             271)KSA Saudi Radio SA"
   echo "32)Free Speech TV     72)CBSN Denver      112)RTL BE           152)-------------    192)Thromadske UA *   232)-------------             272)KSA Jedha Radio SA"
   echo "33)NEWSMAX USA        73)CBSN Minnesota   113)France Inter FR  153)-------------    193)Espresso UA  *    233)-------------             273)KSA Rhiyad Radio SA"
   echo "34)Infowars Live      74)CBSN Philadelphia114)RMC INFO FR      154)-------------    194)-------------     234)-------------             274)KSA Quaran Radio SA"
   echo "35)American Journal   75)CBSN Pittsburgh  115)Azur TV Nice     155)-------------    195)-------------     235)-------------             275)I24 Arabic"
   echo "36)Infowars WarRoom   76)CBSN Sacramento  116)Press TV FR      156)-------------    196)-------------     236)-------------             276)I24 Hebrew"
   echo "37)FrankSpeech TV 1   77)CBSN Baltimore   117)MB TV Monte Blanc157)-------------    197)-------------     237)-------------             277)------------"
   echo "38)FrankSpeech TV 2   78)CBSN Miami       118)OUATCH TV        158)-------------    198)-------------     238)-------------             278)------------"
   echo "39)FrankSpeech TV 3   79)CNN Fast Int     119)I24 Francais     159)-------------    199)-------------     239)-------------             279)------------"
   echo "40)Brighteon TV       80)CNN Headlines    120)--------------   160)Euronews ES *    200)Euronews DE *     240)-------------             280)------------"
   echo "=========================================================================================================================================================="
  
}                    

channel_matrix_1()
{
   echo "============================================================ "$product" "$version" page:"$men_num" ======================================================================"
   echo "||      INDIAN      ||     ASIA        || SOUTH ASIA / AFRICA ||        EXTRA       ||     ENTERTAINMENT    ||    RELIGIOUS  I    ||      RELIGIOUS II     ||"
   echo "============================================================================================================================================================"
   echo "281)SAMAA PK         321)CCTV 4 China   361)DZMM ABS-CBN      401)RSBN Auburn USA    441)V2Beats TV         481)Vatican Media     521)Vatican Media Eng"
   echo "282)-------------    322)ECB 51 TW *    362)PTV Philippines   402)NBC 2 Florida      442)DanceStar TV       482)EWTN Americas     522)Vatican Deutsch"
   echo "283)-------------    323)ECB Finance TW*363)NET TV Jakarta ID*403)PBS NewsHour       443)Classic ARTS       483)EWTN Ireland      523)Vatican Italiano"
   echo "284)-------------    324)TTV TW         364)--------------    404)CBC The National   444)CMC                484)EWTN Africa       524)Temple Institute"
   echo "285)-------------    325)CTV TW         365)--------------    405)AP Top Stories     445)TCN                485)EWTN Asia         525)TBN "
   echo "286)NDTV Profit      326)FTV TW         366)--------------    406)Democracy Now      446)Ditty TV           486)Salt&Light TV     526)TBN UK "
   echo "287)Shaski India     327)CTS World TW*  367)VietTV VN  *      407)Reuters TV         447)RED BULL TV        487)EWTN Canada       527)Hillsong TV "
   echo "288)SunNews          328)SET News TW*   368)VietSky USA       408)NDTV IN            448)CBS Sports HQ      488)Catholic TV       528)TCI Italian   "
   echo "289)TV9 India        329)CTI TW         369)--------------    409)--------------     449)Sorgatron          489)Shalom USA        529)Enlace Latino "
   echo "290)Rajya Sabha      330)SET iNews TW*  370)Earthquake 24 JP  410)--------------     450)Toku Shout Su      490)Shalom World      530)Salsa "
   echo "291)TV9 Gujarat      331)Formosa TW     371)Arirang News TV * 411)CBC Comedy         451)Talking Tom        491)Shalom Europe     531)SMILE  "
   echo "292)-------------    332)TzuChi DaAi TW 372)Arirang TV KR     412)CBC Olympic        452)PJ Masks           492)EWTN Espanol      532)JUCE TV  "
   echo "293)-------------    333)DaAiVideo TW   373)BSC 24 2 JP       413)CBC Olympic 2      453)--------------     493)EWTN Deutsch      533)Nejat "
   echo "294)Aaj Tak          334)DaAi Live TW   374)--------------    414)QVC UK             454)--------------     494)KtO Catholique    534)Al Horreya "
   echo "295)NTV Telugu       335)Sinda TV  *    375)--------------    415)QVC 1 USA          455)--------------     495)TRWAM PL          535)EJTV "
   echo "296)ABN Telugu       336)CTS 2 TW  *    376)--------------    416)TSC CA             456)--------------     496)CBN               536)Shalom Kids "
   echo "297)Vanitha TV       337)SJTV TW        377)--------------    417)QVC 2 USA          457)--------------     497)CBN News          537)VTNTV Arkansas"
   echo "298)-------------    338)LLBN Chinese*  378)Africa News *     418)QVC 3 USA          458)--------------     498)NRB               538)St Patrick Dumbarton"
   echo "299)India TV IN      339)SDTV TW   *    379)Africa24          419)QVC 4 USA          459)--------------     499)Trinity Channel   539)Providence TV"
   echo "300)-------------    340)FANS TV TW     380)SIKKA Afrique*    420)HSN                460)-------------      500)IHOP              540)------------"
   echo "301)i News Telugu    341)Hong Kong TV*  381)Channels 24 NG    421)HSN 2              461)--------------     501)Amazing Facts     541)------------"
   echo "302)-------------    342)OnTV HK CN     382)TVC News NG       422)QVC5               462)--------------     502)It's Supernatural 542)-------------"
   echo "303)DD News          343)GET TV USA *   383)NTV Uganda UG     423)QVC6               463)--------------     503)Shepherd's Chapel 543)-------------"
   echo "304)REPORTER LIVE    344)KCTV KP        384)SPARK UG  *       424)--------------     464)--------------     504)BVOVN             544)------------"
   echo "305)AsiaNet News     345)Arirang Korea  385)EbruTV KE  *      425)CGTN Israel Live   465)--------------     505)3ABN              545)------------"
   echo "306)-------------    346)TBS KR   *     386)KTN Kenya KE *    426)NBC Dateline       466)--------------     506)3ABN Latino       546)------------"
   echo "307)Aaj Tak IN       347)YTN DMB KR     387)KTN Home KE *     427)Bloomberg BNN      467)Cherie Lorraine    507)3ABN Francais     547)------------"
   echo "308)ETV AndhraPradesh348)YTN Sci KR     388)Joy News GH  *    428)Overcomers TV      468)Alia_ASMR          508)LLBN SmartLife    548)------------"
   echo "309)News 18 Tamil    349)Channel 23 KR  389)ADOM GH           429)ROGERS TV Ottawa   469)SharonQueen Kick   509)LLBN His Word     549)------------"
   echo "310)Jaya Plus        350)KBS World24 KR*390)Bukedde TV GH     430)ROGERS TV Kitchner 470)Amouranth Kick     510)LLBN His Light    550)-------------"
   echo "311)TEZ TV           351)YTN 27 KR      391)EBC ET   *        431)OMNI TV East       471)Amouranth Twitch   511)LLBN Latino TV    551)-------------"
   echo "312)Dili Aaj Tak     352)CGNTV *        392)Walf SN           432)OMNI TV West       472)Mirys              512)Salt and Light    552)-------------"
   echo "313)Derana LK        353)LLBN Korean TV*393)EriTV ER  *       433)OMNI TV Praries    473)Leynainu           513)Harbor Light      553)CBC News Yellowknife"
   echo "314)Swarnavahini LK  354)YTV USA        394)SABC ZA *         434)OMNI TV Quebec     474)Katrine            514)St. Mary's Coptic 554)CBC News Toronto"
   echo "315)Kalaignar News   355)Atlanta AM790* 395)ITV ZA *          435)Brigtheon Radio    475)Foxenkin           515)Word of God Greek 555)CBC News Ottawa"
   echo "316)Sangat UK        356)ANN24 JP       396)Parliament ZA*    436)Speakfree Radio    476)SharonQueen        516)Shalom America    556)CBC News Montreal"
   echo "317)-------------    357)Sol!ve 24 JP   397)D24   *           437)AMI Radio          477)IJenz              517)Shalom India      557)CBC News Windsor"
   echo "318)NTV Bangladesh   358)KBS 24 JP      398)Afrique Media     438)VOA Radio          478)Akuasmr            518)Powervision TV    558)CBC News Igalaaq Nunavut"
   echo "319)ATN Bangladesh   359)QVC Japan      399)DMB               439)i24 News IL        479)Violletta_PurPur   519)LLBN Arabic       559)CBC Olympic"
   echo "320)-------------    360)BSC 24 1 JP    400)--------------    440)NYXT Manhattan     480)RhinoSpirit        520)LLBN SouthAsia    560)CBC Here and Now"
   echo "================================================================================================================================================================="
}

channel_matrix_2()
{
   echo "============================================================ "$product" "$version" page:"$men_num" ====================================================================="
   echo "||     CANADA        ||    CANADA EXTRAS     ||     LATINO II     ||      Portugues        ||     USA Local 2     ||     USA Local 3   ||   LiveStream 1   ||"
   echo "============================================================================================================================================================"
   echo "561)CBC News Net CA  601)Global Kingston     641)Cali TV +         681)Euronews PT         721)FOX News Preview   761)News 12 KTVZ7     801)------------"
   echo "562)CBC Vancouver    602)Global Montreal     642)Sinart CR         682)TV Assemblelia BR   722)Beach TV           762)NewsWest 9 KWES DC802)------------"
   echo "563)CBC Yellowknife  603)Global Halifax      643)Bethel Panama     683)TV Canaco Nova      723)Daytona Beach      763)Orange TV         803)Dashmesh  "
   echo "564)CBC Edmonton     604)ROGERS Kitchener    644)Poder de Dios BO  684)Igreja de Graca     724)Shepard Smith      764)PGCPS             804)Iberia TV  "
   echo "565)CBC Calgary      605)ROGERS Ottawa F     645)GUATEVISION GT    685)Assemblelia Ales    725)WUSA9 Breaking     765)RyeTV             805)Obieqtivi TV +  "
   echo "566)CBC Regina       606)ROGERS Ottawa       646)RTV ES            686)Boas Nova           726)WCNC Breaking      766)Seattle Channel   806)ortonville +  "
   echo "567)CBC Winnepeg     607)ROGERS BARRIE       647)Medios Publicos   687)Fundacao Nazzare    727)WCCB News          767)Atlanta TV        807)Holiday & Cruise  "
   echo "568)CBC Windsor      608)ROGERS BORDEN       648)Tele Bahia DR     688)STF Brazil          728)UGA TV             768)----------        808)Vision Cruise AU "
   echo "569)CBC Toronto      609)ROGERS Branftord    649)Iglesia Advent USA689)TV Estudio Brasil   729)TVW2 Washington    769)Vienna HQ         809)Vision Cruise UK"
   echo "570)CBC Ottawa       610)ROGERS Cambridge    650)Expande Puebla MX 690)Radio Justica       730)Action News KNVN   770)Escambia          810)102.3 NOW! TV CA "
   echo "571)CBC Montreal     611)ROGERS Collingwood  651)Ayuda Universal MX691)EXA FM Brasil       731)Alaska ASD         771)----------        811)TourbusTV USA "
   echo "572)CBC Frederickton 612)ROGERS Dufferin     652)Canal 27 Esperanza692)RIT TV BR           732)Bowie TV           772)WYCW Carolinas    812)Ezekiel TV"
   echo "573)CBC Charlottetown613)ROGERS Durham       653)TELEAMIGA         693)Gott24.TV           733)Escambia TV        773)FOX 10 News       813)Emmanuel TV "
   echo "574)CBC Halifax      614)ROGERS Georgina     654)Poli tv Bogota CO 694)TV Fatima Paroquia  734)FOX 5 DC (WTTG)    774)WHO 13            814)Shalom World +"
   echo "575)CBC St. John's   615)ROGERS Grey County  655)UNTREF UN3 AR     695)You Content 98      735)Garland TV         775)Erie News         815)KIFI ABC 8 Idaho Falls"
   echo "576)ICI CB-Yukon Tele616)ROGERS Geulph       656)RUAV Univalle CO  696)Rede Genesis PT     736)Greenbelt TV       776)WISTV             816)ESPN Seattle "
   echo "577)ICI Alberta      617)ROGERS Kawartha     657)JesusTV GT        697)MEIO Teresina BR    737)House Represent    777)Gem Shopping USA  817)King County TV Preston +"
   echo "578)ICI Saskatchewan 618)ROGERS Kincardine   658)FGTV USA          698)Medalhao Persa BR   738)KRBC-TV            778)C-SPAN 1 USA      818)KIRO Radio Seattle"
   echo "579)ICI Manitoba     619)ROGERS Kitchener    659)Evangelio Eterno  699)Talenu TV TPA       739)New Orleans TV     779)C-SPAN 2 USA      819)KOIN CBS 6 Portland"
   echo "580)ICI Ontario      620)ROGERS London       660)Cosmovision TV    700)TV Miramar BR       740)KTVB               780)C-SPAN 3 USA      820)KPTV FOX 12 Portland"
   echo "581)ICI Ottawa       621)ROGERS Midland      661)Libre Cali CO     701)TV Zimbo AO         741)Key TV             781)Fox News Talk     821)KTVZ 21 Bend Oregon"
   echo "582)ICI Acadie       622)ROGERS North Durham 662)Yuma CO           702)TV RAIAR AO         742)KOB4 News          782)KNBC 4 LA USA     822)KEZI ABC 9 Eugene"
   echo "583)ICI Estrie       623)ROGERS Orillia      663)Dominio MX        703)SescTV SaoPaulo BR  743)KPNX Breaking      783)ABC News 1        823)KOIN 6 Extra Portland"
   echo "584)ICI Maurice      624)ROGERS St.Thomas    664)Senal UNTREF      704)Rede Super BeloBR   744)KXAN News          784)ABC News 2        824)KSL NOW Salt Lake "
   echo "585)ICI Montreal     625)ROGERS Stratford    665)NRT 4 monclova    705)Talenu Luanda AO    745)Miami TV           785)ABC News 3        825)KUSI San Diego"
   echo "586)ICI Saguenay     626)ROGERS Strathory    666)TVUNAM 20         706)Vatican Media PT    746)KNTV-TV            786)ABC News 4        826)KEYT ABC 3 Santa Barbara"
   echo "587)ICI Quebec       627)ROGERS Grey County  667)EVTV Miami        707)ABC Paraguay        747)KNTV Telemundo     787)ABC News 5        827)KHSL CBS 12 Redding"
   echo "588)ICI Est-Quebec   628)ROGERS Tilsonburg   668)Cosmovision TV BO 708)Abya Yala BO        748)NBC2 News KTUU     788)ABC News 6        828)KRCR ABC 7 Redding "
   echo "589)CityLine         629)ROGERS Woodstocky   669)VIVE VE           709)UFROVision CL       749)News2 WCBD         789)ABC News 7        829)KION CBS 5/46 Salinas"
   echo "590)CBC News Montreal630)ROGERS Cornerbrook  670)Vatican Media ES  710)Campo Abierto CL    750)News4 WRC Wash D.C.790)ABC News 8        830)KSBY NBC 6 Santa Barbara"
   echo "591)Global BC        631)ROGERS Grey Gander  671)Televen VE        711)UNITV AR            751)News4 White House  791)ABC News 9        831)KESQ ABC 3 Palm Springs  "
   echo "592)Global Okanagan  632)ROGERS St. John's   672)Impacto USA       712)TelePacifico CO     752)News5 WCYB         792)ABC News 10       832)KCOY CBS 12 Santa Maria "
   echo "593)Global Edmonton  633)ROGERS Edmunston    673)UCVTV CL          713)-------------       753)NewsWest 9 KWES    793)ABC News 11       833)MCAET Salinas "
   echo "594)Global Calgary   634)ROGERS Fredericton  674)UCVTV 2 CL        714)-------------       754)NBC4 WNBC          794)------------      834)KVVB CH.33 Victorville"
   echo "595)Global Lethbridge635)ROGERS Miramichi NB 675)Univision MX      715)-------------       755)NBC4 WNBC Traffic  795)------------      835)KOAA NBC 5 Colorado"
   echo "596)Global Saskatoon 636)ROGERS Moncton NB   676)Cablenet AR       716)-------------       756)NBC5 WMAQ          796)------------      836)KRDO ABC 13 Colorado"
   echo "597)Global Regina    637)ROGERS TV Moncton F 677)Telpintv AR       717)-------------       757)NBC 10 KTEN        797)------------      837)Freedom Solar TV Kersey"
   echo "598)Global Winepeg   638)--------------      678)Canal8 MarPlataAR 718)-------------       758)NBC 12 WWBT        798)------------      838)KTVK 3 TV Arizona"
   echo "599)Global Toronto   639)--------------      679)Univision USA     719)-------------       759)NBC 29 WVIR        799)------------      839)KMVP 24/7 Phoenix"
   echo "600)Global Peterbor  640)--------------      680)Canal 2 AR        720)-------------       760)NBC 13 WNYT        800)------------      840)KTAR News Phoenix"
   echo "============================================================================================================================================================="
}

channel_matrix_3()
{
   echo "============================================================ "$product" "$version" page:"$men_num" ============================================================================="
   echo "||      LiveStream 2      ||    LiveStream 3       ||      LiveStream 4     ||     LiveStream 5     ||       LiveStream 6      ||    LiveStream 7      ||   Livestream 8  ||"
   echo "============================================================================================================================================================================"
   echo "841)KOLD 13 Tucson        881)WCYB NBC 5 Bristol    921)WKRG CBS 5 Mobile     961)KLTV ABC 7 Tyler TX   1001)KNPN Fox26 St Joseph 1041)AWCATV Educ     1081)------------"
   echo "842)KPHO CBS 5 Pheonix    882)WRIC ABC 8 Petersburg 922)WALA FOX10 Mobile     962)KTXS 12 ABC Abilene   1002)KCTV CBS5 Kansas MO  1042)FHSU TIGER MEDIA1082)------------"
   echo "843)KVOA NBC 4 Tuscon     883)WWBT NBC 12 Richmond  923)WBRC FOX 6 Birmingham 963)KFDA CBS10 AmarilloTX 1003)KHNL Honolulu        1043)Essex County +  1083)------------"
   echo "844)KYMA NBC 11 Yuma      884)Brunswick TV3 NH      924)Oakwood Uni Huntsville964)KZTV CBS10 CorpusX    1004)ThinkTech Honolulu   1044)CNPTVCaribbean  1084)------------"
   echo "845)NewsChannel5 LasVegas 885)LRPATV CH25 NH        925)WJZY FOX 46 Charlotte 965)KFDX NBC3 WitchitaFls 1005)KFVE 9 Honolulu      1045)LOBO STATION    1085)------------"
   echo "846)VSiN Vegas Stats      886)WJBK FOX 2 Detroit    926)WCCB Charlotte CW     966)Galveston County  +   1006)KHON CBS2 Ala Mona   1046)Maricopa College1086)------------"
   echo "847)KCLV FOX 2 Las Vegas  887)WWTV 9 Mt. Pleasent   927)WYCW CW 62 Carolinas  967)KAUZ CBS 6 Winters    1007)KVZK 2 Am.Samoa      1047)WLTH AM 1370    1087)------------"
   echo "848)KVVU FOX 5 Las Vegas  888)WFIE NBC 14 Evansville928)WNCT CBS 9 Greenville 968)KXXV ABC 25 Waco      1008)PNC K57 Fox 6 Guam + 1048)Lake Tahoe +    1088)------------"
   echo "849)Native Media Sante Fe 889)WANE Ft. Wayne        929)WCBD NBC 2 Charleston 969)KVIA ABC-7 El Paso    1009)Joe Pags             1049)Florida Gaming  1089)------------"
   echo "850)Santa Fe Media        890)WFFT FOX 55 Indiana   930)WWAY ABC3 Willmington 970)KCBD NBC 11 Lubbock   1010)CGTN America         1050)Kidd Kraddick   1090)------------"
   echo "851)WTNH 8 New Haven      891)WTHI 10 Terre Haute   931)WBTV CBS 3 Charlotte  971)Lex & Terry Lufkin    1011)BlabTV               1051)RMG-TV Cleavland1091)------------"
   echo "852)WFSB 3 Hartford       892)WISH 8 Indianapolis   932)CBS 17 Rahliegh NC    972)KSWO ABC 7 Winters TX 1012)Mike Malloy Show     1052)Denver 8 +      1092)------------"
   echo "853)CharmTV Baltimore +   893)EKBTV Pikeville KY +  933)WCSC CBS 5 Charleston 973)------------          1013)Nasdaq Bell   +      1053)Jewlery Maker + 1093)------------"
   echo "854)WTTG Fox 5 DC         894)WTVQ ABC 36 Lexington 934)WSPA CBS 7 Spartanberg974)ESPN 97.5 Houston TX  1014)Westerville.TV 543 + 1054)------------    1094)------------"
   echo "855)WWLP 22 Springfield   895)WPSD-TV Paducah       935)WMBF Myrtle Beach     975)Granbury Media TX     1015)Kingdom Access       1055)------------    1095)------------"
   echo "856)WestMass News Chicopee896)Lex 18 Lexington      936)WIS NBC 10 Columbia   976)KCOH TV Houston TX    1016)Plaistow Access      1056)------------    1096)------------"
   echo "857)Milford TV            897)WFLA NBC 8 Tampa Bay  937)WSMV NBC 4 Nashville  977)KXAN NBC Austin       1017)Topeka City          1057)------------    1097)------------"
   echo "858)Milford TV Educate    898)WTVT FOX 13 Tampa Bay 938)WBBJ ABC 7 Tennesee   978)KSLA 12 Shreveport    1018)Shelby County        1058)------------    1098)------------"
   echo "859)WWOR Secaucus NJ      899)Island TV Miami       939)WDEF CBS12 Chattanooga979)WAFB CBS9 BatonRouge  1019)Provincetown         1059)------------    1099)------------"
   echo "860)WNYW Fox 5 New York   900)City of Tampa         940)WMC NBC 5 Memphis     980)WVUE FOX8 NewOrleans  1020)CITV Hamilton Bermuda1060)------------    1100)------------"
   echo "861)WROC CBS 8 Rochester  901)WFLX FOX 29 Palm Beach941)2nd Presbyter Memphis 981)KLFY 10 Lafayette     1021)------------         1061)------------    1101)------------"
   echo "862)WABC 77 New York      902)WYKE TV47 Hormosassa+ 942)ETSU Fine Arts Johnson982)WDFL 18 SC/LA         1022)Lutheran Penfield    1062)------------    1102)------------"
   echo "863)WJHL CBS 11 Johnson   903)WJBF Augusta GA       943)EPlusTV6 Jackson      983)KSLA CBS12 Shreveport 1023)Whole Life Ministries1063)------------    1103)------------"
   echo "864)DayTraderRockStar     904)WMGT 41 NBC Macon GA  944)KELO Keloland ND/SD   984)HTV10 Houma LA   +    1024)St. Catharine Church 1064)------------    1104)------------"
   echo "865)------------          905)WSAV NBC 3 Savannah   945)KVRR Fargo ND         985)KPLC NBC7 LakeCharles 1025)Glory to God         1065)------------    1105)------------"
   echo "866)MNN-FSTV       +      906)WTOC 11 Savannah      946)KDLT Sioux Falls SD   986)KATC ABC3 Lafayette   1026)St. Helena Chapel    1066)------------    1106)------------"
   echo "867)Fox 8 Cleveland       907)WTVM ABC 9 Columbus   947)GovTV Watertown SD    987)HU16 Harding Sercy    1027)------------         1067)------------    1107)------------"
   echo "868)WIVM TV39 Canton +    908)WRBL CBS 3 Columbus   948)KELO CBS Sioux Falls  988)KSNT Weather Wichita  1028)------------         1068)------------    1108)------------"
   echo "869)WBNS 10 Columbus      909)WGCL CBS46 Atlanta    949)KIMT 3 Mason City     989)WPS-TV Wichita Public 1029)TMN WORD TV          1069)------------    1109)------------"
   echo "870)WNYT NBC 13 Sandusky  910)WALB NBC 10 Albany    950)WDIO ABC 10/13 Duluth 990)KSNW NBC 3 Witchita   1030)Parkside Radio       1070)------------    1110)------------"
   echo "871)WBNS 10 Radar Columbus911)WDAM 7 Hattiesburg    951)KAAL ABC 6 Rochester  991)KSNT Kansas OK        1031)FGTV FreqGlory       1071)------------    1111)------------"
   echo "872)WBNS 10 Columbus      912)WLOX ABC13 Mississippi952)KQDS FOX 21 Duluth    992)Enid TV OK 1          1032)HJTV Healing Jesus   1072)------------    1112)------------"
   echo "873)WOIO CBS 19 Clevland  913)WJTV CBS 12 Jackson   953)KSTP ABC 5 St. Paul   993)KMOV CBS4 St. Louis   1033)APTV Apocalypse      1073)------------    1113)------------"
   echo "874)WTOL CBS 11 Toledo    914)WLBT FOX 40 Jackson   954)KMSP FOX 9 Minneapolis994)KMIZ ABC 17 Missouri  1034)Marytown Chapel      1074)------------    1114)------------"
   echo "875)WCMH NBC 4 Columbus   915)WHLT Hattiesburg      955)St. Cloud Times UTVS  995)PolkCounty BolivarMO  1035)Guaranty Media       1075)------------    1115)------------"
   echo "876)WTXF FOX 29 Philli    916)WSFA 12 Montgomory    956)WHLT 12 Whitehall     996)KOLR CBS10 Springfield1036)Pro Football Hall    1076)------------    1116)------------"
   echo "877)WBRE NBC Wilkes Barre 917)WBRC FOX6 Birmingham  957)WFLD Fox 32 Chicago   997)Branson TV MO         1037)Lance Hope RSL       1077)------------    1117)------------"
   echo "878)WPHL TV ABC 6 Philli  918)WAKA CBS 8 Alabama    958)WAND NBC 17 Decatur   998)EUTV Springfield MO + 1038)XBTV RosecroftRaceway1078)------------    1118)------------"
   echo "879)WFMZ 69 Allen Town    919)WAAY ABC 31 Huntsville959)WFLD Fox 32 Chicago   999)KY3 Springfield MO    1039)Park City TV PCTV    1079)------------    1119)------------"
   echo "880)WPRI Fox 12 Providence920)CBS 42 Birmingham     960)KRIV FOX 26 Houston   1000)KQTV 2 St. Joseph MO 1040)AAA Guayama          1080)------------    1120)------------"
   echo "================================================================================================================================================================="
}

channel_matrix_4()
{ 
   echo "============================================================ "$product" "$version" page:"$men_num" ==================================================================="
   echo "||     FRANCAIS II     ||     GOVERNMENT     ||     AUS/NZ          ||   TWITCH           ||  DLIVE/COZY        ||   Brighteon Live     ||   Locations    ||"
   echo "============================================================================================================================================================"
   echo "1121)Generations TV   1161)EBS EU            1201)2UE Sydney        1241)hasanabi         1281)CozyTV LoFi       1321)Brighteon Live 1  1361)------------"
   echo "1122)Telesud          1162)EBS Plus EU       1202)3AW Melbourne     1242)smidjen          1282)Alexjones         1322)Brighteon Live 2  1362)------------"
   echo "1123)VL               1163)Dail Eireann IE   1203)4BC Brisbane      1243)blondiewondie    1283)PatriotSoapBox    1323)Brighteon Live 3  1363)------------"
   echo "1124)BFM TV           1164)Senad Eireann IE  1204)3 News NZ         1244)Alinity          1284)SloanTV           1324)Brighteon Live 4  1364)------------"
   echo "1125)TV 7 Bordeaux    1165)Oireachtas CR 1 IE1205)------------      1245)My Kinky Dope    1285)PreperSurplus     1325)Brighteon Live 5  1365)------------"
   echo "1126)8 Monte Blacnc 2 1166)Oireachtas CR 2 IE1206)------------      1246)ShyPhoebe        1286)WTC-7             1326)Brighteon Live 6  1366)------------"
   echo "1127)RTL 2            1167)Oireachtas CR 3 IE1207)------------      1247)loserfruit       1287)chieftrumpster    1327)Brighteon Live 7  1367)------------"
   echo "1128)OUI FM           1168)Oireachtas CR 4 IE1208)------------      1248)staryuuki        1288)Red Ice TV        1328)Brighteon Live 8  1368)------------"
   echo "1129)D24TV            1169)------------      1209)------------      1249)Loraveee         1289)MarfoggleNews     1329)Brighteon Live 9  1369)------------"
   echo "1130)Canal Savoir CA  1170)------------      1210)------------      1250)Bunny Bombshell  1290)HateBus           1330)Brighteon Live 10 1370)------------"
   echo "1131)RFI FR           1171)------------      1211)------------      1251)Gonsabella       1291)EthanRalph        1331)Brighteon Live 11 1371)------------"
   echo "1132)CNEWS FR         1172)------------      1212)------------      1252)Cat Like Meow    1292)PaulTown          1332)Brighteon Live 12 1372)------------"
   echo "1133)SYTRAL Rhone FR  1173)------------      1213)------------      1253)DizzyKitten      1293)politicallyprov   1333)Brighteon Live 13 1373)------------"
   echo "1134)Vedia BE         1174)------------      1214)------------      1254)keelyvalentine   1294)veyta             1334)Brighteon Live 14 1374)------------"
   echo "1135)MABI CA          1175)------------      1215)------------      1255)Devon Jenelle    1295)NickFuentes       1335)Brighteon Live 15 1375)------------"
   echo "1136)Vatican Media FR 1176)------------      1216)------------      1256)Cristina Scabbia 1296)AmericaFirstFound 1336)Brighteon Live 16 1376)------------"
   echo "1137)TVM Paris FR     1177)------------      1217)------------      1257)taylor_jevaux    1297)emichaeljones     1337)Brighteon Live 17 1377)------------"
   echo "1138)C-Star           1178)------------      1218)------------      1258)kneecoleslaw     1298)Vince             1338)Brighteon Live 18 1378)------------"
   echo "1139)Journal TVLandes 1179)------------      1219)------------      1259)courtneyysmoke   1299)bakedalaska       1339)Brighteon Live 19 1379)------------"
   echo "1140)TV 7 FR          1180)------------      1220)------------      1260)ninjastarasmr    1300)NPTV PL           1340)Brighteon Live 20 1380)------------"
   echo "1141)------------     1181)------------      1221)------------      1261)jadethejaguar    1301)Resistance Chicks 1341)------------      1381)------------"
   echo "1142)------------     1182)------------      1222)------------      1262)intraventus      1302)PPP               1342)------------      1382)------------"
   echo "1143)------------     1183)------------      1223)------------      1263)anncramling      1303)KOTS              1343)------------      1383)------------"
   echo "1144)------------     1184)------------      1224)------------      1264)TYT              1304)FreeTalkLive      1344)------------      1384)------------"
   echo "1145)------------     1185)------------      1225)------------      1265)PekeASMR         1305)AdamDunnShow      1345)------------      1385)------------"
   echo "1146)------------     1186)-------------     1226)------------      1266)Geekandsundry    1306)TLAVagabond       1346)------------      1386)------------"
   echo "1147)------------     1187)------------      1227)------------      1267)------------     1307)ThinkFreely       1347)------------      1387)------------"
   echo "1148)------------     1188)------------      1228)------------      1268)------------     1308)CanelProof        1348)------------      1388)------------"
   echo "1149)------------     1189)------------      1229)------------      1269)------------     1309)WuzzleRoot        1349)------------      1389)------------"
   echo "1150)------------     1190)------------      1230)------------      1270)------------     1310)HW                1350)------------      1390)------------"
   echo "1151)------------     1191)------------      1231)------------      1271)------------     1311)keithwoods        1351)------------      1391)------------"
   echo "1152)------------     1192)------------      1232)------------      1272)------------     1312)stewpeters        1352)------------      1392)------------"
   echo "1153)------------     1193)------------      1233)------------      1273)------------     1313)joetheboomer      1353)------------      1393)------------"
   echo "1154)------------     1194)------------      1234)------------      1274)------------     1314)beardson          1354)------------      1394)------------"
   echo "1155)------------     1195)------------      1235)------------      1275)------------     1315)loulz             1355)------------      1395)------------"
   echo "1156)------------     1196)------------      1236)------------      1276)------------     1316)trsartor          1356)------------      1396)------------"
   echo "1157)------------     1197)------------      1237)------------      1277)------------     1317)TylerRussell      1357)------------      1397)------------"
   echo "1158)------------     1198)------------      1238)------------      1278)------------     1318)BigTech           1358)------------      1398)------------"
   echo "1159)------------     1199)------------      1239)------------      1279)-----------      1319)JimboZoomer       1359)------------      1399)------------"
   echo "1160)------------     1200)------------      1240)------------      1280)-----------      1320)DudeMan76         1360)------------      1400)------------"
   echo "==================================================================================================================================================="
}
channel_matrix_5()
{ 
   echo "============================================================ "$product" "$version" page:"$men_num" ==================================================================="
   echo "||  ------------   ||     ------------   ||     ------------   ||   ------------   ||  ------------    ||    ------------   ||   ------------  ||"
   echo "============================================================================================================================================================"
   echo "1401)------------   1431)------------    1471)------------     1511)------------   1551)------------      1591)------------     1631)------------"
   echo "1402)------------   1432)------------    1472)------------     1512)------------   1552)------------      1592)------------     1632)------------"
   echo "1403)------------   1433)------------    1473)------------     1513)------------   1553)------------      1593)------------     1633)------------"
   echo "1404)------------   1434)------------    1474)------------     1514)------------   1554)------------      1594)------------     1634)------------"
   echo "1405)------------   1435)------------    1475)------------     1515)------------   1555)------------      1595)------------     1635)------------"
   echo "1406)------------   1436)------------    1476)------------     1516)------------   1556)------------      1596)------------     1636)------------"
   echo "1407)------------   1437)------------    1477)------------     1517)------------   1557)------------      1597)------------     1637)------------"
   echo "1408)------------   1438)------------    1478)------------     1518)------------   1558)------------      1598)------------     1638)------------"
   echo "1409)------------   1439)------------    1479)------------     1519)------------   1559)------------      1599)------------     1639)------------"
   echo "1410)------------   1440)------------    1480)------------     1520)------------   1560)------------      1600)------------     1640)------------"
   echo "1411)------------   1441)------------    1481)------------     1521)------------   1561)------------      1601)------------     1641)------------"
   echo "1412)------------   1442)------------    1482)------------     1522)------------   1562)------------      1602)------------     1642)------------"
   echo "1413)------------   1443)------------    1483)------------     1523)------------   1563)------------      1603)------------     1643)------------"
   echo "1414)------------   1444)------------    1484)------------     1524)------------   1564)------------      1604)------------     1644)------------"
   echo "1415)------------   1445)------------    1485)------------     1525)------------   1565)------------      1605)------------     1645)------------"
   echo "1416)------------   1446)------------    1486)------------     1526)------------   1566)------------      1606)------------     1646)------------"
   echo "1417)------------   1447)------------    1487)------------     1527)------------   1567)------------      1607)------------     1647)------------"
   echo "1418)------------   1448)------------    1488)------------     1528)------------   1568)------------      1608)------------     1648)------------"
   echo "1419)------------   1449)------------    1489)------------     1529)------------   1569)------------      1609)------------     1649)------------"
   echo "1410)------------   1450)------------    1490)------------     1530)------------   1570)------------      1610)------------     1640)------------"
   echo "1411)------------   1451)------------    1491)------------     1531)------------   1571)------------      1611)------------     1641)------------"
   echo "1412)------------   1452)------------    1492)------------     1532)------------   1572)------------      1612)------------     1642)------------"
   echo "1413)------------   1453)------------    1493)------------     1533)------------   1573)------------      1613)------------     1643)------------"
   echo "1414)------------   1454)------------    1494)------------     1534)------------   1574)------------      1614)------------     1644)------------"
   echo "1415)------------   1455)------------    1495)------------     1535)------------   1575)------------      1615)------------     1645)------------"
   echo "1416)------------   1456)-------------   1496)------------     1536)------------   1576)------------      1616)------------     1646)------------"
   echo "1417)------------   1457)------------    1497)------------     1537)------------   1577)------------      1617)------------     1647)------------"
   echo "1418)------------   1458)------------    1498)------------     1538)------------   1578)------------      1618)------------     1648)------------"
   echo "1419)------------   1459)------------    1499)------------     1539)------------   1579)------------      1619)------------     1649)------------"
   echo "1420)------------   1460)------------    1500)------------     1540)------------   1580)------------      1620)------------     1650)------------"
   echo "1421)------------   1461)------------    1501)------------     1541)------------   1581)------------      1621)------------     1651)------------"
   echo "1422)------------   1462)------------    1502)------------     1542)------------   1582)------------      1622)------------     1652)------------"
   echo "1423)------------   1463)------------    1503)------------     1543)------------   1583)------------      1623)------------     1653)------------"
   echo "1424)------------   1464)------------    1504)------------     1544)------------   1584)------------      1624)------------     1654)------------"
   echo "1425)------------   1465)------------    1505)------------     1545)------------   1585)------------      1625)------------     1655)------------"
   echo "1426)------------   1466)------------    1506)------------     1546)------------   1586)------------      1626)------------     1656)------------"
   echo "1427)------------   1467)------------    1507)------------     1547)------------   1587)------------      1627)------------     1657)------------"
   echo "1428)------------   1468)------------    1508)------------     1548)------------   1588)------------      1628)------------     1658)------------"
   echo "1429)------------   1469)------------    1509)------------     1549)-----------    1589)------------      1629)------------     1659)------------"
   echo "1430)------------   1470)------------    1510)------------     1550)-----------    1590)------------      1630)------------     1660)------------"
   echo "==================================================================================================================================================="
}   
   channel_matrix_6()
{ 
   echo "============================================================ "$product" "$version" page:"$men_num" ==================================================================="
   echo "||  ------------   ||     ------------   ||     ------------   ||   ------------   ||  ------------    ||    ------------   ||   ------------  ||"
   echo "============================================================================================================================================================"
   echo "1661)------------   1701)------------    1741)------------     1781)------------   1821)------------      1851)------------     1891)------------"
   echo "1662)------------   1702)------------    1742)------------     1782)------------   1822)------------      1852)------------     1892)------------"
   echo "1663)------------   1703)------------    1743)------------     1783)------------   1823)------------      1853)------------     1893)------------"
   echo "1664)------------   1704)------------    1744)------------     1784)------------   1824)------------      1854)------------     1894)------------"
   echo "1665)------------   1705)------------    1745)------------     1785)------------   1825)------------      1855)------------     1895)------------"
   echo "1666)------------   1706)------------    1746)------------     1786)------------   1826)------------      1856)------------     1896)------------"
   echo "1667)------------   1707)------------    1747)------------     1787)------------   1827)------------      1857)------------     1897)------------"
   echo "1668)------------   1708)------------    1748)------------     1788)------------   1828)------------      1858)------------     1898)------------"
   echo "1669)------------   1709)------------    1749)------------     1789)------------   1829)------------      1859)------------     1899)------------"
   echo "1670)------------   1700)------------    1750)------------     1790)------------   1830)------------      1860)------------     1900)------------"
   echo "1671)------------   1711)------------    1751)------------     1791)------------   1831)------------      1861)------------     1901)------------"
   echo "1672)------------   1712)------------    1752)------------     1792)------------   1832)------------      1862)------------     1902)------------"
   echo "1673)------------   1713)------------    1753)------------     1793)------------   1833)------------      1863)------------     1903)------------"
   echo "1674)------------   1714)------------    1754)------------     1794)------------   1834)------------      1864)------------     1904)------------"
   echo "1675)------------   1715)------------    1755)------------     1795)------------   1835)------------      1865)------------     1905)------------"
   echo "1676)------------   1716)------------    1756)------------     1796)------------   1836)------------      1866)------------     1906)------------"
   echo "1677)------------   1717)------------    1757)------------     1797)------------   1837)------------      1867)------------     1907)------------"
   echo "1678)------------   1718)------------    1758)------------     1798)------------   1838)------------      1868)------------     1908)------------"
   echo "1679)------------   1719)------------    1759)------------     1799)------------   1839)------------      1869)------------     1909)------------"
   echo "1680)------------   1720)------------    1760)------------     1800)------------   1840)------------      1870)------------     1910)------------"
   echo "1681)------------   1721)------------    1761)------------     1801)------------   1841)------------      1871)------------     1911)------------"
   echo "1682)------------   1722)------------    1762)------------     1802)------------   1842)------------      1872)------------     1912)------------"
   echo "1683)------------   1723)------------    1763)------------     1803)------------   1843)------------      1873)------------     1913)------------"
   echo "1684)------------   1724)------------    1764)------------     1804)------------   1844)------------      1874)------------     1914)------------"
   echo "1685)------------   1725)------------    1765)------------     1805)------------   1845)------------      1875)------------     1915)------------"
   echo "1686)------------   1726)------------    1766)------------     1806)------------   1846)------------      1876)------------     1916)------------"
   echo "1687)------------   1727)------------    1767)------------     1807)------------   1847)------------      1877)------------     1917)------------"
   echo "1688)------------   1728)------------    1768)------------     1808)------------   1848)------------      1878)------------     1918)------------"
   echo "1689)------------   1729)------------    1769)------------     1809)------------   1849)------------      1879)------------     1919)------------"
   echo "1690)------------   1730)------------    1770)------------     1810)------------   1840)------------      1880)------------     1920)------------"
   echo "1691)------------   1731)------------    1771)------------     1811)------------   1841)------------      1881)------------     1921)------------"
   echo "1692)------------   1732)------------    1772)------------     1812)------------   1842)------------      1882)------------     1922)------------"
   echo "1693)------------   1733)------------    1773)------------     1813)------------   1843)------------      1883)------------     1923)------------"
   echo "1694)------------   1734)------------    1774)------------     1814)------------   1844)------------      1884)------------     1924)------------"
   echo "1695)------------   1735)------------    1775)------------     1815)------------   1845)------------      1885)------------     1925)------------"
   echo "1696)------------   1736)------------    1776)------------     1816)------------   1846)------------      1886)------------     1926)------------"
   echo "1697)------------   1737)------------    1777)------------     1817)------------   1847)------------      1887)------------     1927)------------"
   echo "1698)------------   1738)------------    1778)------------     1818)------------   1848)------------      1888)------------     1928)------------"
   echo "1699)------------   1739)------------    1779)------------     1819)-----------    1849)------------      1889)------------     1929)------------"
   echo "1700)------------   1740)------------    1780)------------     1820)-----------    1850)------------      1890)------------     1930)------------"
   echo "==================================================================================================================================================="
   
}

############################  FUNCTIONS ##################################################################

## Channel Selection function  (ADD CHANNELS HERE)
channel_select()
{

chan_num=$1

case $chan_num in
################    ENGLISH     ##################################

########################## USA MAINSTREAM ###################################################
# 1) CBSN
1)
keyword="LIVE"
if [ "$getlink" = 1 ]
then

#link="https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8"

link=$( curl "https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8" | cut -d \" -f 2 | cut -d \" -f 1 )?BANDWIDTH=1689600

####link="$(curl --socks5 "$socks_ip":"$socks_port" -A "$UA" $( curl --socks5 "$socks_ip":"$socks_port" -A "$UA" "https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8" | cut -d \" -f 2 | cut -d \" -f 1 ) | grep 1029600.m3u8 | tail -n 1 ) "
#link="$(curl -A "$UA" $( curl -A "$UA" "https://dai.google.com/linear/hls/event/Sid4xiTQTkCT1SLu6rjUSQ/master.m3u8" | cut -d \" -f 2 | cut -d \" -f 1 ) | grep 2808256.m3u8 | tail -n 1 ) "
# BANDWIDTHS: 2808256.m3u8 3394688.m3u8 1928608.m3u8 1195537.m3u8 697100.m3u8 345241.m3u8

#link=https://www.cbsnews.com/common/video/dai_prod.m3u8
#link=https://cbsnewshd-lh.akamaihd.net/i/CBSNHD_7@199302/master.m3u8

fi
# method="Tor"
use_cookies="no"
TAG=" CBSN_______"
chan_name="CBSN" ;;

# 2) NBC News Live
2)
keyword="LIVE"
## YOUTUBE
channelURL="https://www.youtube.com/@NBCNews/streams"
youTubeNBCGrab 2
use_cookies="no"
chan_name="NBC News Live";;

# 3)ABC News USA
3)

if [ "$getlink" = 1 ]
then
#https://abcnews.go.com/Live
#https://abcnews.go.com/live/video/special-live-11

link="https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8"

#link="$(curl -A "$UA" "https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8"| grep d.m3u8 | head -n 1 ) "

#link="https://content.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be.m3u8"
 ###################### YOUTUBE  #######################
 #keyword="LIVE"
 #channelURL="https://www.youtube.com/c/ABCNews/videos?view=2&live_view=501"
 #youTubeGrab

fi
#method="Tor"
use_cookies="no"
TAG="ABC_NEWS_USA"
chan_name="ABC News USA" ;;

# 4) Bloomberg Business USA
4)
keyword="Bloomberg"
if [ "$getlink" = 1 ]
then
#link=https://www.bloomberg.com/live/us
#link="http://cdn3.videos.bloomberg.com/btv/us/master.m3u8?b?b*t$"
#link=http://cdn-videos.akamaized.net/btv/desktop/akamai/europe/live/primary.m3u8
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/Bloomberg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"

#link="https://liveproduseast.akamaized.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8"


## US With charts
#glink="https://dai.google.com/linear/hls/event/BVlOmFGaTi6NpchccR14yA/master.m3u8"
## US No Charts
glink="https://dai.google.com/linear/hls/event/PwTJe4aZRvSBjbWY7_VSzA/master.m3u8"
## Bloomberg Australia 
#glink="https://dai.google.com/linear/hls/event/-0JiXPvoQCCx1Nbwgx9Xmw/master.m3u8"

bandwidth="1200000.m3u8"
# options = 1200000.m3u8 800000.m3u8 600000.m3u8 400000.m3u8 


link=$( curl $( curl "$glink" |  cut -d \" -f 2 ) | grep "$bandwidth" | head -n 1) 


fi
#method="Tor"
use_cookies="no"
TAG=" BLMBRG_____"
chan_name="Bloomberg Business USA";;

# 5) Scripps News
5)

if [ "$getlink" = 1 ]
then
#link=http://www.newsy.com/live/
#link="https://content.jwplatform.com/players/hBmO7M6k"

#link="https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"

#link="$(curl -A "$UA" "https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"| grep c.m3u8 | head -n 1 ) "

#url="https://content-ause1-uc-1.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"
#url="https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"
#url="https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"
#link="$(curl -A "$UA" "$url"| grep e.m3u8 | head -n 1 ) "
#link="$url"

#link="https://content-ause1-uc-1.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"

## Old link 
#link="https://content.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37.m3u8"

#link="https://content-auso3.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37/h.m3u8"
#https://content-ause1-up-1.uplynk.com/channel/4bb4901b934c4e029fd4c1abfc766c37/e.m3u8?v=2&ad=live&expand=ad_live&repl=aboi&ad.url=https%3A%2F%2Fwww.scrippsnews.com%2F&ad.cust_params=%26user_id%3Db9c48989-8111-453a-9741-5a2da9962d4c%26givn%3Dundefined&pbs=fbd4d8458c4240879e3a2eb97627a814

#link=https://www.filmon.com/tv/newsy

#### Youtube
keyword="Live"
channelURL="https://www.youtube.com/@scrippsnews/streams"
youTubeGrab3
use_cookies="no"

fi
#method="Tor"
use_cookies="no"
TAG="SCRIPPS----"
chan_name="Scripps News" ;;


# 6)Cheddar News 
6)
if [ "$getlink" = 1 ]
then

#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/index.m3u8"
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",NAME="ENG",LANGUAGE="eng",DEFAULT=YES,AUTOSELECT=YES,INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2276268,AVERAGE-BANDWIDTH=2276268,CODECS="avc1.64001f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=960x540,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=5341484,AVERAGE-BANDWIDTH=5341484,CODECS="avc1.640028,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1920x1080,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3297996,AVERAGE-BANDWIDTH=3297996,CODECS="avc1.64001f,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=1280x720,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1356684,AVERAGE-BANDWIDTH=1356684,CODECS="avc1.64001e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=768x432,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=978652,AVERAGE-BANDWIDTH=978652,CODECS="avc1.64001e,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=640x360,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=573012,AVERAGE-BANDWIDTH=573012,CODECS="avc1.640015,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=480x270,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/6.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=404428,AVERAGE-BANDWIDTH=404428,CODECS="avc1.64000d,mp4a.40.5",PROGRAM-ID=1,RESOLUTION=416x234,FRAME-RATE=29.970,CLOSED-CAPTIONS="CC"
#link="https://livestream.chdrstatic.com/b93e5b0d43ea306310a379971e384964acbe4990ce193c0bd50078275a9a657d/cheddar-42620/cheddarweblive/cheddar/primary/7.m3u8"


fi
#####method="Tor"
use_cookies="no"
chan_name="Cheddar News";;


########################## CANADA MAINSTREAM #################################################

###################### CANADA ##########################################################
# 7) CBC News Network
7)
if [ "$getlink" = 1 ]
then
website="https://gem.cbc.ca/"
eventID="VV86w2GwS9GS0bcVn_Hwjw"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"

googleGrab2


fi
use_cookies="no"
chan_name="CBC News Network " ;;

# 8) Global News CA
8)
if [ "$getlink" = 1 ]
then

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/national/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="cQOVg6jKSvusQAfYpTrUoQ"
googleGrab

fi
#method="Tor"
use_cookies="no"
TAG=" GLOBAL CA______"
chan_name="Global News CA" ;;

# 9) CityNews Toronto CA
9)
keyword="Bloomberg"
if [ "$getlink" = 1 ]
then

eventID="NYoux6eGTkqmdrxc0P_biw"
googleGrab

#link="https://citynewsregional.akamaized.net/hls/live/1024052/Regional_Live_7/master.m3u8"
#EXT-X-STREAM-INF:CODECS="avc1.4d4029,mp4a.40.2",BANDWIDTH=3974717,AVERAGE-BANDWIDTH=3109997
#link="https://citynewsregional.akamaized.net/hls/live/1024052/Regional_Live_7/072000f1dfddc44c8bf7b45da8374f2f/1.m3u8"
#EXT-X-STREAM-INF:CODECS="avc1.4d4020,mp4a.40.2",BANDWIDTH=2680999,AVERAGE-BANDWIDTH=2109919
#link="https://citynewsregional.akamaized.net/hls/live/1024052/Regional_Live_7/072000f1dfddc44c8bf7b45da8374f2f/2.m3u8"
#EXT-X-STREAM-INF:CODECS="avc1.4d4020,mp4a.40.2",BANDWIDTH=1387809,AVERAGE-BANDWIDTH=1110249
#link="https://citynewsregional.akamaized.net/hls/live/1024052/Regional_Live_7/072000f1dfddc44c8bf7b45da8374f2f/3.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG=" CITYTV_____"
chan_name="CityNews CA";;

# 10) CityNews West 
10)
#eventID="oHA60MeMEPNviL59xVH9zs"
#googleGrab

link="https://citynewsregional.akamaized.net/hls/live/1024053/Regional_Live_8/master.m3u8"
#EXT-X-STREAM-INF:CODECS="avc1.4d4029,mp4a.40.2",BANDWIDTH=3974717,AVERAGE-BANDWIDTH=3109997
#link="https://citynewsregional.akamaized.net/hls/live/1024053/Regional_Live_8/771c578ce00385a2bc8c6e879f71593a/1.m3u8"
##EXT-X-STREAM-INF:CODECS="avc1.4d4020,mp4a.40.2",BANDWIDTH=2680999,AVERAGE-BANDWIDTH=2109919
#link="https://citynewsregional.akamaized.net/hls/live/1024053/Regional_Live_8/771c578ce00385a2bc8c6e879f71593a/2.m3u8"
##EXT-X-STREAM-INF:CODECS="avc1.4d4020,mp4a.40.2",BANDWIDTH=1387809,AVERAGE-BANDWIDTH=1110249
#link="https://citynewsregional.akamaized.net/hls/live/1024053/Regional_Live_8/771c578ce00385a2bc8c6e879f71593a/3.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="CityNews West CA";;

######################## SOUTH AMERICA #############################################
# 11) Telesur English
11)

if [ "$getlink" = 1 ]
then


#link="https://cdnenmain.telesur.ultrabase.netmblivev3/hd/playlist.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/480p/playlist.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/360p/playlist.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/audio/playlist.m3u8"

#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/audio/chunklist_w620208955.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4112500,CODECS="avc1.66.40,mp4a.40.2",RESOLUTION=1920x1080
link="https://cdnenmain.telesur.ultrabase.net/mblivev3/hd/chunklist_w384365430.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1090588,CODECS="avc1.66.31,mp4a.40.2",RESOLUTION=640x360
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/480p/chunklist_w828236034.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=572084,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=462x260
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/360p/chunklist_w220534359.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=64160,CODECS="mp4a.40.2
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/audio/chunklist_w1221487880.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3/audio/chunklist_w637524806.m3u8"

#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/hd/playlist.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/480p/playlist.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/360p/playlist.m3u8"

#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/hd/chunklist_w209051470.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/480p/chunklist_w654799258.m3u8"
#link="https://cdnenmain.telesur.ultrabase.net/mblivev3_alt1/360p/chunklist_w1182587844.m3u8"

use_cookies="no"
###method="Tor"
fi
####method="Tor"
use_cookies="no"
TAG="TELESUR_ENG___"
chan_name="Telesur English" ;;

########################### EUROPE #############################################################
# 12) Euronews English
12)
keyword="Live"
## YOUTUBE
channelURL="https://www.youtube.com/@euronews/featured"
#youTubeNBCGrab 2
youTubeGrab3
use_cookies="no"
chan_name="Euronews English";;

# 13) GB News
13)
keyword="Live"
## YOUTUBE
channelURL="https://www.youtube.com/@GBNewsOnline/featured"
youTubeGrab
#googleGBNews2
use_cookies="no"
chan_name="GB News";;

# 14) France 24 English
14)
keyword="Live"
## YOUTUBE
channelURL="https://www.youtube.com/@France24_en/streams"
youTubeGrab3
use_cookies="no"
chan_name="France 24 English";;

################## GERMANY ########
# 15) DW English
15)
keyword="DW"

if [ "$getlink" = 1 ]
then

#link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/index.m3u8"
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="ENG_301_150",DEFAULT=NO,AUTOSELECT=YES,LANGUAGE="ENG",URI="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream106/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1140853,AVERAGE-BANDWIDTH=950711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream01/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2100853,AVERAGE-BANDWIDTH=1750711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=711x400,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream02/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3780853,AVERAGE-BANDWIDTH=3150711,CODECS="avc1.77.32,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream03/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4780088,AVERAGE-BANDWIDTH=3983407,CODECS="avc1.100.41,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream04/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6898557,AVERAGE-BANDWIDTH=5748798,CODECS="avc1.100.42,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://dwamdstream102.akamaized.net/hls/live/2015525/dwstream102/stream05/streamPlaylist.m3u8"
# link=https://www.filmon.com/tv/dw-english
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/deutschewelleenglish/videos?view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1 )"

##################### YOUTUBE
#keyword="LIVE"
#channelURL="https://www.youtube.com/c/dwnews/videos?view=2&live_view=501"
#youTubeGrab

fi
#method="Tor"
use_cookies="no"
TAG=" DWENG______"
chan_name="DW English" ;;


#################### RUSSIA  ################################
# 16) Russia Today
16)

if [ "$getlink" = 1 ]
then
#link=https://www.rt.com/on-air/

#link="https://rt-glb.rttv.com/live/rtnews/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=7594400,AVERAGE-BANDWIDTH=5020400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=25.000
#link="https://rt-glb.rttv.com/live/rtnews/playlist_4500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4250400,AVERAGE-BANDWIDTH=2820400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=25.000
link="https://rt-glb.rttv.com/live/rtnews/playlist_2500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2745600,AVERAGE-BANDWIDTH=1830400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=25.000
#link="https://rt-glb.rttv.com/live/rtnews/playlist_1600Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1408000,AVERAGE-BANDWIDTH=950400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="https://rt-glb.rttv.com/live/rtnews/playlist_800Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
#link="https://rt-glb.rttv.com/live/rtnews/playlist_64Kb.m3u8"

## link=https://www.filmon.com/tv/russia-today-1


fi
#method="Tor"
use_cookies="no"
TAG=" RT_________"
chan_name="Russia Today" ;;

############################# MIDDLE EAST ##############################################################
############################### TURKEY #################################
# 17) TRT World
17)
keyword="TRT"

if [ "$getlink" = 1 ]
then

#channelURL="https://www.youtube.com/@trtworld/streams"
#youTubeGrab
#youTubeNBCGrab 2

#link="https://api.trtworld.com/livestream/v1/WcM3Oa2LHD9iUjWDSRUI335NkMWVTUV351H56dqC/master.m3u8"
#https://api.trtworld.com/livestream/v1/WcM3Oa2LHD9iUjWDSRUI335NkMWVTUV351H56dqC/master.m3u8?secondary=1

link="https://tv-trtworld.medya.trt.com.tr/master.m3u8"

#link="https://tv-trtworld.live.trt.com.tr/master.m3u8"
#link=https://trtcanlitv-lh.akamaihd.net/master.m3u8

#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC7fWeaHhqgM4Ry-RMpM2YYw/videos?view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1 )"
fi
#method="Tor"
use_cookies="no"
TAG="TRTWORLD--"
chan_name="TRT World";;

########################## ISRAEL ####################################
# 18) i24 News IL
18)
if [ "$getlink" = 1 ]
then
link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/playlist.m3u8"
#link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/profile_0/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/profile_1/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/profile_2/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/profile_4/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/ecf224f43f3b43e69471a7b626481af0/eu-central-1/5377161796001/profile_5/chunklist.m3u8"


fi
###method="Tor"
use_cookies="no"
TAG="I24_News_IL"
chan_name="i24 News IL English" ;;

###################### QUTAR #########################################
# 19) Al Jazeera
19)
keyword="Al Jazeera English - Live"

if [ "$getlink" = 1 ]
then
#  link="https://live-hls-web-aje.getaj.net/AJE/index.m3u8"
   link="https://live-hls-web-aje.getaj.net/AJE/01.m3u8"
#  link="https://live-hls-web-aje.getaj.net/AJE/02.m3u8"
#  link="https://live-hls-web-aje.getaj.net/AJE/03.m3u8"
#  link="https://live-hls-web-aje.getaj.net/AJE/04.m3u8"

##################### YOUTUBE
#keyword="Live"
#channelURL="https://www.youtube.com/c/aljazeeraenglish/videos?view=2&live_view=501"
#youTubeGrab

fi
##method="Tor"
use_cookies="no"
TAG="ALJAZ_ENG_"
chan_name="Al Jazeera English" ;;


############################## IRAN ##########################################
# 20) Press TV
20)

if [ "$getlink" = 1 ]
then
#link=https://www.filmon.com/tv/press-tv

link="https://live.presstv.ir/hls/presstv.m3u8"
#link="https://live.presstv.ir/hls/presstv_2_482/index.m3u8"
#link="https://rumble.com/live-hls-dvr/5zwjw2/playlist.m3u8"
#link="https://cloud.odysee.live/content/26bcbcc342a5b143578f27dbfaf000201f06e417/master.m3u8"

fi
use_cookies="no"
TAG="PRESSTV___"
chan_name="Press TV" ;;



################### INDIA  ########################################

# 21) WION IN
21)

if [ "$getlink" = 1 ]
then

#tokenURL="https://03nwj0csy5.execute-api.ap-south-1.amazonaws.com/prod/cf-token?cb=137466"
#token=$(curl  -A "$UA"  "$tokenURL" | cut -d \" -f 4)

#echo "$token"

#link="https://d3neuepii3rf1i.cloudfront.net/v1/master/8fe6b38eb3580727128fa5d6759fbc48b3ec1c7e/Zee_News_MT_POC/out/v1/15b8393e9a9240b8bedd4c79ccefb301/index.m3u8?""$token"

link="https://d7x8z4yuq42qn.cloudfront.net/index_1.m3u8"
#link="https://d7x8z4yuq42qn.cloudfront.net/index_2.m3u8"
#link="https://d7x8z4yuq42qn.cloudfront.net/index_3.m3u8"
#link="https://d7x8z4yuq42qn.cloudfront.net/index_4.m3u8"
#link="https://d7x8z4yuq42qn.cloudfront.net/index_5.m3u8"
fi

#method="Tor"
use_cookies="no"
TAG="WION-IN---"
chan_name="WION IN";;

# 22) India TODAY
22)
keyword="IndiaToday Live TV"
if [ "$getlink" = 1 ]
then
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCYPvAwZP8pZhSMW8qs7cVCw/videos?view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
#link="https://feeds.intoday.in/hltapps/api/master.m3u8"
#link="$( curl --socks5 "$socks_ip":"$socks_port" -A "$UA" "https://feeds.intoday.in/hltapps/api/master.m3u8" | grep 896000p | tail -n 1 )"
#link="$( curl -A "$UA" "https://feeds.intoday.in/hltapps/api/master.m3u8" | grep 2128000pb | tail -n 1 )"
# BANDWIDTH=2128000pb.m3u8 896000pb.m3u8 428000pb.m3u8 678000  1628000  428000

#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/playlist.m3u8"
#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/indiatoday_4/chunklist.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=255178,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180
#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/live_180p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=255178,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180
#link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/live_180p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=343162,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=416x234
#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/live_234p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=343162,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=416x234
#link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/live_234p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=661008,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=640x360
#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/live_360p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=661008,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=640x360
#link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/live_360p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=814666,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=718x404
#link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/live_404p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=814666,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=718x404
#link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/live_404p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1442805,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720
link="https://indiatodaylive.akamaized.net/hls/live/2014320/indiatoday/indiatodaylive/live_720p/chunks.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1442805,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720
#link="https://indiatodaylive.akamaized.net/hls/live/2014320-b/indiatoday/indiatodaylive/live_720p/chunks.m3u8"

fi
use_cookies="no"
#method="Tor"
TAG="INDIATODAY"
chan_name="India TODAY English" ;;

###########################  ASIA-OCEANIA   ############################################
# 23) CGTN China English
23)
keyword="Live"
if [ "$getlink" = 1 ]
then
link="https://english-livetx.cgtn.com/hls/yypdyyctzb_hd.m3u8"
#link="https://english-livews.cgtn.com/hls/yypdyyctzbhd/playlist.m3u8?wsApp=HLS"

### RADIO
#link="https://sk.cri.cn/am846.m3u8"

#link=https://www.filmon.com/tv/cctv-news
fi
###method="Tor"
use_cookies="no"
TAG="CGTN_ENG__"
chan_name="CGTN China English" ;;

# 24) Arirang TV Korea KR
24)

if [ "$getlink" = 1 ]
then

#http://vietcago.net/vstv/arirang.m3u8

#link="https://amdlive-ch01-ctnd-com.akamaized.net/arirang_1ch/smil:arirang_1ch.smil/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=656000,RESOLUTION=640x360
#link="https://amdlive-ch01-ctnd-com.akamaized.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b656000_sleng.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1256000,RESOLUTION=960x540
#link="https://amdlive-ch01-ctnd-com.akamaized.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b1256000_sleng.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2256000,RESOLUTION=1280x720
link="https://amdlive-ch01-ctnd-com.akamaized.net/arirang_1ch/smil:arirang_1ch.smil/chunklist_b2256000_sleng.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="ARIRANG_______"
chan_name="Arirang South Korea";;


# 25)NHK World Japan
25)
if [ "$getlink" = 1 ]
then


#link="https://cdn.nhkworld.jp/www11/nhkworld-tv/domestic/2003459/live.m3u8"
link="https://nhkwlive-ojp.akamaized.net/hls/live/2003459/nhkwlive-ojp-en/index_2M.m3u8"
#link="https://nhkwlive-ojp.akamaized.net/hls/live/2003459/nhkwlive-ojp-en/index_1M.m3u8"

#link="https://nhkworld.webcdn.stream.ne.jp/www11/nhkworld-tv/global/2003458/live.m3u8"

#link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_2M.m3u8"
#link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_2M.m3u8"
#link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_1M.m3u8"
#link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_1M.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=1086734,AVERAGE-BANDWIDTH=1240800,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_1M.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1086734,AVERAGE-BANDWIDTH=1240800,CODECS="avc1.4d401f,mp4a.40.5",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_1M.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,CODECS="mp4a.40.5"
#link="https://nhkwlive-xjp.akamaized.net/hls/live/2003458/nhkwlive-xjp-en/index_audio.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,CODECS="mp4a.40.5"
#link="https://b-nhkwlive-xjp.webcdn.stream.ne.jp/hls/live/2003458-b/nhkwlive-xjp-en/index_audio.m3u8"

fi
###method="Tor"
use_cookies="no"
TAG="NHKWORLDJP"
chan_name="NHK World Japan" ;;

# 26) Channel News Asia Singapore
26)

if [ "$getlink" = 1 ]
then
#link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=670208,AVERAGE-BANDWIDTH=563200,RESOLUTION=480x270,FRAME-RATE=25.000,CODECS="avc1.4D4015,mp4a.40.2"
#link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_1.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1120768,AVERAGE-BANDWIDTH=915200,RESOLUTION=640x360,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2"
#link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_2.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1931776,AVERAGE-BANDWIDTH=1548800,RESOLUTION=854x480,FRAME-RATE=25.000,CODECS="avc1.4D401E,mp4a.40.2"
#link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_3.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=4026880,AVERAGE-BANDWIDTH=3185600,RESOLUTION=1280x720,FRAME-RATE=25.000,CODECS="avc1.4D401F,mp4a.40.2"
#link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_4.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=6420449,AVERAGE-BANDWIDTH=5055564,RESOLUTION=1920x1080,FRAME-RATE=25.000,CODECS="avc1.4D4028,mp4a.40.2"
link="https://d2e1asnsl7br7b.cloudfront.net/7782e205e72f43aeb4a48ec97f66ebbe/index_5.m3u8"
fi
# method="Tor"
use_cookies="no"
TAG="CNA_SG____"
chan_name="CNA Channel News Asia Singapore" ;;

########################## AUSTRALIA ###########################################
# 27)  ABC News Australia
27)

if [ "$getlink" = 1 ]
then

#link="https://abc-iview-mediapackagestreams-2.akamaized.net/out/v1/64baf190a85c4fdd9f67d5a3c856876d/index.mpd"
###################YOUTUBE
keyword="ABC"
#keyword="Live"
channelURL="https://www.youtube.com/user/NewsOnABC/streams" 
youTubeGrab

fi
####method="Tor"
use_cookies="no"
TAG="ABC_AU____"
chan_name="ABC News Australia" ;;

# 28) Ticker News 
28)
if [ "$getlink" = 1 ]
then
link="https://live-hls-7agy.livepush.io/live_abr_cdn/nsitWAl1pTZtwca/emnmZbKZcO8RfwJR/index.m3u8"
fi
TAG="TICKER_AU__"
chan_name="TickerNews";;
########################### AFRICA ############################################
# 29) Arise News Nigeria
29)
if [ "$getlink" = 1 ]
then
keyword="Arise"

channelURL="https://www.youtube.com/@AriseNewsChannel/streams"
youTubeGrab

##link="https://liveedge-arisenews.visioncdn.com/live-hls/arisenews/arisenews/arisenews_web/master.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="ARISE_NG__"
chan_name="Arise News Nigeria";;

# 30) Africa News Live
30)
keyword="Live"

## YOUTUBE
#channelURL="https://www.youtube.com/@africanews/streams"
#youTubeGrab

# UPSTREAM SOURCE 
#https://www.africanews.com/api/watchlive.json
#radix=$ ( curl "https://www.africanews.com/api/watchlive.json" ) 

link="https:"$(curl -A "$UA" "https://www.africanews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""

#### NOT WORKING // Investigate
#base="https:"$(curl -A "$UA" "https://www.africanews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g' | cut -d \/ -f 1,2,3,4,5,6,7)"/"
#speed=3300000
#postfix="$(curl -A "$UA" "https:"$(curl -A "$UA" "https://www.africanews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""|grep "$speed")"
#link="$base"/"$postfix"

use_cookies="no"
chan_name="Africa News English";;

###################### UNITED NATIONS #################################################
# 31) United Nations UN Web TV
31)
keyword="LIVE"
### UN WEB TV
if [ "$getlink" = 1 ]
then
link="https://cdnapisec.kaltura.com/p/2503451/sp/250345100/playManifest/entryId/1_gb6tjmle/format/applehttp/protocol/https/uiConfId/43914941/a.m3u8"


# link="https://bcliveunivsecure-lh.akamaihd.net/i/un150_1@575439/index_1328_av-p.m3u8?sd=10&rebase=on"
##Trustship Chamber
#link=https://players.brightcove.net/1362235914001/B1J3DDQJf_default/index.html?videoId=5701485575001
##ECOSOC
#link=https://players.brightcove.net/1362235914001/B1J3DDQJf_default/index.html?videoId=5701459952001
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/unitednations/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
fi
####method="Tor"
use_cookies="no"
TAG="UN_TV_____"
chan_name="United Nations UN Web TV" ;;

##################    ALTERNATIVE MEDIA   ##################################################
# 32)Free Speech TV
32)
if [ "$getlink" = 1 ]
then

#link="https://edge.fstv-live-linear-channel.top.comcast.net/Content/HLS_HLSv3/Live/channel(b168a609-19c1-2203-ae1d-6b9726f05e67)/index.m3u8"
##EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1749451,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970
#link="https://edge.fstv-live-linear-channel.top.comcast.net/Content/HLS_HLSv3/Live/channel(b168a609-19c1-2203-ae1d-6b9726f05e67)/02.m3u8"
##EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1299886,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=512x288,FRAME-RATE=29.970
#link="https://edge.fstv-live-linear-channel.top.comcast.net/Content/HLS_HLSv3/Live/channel(b168a609-19c1-2203-ae1d-6b9726f05e67)/01.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2311408,CODECS="avc1.77.40,mp4a.40.2",RESOLUTION=853x480,FRAME-RATE=29.970
#REM set link="https://edge.fstv-live-linear-channel.top.comcast.net/Content/HLS_HLSv3/Live/channel(b168a609-19c1-2203-ae1d-6b9726f05e67)/03.m3u8"
#REM #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3997277,CODECS="avc1.77.40,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
link="https://edge.fstv-live-linear-channel.top.comcast.net/Content/HLS_HLSv3/Live/channel(b168a609-19c1-2203-ae1d-6b9726f05e67)/04.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="FREESPEECH"
chan_name="Free Speech TV" ;;

# 33) NEWSMAX USA
33)

if [ "$getlink" = 1 ]
then
#link=httpS://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/a.m3u8
#link=http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_720.m3u8
##link=http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_480.m3u8
#link=http://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_360.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=5640800,AVERAGE-BANDWIDTH=5640800,CODECS="avc1.4d4028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000,SUBTITLES="subs"
#link=https://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_1080.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=2890800,AVERAGE-BANDWIDTH=2890800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,SUBTITLES="subs"
#link=https://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_720.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1425600,AVERAGE-BANDWIDTH=1425600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=720x404,FRAME-RATE=30.000,SUBTITLES="subs"
#link=https://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_404.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=875600,AVERAGE-BANDWIDTH=875600,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=512x288,FRAME-RATE=30.000,SUBTITLES="subs"
#link=https://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_288.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=589600,AVERAGE-BANDWIDTH=589600,CODECS="avc1.4d400d,mp4a.40.2",RESOLUTION=384x216,FRAME-RATE=30.000,SUBTITLES="subs"
#link=https://cdnapi.kaltura.com/p/2216081/sp/221608100/playManifest/entryId/1_f19eeulz/format/applehttp/protocol/http/uiConfId/28428751/index_218.m3u8
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="English",DEFAULT=YES,AUTOSELECT=YES,FORCED=NO,LANGUAGE="eng",URI="index_cc.m3u8"

link=https://nmxlive.akamaized.net/hls/live/529965/Live_1/index.m3u8

# "https://www.newsmaxtv.com/"
# link=https://nmxlive.akamaized.net/hls/live/529965/Live_1/index.m3u8
#link="http://ooyalahd2-f.akamaihd.net/i/newsmax02_delivery@119568/master.m3u8"
# link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/NewsmaxTV/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"

############## YOUTUBE
#keyword="LIVE"
#channelURL="https://www.youtube.com/c/NewsmaxtvLive/videos?view=2&live_view=501"
#youTubeGrab


fi
##method="Tor"
use_cookies="no"
TAG="NEWSMAX___"
chan_name="NEWSMAX USA";;

# 34)  Infowars Live Alex Jones Show
34)

if [ "$getlink" = 1 ]
then

## https://banned.video/channel/the-alex-jones-show

link="https://freespeech.akamaized.net/hls/live/2024573/live2/playlist.m3u8"
#link="https://freespeech.akamaized.net/hls/live/2024573-b/live2/playlist.m3u8"


fi
# method="Tor"
use_cookies="no"
TAG="INFOWARS__"
chan_name="Infowars Alex Jones Show" ;;
########################### INFOWARS EXTRAS #######################################################

# 35) Infowars American Journal
35)
if [ "$getlink" = 1 ]
then
# https://banned.video/channel/the-american-journal

link="https://freespeech.akamaized.net/hls/live/2016873/live3/playlist.m3u8"

fi

TAG="INFOWARS2_"
use_cookies="no"
chan_name="Infowars American Journal" ;;

# 36) Infowars WarRoom Owen Shroyer
36)
if [ "$getlink" = 1 ]
then

# https://banned.video/channel/war-room-with-owen-shroyer
link="https://freespeech.akamaized.net/hls/live/2024574/live4/playlist.m3u8"

fi

TAG="INFOWARS3_"
use_cookies="no"
chan_name="Infowars WarRoom " ;;

## 37)FrankSpeech TV 1
37)
link="https://watch.frankspeech.io/hls/cf4e6ec7-2e3d-42bb-8787-7973293f610d.m3u8"
chan_name="FrankSpeech TV 1";;


# 38) FrankSpeech TV 2
38)
link="https://watch.frankspeech.io/hls/d1d579a5-59fa-4451-907b-2178e0efedcd.m3u8"
chan_name="FrankSpeech TV 2";;

# 39) FrankSpeech TV 3
39)
link="https://watch.frankspeech.io/hls/ddbf636a-4c99-4032-b9ff-475d80f9c2c3_480.m3u8"
chan_name="FrankSpeech TV 3";;

# 40) Brighteon TV
40)
link="https://rtmp-edge.brighteon.com/hls/brighteon-live/index.m3u8"
#link="https://rtmp-edge.brighteon.com/hls/brighteon2-live/index.m3u8"
##link="https://rtmp-edge.brighteon.com/hls/brighteon-live/index_480p/index.m3u8"
#link="https://rtmp-edge.brighteon.com/hls/brighteon-live/index_720p/index.m3u8"
chan_name="BrighteonTV";;


#############################  ENGLISH EXTRA #############################################

##################    DOCUMENTARY   ##################################################

#  41)VOA
41)
if [ "$getlink" = 1 ]
then
### VOA TV
#link="https://voa-ingest.akamaized.net/hls/live/2037660/tvmc13/playlist.m3u8"
link="https://www.voanews.com/live/video/116"
## VOA RADIO
#link="https://voa-ingest.akamaized.net/dash/live/2035100/161_352R/manifest.mpd"
# link=https://voa-ingest.akamaized.net/dash/live/2035100/161_352R/manifest.mpd

## VOA Africa
#link="https://voa-ingest.akamaized.net/dash/live/2035112/152_134L/manifest.mpd"

fi
##method="Tor"
#use_cookies="no"
TAG="VOA_______"
chan_name="VOA" ;;

# 42) CBC Explorer Canada
42)

if [ "$getlink" = 1 ]
then

website="https://gem.cbc.ca/"
eventID="_rLdLVACQsGnox8dV5pT-g"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"

#googleGrab2

link="https://amagi-streams.akamaized.net/hls/live/2110962/cbcexplore/master.m3u8"

#eventID="5PclQViSSK2sjs-F8dpm6Q"
#api_key="90309C33A86C10147DC061BA9283D5AA9A285B6666AA7915960BE745B99A9D21"

## CBC NEWS EXPLORE  (Documentaries)
# link="https://dai.google.com/linear/hls/pa/event/5PclQViSSK2sjs-F8dpm6Q/stream/0c27b3d9-a6b1-41b7-927d-a0e7ed3c8500:CHS/master.m3u8"
# link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/master.m3u8"
##EXT-X-STREAM-INF:BANDWIDTH=2400000,AVERAGE-BANDWIDTH=1500000,RESOLUTION=768x432,FRAME-RATE=29.97,CODECS="avc1.640029,mp4a.40.2"
#link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/432p/master.m3u8"
##EXT-X-STREAM-INF:BANDWIDTH=5550000,AVERAGE-BANDWIDTH=3350000,RESOLUTION=1280x720,FRAME-RATE=29.97,CODECS="avc1.640029,mp4a.40.2"
# link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/720p/master.m3u8"
##EXT-X-STREAM-INF:BANDWIDTH=3800000,AVERAGE-BANDWIDTH=2300000,RESOLUTION=960x540,FRAME-RATE=29.97,CODECS="avc1.640029,mp4a.40.2"
# link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/540p/master.m3u8"
##EXT-X-STREAM-INF:BANDWIDTH=1400000,AVERAGE-BANDWIDTH=900000,RESOLUTION=640x360,FRAME-RATE=29.97,CODECS="avc1.640029,mp4a.40.2"
# link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/360p/master.m3u8"
##EXT-X-STREAM-INF:BANDWIDTH=750000,AVERAGE-BANDWIDTH=600000,RESOLUTION=480x270,FRAME-RATE=29.97,CODECS="avc1.640029,mp4a.40.2"
# link="https://streamer.cbcrc.ca/prod/gem/cbc-news/hls/270p/master.m3u8"

fi
#####method="Tor"
use_cookies="no"
TAG="CBC_EXP_CA_"
chan_name="CBC Explore Canada";;

####### EASTERN DOCUMENTARIES ##############################################

# 43) RT Documentary
43)

if [ "$getlink" = 1 ]
then
#link=https://rtd.rt.com/on-air/
#link=https://rt-doc.secure.footprint.net/1101.m3u8

#link="https://rt-rtd.rttv.com/live/rtdoc/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=7594400,AVERAGE-BANDWIDTH=5020400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=25.000
#link="https://rt-rtd.rttv.com/live/rtdoc/playlist_4500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4250400,AVERAGE-BANDWIDTH=2820400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=25.000
link="https://rt-rtd.rttv.com/live/rtdoc/playlist_2500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2745600,AVERAGE-BANDWIDTH=1830400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=25.000
#link="https://rt-rtd.rttv.com/live/rtdoc/playlist_1600Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1408000,AVERAGE-BANDWIDTH=950400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="https://rt-rtd.rttv.com/live/rtdoc/playlist_800Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
#link="https://rt-rtd.rttv.com/live/rtdoc/playlist_64Kb.m3u8"

fi
#####method="Tor"
use_cookies="no"
TAG="RT_DOC____"
chan_name="RT Documentary" ;;

# 44) CGTN Documentary
44)

if [ "$getlink" = 1 ]
then
link="https://english-livetx.cgtn.com/hls/yypdjlctzb_hd.m3u8"
fi
###method="Tor"
use_cookies="no"
TAG="CGTN_DOC__"
chan_name="CGTN Documentary" ;;

######################## CANADA #################################

# 45) CBC Canada
45)

if [ "$getlink" = 1 ]
then

website="https://gem.cbc.ca/"
eventID="ZX-bVk6oQHyOaEJSRmxUlg"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

fi
#####method="Tor"
use_cookies="no"
TAG="CBC_CA____"
chan_name="CBC Canada";;

########################## CANADIAN GOVERNMENT #########################
# 46) CPAC 1 Canada
46)

if [ "$getlink" = 1 ]
then

#link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/.m3u8"
link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/.m3u8"

#audio_file="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-audio_track_0_0_eng=96000.m3u8"
#video_file="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=600000.m3u8"
#link=""$video_file" --audio-file="$audio_file" "

#AUDIO groups
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",LANGUAGE="en",NAME="English",DEFAULT=YES,AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_0_0_eng=96000.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",LANGUAGE="fr",NAME="French",AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_1_1_fre=96000.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aacl-96",NAME="audio_track_2_2_und",AUTOSELECT=YES,CHANNELS="2",URI="live-audio_track_2_2_und=96000.m3u8"

# CLOSED-CAPTIONS groups
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="textstream",NAME="textstream",DEFAULT=YES,AUTOSELECT=YES,INSTREAM-ID="CC1"

# variants
#EXT-X-STREAM-INF:BANDWIDTH=807000,AVERAGE-BANDWIDTH=733000,CODECS="mp4a.40.2,avc1.4D401E",RESOLUTION=640x360,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
#link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=600000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1740000,AVERAGE-BANDWIDTH=1581000,CODECS="mp4a.40.2,avc1.4D401F",RESOLUTION=960x540,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
#link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=1400000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2906000,AVERAGE-BANDWIDTH=2641000,CODECS="mp4a.40.2,avc1.4D401F",RESOLUTION=1280x720,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
#link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=2400000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=6404000,AVERAGE-BANDWIDTH=5821000,CODECS="mp4a.40.2,avc1.4D4028",RESOLUTION=1920x1080,FRAME-RATE=30,AUDIO="audio-aacl-96",CLOSED-CAPTIONS="textstream"
#link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/live-video_track=5400000.m3u8"

# keyframes
#EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=88000,CODECS="avc1.4D401E",RESOLUTION=640x360,URI="keyframes/live-video_track=600000.m3u8"REM 
#EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=205000,CODECS="avc1.4D401F",RESOLUTION=960x540,URI="keyframes/live-video_track=1400000.m3u8"R
#EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=350000,CODECS="avc1.4D401F",RESOLUTION=1280x720,URI="keyframes/live-video_track=2400000.m3u8"
#EXT-X-I-FRAME-STREAM-INF:BANDWIDTH=788000,CODECS="avc1.4D4028",RESOLUTION=1920x1080,URI="keyframes/live-video_track=5400000.m3u8"


fi
####method="Tor"
use_cookies="no"
TAG="CPAC_1_CA_"
chan_name="CPAC 1 Canada" ;;


############# WASHINGTON DC #################################
# 47) District of Columbia Network
47)
if [ "$getlink" = 1 ]
then
link=https://video.oct.dc.gov/out/u/DCN.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=364035,RESOLUTION=416x234,CODECS="avc1.4D400D,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/21_1.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=664059,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/21_2.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=864061,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/21_3.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1064061,RESOLUTION=1920x1080,CODECS="avc1.4D4028,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/21_4.m3u8
fi
#method="Tor"
use_cookies="no"
TAG="DC_NETWORK_____"
chan_name="District of Columbia Network" ;;

# 48) District of Columnbia
48)
if [ "$getlink" = 1 ]
then
link=https://video.oct.dc.gov/out/u/DCC.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=364063,RESOLUTION=416x234,CODECS="avc1.4D400D,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/15_1.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=664058,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/15_2.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=864062,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/15_3.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1064088,RESOLUTION=1920x1080,CODECS="avc1.4D4028,mp4a.40.2"
#link=https://video.oct.dc.gov/out/u/15_12.m3u8
fi
# method="Tor"
use_cookies="no"
TAG="DCC___________"
chan_name="District of Columbia" ;;

# 49) DC Knowledge Network
49)

if [ "$getlink" = 1 ]
then
link=https://video.oct.dc.gov/out/u/DKN.m3u8
#link="http://video.oct.dc.gov/out/u/119_8.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=427875,RESOLUTION=416x234,CODECS="avc1.4D401E,mp4a.40.2"
#link="http://video.oct.dc.gov/out/u/119_5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=727840,RESOLUTION=640x360,CODECS="avc1.4D401F,mp4a.40.2"
#link="http://video.oct.dc.gov/out/u/119_6.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=928015,RESOLUTION=640x360,CODECS="avc1.4D401F,mp4a.40.2"
#link="http://video.oct.dc.gov/out/u/119_7.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1128034,RESOLUTION=1920x1080,CODECS="avc1.4D402A,mp4a.40.2"
#link="http://video.oct.dc.gov/out/u/119_8.m3u8"
fi
#method="Tor"
use_cookies="no"
TAG="DC_KNOWLEDGE___"
chan_name="District of Columbia DC Knowledge Network USA";;


################################## MNN ###########################################
################## MANHATTAN NEIGHBOURHOOD NETWORK HD
# 50)MNN Channel 5 Manhattan Neighbourhood Network HD New York USA
50)
if [ "$getlink" = 1 ]
then
channelURL="https://player-api.new.livestream.com/accounts/17251372/events/10721168/"
liveStreamGrab
fi
use_cookies="no"
##method="Tor"
TAG="MNN_5__HD_"
chan_name="MNN Channel HD New York USA" ;;

# 51) MNN Channel 1 Community New York USA
51)
if [ "$getlink" = 1 ]
then
## MNN Community
channelURL="https://player-api.new.livestream.com/accounts/6480540/events/10721190/"
liveStreamGrab
fi
# method="Tor"
use_cookies="no"
TAG="MNN_1__________"
chan_name="MNN Channel 1 New York, USA" ;;

# 52) MNN 2 Lifestyle New York, USA
52)
if [ "$getlink" = 1 ]
then
channelURL="https://player-api.new.livestream.com/accounts/6478976/events/10721188/"
liveStreamGrab
fi
##method="Tor"
use_cookies="no"
TAG="MNN_2__________"
chan_name="MNN Channel 2 New York, USA" ;;

# 53) MNN Channel 3 Spirit New York, USA
53)
if [ "$getlink" = 1 ]
then
#https://player-api.new.livestream.com/accounts/6312590/events/2611503/
channelURL="https://player-api.new.livestream.com/accounts/6312590/events/10721313/"
liveStreamGrab
fi
## method="Tor"
use_cookies="no"
TAG="MNN_3__________"
chan_name="MNN Channel 3 New York, USA" ;;

# 54) MNN Channel 4 Culture New York, USA
54)
if [ "$getlink" = 1 ]
then
channelURL="https://player-api.new.livestream.com/accounts/6478935/events/10721179/"
liveStreamGrab
fi
## method="Tor"
use_cookies="no"
TAG="MNN_4__________"
chan_name="MNN Channel 4 New York, USA" ;;


# 55) BronxNet NY USA
55)
if [ "$getlink" = 1 ]
then
#link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/live.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
#link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/CELL-496k-270p/CELL-496k-270p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
link="https://reflect-stream-bronxnet.cablecast.tv/live-16/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="BRONXNET_16"
chan_name="BronxNet NY USA";;

# 56) BronxNet Omni NY USA
56)
if [ "$getlink" = 1 ]
then

#link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/live.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=570400,RESOLUTION=480x270,NAME="CELL-496k-270p"
#link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/CELL-496k-270p/CELL-496k-270p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
link="https://reflect-stream-bronxnet.cablecast.tv/live-19/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="BRONXNET_19"
chan_name="BronxNet Omni NY USA";;

# 57) BronxNet Culture NY USA
57)
if [ "$getlink" = 1 ]
then
#link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/live.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
#link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/CELL-496k-270p/CELL-496k-270p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
link="https://reflect-stream-bronxnet.cablecast.tv/live-7/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="BRONXNET_7"
chan_name="BronxNet Culture NY USA";;

# 58) BronxNet Life NY USA
58)
if [ "$getlink" = 1 ]
then
#link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/live.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
#link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/CELL-496k-270p/CELL-496k-270p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
link="https://reflect-stream-bronxnet.cablecast.tv/live-8/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="BRONXNET_8"
chan_name="BronxNet Life NY USA";;

################## UNIVERSITY TV ######################################
#############################################################

# 59) Lindenwood University LUTV
59)
if [ "$getlink" = 1 ]
then
#link="https://lutv-vod.lindenwood.edu/live-4/live/live.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1490400,RESOLUTION=960x540,NAME="WIFI-1296k-540p"
#link="https://lutv-vod.lindenwood.edu/live-4/live/WIFI-1296k-540p/WIFI-1296k-540p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2180400,RESOLUTION=1280x720,NAME="WIFI-1896k-720p"
#link="https://lutv-vod.lindenwood.edu/live-4/live/WIFI-1896k-720p/WIFI-1896k-720p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2410400,RESOLUTION=1920x1080,NAME="WIFI-2096k-1080p"
link="https://lutv-vod.lindenwood.edu/live-4/live/WIFI-2096k-1080p/WIFI-2096k-1080p.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="LUTV_______"
chan_name="Lindenwood University LUTV" ;;

#####################
# 60) Southeastern Channel
60)
if [ "$getlink" = 1 ]
then
#https://thesoutheasternchannel.com/live-stream/

link="https://selu-tv.cablecast.tv/live/stream-1/live.m3u8"
#link="https://selu-tv.cablecast.tv/live/stream-1/subtitle.en-US/subtitle.en-US.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG="SOUTHEASTERN___"
chan_name="Southeastern Channel" ;;

# 61) TSTV  Texas Student Televeision
61)

if [ "$getlink" = 1 ]
then
link="https://tstv-stream.tsm.utexas.edu/hls/livestream.m3u8"

#link=http://tstv-stream.tsm.utexas.edu/hls/livestream_hi/index.m3u8
#link=http://tstv-stream.tsm.utexas.edu/hls/livestream_low/index.m3u8

fi
##method="Tor"
use_cookies="no"
TAG="TSTV_TEXAS_____"
chan_name="TSTV Texas Student Television" ;;

# 62) Temple University TV
62)
if [ "$getlink" = 1 ]
then
link="https://livestream.telvue.com/templeuni1/f7b44cfafd5c52223d5498196c8a2e7b.sdp/playlist.m3u8"
#link="https://templeuni.secure.footprint.net/egress/bhandler/templeuni/streama/manifest.m3u8"
fi
use_cookies="no"
TAG="TEMPLE_TV____"
chan_name="Temple University TV" ;;

# 63) Bloomberg Business Australia
63)
keyword="Bloomberg"
if [ "$getlink" = 1 ]
then
#link=https://www.bloomberg.com/live/us
#link="http://cdn3.videos.bloomberg.com/btv/us/master.m3u8?b?b*t$"
#link=http://cdn-videos.akamaized.net/btv/desktop/akamai/europe/live/primary.m3u8
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/Bloomberg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"

#link="https://liveproduseast.akamaized.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8"

## US With charts
#glink="https://dai.google.com/linear/hls/event/BVlOmFGaTi6NpchccR14yA/master.m3u8"
## US No Charts
#glink="https://dai.google.com/linear/hls/event/PwTJe4aZRvSBjbWY7_VSzA/master.m3u8"
## Bloomberg Australia 
glink="https://dai.google.com/linear/hls/event/-0JiXPvoQCCx1Nbwgx9Xmw/master.m3u8"
## Europe BTV
#glink="https://dai.google.com/linear/hls/event/TPKhqf0BQn2_ijC-0rOJcA/master.m3u8"

bandwidth="1200000.m3u8"
# options = 1200000.m3u8 800000.m3u8 600000.m3u8 400000.m3u8 

link=$( curl $( curl "$glink" |  cut -d \" -f 2 ) | grep "$bandwidth" | head -n 1) 

fi
#method="Tor"
use_cookies="no"
TAG=" BLMBRG_____"
chan_name="Bloomberg Business AU";;

# 64) Bloomberg Business Europe
64)
keyword="Bloomberg"
if [ "$getlink" = 1 ]
then
#link=https://www.bloomberg.com/live/us
#link="http://cdn3.videos.bloomberg.com/btv/us/master.m3u8?b?b*t$"
#link=http://cdn-videos.akamaized.net/btv/desktop/akamai/europe/live/primary.m3u8
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/Bloomberg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"

#link="https://liveproduseast.akamaized.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8"

## US With charts
#glink="https://dai.google.com/linear/hls/event/BVlOmFGaTi6NpchccR14yA/master.m3u8"
## US No Charts
#glink="https://dai.google.com/linear/hls/event/PwTJe4aZRvSBjbWY7_VSzA/master.m3u8"
## Bloomberg Australia 
#glink="https://dai.google.com/linear/hls/event/-0JiXPvoQCCx1Nbwgx9Xmw/master.m3u8"
## Europe BTV
glink="https://dai.google.com/linear/hls/event/TPKhqf0BQn2_ijC-0rOJcA/master.m3u8"

bandwidth="1200000.m3u8"
# options = 1200000.m3u8 800000.m3u8 600000.m3u8 400000.m3u8 


link=$( curl $( curl "$glink" |  cut -d \" -f 2 ) | grep "$bandwidth" | head -n 1) 

## Bloomberg Radio
## link="https://18363.live.streamtheworld.com/WBBRAMAAC48/HLS/6f8a015a-40a3-4681-9033-f7be7203ca8c/0/playlist.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG=" BLMBRG_____"
chan_name="Bloomberg Business EU";;

# 65) Bloomberg Business USA + Charts
65)
keyword="Bloomberg"
if [ "$getlink" = 1 ]
then
#link=https://www.bloomberg.com/live/us
#link="http://cdn3.videos.bloomberg.com/btv/us/master.m3u8?b?b*t$"
#link=http://cdn-videos.akamaized.net/btv/desktop/akamai/europe/live/primary.m3u8
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/Bloomberg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"

#link="https://liveproduseast.akamaized.net/us/Channel-USTV-AWS-virginia-1/Source-USTV-1000-1_live.m3u8"

## US With charts
glink="https://dai.google.com/linear/hls/event/BVlOmFGaTi6NpchccR14yA/master.m3u8"
## US No Charts
#glink="https://dai.google.com/linear/hls/event/PwTJe4aZRvSBjbWY7_VSzA/master.m3u8"
## Bloomberg Australia 
#glink="https://dai.google.com/linear/hls/event/-0JiXPvoQCCx1Nbwgx9Xmw/master.m3u8"
## Europe BTV
#glink="https://dai.google.com/linear/hls/event/TPKhqf0BQn2_ijC-0rOJcA/master.m3u8"

bandwidth="3000000.m3u8"
# options = 3000000.m3u8 2400000.m3u8 1500000.m3u8 600000.m3u8 400000.m3u8

link=$( curl $( curl "$glink" |  cut -d \" -f 2 ) | grep "$bandwidth" | head -n 1) 

## Bloomberg Radio
## link="https://18363.live.streamtheworld.com/WBBRAMAAC48/HLS/6f8a015a-40a3-4681-9033-f7be7203ca8c/0/playlist.m3u8"

fi
#method="Tor"
use_cookies="no"
TAG=" BLMBRG_____"
chan_name="Bloomberg Business USA Charts";;

####################### LOCAL USA NEWS ##################################################

# 66) CBSN New York
66)
if [ "$getlink" = 1 ]
then

link="https://dai.google.com/linear/hls/event/jeTDC610T-OSPdiWhcl0Pg/master.m3u8"

#link="https://www.cbsnews.com/common/video/cbsn-ny-prod.m3u8"
#link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master.m3u8"

#link="https://www.cbsnews.com/common/video/cbsn-ny-prod.m3u8"
#link="https://cbsn-ny-cedexis.cbsnstream.cbsnews.com/out/v1/ec3897d58a9b45129a77d67aa247d136/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_NY_______"
chan_name="CBSN NY" ;;

# 67) CBSN LA
67)
if [ "$getlink" = 1 ]
then
#link="https://dai.google.com/linear/hls/pa/event/TxSbNMu4R5anKrjV02VOBg/stream/7fece08f-0ca5-4cbe-9545-0e1d733a9661:DLS/master.m3u8"
#link="https://cbsn-la-cedexis.cbsnstream.cbsnews.com/out/v1/57b6c4534a164accb6b1872b501e0028/master.m3u8"

link="https://dai.google.com/linear/hls/event/K_2aA7OVRTacJJli1oSi8w/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_LA_______"
chan_name="CBSN LA" ;;

# 68) CBSN Bay Area
68)
if [ "$getlink" = 1 ]
then
#link="https://cbsn-sf-cedexis.cbsnstream.cbsnews.com/out/v1/dac63c1abb3f4a2dac9f508f44bb072a/master.m3u8"
link="https://dai.google.com/linear/hls/event/laLJwH1nS2KQAUQTF8z1Cg/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_BAY_______"
chan_name="CBSN BAY AREA" ;;

# 69) CBSN Boston
69)
if [ "$getlink" = 1 ]
then
#link="https://dai.google.com/linear/hls/pa/event/26FJK7wRSo6RhPsK70XS_w/master.m3u8"
#link="https://dai.google.com/linear/hls/pa/event/26FJK7wRSo6RhPsK70XS_w/stream/1c87cbac-cf6f-442c-82b2-fff231ed3aa4:DLS/master.m3u8"
#link="https://cbsn-bos-cedexis.cbsnstream.cbsnews.com/out/v1/589d66ec6eb8434c96c28de0370d1326/master.m3u8"

link="https://dai.google.com/linear/hls/event/dHA193vxQ_WqZNVoC-W5MA/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_Boston_______"
chan_name="CBSN Boston" ;;

# 70) CBSN Chicago
70)
if [ "$getlink" = 1 ]
then

#link="https://dai.google.com/linear/hls/pa/event/DWt8iR1YQ-OJQsxczu8KfQ/master.m3u8"
#link="https://dai.google.com/linear/hls/pa/event/DWt8iR1YQ-OJQsxczu8KfQ/stream/3e6dc6fd-ea1b-4786-a9c5-8f48bd105847:DLS/master.m3u8"

#link="https://cbsn-chi-cedexis.cbsnstream.cbsnews.com/out/v1/b2fc0d5715d54908adf07f97d2616646/master.m3u8"

link="https://dai.google.com/linear/hls/event/_xQBtL7ZSEClkNebaXzn8w/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_Chicago_______"
chan_name="CBSN Chicago" ;;

# 71) CBSN Dallas Texas
71)
if [ "$getlink" = 1 ]
then

#link="https://dai.google.com/linear/hls/pa/event/o5J3g4U9T16CvYnS7Qd86Q/master.m3u8"
#link="https://dai.google.com/linear/hls/pa/event/o5J3g4U9T16CvYnS7Qd86Q/stream/29108445-1259-4926-b94c-cfb8296069f4:DLS/master.m3u8"

#link="https://cbsn-dal-cedexis.cbsnstream.cbsnews.com/out/v1/ffa98bbf7d2b4c038c229bd4d9122708/master.m3u8"

link="https://dai.google.com/linear/hls/event/ogzLhRCkRbG3lFHHJwqaNw/master.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_DAL______"
chan_name="CBSN DALLAS" ;;

# 72) CBSN Denver Colorado
72)
if [ "$getlink" = 1 ]
then
#link="https://dai.google.com/linear/hls/pa/event/EUo67MWSRh6toPi0heJKnQ/master.m3u8"
#link="https://dai.google.com/linear/hls/pa/event/EUo67MWSRh6toPi0heJKnQ/stream/d8c0a401-725c-488a-9d4b-39976b1bf679:DLS/master.m3u8"
# link="https://cbsn-den-cedexis.cbsnstream.cbsnews.com/out/v1/2e49baf2906244ecb01b07d9885fbe7a/master.m3u8"
link="https://dai.google.com/linear/hls/event/E9CkyheTSKeGiOiICU_JBQ/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_DEN___"
chan_name="CBSN DENVER" ;;

# 73) CBSN Minnesota
73)
if [ "$getlink" = 1 ]
then
  #link="https://dai.google.com/linear/hls/pa/event/zcWPVCfURNSPxeidcckQLA/master.m3u8"
  #link="https://dai.google.com/linear/hls/pa/event/zcWPVCfURNSPxeidcckQLA/stream/c8d93a89-21b3-49ee-8a81-ebfae0b39fde:DLS/master.m3u8"
  #link="https://cbsn-min-cedexis.cbsnstream.cbsnews.com/out/v1/76518f06941246ba810c8d175600bf74/master.m3u8"
link="https://dai.google.com/linear/hls/event/c0XucO32RNKG8oeQ351a4Q/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_MIN__"
chan_name="CBSN Minnesota" ;;

# 74) CBSN Philadelphia
74)
if [ "$getlink" = 1 ]
then
#link="https://cbsn-phi-cedexis.cbsnstream.cbsnews.com/out/v1/5c9ad3e215984b0e9ad845b335216b72/master.m3u8"
link="https://dai.google.com/linear/hls/event/R2Kw0uvnQIW7fUmOseurzA/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_PHIL__"
chan_name="CBSN Philadelphia" ;;

# 75) CBSN Pittsburgh
75)
if [ "$getlink" = 1 ]
then
#link="https://cbsn-pit-cedexis.cbsnstream.cbsnews.com/out/v1/6966dabf8150405ab26f854e3cd6a2b8/master.m3u8"
link="https://dai.google.com/linear/hls/event/mir-uZYjTu6-8JLMHBTKhQ/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_PITT__"
chan_name="CBSN Pittsburgh" ;;

# 76)CBSN Sacramento
76)
if [ "$getlink" = 1 ]
then
link="https://dai.google.com/linear/hls/event/e7mp4YVGS7O_e7rqRNjKow/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_SACRA__"
chan_name="CBSN Sacramento" ;;

# 77)CBSN Baltimore
77)
if [ "$getlink" = 1 ]
then
link="https://dai.google.com/linear/hls/event/TMUt418sQMeu1QtneYJ9ag/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_BALTIM__"
chan_name="CBSN Baltimore" ;;

# 78)CBSN Miami
78)
if [ "$getlink" = 1 ]
then
link="https://dai.google.com/linear/hls/event/_yODrBHESGSzPe3dqW4gGg/master.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="CBSN_MIAMI__"
chan_name="CBSN Miami" ;;

# 79) CNN Fast International
79)
if [ "$getlink" = 1 ]
then
link="https://live-manifests-aka.warnermediacdn.com/csmp/cmaf/live/2028716/cnnfast-international/master_de.m3u8"
####method="Tor"
use_cookies="no"
fi
TAG="CNN_FAST__"
chan_name="CNN Fast International" ;;

# 80) CNN Headlines
80)
if [ "$getlink" = 1 ]
then
link="https://live-manifests-fly.warnermediacdn.com/csmp/cmaf/live/2028715/cnnfast-domestic/master_de.m3u8"
####method="Tor"
use_cookies="no"
fi
TAG="CNN_HEADLINES__"
chan_name="CNN Headlines" ;;

############################################################
# 80) EuroNews English  BROKEN
#80)
#if [ "$getlink" = 1 ]
#then

#keyword="Live"
#channelURL="https://www.youtube.com/EuronewsUSA/videos?view=2&live_view=501"
#youTubeGrab

# endcurl "https:$(curl "https://www.euronews.com/api/watchlive.json" | cut -d : -f 2 | cut -d \} -f 1 | sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8
#radix="$(torsocks -i -a "$torsocks_ip" -P "$torsocks_port" curl "https:$(curl "https://www.euronews.com/api/watchlive.json" | cut -d : -f 2 | cut -d \} -f 1 | sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

#radix="$(curl -A "$UA" "https:$(curl -A "$UA"  "https://www.euronews.com/api/watchlive.json" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

#base_url="https://www.euronews.com/api/watchlive.json"
#radix="$(curl --socks5 "$torsocks_ip":"$torsocks_port" -A "$UA" "https:$(curl -A "$UA"  "$base_url" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

#link="$radix/playlist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3300000,RESOLUTION=1280x720
#link="$radix/ewnsabren_eng_720p33.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2000000,RESOLUTION=1280x720
#link="$radix/ewnsabren_eng_720p20.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=900000,RESOLUTION=1024x576
#link="$radix/ewnsabren_eng_576p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=500000,RESOLUTION=848x480
#link="$radix/ewnsabren_eng_480p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=250000,RESOLUTION=640x360
#link="$radix/ewnsabren_eng_360p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=120000,RESOLUTION=432x240
#link="$radix/ewnsabren_eng_240p.m3u8"

#fi

#method="Tor"
#method="Proxychains"

#use_cookies="no"
#chan_name="Euronews English Live" ;;

####################################################################

####################################################################
#80)
#
# University of Oregon
#https://lib-kni-strm01.uoregon.edu/youtube/streamer_2_push.stream/playlist.m3u8

################################################    FRENCH   ###################################

# 81) France 24
81)
keyword="FRANCE 24 en Direct"

if [ "$getlink" = 1 ]
then

#link=http://www.dailymotion.com/video/xigbvx_live-france-24_news
# link=http://static.france24.com/live/F24_FR_LO_HLS/live_ios.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1095600,AVERAGE-BANDWIDTH=1095600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=25.000,AUDIO="program_audio"
#link=http://f24hls-i.akamaihd.net/hls/live/221192/F24_FR_LO_HLS/master_900.m3u8
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_1",AUTOSELECT=YES,DEFAULT=YES,URI="master_96.m3u8"
#link=http://f24hls-i.akamaihd.net/hls/live/221192/F24_FR_LO_HLS/master_96.m3u8
#link=http://static.france24.com/live/F24_FR_HI_HLS/live_tv.m3u8

keyword="DIRECT"
channelURL="https://www.youtube.com/@FRANCE24/featured"
youTubeGrab

fi
use_cookies="no"
#format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
#method="Tor"
chan_name="France 24" ;;
# 82) BFM TV
82)

if [ "$getlink" = 1 ]
then
link="https://players.brightcove.net/876450610001/HJeY2afE_default/index.html?videoId=5615950982001"
#link=https://bfmtvalive1-a.akamaihd.net/8a3483ffeb9d40f0a738c1392f2bcc14/eu-central-1/876450610001/profile_1/87cd96eea0644453bd913833950774b0/chunklist_ssaiM.m3u8
#link=http://csm-e.dai.bfmtv.com/csm/live/109797390.m3u8
#link=https://www.dailymotion.com/video/xgz4t1_live-bfmtv_news
#link=link=https://www.filmon.com/tv/bfm-tv
fi
use_cookies="no"
#format=hls-1080@60-0
#format=hls-1080@60-1
#format=hls-720@60-0
#format=hls-720@60-1
#format=hls-480-0
#format=hls-480-1
#format=hls-380-0
#format=hls-380-1
#format=hls-240-0
#format=hls-240-1

#method="Tor"
chan_name="BFM TV";;
## 83) BFM BFM BUSINESS
83)

if [ "$getlink" = 1 ]
then
link="https://players.brightcove.net/876450612001/HycrnmXI_default/index.html?videoId=1920204345001"
#link=https://bfmbusisecure-i.akamaihd.net/hls/live/265375/876450612001/BFMBusinessS//audio_0_fra/audio_0_fra.m3u8
#link=https://bfmbusisecure-i.akamaihd.net/hls/live/265375/876450612001/BFMBusinessS//video_0/video_0.m3u8
## link=https://bfmbusisecure-i.akamaihd.net/hls/live/265375/876450612001/BFMBusinessS//audio_4_fra/audio_4_fra.m3u8
#link=https://bfmbusisecure-i.akamaihd.net/hls/live/265375/876450612001/BFMBusinessS//video_19/video_19.m3u8
#link="http://bfmlive-i.akamaihd.net/hls/live/254438/876450612001/DVMR_BFMBusiness2/master-4.m3u8"
#link="http://bfmlive-i.akamaihd.net/hls/live/254438/876450612001/DVMR_BFMBusiness2/master-3.m3u8"
#link="http://bfmlive-i.akamaihd.net/hls/live/254438/876450612001/DVMR_BFMBusiness2/master-2.m3u8"
#link="http://bfmlive-i.akamaihd.net/hls/live/254438/876450612001/DVMR_BFMBusiness2/master-1.m3u8"
fi
format=""
use_cookies="no"
#method="Tor"
chan_name="BFM Busineess France" ;;
# 84) RT Francais
84)

if [ "$getlink" = 1 ]
then

link="https://rt-fra.rttv.com/live/rtfrance/playlist.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=7594400,AVERAGE-BANDWIDTH=5020400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=25.000
#link="https://rt-fra.rttv.com/live/rtfrance/playlist_4500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4250400,AVERAGE-BANDWIDTH=2820400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=25.000
#link="https://rt-fra.rttv.com/live/rtfrance/playlist_2500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2745600,AVERAGE-BANDWIDTH=1830400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=25.000
#link="https://rt-fra.rttv.com/live/rtfrance/playlist_1600Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1408000,AVERAGE-BANDWIDTH=950400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="https://rt-fra.rttv.com/live/rtfrance/playlist_800Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
#link="https://rt-fra.rttv.com/live/rtfrance/playlist_64Kb.m3u8"

fi

use_cookies="no"
#method="Tor"
chan_name="RT France" ;;

# 85) France Info TV
85)
keyword="franceinfo"

if [ "$getlink" = 1 ]
then
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/franceinfo/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
#link=https://www.dailymotion.com/video/x4rdeu6_live-franceinfo-tv_news
#link=https://livefrancetv.akamaized.net/simulcast/France_Info/dash_monde/ZXhwPTE1MjUxODIxMzZ+YWNsPSUyZnNpbXVsY2FzdCUyZkZyYW5jZV9JbmZvJTJmZGFzaF9tb25kZSp+aG1hYz1mZDU1NmM2NmE5ODExZWNlOGI5YjQ1MDc3ZDA2ZTQ4YTg1Y2FmNTkyNTdiY2Q4MWI1YzU4YjRiMWE0M2MxYmUw/France_Info.mpd
#link="https://videos.francetv.fr/video/SIM_Franceinfo"
#link="https://simulcast.ftven.fr/ZXhwPTE2MjY2MTIxMTd+YWNsPSUyZip+aG1hYz03M2Y4YzgzZDg2YzQ2MzBhODQ5MjczOTM4NDk5ZDUxZWUyYjFmYThlMWM1Y2FjMTZjOWE2MzVjNzJmYjI1YWY0/simulcast/France_Info/hls_monde_frinfo/index.m3u8"


channelURL="https://hdfauthftv-a.akamaihd.net/esi/TA?format=json&url=https%3A%2F%2Fsimulcast-p.ftven.fr%2Fsimulcast%2FFrance_Info%2Fhls_monde_frinfo%2Findex.m3u8"

#channelURL="https://hdfauthftv-a.akamaihd.net/esi/TA?format=json&url=https%3A%2F%2Fsimulcast.ftven.fr%2Fsimulcast%2FFrance_Info%2Fhls_monde_frinfo%2Findex.m3u8"

link=$(curl -A "$UA" $channelURL | cut -d \" -f 4)


fi
#format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
format="best"
use_cookies="no"
#method="Tor"
chan_name="France Info TV" ;;


# 86) CGTN Francais
86)

if [ "$getlink" = 1 ]
then
link="https://francais-livews.cgtn.com/hls/LSvev95OuFZtKLc6CeKEFYXj220802LSTeV6PO0Ut9r71Uq3k5goCA220802cd/playlist.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="CGTN Francais" ;;

# 87) Africa News Francais
87)
keyword="DIRECT"

if [ "$getlink" = 1 ]
then
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC25EuGAePOPvPrUA5cmu3dQ/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1 )"

#link="https://www.dailymotion.com/video/x6i37o5"

## Broken
#radix="$(curl -A "$UA" "https:"$(curl -A "$UA" "https://fr.africanews.com/api/watchlive.json" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')"" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

link="https:"$(curl -A "$UA" "https://fr.africanews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""

fi

use_cookies="no"
#method="Tor"
chan_name="Africa News Francais" ;;

# 88) RDI Radio Canada ICI
88)

if [ "$getlink" = 1 ]
then
website="https://ici.tou.tv/"
eventID="ixE_JVvSSCWyxU7eXJoV-A"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

fi
## method="Tor"
use_cookies="no"
chan_name="RDI Radio Canada ICI" ;;

# 89) ICI Tele Alberta
89)

link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master.m3u8"
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-INDEPENDENT-SEGMENTS
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_256.m3u8"
use_cookies="no"
chan_name="ICI Tele Alberta" ;;


# 90) TVA CA
90)

if [ "$getlink" = 1 ]
then
website="https://www.tvaplus.ca/tva/en-direct"
eventID="5DUWih-wSeOUg9zszuE-Jw"
ppid="3bfa058d-32e0-445f-8916-182983ced72c"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
fi
use_cookies="no"
#method="Tor"
chan_name="TVA CA";;


# 91) FRANCE 2
91)

if [ "$getlink" = 1 ]
then
#link=http://par-4.firstone.tv/hls/1f181ce3-b1d5-70a2-8cc7-9f6ef5df7d89.m3u8
link=https://www.filmon.com/tv/france-2
fi
use_cookies="no"
#method="Tor"
chan_name="France 2" ;;

# 92) France 3
92)

if [ "$getlink" = 1 ]
then
#link=http://par-4.firstone.tv/hls/f5d676d6-692f-eb8c-8c3c-34f741a0f7b3.m3u8
link=https://www.filmon.com/tv/france-3-rhone-alpes
fi

use_cookies="no"
#method="Tor"
chan_name="France 3" ;;

# 93) ARTE FRANCAIS
93)

if [ "$getlink" = 1 ]
then
link=https://www.filmon.com/tv/arte-francais
fi

use_cookies="no"
#method="Tor"
chan_name="ARTE Francais" ;;


# 94) IL TV France
94)

if [ "$getlink" = 1 ]
then
#link=rtmp://str81.creacast.com:80/iltv/high
link="http://str81.creacast.com:80/iltv/high/playlist.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="IL TV" ;;

# 95) BFM Paris Francais
95)

if [ "$getlink" = 1 ]
then
link="https://players.brightcove.net/5132998232001/H1bPo8t6_default/index.html?videoId=5152968636001"
#link=http://bfmparishdslive-lh.akamaihd.net/i/DVMR_PARIS@429747/master.m3u8
fi
use_cookies="no"
#method="Tor"
chan_name="BFM Paris Francais" ;;


# 96) Alsace 20 France
96)

if [ "$getlink" = 1 ]
then
link="https://live.alsace20.fr/live/alsace20/ngrp:alsace20_all/master.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="Alsace 20 France" ;;

# 97) Mosaik TV Francais
97)
keyword="Cristal"
channelURL="https://www.youtube.com/user/mosaiktv/streams"
if [ "$getlink" = 1 ]
then
# set the link
youTubeGrab3
fi

## method="Tor"
use_cookies="no"
chan_name="Mosaik TV" ;;

## 98) Tv Vendée - Le Direct
98)
if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/x38yjeb"
#####method="Tor"
fi
use_cookies="no"
chan_name="Tv Vendée";;

# 99) 8 Mont Blanc FR
99)

if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/x3wqv8b"
fi
use_cookies="no"
#method="Tor"
chan_name="8 Mont Blanc FR" ;;

# 100) TV7 Bordeaux
100)

if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/x46ancl"
fi
use_cookies="no"
#method="Tor"
chan_name="TV7 Bordeaux" ;;


# 101) TéléGrenoble Isère
101)
link="https://www.dailymotion.com/video/x128fjo"
#####method="Tor"
use_cookies="no"
chan_name="téléGrenoble Isère";;


# 102) LCP Assemblee National France
102)
if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/xji3qy"
fi
use_cookies="no"
#method="Tor"
chan_name="LCP Assemblee National France" ;;

# 103) Public Senate France
103)
if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/xkxbzc"
fi
use_cookies="no"

#method="Tor"
chan_name="Public Senate France" ;;


# 104) CPAC 1 Francais
104)
if [ "$getlink" = 1 ]
then
audio_track="2"
link="https://d7z3qjdsxbwoq.cloudfront.net/groupa/live/f9809cea-1e07-47cd-a94d-2ddd3e1351db/live.isml/.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="CPAC 1 Francais Canada" ;;

# 105) Assemblee Nationale du Quebec Francais
105)
if [ "$getlink" = 1 ]
then
link="https://wowzaprod231-i.akamaihd.net/hls/live/1013830/7f07867f/playlist.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="Assemblee Nationale du Quebec Francais Canada" ;;

# 106) BX1 BE
106)

if [ "$getlink" = 1 ]
then
link="https://149.202.81.107:1935/stream/live/playlist.m3u8"

fi
use_cookies="no"
#method="Tor"
chan_name="BX1 BE" ;;

# 107) France Info Radio
107)

if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/x26eox4_live-franceinfo-direct-radio_news"
fi
format=hls-380
use_cookies="no"
#method="Tor"
chan_name="France Info Radio" ;;

# 108) Europe 1
108)

if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/xqjkfz_europe-1-live_news"
fi
use_cookies="no"
#format=hls-720
#method="Tor"
chan_name="Europe 1" ;;

# 109) RTL BE
109)
if [ "$getlink" = 1 ]
then
#link=https://www.dailymotion.com/video/xl1km0_regardez-rtl-en-direct-et-en-video_news
link="https://www.dailymotion.com/video/xl1km0"
fi
use_cookies="no"
#method="Tor"
chan_name="RTL BE" ;;


# 110) France Inter
110)
keyword="France Inter en direct"

if [ "$getlink" = 1 ]
then
#link=https://www.dailymotion.com/video/x17qw0a_video-regardez-france-inter-en-direct_newsc
link="https://www.dailymotion.com/video/x17qw0a"

#channelURL="https://www.youtube.com/user/videofranceinter/videos?&view=2&live_view=501"
#youTubeGrab

fi
use_cookies="no"
chan_name="France Inter" ;;

# 111) RMC INFO TALK SPORT RADIO FRANCE
111)

if [ "$getlink" = 1 ]
then
link="https://players.brightcove.net/876630703001/SkKvZlxI_default/index.html?videoId=2623007265001"
fi
use_cookies="no"
chan_name="RMC INFO TALK SPORT France" ;;


# 112) CNEWS France
112)
link=https://www.dailymotion.com/video/x3b68jn
# link=http://www.dailymotion.com/embed/video/x3b68jn
method="Tor"
use_cookies="no"
#format=hls-1080
#format=hls-480
#format=hls-380
#format=hls-240
chan_name="CNEWS France" ;;

# 113) VL
113)
link="https://www.dailymotion.com/video/x35m6bz"
#####method="Tor"
use_cookies="no"
chan_name="VL";;

# 114) RTL2
114)
link="https://www.dailymotion.com/video/x2tzzpj"
#####method="Tor"
use_cookies="no"
chan_name="RTL2";;


# 115) Azur TV Nice
115)
if [ "$getlink" = 1 ]
then
link="https://www.dailymotion.com/video/x13x1q2"
fi
use_cookies="no"
#method="Tor"
chan_name="Azur TV Nice" ;;

# 116) PressTV FR
116)
#link="https://live1.presstv.ir/live/presstvfr/index.m3u8"
link="https://live4.presstv.ir/live/smil:presstvfr.smil/playlist.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="PressTV FR";;

# 117) MB TV Monte Blanc
117)
link="https://www.dailymotion.com/video/x6142rr"
#####method="Tor"
use_cookies="no"
chan_name="MB TV Monte Blanc";;


# 118) OUATCH TV
118)
link="https://www.dailymotion.com/video/xuw47s"
#####method="Tor"
use_cookies="no"
chan_name="OUATCH TV";;

# 119) I24 Francais
119)
if [ "$getlink" = 1 ]
then
link="https://bcovlive-a.akamaihd.net/41814196d97e433fb401c5e632d985e9/eu-central-1/5377161796001/playlist.m3u8"
#link="https://bcovlive-a.akamaihd.net/41814196d97e433fb401c5e632d985e9/eu-central-1/5377161796001/profile_0/chunklist.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="i24 News Francais" ;;



# 120) Euronews Francais
120)

#keyword="euronews"
#method="Tor"

if [ "$getlink" = 1 ]
then
#link="http://fr.euronews.com/live"

#base_url="https://fr.euronews.com/api/watchlive.json"
#radix="$(curl --socks5 "$torsocks_ip":"$torsocks_port" -A "$UA" "https:$(curl -A "$UA"  "$base_url" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

link="https:"$(curl -A "$UA" "https://fr.euronews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""


#link="$radix/playlist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3300000,RESOLUTION=1280x720
#link="$radix/ewnsabrfr_fre_720p33.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2000000,RESOLUTION=1280x720
#link="$radix/ewnsabrfr_fre_720p20.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=900000,RESOLUTION=1024x576
#link="$radix/ewnsabrfr_fre_576p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=500000,RESOLUTION=848x480
#link="$radix/ewnsabrfr_fre_480p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=250000,RESOLUTION=640x360
#link="$radix/ewnsabrfr_fre_360p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=120000,RESOLUTION=432x240
#link="$radix/ewnsabrfr_fre_240p.m3u8"

fi

#format="720p"
## Formats 90p (worst), 180p, 224p, 360p, 540p, 720p (best)
#keyword="direct"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/euronewsfr/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
use_cookies="no"
method="Tor"
chan_name="Euronews Francais" ;;

###################  SPANISH  #################################
# 121) RT Espanol
121)
keyword="EN VIVO"

if [ "$getlink" = 1 ]
then

link="https://rt-esp.rttv.com/live/rtesp/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=7594400,AVERAGE-BANDWIDTH=5020400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=25.000
#link="https://rt-esp.rttv.com/live/rtesp/playlist_4500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4250400,AVERAGE-BANDWIDTH=2820400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=25.000
#link="https://rt-esp.rttv.com/live/rtesp/playlist_2500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2745600,AVERAGE-BANDWIDTH=1830400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=25.000
#link="https://rt-esp.rttv.com/live/rtesp/playlist_1600Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1408000,AVERAGE-BANDWIDTH=950400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="https://rt-esp.rttv.com/live/rtesp/playlist_800Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
#link="https://rt-esp.rttv.com/live/rtesp/playlist_64Kb.m3u8"

#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/ActualidadRT/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCEIhICHOQOonjE6V0SLdrHQ/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
#link=https://actualidad.rt.com/en_vivo2
fi

use_cookies="no"
#method="Tor"
chan_name="RT Espanol" ;;
# 122) DW Espanol
122)
keyword="DW Español en VIVO"

if [ "$getlink" = 1 ]
then

#link="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/index.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="SPA_301_150",DEFAULT=NO,AUTOSELECT=YES,LANGUAGE="SPA",URI="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream106/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1140853,AVERAGE-BANDWIDTH=950711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="ttps://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream01/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2100853,AVERAGE-BANDWIDTH=1750711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=711x400,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream02/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3780853,AVERAGE-BANDWIDTH=3150711,CODECS="avc1.77.32,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream03/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4780088,AVERAGE-BANDWIDTH=3983407,CODECS="avc1.100.41,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream04/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6898557,AVERAGE-BANDWIDTH=5748798,CODECS="avc1.100.42,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://dwamdstream104.akamaized.net/hls/live/2015530/dwstream104/stream05/streamPlaylist.m3u8"


#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/DeutscheWelleEspanol/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
fi

use_cookies="no"
#method="Tor"
chan_name="DW Espanol" ;;
# 123) CGTN Espanol
123)

if [ "$getlink" = 1 ]
then
link="https://espanol-livews.cgtn.com/hls/LSveOGBaBw41Ea7ukkVAUdKQ220802LSTexu6xAuFH8VZNBLE1ZNEa220802cd/playlist.m3u8"
fi
use_cookies="no"
#method="Tor"
chan_name="CGTN Espanol" ;;
###################### FRANCIA ##########################################
# 124) France 24 Espanol
124)

if [ "$getlink" = 1 ]
then

#link=http://f24hls-i.akamaihd.net/hls/live/520844/F24_ES_LO_HLS/master.m3u8
#link=http://static.france24.com/live/F24_ES_LO_HLS/live_web.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/520844/F24_ES_LO_HLS/master_900.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/520844-b/F24_ES_LO_HLS/master.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/520844-b/F24_ES_LO_HLS/master_900.m3u8
#link=http://static.france24.com/live/F24_ES_HI_HLS/live_tv.m3u8

keyword="VIVO"
channelURL="https://www.youtube.com/c/FRANCE24Espa%C3%B1ol/streams"
youTubeGrab3

fi
use_cookies="no"
#method="Tor"
chan_name="France 24 Espanol" ;;

# 125) TeleSUR Venezuela
125)
keyword="EN VIVO"

if [ "$getlink" = 1 ]
then
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/telesurtv/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1 )"
#link=http://cdn2.telesur.ultrabase.net/livecf/telesurLive/master.m3u8

link=https://cdnesmain.telesur.ultrabase.net/mbliveMain/hd/playlist.m3u8
#link=https://cdnesmain.telesur.ultrabase.net/mbliveMain/480p/playlist.m3u8
#link=https://cdnesmain.telesur.ultrabase.net/mbliveMain/360p/playlist.m3u8

#link="https://cdnesmain.telesur.ultrabase.net/mbliveMain/audio/chunklist.m3u8"

fi
use_cookies="no"
chan_name="TeleSUR Venezuela" ;;

# 126) Hispan TV Iran
126)
keyword="HispanTV"

if [ "$getlink" = 1 ]
then
link="https://live.presstv.ir/hls/hispantv_5_482/index.m3u8"

#channelURL="https://www.youtube.com/user/hispantv/featured"
#youtubeGrab3
fi
use_cookies="no"
chan_name="HispanTV Iran" ;;

############## ESPANIA ######################################
# 127) Malaga TV Spain  Malaga,Andalusia,Spain
127)
keyword="en vivo"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/Malaga24h/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Malaga TV Spain" ;;


######################### ARGENTINA ##############################################
# 128) c5n Argentina
128)
keyword="C5N EN VIVO"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/c5n/featured"
youTubeGrab3

# link=http://www.c5n.com/
fi
use_cookies="no"
chan_name="c5n Argentina" ;;

# 129) Canal Acequia Mendoza AR
129)

if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/6450028/events/5813077"
liveStreamGrab

fi
use_cookies="no"
chan_name="Canal Acequia Mendoza AR" ;;

# 130) Todo Noticias Argentina
130)
keyword="vivo"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCj6PcyLvpnIRT_2W_mwa9Aw/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Todo Noticias Argentina";;

# 131) La Nacion TV Argentina
131)
keyword="LN+"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/LaNacionTV/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="La Nacion TV Argentina";;

# 132) A24 Argentina
132)
keyword="A24"

channelURL="https://www.youtube.com/channel/UCR9120YBAqMfntqgRTKmkjQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="A24 Argentina";;


# 133) KZO En Vivo Canal 30
133)
keyword="VIVO"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCv0zRACOVWmhu1Ilufm40-w/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="KZO Canal 30 Cablevision" ;;


# 134)  Canal 2 Argentina
134)

if [ "$getlink" = 1 ]
then
#link="https://livestream.com/accounts/679322/Canal2Jujuy"

channelURL="https://livestream.com/accounts/679322/Canal2Jujuy"
liveStreamGrab

fi
use_cookies="no"
chan_name="Canal 2 Argentina" ;;


# 135) TV5 Argentina
135)

if [ "$getlink" = 1 ]
then

link="https://livestream.com/T5SATELITAL/events/8664197"

## Not working??
#channelURL="https://livestream.com/T5SATELITAL/events/8664197"
#liveStreamGrab

fi
use_cookies="no"
chan_name="TV5 Argentina" ;;


# 136) Canal 7 Mendoza Argentina
136)
keyword="VIVO"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/webcanal7mendoza/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Canal 7 Mendoza Argentina" ;;

# 137) Canal 13 San Juan Argentina
137)
keyword="directo"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCnfpjpEMfxPXAI3Nc23MTWA/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Canal 13 San Juan Argentina" ;;

# 138) CN23 Argentina
138)
keyword="CN23"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCC05qIa00qEB06CtCi01NbQ/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="CN23 Argentina" ;;

# 139) Telemax Argentina
139)

if [ "$getlink" = 1 ]
then
link="http://live-edge01.telecentro.net.ar/live/smil:tlx.smil/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=364000,RESOLUTION=320x180
#link=http://live-edge01.telecentro.net.ar/live/smil:tlx.smil/chunklist_w813342727_b364000_sleng.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=864000,RESOLUTION=640x360
#link=http://live-edge01.telecentro.net.ar/live/smil:tlx.smil/chunklist_w813342727_b864000_sleng.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1828000,RESOLUTION=1280x720
#link=http://live-edge01.telecentro.net.ar/live/smil:tlx.smil/chunklist_w813342727_b1828000_sleng.m3u8
fi
use_cookies="no"
chan_name="Telemax Argentina" ;;

# 140) VORTERIX AR
140)
keyword="EN VIVO"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCvCTWHCbBC0b9UIeLeNs8ug/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="VORTERIX AR" ;;

# 141) TV Publica Argentina
141)
keyword="VIVO"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/TVPublicaArgentina/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="TV Publica Argentina" ;;


################BOLIVIA ##################################

######################       CHILE       #################################
# 142)Senal Internacional Mega Chile
142)
keyword="Mega"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/programasmega/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Senal Internacional Mega Chile" ;;

################## Colombia ###################

# 143)Telemedellin CO
143)
keyword="Telemedellin"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCW_16ow2scNATL0NSxlBtPg/featured"
youTubeGrab3

#channelURL="https://livestream.com/accounts/4608897/events/7111788/"
#liveStreamGrab

fi
use_cookies="no"
chan_name="Telemedellin CO" ;;

# 144) Canal Telecafé CO
144)
link="https://livestream.com/canaltelecafe/redes-sociales"
#channelURL="https://livestream.com/canaltelecafe/redes-sociales"
#liveStreamGrab
use_cookies="no"
chan_name="Canal Telecafé CO" ;;

################# VENEZUELA

# 145) Globovision Venezeula
145)
keyword="Globovisión"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCfJtBtmhnIyfUB6RqXeImMw/featured"
youTubeGrab3

#link=http://www.dailymotion.com/video/xio7e2_senal-en-vivo_news
fi
use_cookies="no"
chan_name="Globovision Venezeula" ;;


# 146) VPItv Venezuela
146)
keyword="Vivo"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCVFiIRuxJ2GmJLUkHmlmj4w/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="VPItv Venezuela" ;;

#################### CENTRAL AMERICA    #############################################

#################### MEXICO #########################################################

# 147) TVDIÁRIO 145 Mexico
147)
#link="https://livestream.com/accounts/7328757/events/7373344"

channelURL="https://livestream.com/accounts/7328757/events/7373344"
liveStreamGrab

use_cookies="no"
chan_name="TVDIÁRIO 145 MX" ;;

# 148) Excelsior TV Mexico
148)
keyword="Transmisión en directo de Excélsior TV"

if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UClqo4ZAAZ01HQdCTlovCgkA/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Excelsior TV Mexico" ;;

###########################  EXTRA
## 149)
149)
##Brighteon TV Espanol
link="https://rtmp-edge.brighteon.com/hls/brighteones-live/index_720p/index.m3u8"
chan_name="BrighteonTV";;

## 150) 

## 151) 

## 152) TeleSUR VE
152)
if [ "$getlink" = 1 ]
then
#EXTINF:-1 tvg-id="" tvg-name="" tvg-logo="" group-title="",TELESUR
link="http://k3.usastreams.com:1935/telesur/telesur/playlist.m3u8"
fi
use_cookies="no"
chan_name="TeleSUR VE" ;;


############################ BROKEN EURONEWS
# 160) Euronews Espanol
160)

#keyword="euronews"
#method="Tor"

if [ "$getlink" = 1 ]
then
#link="http://es.euronews.com/live"

#base_url="https://es.euronews.com/api/watchlive.json"
#radix="$(curl --socks5 "$torsocks_ip":"$torsocks_port" -A "$UA" "https:$(curl -A "$UA"  "$base_url" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

#link="$radix/playlist.m3u8"
#EXTM3U
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3300000,RESOLUTION=1280x720
#link="$radix/ewnsabres_spa_720p33.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2000000,RESOLUTION=1280x720
#link="$radix/ewnsabres_spa_720p20.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=900000,RESOLUTION=1024x576
#link="$radix/ewnsabres_spa_576p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=500000,RESOLUTION=848x480
#link="$radix/ewnsabres_spa_480p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=250000,RESOLUTION=640x360
#link="$radix/#link="$radix/ewnsabres_spa_360p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=120000,RESOLUTION=432x240
#link="$radix/ewnsabres_spa_240p.m3u8"

link="https:"$(curl -A "$UA" "https://es.euronews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""




fi

#format="720p"
## Formats 90p (worst), 180p, 224p, 360p, 540p, 720p (best)
#keyword="direct"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/euronewses/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
use_cookies="no"
#method="Tor"
chan_name="Euronews ES" ;;


####################################### NORTHERN EUROPE ##############################################################
################  GERMAN   #######################################
# 161) WDR Germany
161)

if [ "$getlink" = 1 ]
then
link="http://wdr_fs-lh.akamaihd.net/i/wdrfs_weltweit@112033/master.m3u8"


#link="https://wdrfs247.akamaized.net/hls/live/681509/wdr_msl4_fs247/index.m3u8"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=1672000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master_1328.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1672000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628-b/wdr_msl4_fs247ww/master_1028.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4224000,AVERAGE-BANDWIDTH=3660800,CODECS="avc1.640020,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master_3328.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4224000,AVERAGE-BANDWIDTH=3660800,CODECS="avc1.640020,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628-b/wdr_msl4_fs247ww/master_3628.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2182400,AVERAGE-BANDWIDTH=1900800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master_1728.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2182400,AVERAGE-BANDWIDTH=1900800,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628-b/wdr_msl4_fs247ww/master_1928.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1034000,AVERAGE-BANDWIDTH=910800,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master_828.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1034000,AVERAGE-BANDWIDTH=910800,CODECS="avc1.4d401e,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://wdrfsww247.akamaized.net/hls/live/2009628-b/wdr_msl4_fs247ww/master_578.m3u8"
#EXT-X-MEDIA:TYPE=SUBTITLES,NAME="Untertitel",DEFAULT=YES,AUTOSELECT=YES,FORCED=NO,LANGUAGE="ger",GROUP-ID="subs",URI="https://wdrfsww247.akamaized.net/hls/live/2009628/wdr_msl4_fs247ww/master_subs.m3u8"

fi
#method="Tor"
use_cookies="no"
chan_name="WDR Germany" ;;
# 162)DW Deutsch Welle
162)
keyword="DW"

if [ "$getlink" = 1 ]
then
#link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/index.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="DEU_301_100",DEFAULT=NO,AUTOSELECT=YES,LANGUAGE="DEU",URI="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream106/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1140853,AVERAGE-BANDWIDTH=950711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream01/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2100853,AVERAGE-BANDWIDTH=1750711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=711x400,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream02/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3780853,AVERAGE-BANDWIDTH=3150711,CODECS="avc1.77.32,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream03/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4780088,AVERAGE-BANDWIDTH=3983407,CODECS="avc1.100.41,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream04/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6898557,AVERAGE-BANDWIDTH=5748798,CODECS="avc1.100.42,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream106.akamaized.net/hls/live/2017965/dwstream106/stream05/streamPlaylist.m3u8"

### YOUTUBE STREAM 
#channelURL="https://www.youtube.com/user/deutschewelle/videos?view=2&live_view=501" 
#youTubeGrab

fi

#method="Tor"
use_cookies="no"
chan_name="DW Deutsch Welle DE";;


# 163) ZDK InfoKanal
163)

if [ "$getlink" = 1 ]
then
link=https://www.filmon.com/tv/zdf-infokanal
fi
use_cookies="no"
chan_name="ZDK InfoKanal Deutsch";;
# 164)  Tagessschau 24 Germany
164)

if [ "$getlink" = 1 ]
then

link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index.m3u8"

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=320000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1152000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1152_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1152000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1152_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1928000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1928_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1928000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_1928_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3712000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_3712_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3712000,RESOLUTION=1280x720,CODECS="avc1.64001f, mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_3712_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_320_a-b.m3u8?sd=10&rebase=on"


fi
use_cookies="no"
chan_name="Tagessschau 24 Germany" ;;



# 165) RT DE
165)
if [ "$getlink" = 1 ]
then

link="https://rt-ger.rttv.com/live/rtdeutsch/playlist.m3u8"

fi
use_cookies="no"
chan_name="RT DE" ;;

# 166)QVC DE
166)
if [ "$getlink" = 1 ]
then
link="https://llnw.live.qvc.simplestream.com/hera/remote/qvcde_primary_sdi7/2/prog_index.m3u8"
fi
use_cookies="no"
chan_name="QVC DE " ;;

# 167) ADR Alpha Live DE
167)
if [ "$getlink" = 1 ]
then
link="https://br-i.akamaihd.net/i/tafeln/br-fernsehen/br-fernsehen-tafel_,0,A,B,E,C,X,.mp4.csmil/index_2_av.m3u8?null=0"
fi
use_cookies="no"
chan_name="ADR Alpha Live DE" ;;

# 168) Radio 21 Nachreichten DE Germany
168)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/22300508/events/6675945"
liveStreamGrab

fi
use_cookies="no"
chan_name="Radio 21 Nachreichten DE" ;;

# 169)  DW Deutsch +     GEOregion blocked
169)
if [ "$getlink" = 1 ]
then

#link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/index.m3u8

#EXT-X-INDEPENDENT-SEGMENTS
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="ENG_301_149",DEFAULT=NO,AUTOSELECT=YES,LANGUAGE="ENG",URI="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream106/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1140853,AVERAGE-BANDWIDTH=950711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream01/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2100853,AVERAGE-BANDWIDTH=1750711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=711x400,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream02/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3780853,AVERAGE-BANDWIDTH=3150711,CODECS="avc1.77.32,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream03/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4780088,AVERAGE-BANDWIDTH=3983407,CODECS="avc1.100.41,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream04/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6898557,AVERAGE-BANDWIDTH=5748798,CODECS="avc1.100.42,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream105.akamaized.net/hls/live/2015531/dwstream105/stream05/streamPlaylist.m3u8"

fi
method="Tor"
use_cookies="no"
chan_name="DW Deutsch + DE" ;;

# 170) Baden TV DE
170)

if [ "$getlink" = 1 ]
then
#link="https://cdn.icu.de/rtplive/smil:btv.smil/chunklist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2224000,RESOLUTION=1280x720
link="https://cdn.icu.de/rtplive/smil:btv.smil/chunklist_w1511966266_b2224000_sldeu.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=964000,RESOLUTION=864x486
#link="https://cdn.icu.de/rtplive/smil:btv.smil/chunklist_w1511966266_b964000_sldeu.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2224000,RESOLUTION=1280x720
#link="https://cdn.icu.de/rtplive/smil:btv.smil/chunklist_w338674490_b2224000_sldeu.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1424000,RESOLUTION=720x576
#link="https://cdn.icu.de/rtplive/smil:btv.smil/chunklist_w338674490_b1424000_sldeu.m3u8"


fi
use_cookies="no"
chan_name="Baden TV " ;;


################  Austria
# 171) W24 Wein Austria
171)
if [ "$getlink" = 1 ]
then
#link=https://ms03.w24.at/W24/smil:liveevent.smil/chunklist.m3u8
#link=https://ms03.w24.at/W24/smil:liveevent.smil/chunklist_w1902571248_b1088000_slger.m3u8
#link=https://ms03.w24.at/W24/smil:liveevent.smil/chunklist_w1902571248_b448000_slger.m3u8
link=https://ms01.w24.at/W24/smil:liveevent.smil/chunklist_w1376873396_b1088000_slger.m3u8
fi
#method="Tor"
use_cookies="no"
chan_name="W24 Wein, Austria" ;;

# 172) Tirol TV Austria
172)
if [ "$getlink" = 1 ]
then
#link=http://lb.hd-livestream.de:1935/live/TirolTV/playlist.m3u8
#link=http://lb.hd-livestream.de:1935/live/TirolTV/chunklist_w1916857628.m3u8
link=https://58b42f6c8c9bf.streamlock.net:8080/live/TirolTV/playlist.m3u8

fi
#method="Tor"
use_cookies="no"
chan_name="Tirol TV Austria" ;;

############################### Switzerland###############################################
# 173) Musig24 TV Switzerland Deutsche
173)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/16598383/events/8687407"
liveStreamGrab

fi
use_cookies="no"
chan_name="musig24 TV Switzerland Deutsche" ;;


# 174) RTL TV 
174)
if [ "$getlink" = 1 ]
then

#ink="https://live-edge.rtl.lu/channel1/smil:channel1.smil/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4887400,AVERAGE-BANDWIDTH=4887400,CODECS="avc1.640029,mp4a.40.2",PROGRAM-ID=1,RESOLUTION=1920x1080,FRAME-RATE=25.000
link="https://live-edge.rtl.lu/channel1/smil:channel1.smil/1080p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2647752,AVERAGE-BANDWIDTH=2647752,CODECS="avc1.640029,mp4a.40.2",PROGRAM-ID=1,RESOLUTION=1280x720,FRAME-RATE=25.000
#ink="https://live-edge.rtl.lu/channel1/smil:channel1.smil/720p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1720008,AVERAGE-BANDWIDTH=1720008,CODECS="avc1.640029,mp4https://www.linkedin.com/me/search-appearances/a.40.2",PROGRAM-ID=1,RESOLUTION=854x480,FRAME-RATE=25.000
#ink="https://live-edge.rtl.lu/channel1/smil:channel1.smil/480p.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1147848,AVERAGE-BANDWIDTH=1147848,CODECS="avc1.64001f,mp4ahttps://www.linkedin.com/me/search-appearances/.40.2",PROGRAM-ID=1,RESOLUTION=640x360,FRAME-RATE=25.000
#ink="https://live-edge.rtl.lu/channel1/smil:channel1.smil/360p.m3u8"


fi
use_cookies="no"
chan_name="RTL LU" ;;


################## DUTCH
########## BELGIUM
# 175)TV OOST BE Dutch
175)

if [ "$getlink" = 1 ]
then
#link="https://livestream.com/accounts/27755193/events/8511193/" "https://player-api.new.livestream.com/v3/accounts/27755193/events/8511193/"
#link="$( curl "https://livestream.com/accounts/27755193/events/8511193/" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
#link="https://new.livestream.com/v3/accounts/27755193/events/8511193/live.secure.m3u8"
#link="https://player-api.new.livestream.com/accounts/27755193/events/8511193/live.secure.m3u8"

channelURL="https://player-api.new.livestream.com/accounts/27755193/events/8511193/"
liveStreamGrab

fi
use_cookies="no"
chan_name="TV OOST BE Dutch" ;;

########## NETHERLANDS

# 176)RTV OOST NETHERLANDS
176)
if [ "$getlink" = 1 ]
then

#link="https://streams.rtvoost.nl/video/tv/hls.m3u8"

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6051800,RESOLUTION=1920x1080,CODECS="avc1.4d4028,mp4a.40.2"
link="https://mediacdn.rtvoost.nl/live/rtvoost/tv/1634827838-fast-1920-1080-5500000-index.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3426800,RESOLUTION=1280x720,CODECS="avc1.4d401f,mp4a.40.2"
#link="https://mediacdn.rtvoost.nl/live/rtvoost/tv/1634827838-veryfast-1280-720-3000000-index.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=434300,RESOLUTION=800x450,CODECS="avc1.4d401e,mp4a.40.2"
#link="https://mediacdn.rtvoost.nl/live/rtvoost/tv/1634827838-ultrafast-800-450-150000-index.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=276800,CODECS="mp4a.40.2"
#link="https://mediacdn.rtvoost.nl/live/rtvoost/tv/1634827838-au-index.m3u8"

fi
use_cookies="no"
chan_name="TV OOST NL Dutch" ;;

# 177)AT5 NETHERLANDS
177)
if [ "$getlink" = 1 ]
then

channelURL="https://rrr.sz.xlcdn.com/?account=atvijf&file=live&type=live&service=wowza&protocol=https&output=playlist.m3u8"

link=$(curl -L $channelURL | head -n 6 | tail -n 1)


#EXTM3U
#EXT-X-VERSION:3
#EXT-X-STREAM-INF:BANDWIDTH=1153433,RESOLUTION=640x512 head -n 4
#https://ngx.cr1.streamzilla.xlcdn.com/session/db0c3da3a94ee6364f04c7598af0060f/sz/atvijf/wowza4/live/live.smil/chunklist_b1048576.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=2306867,RESOLUTION=768x608 head -n 6
#https://ngx.cr1.streamzilla.xlcdn.com/session/db0c3da3a94ee6364f04c7598af0060f/sz/atvijf/wowza4/live/live.smil/chunklist_b2097152.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3460300,RESOLUTION=1920x1536 head -n 8
#https://ngx.cr1.streamzilla.xlcdn.com/session/db0c3da3a94ee6364f04c7598af0060f/sz/atvijf/wowza4/live/live.smil/chunklist_b3145728.m3u8


fi
use_cookies="no"
chan_name="AT5 TV NETHERLANDS" ;;

#######################   EASTERN EUROPE ############################################
############### RUSSIAN ################################

# 178)  Euronews Russian
178)
#method="Tor"
if [ "$getlink" = 1 ]
then
#link="http://ru.euronews.com/live"

#link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist.m3u8
#link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist_2m.m3u8
#link=http://evronovosti.mediacdn.ru/sr1/evronovosti/playlist_1m.m3u8

link="https:"$(curl -A "$UA" "https://ru.euronews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""

fi
use_cookies="no"
chan_name="Euronews Russian" ;;

# 179) Россия 24
179)
keyword="24"
if [ "$getlink" = 1 ]
then
#link=https://live.russia.tv/index/index/channel_id/3
#link=https://www.filmon.com/tv/rossiya-24

#link="https://vk.com/video-80246985_456239779"
# link="https://vk.com/video-24136539_456239830"
# link="https://vk.com/rossia24online"
channelURL="https://www.youtube.com/user/Russia24TV/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="POCCNR 24 Russia" ;;

# 180) RBC TV RUSSIA
180)
if [ "$getlink" = 1 ]
then
link=http://online.video.rbc.ru/online/rbctv_480p/index.m3u8
#link=http://online.video.rbc.ru/online/rbctv_360p/index.m3u8
fi
use_cookies="no"
chan_name="RBC TV Russia" ;;

# 181) CGTN Russian
181)
if [ "$getlink" = 1 ]
then
link="https://russian-livews.cgtn.com/hls/LSvexABhNipibK5KRuUkvHZ7220802LSTeze9o8tdFXMHsb1VosgoT220802cd/playlist.m3u8"
fi
use_cookies="no"
chan_name="CGTN Russian" ;;

# 182) Vesti FM Russia
182)
keyword="Вести ФМ"
if [ "$getlink" = 1 ]
then
#link=https://live.russia.tv/index/index/channel_id/199

channelURL="https://www.youtube.com/user/vestifm/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Vesti FM Russia" ;;

# 183) Perviy Kanal Europa
183)
if [ "$getlink" = 1 ]
then
link=https://www.filmon.com/tv/perviy-kanal-europa
#link=https://edge1.1internet.tv/dash-live11/streams/1tv/1tvdash.mpd
#link=https://cdn9.1internet.tv/dash-live11/streams/1tv/1tvdash.mpd
#link=https://edge1.1internet.tv/hls-live/livepkgr/_definst_/1tv.m3u8
#link=https://cdn9.1internet.tv/hls-live/livepkgr/_definst_/1tv.m3u8
fi
use_cookies="no"
chan_name="Perviy Kanal Europa" ;;

# 184)  Current Time TV VOA
184)
keyword="НАСТОЯЩЕЕ ВРЕМЯ"
if [ "$getlink" = 1 ]
then

link="https://rfe-ingest.akamaized.net/dash/live/2033030/tvmc05/manifest.mpd"

#Multibitrate HDS: 
#link="https://rfe-lh.akamaihd.net/z/rfe_tvmc5@383630/manifest.f4m"
# HLS:
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/master.m3u8"
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/index_1080_av-p.m3u8"
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/index_0720_av-p.m3u8"
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/index_0540_av-p.m3u8"
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/index_0404_av-p.m3u8"
#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/index_0288_av-p.m3u8"



#link="https://voa-lh.akamaihd.net/i/voa_mpls_tvmc6@320298/master.m3u8"

#Single bitrate Flash in HD:
#rtmp://cp107825.live.edgefcs.net/live/rfe_tvmc5@383651

#link=https://www.filmon.com/tv/current-time-tv

#channelURL="https://www.youtube.com/user/currenttimetv/videos?&view=2&live_view=501"
#youTubeGrab

fi
use_cookies="no"
chan_name="Current Time TV" ;;

# 185) 5 RU
185)
keyword="Пятого канала"
if [ "$getlink" = 1 ]
then
#link=http://www.ontvtime.ru/general/channel5.html

channelURL="https://www.youtube.com/channel/UCGM8ZTtduKll7X8RiGe6N8g/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="5 Live RU" ;;
######################### UKRAINE  ##################################
# 186) News 24 UA
186)
keyword="24"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/news24ru/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="24 TV UA" ;;
# 187) UA TV Ukraine
187)
keyword="UATV"
if [ "$getlink" = 1 ]
then
link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_mid/index.m3u8
#link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_hi/index.m3u8
#link=https://ua-tv-hls3.cosmonova.net.ua/hls/ua-tv_ua_low/index.m3u8
fi
use_cookies="no"
chan_name="UA TV Ukraine" ;;

# 188) News 1 Ukraine
188)
keyword="NEWSONE"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UC9oI0Du20oMOlzsLDTQGfug/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="News 1 Ukraine" ;;

# 189) Ukraine Channel 5
189)
keyword="live"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/5channel/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Ukraine 5" ;;
################# Moldova
# 190) TV Publica Moldova
190)
if [ "$getlink" = 1 ]
then
link=http://livebeta.publika.md/LIVE/P/6810.m3u8
fi
use_cookies="no"
chan_name="TV Publica Moldova" ;;

# 191) RTDU TV Documentaries Russian
191)
if [ "$getlink" = 1 ]
then
link=https://rtmp.api.rt.com/hls/rtdru.m3u8
#link=https://rtmp.api.rt.com/hls/rtdru360.m3u8
fi
use_cookies="no"
chan_name="RTDU TV Documentaries Russia" ;;

############################# BROKEN EURONEWS

# 192) Thromadske Ukraine
192)
keyword="LIVE"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/HromadskeTV/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Thromadske Ukraine" ;;

# 193) Еспресо Ukraine
193)
keyword="LIVE"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/espresotv/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Ecnpeco Ukraine" ;;

# 200) Euronews Deutsch
200)
method="Tor"
#format="720p"
## Formats 90p (worst), 180p, 224p, 360p, 540p, 720p (best)
keyword="LIVE"
if [ "$getlink" = 1 ]
then
#link="http://de.euronews.com/live"

#base_url="https://de.euronews.com/api/watchlive.json"
#radix="$(curl --socks5 "$torsocks_ip":"$torsocks_port" -A "$UA" "https:$(curl -A "$UA"  "$base_url" | cut -d : -f 2 | cut -d \} -f 1 |sed 's/[\\"]//g')" | cut -d \: -f 4,5 | sed 's/[\\"]//g' | cut -d \, -f 1 | cut -d \/ -f 1,2,3,4,5,6,7,8 )"

#link="$radix/playlist.m3u8"
#EXTM3U
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3300000,RESOLUTION=1280x720
#link="$radix/ewnsabrde_ger_720p33.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2000000,RESOLUTION=1280x720
#link="$radix/ewnsabrde_ger_720p20.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=900000,RESOLUTION=1024x576
#link="$radix/ewnsabrde_ger_576p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=500000,RESOLUTION=848x480
#link="$radix/ewnsabrde_ger_480p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=250000,RESOLUTION=640x360
#link="$radix/ewnsabrde_ger_360p.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=120000,RESOLUTION=432x240
#link="$radix/ewnsabrde_ger_240p.m3u8"

link="https:"$(curl -A "$UA" "https://de.euronews.com/api/watchlive.json" | cut -d : -f 3 | cut -d \} -f 1 |sed 's/[\\"]//g')""

### YOUTUBE
#channelURL="https://www.youtube.com/user/euronewsde/videos?&view=2&live_view=501" 
#youTubeGrab
fi

use_cookies="no"
chan_name="Euronews Deutsch" ;;


# TV Kanal 12 RU
# link="https://vk.com/tvkanal12"
# link="https://vk.com/video-62455863_456248833"

# Pervy-Gorodskoy Telekanal
# link="https://vk.com/video/@id509009581"
# link=https://vk.com/video509009581_456239132

# 67 
# link="https://vk.com/tvregion67_smolensk"
# link="https://vk.com/video-9150517_456242314"

# Gtrk-Volgograd Trv
# link="https://vk.com/vestivolgograd"
# link="https://vk.com/video157253474_456240027"

# Vesti KO
# link="https://vk.com/vesti_ko"
# link="https://vk.com/video-48717536_456246428"

# NST iribit
# link="https://vk.com/ntsirbit"
# link="https://vk.com/video-36762560_456242710"

# 8 Kanal KRSK
# link="https://vk.com/8kanalkrsk"
# link="https://vk.com/video-105235529_456260514"

# Vesti Murman
# link="https://vk.com/vesti_murman"
# link="https://vk.com/video-80246985_456239779"

# Ellco
# link="https://vk.com/ellco_ru"
# link="https://vk.com/video-211635066_456239021"

# Sputnik Radio
# link="https://vk.com/sputnik_radio"
# link="https://vk.com/video-13984605_456245984"
# link="https://vk.com/video-13984605_456245985

# RT ES
# link="https://vk.com/actualidadrt"
# link="https://vk.com/video-61174019_456240097"

# ECO MEDIOS
# link="https://vk.com/ecomedios"
# link="https://vk.com/video-210630418_456239051"

# F1 TV
# link="https://vk.com/f1tvlive"
# link="https://vk.com/videos-10965324?z=video-212544418_456239021"

# Radio Tansmit
# link="https://vk.com/radiotransmit"
# link"https://vk.com/video-27479382_456239468"

# Respublik Anskiy
#link="https://vk.com/1respublikanskiy"
#link="https://vk.com/video/@1respublikanskiy"
#link="https://vk.com/video-75166498_456271965"

# MMA
# link="https://vk.com/video/@mma"
# link="https://vk.com/video-55587293_456242587"

# Public TV
# link="https://vk.com/public119750585"
# link="https://vk.com/video-119750585_456240733"

# TV Krasnodar
# link="https://vk.com/tvkrasnodar"
# link="https://vk.com/video-54068570_456244610"

########################### SOUTHERN EUROPE ################################################

##########################  Italian  #######################################################

# 201) QVC Itallian
201)
keyword="QVC in diretta"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/qvcitalia/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="QVC Italian" ;;

# 202) Mediaon BergamoTV Italian
202)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/245066/events/3063596"
liveStreamGrab

fi
use_cookies="no"
chan_name="Mediaon BergamoTV Italian" ;;

# 203) Radio Radio TV Rome Italy
203)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/11463451/tvlive"
liveStreamGrab

fi
use_cookies="no"
chan_name="Radio Radio TV Rome Italy" ;;


# 204) Udinews TV Udine Italy
204)
if [ "$getlink" = 1 ]
then

#link="https://livestream.com/accounts/11217196/Udinese"
link="https://livestream.com/udinewstv/udinese"

#liveStreamGrab

fi
use_cookies="no"
chan_name="Udinews TV Udine Italy" ;;

# 205) RTM TV Arcevia Italy
205)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/10831729/events/3759913"
liveStreamGrab

fi
use_cookies="no"
chan_name="RTM TV Arcevia Italy" ;;


# 206) 50 News Versilia Viareggio Italy
206)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/25529830/events/7893732"
liveStreamGrab

fi
use_cookies="no"
chan_name="50 News Versilia Viareggio Italy" ;;


# 207) 50 Canale Pisa Italy
207)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/50canale/events/8302416"
liveStreamGrab

fi
use_cookies="no"
chan_name="50 Canale Pisa Italy" ;;


# 208) Telelibertà Piacenza Italy
208)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/17114188/events/4902226"
liveStreamGrab

fi
use_cookies="no"
chan_name="Telelibertà Piacenza Italy" ;;

################# MALTA #######################################


###################  CROATIA   ##########################


################### Macedonia ######################################


################### ALBANIA ########################################
# 209) Top News Albania
209)
if [ "$getlink" = 1 ]
then
link=https://www.dailymotion.com/video/x6inuzo
fi
use_cookies="no"
#format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
use_cookies="no"
chan_name="Top News Albania" ;;
################  GREEK #################################################
## 210) Star Lamia
210)
if [ "$getlink" = 1 ]
then
link=http://www.dailymotion.com/video/xqjey2_star-lamia-live-streaming_news
fi
use_cookies="no"
chan_name="Star Lamia Greek" ;;
# 211) Action 24 Greece HD
211)
if [ "$getlink" = 1 ]
then
link=http://www.dailymotion.com/video/x61fbhs
fi
use_cookies="no"
chan_name="Action 24 Greece HD" ;;
################## TURKEY  ########################
## 212) TRT Haber Turkey
212)
keyword="TRT"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/trthaber/featured" 
youTubeGrab3

fi
use_cookies="no"
chan_name="TRT Haber Turkey";;
## 213) NTV Turkey
213)
keyword="NTV"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/ntv/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="NTV Turkey";;
## 214) HaberTurk TV
214)
keyword="Habertürk"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/TVhaberturk/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="HaberTurk TV";;
# 215) Star TV  Turkish
215)
keyword="Canlı Yayın"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/STARTVSTAR/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Star TV Turkey";;

# 216) KRT Kulture TV
216)
keyword="KRT"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCVKWwHoLwUMMa80cu_1uapA/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="KRT Kulture TV";;

# 217) TGRT Haber TV
217)
keyword="TGRT"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCzgrZ-CndOoylh2_e72nSBQ/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="TGRT Haber TV";;

# 218) TVNET Canali Yayin
218)
keyword="TVNET Canlı Yayın"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/tvnethaber/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="TVNET Canali Yayin";;

# 219) Show TV Turkey
219)
keyword="Show"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/ShowTVShowTV/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Show TV Turkey" ;;

#220

#240

####################################################
################## ARABIC  ##########################################
# 241) RT Arabic
241)
keyword="RT"

if [ "$getlink" = 1 ]
then

link="https://rt-arb.rttv.com/live/rtarab/playlist.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=7594400,AVERAGE-BANDWIDTH=5020400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=25.000
#link="https://rt-arb.rttv.com/live/rtarab/playlist_4500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4250400,AVERAGE-BANDWIDTH=2820400,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=25.000
#link="https://rt-arb.rttv.com/live/rtarab/playlist_2500Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2745600,AVERAGE-BANDWIDTH=1830400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=25.000
#link="https://rt-arb.rttv.com/live/rtarab/playlist_1600Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1408000,AVERAGE-BANDWIDTH=950400,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="https://rt-arb.rttv.com/live/rtarab/playlist_800Kb.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=70400,AVERAGE-BANDWIDTH=70400,CODECS="mp4a.40.2"
#link="https://rt-arb.rttv.com/live/rtarab/playlist_64Kb.m3u8"

#channelURL="https://www.youtube.com/user/RTarabic/videos?&view=2"
#youTubeGrab

fi

use_cookies="no"
chan_name="RT Arabic" ;;
# 242) France 24 Arabic
242)

if [ "$getlink" = 1 ]
then

##link=http://static.france24.com/live/F24_AR_LO_HLS/live_web.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/221196/F24_AR_LO_HLS/master.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/221196-b/F24_AR_LO_HLS/master.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1095600,AVERAGE-BANDWIDTH=1095600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=25.000,AUDIO="program_audio"
#link=http://f24hls-i.akamaihd.net/hls/live/221196-b/F24_AR_LO_HLS/master_900.m3u8
#link=http://f24hls-i.akamaihd.net/hls/live/221196/F24_AR_LO_HLS/master_900.m3u8
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_1",AUTOSELECT=YES,DEFAULT=YES,URI="master_96.m3u8"
#link=http://static.france24.com/live/F24_AR_HI_HLS/live_tv.m3u8

keyword="الأخبار "
channelURL="https://www.youtube.com/c/FRANCE24Arabic/featured"
youTubeGrab3


fi
use_cookies="no"
chan_name="France 24 Arabic" ;;
# 243) BBC Arabic
243)
keyword="BBC Arabic Live"
if [ "$getlink" = 1 ]
then
#link=https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/master.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=192000,RESOLUTION=256x144,CODECS="avc1.66.30, mp4a.40.2"
#link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_192_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=400000,RESOLUTION=512x288,CODECS="avc1.66.30, mp4a.40.2"
#link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=800000,RESOLUTION=640x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://bbcwshdlive01-lh.akamaihd.net/i/atv_1@61433/index_800_av-p.m3u8?sd=10&rebase=on"

channelURL="https://www.youtube.com/user/BBCArabicNews/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="BBC Arabic" ;;
# 244)  DW Arabic
244)
keyword="DW عربية مباشر"
if [ "$getlink" = 1 ]
then
#link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/index.m3u8"
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="ARA_301_100",DEFAULT=NO,AUTOSELECT=YES,LANGUAGE="ARA",URI="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream106/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1140853,AVERAGE-BANDWIDTH=950711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream01/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2100853,AVERAGE-BANDWIDTH=1750711,CODECS="avc1.77.31,mp4a.40.2",RESOLUTION=711x400,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream02/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=3780853,AVERAGE-BANDWIDTH=3150711,CODECS="avc1.77.32,mp4a.40.2",RESOLUTION=1024x576,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream03/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=4780088,AVERAGE-BANDWIDTH=3983407,CODECS="avc1.100.41,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=50.000,SUBTITLES="subs"
link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream04/streamPlaylist.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=6898557,AVERAGE-BANDWIDTH=5748798,CODECS="avc1.100.42,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=50.000,SUBTITLES="subs"
#link="https://dwamdstream103.akamaized.net/hls/live/2015526/dwstream103/stream05/streamPlaylist.m3u8"

#channelURL="https://www.youtube.com/user/deutschewellearabic/featured" 
#youTubeGrab3

fi

use_cookies="no"
chan_name="DW Arabic" ;;
# 245) CGTN Arabic
245)
if [ "$getlink" = 1 ]
then
link="https://arabic-livews.cgtn.com/hls/LSveq57bErWLinBnxosqjisZ220802LSTefTAS9zc9mpU08y3np9TH220802cd/playlist.m3u8"
fi
use_cookies="no"
chan_name="CGTN Arabic" ;;

####################################################################################
# 246) Al Jazeera Arabic Qatar QA
246)
if [ "$getlink" = 1 ]
then
#link="https://live-hls-web-aja.getaj.net/AJA/index.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=6324320,RESOLUTION=1920x1080,CODECS="avc1.640028,mp4a.40.2"
link="https://live-hls-web-aja.getaj.net/AJA/01.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3120800,RESOLUTION=1280x720,CODECS="avc1.64001f,mp4a.40.2"
#link="https://live-hls-web-aja.getaj.net/AJA/02.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1831872,RESOLUTION=960x540,CODECS="avc1.64001f,mp4a.40.2"
#link="https://live-hls-web-aja.getaj.net/AJA/03.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1013696,RESOLUTION=746x420,CODECS="avc1.64001e,mp4a.40.2"
#link="https://live-hls-web-aja.getaj.net/AJA/04.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=813664,RESOLUTION=640x360,CODECS="avc1.64001e,mp4a.40.2"
#ink="https://live-hls-web-aja.getaj.net/AJA/05.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=428640,RESOLUTION=426x240,CODECS="avc1.640015,mp4a.40.2"
#link="https://live-hls-web-aja.getaj.net/AJA/06.m3u8"

#link=https://www.aljazeera.net/broadcastschedule

################# YOUTUBE ############################
 #keyword="Live"
 #channelURL="https://www.youtube.com/c/aljazeera/videos?view=2&live_view=501"
 #youTubeGrab
 
fi
use_cookies="no"
chan_name="Al Jazeera Arabic" ;;
# 247) Al Jazeera Mubasher QA
247)
#keyword="Mubasher"
keyword="HD"
if [ "$getlink" = 1 ]
then
channelURL="https://www.youtube.com/c/ajmubasher/featured"
youTubeGrab3
fi

use_cookies="no"
chan_name="Al Jazeera Mubasher QA " ;;


################# Other Arabic
# 248) Al Arabiya, Dubai, United Arab Emirates
248)
keyword="قناة"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/AlArabiya/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Al Arabiya, Dubai, UAE " ;;

# 249) Al Mayadeen,  Beirut, Lebanon
249)
keyword="Live"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UC9YbjpvsFZytS0DnO1FnTKw/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="Al Mayadeen, Beirut, Lebanon" ;;

# 250) Belqees TV Yemen Arabic
250)
keyword="قناة بلقيس "
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/c/BelqeesTV/featured"
youTubeGrab3

#channelURL="https://livestream.com/accounts/12233888/events/3819374"
#liveStreamGrab

fi
use_cookies="no"
chan_name="Belqees TV Yemen Arabic" ;;

# 251) SKY Arabic, Abu Dhabi, UAE
251)
keyword="البث المباشر"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/skynewsarabia/featured" 
youTubeGrab3

fi
use_cookies="no"
chan_name="SKY Arabic, Abu Dhabi, UAE" ;;

# 252)Alghad TV Cairo Egypt
252)
keyword="Alghad"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UCH4UNKBHSNwstan99YDoCVg/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="AlGhad, Cairo, Egypt" ;;

# 253) eXtra News Egypt Arabic
253)
keyword="Live Stream"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UC65F33K2cXk9hGDbOQYhTOw/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="eXtra News Egypt" ;;

# 254) CBC Egypt Sofra Arabic
254)
keyword="Live"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/CBCSofraStream/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="CBC Egypt Sofra" ;;

# 255) CBC Egypt Arabic Drama
255)
keyword="Live"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/CBCDramaStream/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="CBC Egypt Arabic Drama" ;;

# 256) DMC Live EG
256)
keyword="dmc"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/channel/UClWxVmz6anf2M58vK_LHZJg/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="DMC LIVE EG" ;;

# 257) AFAQ TV IRAQ
257)
keyword="Afaq Tv Live"
if [ "$getlink" = 1 ]
then
channelURL="https://www.youtube.com/user/afaqiraq/featured"
youTubeGrab3
fi
use_cookies="no"
chan_name="AFAQ TV IRAQ" ;;


################################## FARSI / PERSIAN  ###########################################################
# 258)  BBC Persian TV
258)
keyword="پخش زنده"
if [ "$getlink" = 1 ]
then

#link=https://www.bbc.com/persian/media-49522521
link="https://vs-cmaf-pushb-ww-live.akamaized.net/x=3/i=urn:bbc:pips:service:bbc_persian_tv/pc_hd_abr_v2.mpd"

#channelURL="https://www.youtube.com/user/BBCPersian/featured"
#youTubeGrab3

fi
use_cookies="no"
chan_name="BBC Persian TV";;


# 259)  Iran Aryaee San Bernadino California
259)

channelURL="https://livestream.com/accounts/11825802/events/3752117"
liveStreamGrab

use_cookies="no"
chan_name="Iran Aryaee San Bernadino California" ;;

# 260) DidgahNew TV Iranian
260)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/27146356/events/8209491"
liveStreamGrab

fi
use_cookies="no"
chan_name="DidgahNew TV Iranian" ;;

# 261) PTN Pars TV USA Persian
261)
if [ "$getlink" = 1 ]
then

channelURL="https://livestream.com/accounts/5901056/events/4455330"
liveStreamGrab

fi
use_cookies="no"
chan_name="PTN Pars TV USA Persian" ;;

################# AFGHANISTAN ######################################
## 262) TOLO NEWS AFGHANISTAN
262)
keyword="Live"
if [ "$getlink" = 1 ]
then

channelURL="https://www.youtube.com/user/TOLOnewsLive/featured"
youTubeGrab3

fi
use_cookies="no"
chan_name="TOLO NEWS AFGHANISTAN";;


############################## SAUDI TV   #########################################
# 263) Saudi Channel 1 Green KSA 1
263)
keyword="القناة"
if [ "$getlink" = 1 ]
then

#link=https://www.aloula.sa/live/
#link="https://www.aloula.sa/live/saudiatv"
#link="https://www.filmon.com/tv/saudi-arabian-tv-1"


channelURL="https://aloula.faulio.com/api/v1/channels/2"
link="$(curl $channelURL | cut -d \{ -f 5 | cut -d \: -f 2,3 | cut -d \, -f 1 | sed 's/[\\"]//g')"


KSAGrab

#channelURL="https://www.youtube.com/user/SaudiChannelOne/videos?&view=2&live_view=501"
#youTubeGrab

fi
use_cookies="no"
chan_name="Kingdom of Saudi Arabia Channel 1 Green" ;;


# 264) Kingdom of Saudi Arabia Sports Channel KSA Sports
264)
keyword="القنوات"
if [ "$getlink" = 1 ]
then
#link="https://www.filmon.com/tv/saudi-arabian-tv-sports"
#"http://www.shashatcom.sa/assets/themes/TriTheme/libraries/bootstrap/css/bootstrap.min.css.mapno"

channelURL="https://aloula.faulio.com/api/v1/channels/9"
KSAGrab

#channelURL="https://www.youtube.com/user/AlMalabTube/videos?&view=2&live_view=501"
#youTubeGrab

fi
use_cookies="no"
chan_name="Saudi Sports Channel 1 Red" ;;

## 265) KSA Sports 2 
265)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksasports2live/token=nva=1627445080~dirs=1~hash=0e822d6861d826fe6641d/ksasports2.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/10"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Sports 2";;

## 266) KSA Quaran
266)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksaquranlive/token=nva=1627445026~dirs=1~hash=01fc277536b286c963256/ksaquran.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/7"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Quaran";;


## 267) KSA Sunna
267)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksasunnalive/token=nva=1627445020~dirs=1~hash=0ce3c90f19d772d88669c/ksasunna.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/6"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Sunna";;

## 268) KSA Al Ekhbariya
268)
keyword="Live"
if [ "$getlink" = 1 ]
then

# https://www.aloula.sa/live/alekhbariya
#link="https://cllive.itworkscdn.net/ikhbariyalive/token=nva=1627445145~dirs=1~hash=03655eab0f00dbad0483c/ikhbariya.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/4"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Khbariya";;

## 269) KSA Zikrayat 
269)
keyword="Live"
if [ "$getlink" = 1 ]
then


#https://www.aloula.sa/live/thikrayat-tv
#link="https://cllive.itworkscdn.net/zikrayatlive/token=nva=1627445221~dirs=1~hash=0ecca3237f876eeabdd05/zikrayat.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/3"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Zikrayat";;

## 270) KSA SBC
270)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/sbclive/token=nva=1627445326~dirs=1~hash=002fa996f87c6f8571fed/sbc.smil/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/1"
KSAGrab

fi
use_cookies="no"
chan_name="KSA SBC";;
################ KSA RADIO ##########################################
## 271) KSA Saudia Radio
271)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksasaudiaradiolive/token=nva=1627444948~dirs=1~hash=0dff2369879df789d8b26/ksasaudiaradio/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/11"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Saudi Radio";;

## 272) KSA Jeddah Radio
272)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link=https://cllive.itworkscdn.net/ksajeddahradiolive/token=nva=1627445457~dirs=1~hash=073e2051ed1f592c9c880/ksajeddahradio/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/15"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Jeddah Radio";;

## 273) KSA Riyadh Radio
273)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksariyadhradiolive/token=nva=1627445623~dirs=1~hash=028e3753b672adb7795d0/ksariyadhradio/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/12"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Riyadh Radio";;

## 274) KSA Quaran Radio
274)
keyword="Live"
if [ "$getlink" = 1 ]
then

#link="https://cllive.itworkscdn.net/ksaquranradiolive/token=nva=1627445685~dirs=1~hash=0e13e722ab5993381e5f7/ksaquranradio/playlist.m3u8"
channelURL="https://aloula.faulio.com/api/v1/channels/13"
KSAGrab

fi
use_cookies="no"
chan_name="KSA Quaran Radio";;

#######################
## 275) I24 IL Arabic
275)
keyword="Live"
if [ "$getlink" = 1 ]
then

## I24 Arabic
link="https://bcovlive-a.akamaihd.net/95116e8d79524d87bf3ac20ba04241e3/eu-central-1/5377161796001/playlist.m3u8"
#link="https://bcovlive-a.akamaihd.net/95116e8d79524d87bf3ac20ba04241e3/eu-central-1/5377161796001/profile_0/chunklist.m3u8"
fi
use_cookies="no"
chan_name="I24 IL Arabic";;

## 276) I24 IL Hebrew
276)
keyword="Live"
if [ "$getlink" = 1 ]
then

### I24 IL Hebrew
link="https://bcovlive-a.akamaihd.net/d89ede8094c741b7924120b27764153c/eu-central-1/5377161796001/playlist.m3u8"
# link="https://bcovlive-a.akamaihd.net/d89ede8094c741b7924120b27764153c/eu-central-1/5377161796001/profile_0/chunklist.m3u8"

fi
use_cookies="no"
chan_name="I24 IL Hebrew";;


# 277)
# 278)
# 279)
# 280)


###########################################################  PAGE 2  ###############################################################

##################### PAKISTAN  ############################
# 281) SAMAA TV Pakistan
281)
keyword="SAMAA"

channelURL="https://www.youtube.com/Samaatv/featured"
youTubeGrab3

use_cookies="no"
chan_name="SAMAA TV Pakistan" ;;

##################### INDIA ENGLISH #########################################################
#285)


# 286) NDTV Profit
286)
if [ "$getlink" = 1 ]
then

#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=242880,AVERAGE-BANDWIDTH=246400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=346368,AVERAGE-BANDWIDTH=352000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=484352,AVERAGE-BANDWIDTH=492800,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=622336,AVERAGE-BANDWIDTH=633600,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=933504,AVERAGE-BANDWIDTH=950400,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=105600,AVERAGE-BANDWIDTH=105600,CODECS="mp4a.40.2"
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680/ndtvprofit/masterp_480p@6.m3u8"


#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=274560,AVERAGE-BANDWIDTH=246400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=397056,AVERAGE-BANDWIDTH=352000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=560384,AVERAGE-BANDWIDTH=492800,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=723712,AVERAGE-BANDWIDTH=633600,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1085568,AVERAGE-BANDWIDTH=950400,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=105600,AVERAGE-BANDWIDTH=105600,CODECS="mp4a.40.2"
#link="https://ndtvprofitelemarchana.akamaized.net/hls/live/2003680-b/ndtvprofit/masterb_480p@6.m3u8"


fi
use_cookies="no"
TAG="NDTV Profit__"
chan_name="NDTV Profit" ;;
###### INDIAN, HINDI, URDU, DARI, PASHTUN##################
# 287) Shaski India
287)
keyword="Sakshi"

channelURL="https://www.youtube.com/channel/UCQ_FATLW83q-4xJ2fsi8qAw/featured"
youTubeGrab3

use_cookies="no"
chan_name="Shaski India" ;;
# 288) SunNews
288)
keyword="LIVE"

channelURL="https://www.youtube.com/channel/UCYlh4lH762HvHt6mmiecyWQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="SunNews" ;;
# 289) TV9 India Live
289)
keyword="TV9"

channelURL="https://www.youtube.com/user/tv9telugulive/featured"
youTubeGrab3

use_cookies="no"
chan_name="TV9 Live India";;
# 290) Rajya Sabha TV
290)
keyword="Rajya"

channelURL="https://www.youtube.com/user/rajyasabhatv/featured"
youTubeGrab3
use_cookies="no"
chan_name="Rajya Sabha" ;;
# 291) TV9 Gujarat
291)
keyword="Gujarat"

channelURL="https://www.youtube.com/user/tv9gujaratlive/featured"
youTubeGrab3

use_cookies="no"
chan_name="TV 9 Gujarat" ;;

# 294) Aaj Tak
294)
keyword="Aaj"

channelURL="https://www.youtube.com/user/aajtaktv/featured"
youTubeGrab3

use_cookies="no"
chan_name="Aaj Tak" ;;
# 295) NTV Telugu
295)
keyword="Live"

channelURL="https://www.youtube.com/user/ntvteluguhd/featured"
youTubeGrab3

use_cookies="no"
chan_name="NTV Telugu" ;;
# 296) ABN Telugu
296)
keyword="ABN"

channelURL="https://www.youtube.com/user/abntelugutv/featured"
youTubeGrab3

use_cookies="no"
chan_name="ABN Telugu" ;;
# 297) Vanitha TV
297)
keyword="Live"

channelURL="https://www.youtube.com/user/VanithaTvChannel/featured"
youTubeGrab3

use_cookies="no"
chan_name="Vanitha TV" ;;

# 299) India TV IN
299)
#link=https://indiatvnews-lh.akamaihd.net/i/ITV_1@199237//master.m3u8

keyword="Live"

channelURL="https://www.youtube.com/user/IndiaTV/featured"
youTubeGrab3

use_cookies="no"
chan_name="India TV IN" ;;

# 301)i News Telugu
301)
keyword="iNews"

channelURL="https://www.youtube.com/user/inews/featured"
youTubeGrab3

use_cookies="no"
chan_name="iNews Telugu" ;;

## 303) DD News
303)
keyword="LIVE"

channelURL="https://www.youtube.com/user/DDNewsofficial/featured"
youTubeGrab3

use_cookies="no"
 chan_name="DD News" ;;
# 304) REPORTER LIVE
304)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCFx1nseXKTc1Culiu3neeSQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="Reporter Live" ;;
# 305) AsiaNet News
305)
keyword="Live"

channelURL="https://www.youtube.com/user/asianetnews/featured"
youTubeGrab3

use_cookies="no"
chan_name="AsiaNet News" ;;

# 307) Aaj Tak TV IN
307)
keyword="Aaj Tak"
# AJTAK TV

channelURL="https://www.youtube.com/user/aajtaktv/featured"
youTubeGrab3

#channelURL= "https://player-api.new.livestream.com/accounts/13982572/events/4169984/"
#liveStreamGrab

use_cookies="no"
chan_name="Aaj Tak TV IN" ;;
# 308) ETV Andhra Pradesh
308)
keyword="ETV"

channelURL="https://www.youtube.com/user/newsetv/featured"
youTubeGrab3

use_cookies="no"
chan_name="ETV Andhra Pradesh" ;;
# 309) News 18 Tamilnadu
309)
keyword="News18"

channelURL="https://www.youtube.com/channel/UCat88i6_rELqI_prwvjspRA/featured"
youTubeGrab3

use_cookies="no"
chan_name="News 18 Tamilnadu" ;;
# 310) Jaya Plus
310)
keyword="Live"

channelURL="https://www.youtube.com/user/jayapluschennai/featured"
youTubeGrab3

use_cookies="no"
chan_name="Jaya Plus" ;;
# 311) TEZ TV
311)
keyword="Live"
# Tez TV

channelURL="https://www.youtube.com/user/teztvnews/featured"
youTubeGrab3

#channelURL="https://player-api.new.livestream.com/accounts/13995833/events/4198957/"
#liveStreamGrab

use_cookies="no"
chan_name="TEZ TV" ;;
# 312) Dilli Aaj Tak
312)
keyword="Live"
# Dili AajTak

channelURL="https://www.youtube.com/user/DilliAajtak/featured" 
youTubeGrab3

#channelURL="https://player-api.new.livestream.com/accounts/14014394/events/4198951/"
#liveStreamGrab

use_cookies="no"
chan_name="Dilli Aaj Tak";;
# 313) Derana Sri Lanka
313)
keyword="Live"

channelURL="https://www.youtube.com/user/tvderanavideos/featured"
youTubeGrab3

use_cookies="no"
chan_name="Derana Sri Lanka" ;;

# 314) Swarnavahini Sri Lanka
314)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCAH7R88V7gz7RqJv78nNOzg/featured"
youTubeGrab3

use_cookies="no"
chan_name="Swarnavahini Sri Lanka " ;;
# 315) Kalaignar News
315)
keyword="LIVE"

channelURL="https://www.youtube.com/@KalaignarTVNews/streams"
youTubeGrab3

use_cookies="no"
chan_name="Kalaignar News" ;;

# 316) Sangat Television Birmingham England
316)

channelURL="https://livestream.com/accounts/6986636/sangattv"
liveStreamGrab

use_cookies="no"
chan_name="Sangat Television Birmingham England" ;;

# 317) 


# 318) NTV Bangladesh
318)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCYqujAD5831EywH1jldBu5w/featured"
youTubeGrab3

use_cookies="no"
chan_name="NTV Bangladesh" ;;

# 319) ATN Bangladesh
319)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCKlhfq1ILoAFav7iw5iCnfA/featured"
youTubeGrab3

use_cookies="no"
chan_name="ATN Bangladesh" ;;

# 320) Channel 24 IN
320)
keyword="LIVE"

channelURL="https://www.youtube.com/channel/UCBUJipGCEK09A8qlI6PkS4Q/featured"
youTubeGrab3

use_cookies="no"
chan_name="Channel 24 IN" ;;

# CNN 18 IN
# https://www.youtube.com/user/ibnlive/videos
# HUM News Live PK
# https://www.youtube.com/channel/UCt4pLfULsDlvIyMF5fKmtRg/videos
################## ASIA ######################################################################
################ CHINESE MANDARIN CANTONESE  ####################
# 321) CCTV 4 Chinese
321)
keyword="CCTV"

channelURL="https://www.youtube.com/user/ChineseInternatioify/featured"
youTubeGrab3

use_cookies="no"
chan_name="CCTV 4 China" ;;
############## TAIWAN TAIWANESE ##############################
# 322) EBC 51 News Taiwan
322)
keyword="EBC"
channelURL="https://www.youtube.com/user/newsebc/featured"
youTubeGrab3

use_cookies="no"
chan_name="EBC 51 News Taiwan" ;;
# 323) EBC Finance Taiwan
323)
keyword="EBC"

channelURL="https://www.youtube.com/user/57ETFN/featured"
youTubeGrab3

use_cookies="no"
chan_name="EBC Finance News Taiwan" ;;
# 324) TTV News Taiwan
324)
keyword="TTV"

channelURL="https://www.youtube.com/channel/UCzZe-zMu-YgVFQfDmsFG_VQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="TTV News Taiwan"  ;;
# 325) CTV Taiwan
325)
keyword="中視新聞台 LIVE直播"

channelURL="https://www.youtube.com/channel/UCmH4q-YjeazayYCVHHkGAMA/featured"
youTubeGrab3

use_cookies="no"
chan_name="CTV Taiwan" ;;
# 326) FTV Taiwan
326)
keyword="live"

channelURL="https://www.youtube.com/channel/UClIfopQZlkkSpM1VgCFLRJA/featured"
youTubeGrab3

use_cookies="no"
chan_name="FTV Taiwan Live";;
# 327) CTS World News HD Taiwan
327)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCA_hK5eRICBdSOLlXKESvEg/featured"
youTubeGrab3

use_cookies="no"
chan_name="CTS World News HD" ;;
# 328) SET News Taiwan
328)
keyword="SET"

channelURL="https://www.youtube.com/user/setnews159/featured"
youTubeGrab3

use_cookies="no"
chan_name="SET News Taiwan" ;;
# 329) CTI Taiwan
329)
keyword="CTI"

channelURL="https://www.youtube.com/user/ctitv/featured"
youTubeGrab3

use_cookies="no"
chan_name="CTI Taiwan" ;;
# 330) SET iNEWS Taiwan
330)
keyword="LIVE"

channelURL="https://www.youtube.com/user/setmoney159/featured"
youTubeGrab3

use_cookies="no"
chan_name="SET iNEWS Taiwan" ;;
# 331) Formosa News HD Taiwan
331)
keyword="Formosa"

channelURL="https://www.youtube.com/channel/UClIfopQZlkkSpM1VgCFLRJA/featured"
youTubeGrab3

use_cookies="no"
chan_name="Formosa News HD Taiwan";;
#  332) TzuChi DaAi World Taiwan
332)
keyword="大愛海外頻道"
#link=https://www.dailymotion.com/video/x5crdro

channelURL="https://www.youtube.com/user/DaAiVideo/featured" 
youTubeGrab3

use_cookies="no"
chan_name="Tzu Chi DaAi World Taiwan" ;;
# 333) 大愛電視 Tzu Chi DaAiVideo
333)
keyword="全球直播"

channelURL="https://www.youtube.com/user/DaAiVideo/featured"
youTubeGrab3

use_cookies="no"
chan_name="Tzu Chi DaAiVideo 1" ;;
# 334) 大愛一臺HD Live 直播
334)
keyword="直播"

channelURL="https://www.youtube.com/user/DaAiVideo/featured"
youTubeGrab3

use_cookies="no"
chan_name="Tzu Chi DaAiVideo 2" ;;
# 335) Sinda Television
335)
keyword="信大電視台"

channelURL="https://www.youtube.com/channel/UCZIvbuuP-xGgMG-_0tLLadg/featured"
youTubeGrab3

use_cookies="no"
chan_name="Sinda Television" ;;
# 336) CTS World News HD 2 Taiwan
336)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCA_hK5eRICBdSOLlXKESvEg/featured"
youTubeGrab3

use_cookies="no"
chan_name="CTS World News HD 2" ;;
# 337) SJTV TW
337)
keyword="SJTV"

channelURL="https://www.youtube.com/user/SJTVonline/featured"
youTubeGrab3

use_cookies="no"
chan_name="SJTV TW";;
# 338) #LLBN Chinese TV
338)
keyword="Live"
link="https://t01587-lh.akamaihd.net/i/t01587Chinese_1@692075/index_1250_av-p.m3u8"

use_cookies="no"
chan_name="LLBN Chinese  TV" ;;

# 339) SDTV 04CH Taiwan
339)
keyword="04CH"

channelURL="https://www.youtube.com/channel/UCBWzi-vMywDa05QYA2jHxwQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="SDTV 04CH TW" ;;
# 340) Fanstelevision Taiwan
340)
keyword="番薯衛星電視台現場直播"

channelURL="https://www.youtube.com/channel/UC2UCHUxTWVkSqP6MILU5Bqw/featured"
youTubeGrab3

use_cookies="no"
chan_name="Fans TV TW" ;;
# 341) Hong Kong TV
341)
link=rtmp://live.hkstv.hk.lxdns.com/live/hks
use_cookies="no"
chan_name="Hong Kong TV" ;;

# 342) OnTV Hong Kong
342)
keyword="ontv"

channelURL="https://www.youtube.com/channel/UCZ79ABUb7OO4iMiNK2QPM7g/featured"
youTubeGrab3

use_cookies="no"
chan_name="OnTV Hong Kong";;

# 343) GETV Chinese California USA
343)

channelURL="https://livestream.com/channelge/events/8122971"
liveStreamGrab

use_cookies="no"
chan_name="GETV Chinese California USA" ;;

# 344) KCTV North Korea Central Television
344)
link=https://tv.nknews.org/tvdash/stream.mpd
#link=https://tv.nknews.org/tvhls/stream.m3u8
use_cookies="no"
chan_name="KCTV North Korea Central Television";;

# 345) Arirang Culture TV Korean
345)
keyword="Arirang TV"

channelURL="https://www.youtube.com/user/arirangkorean/featured"
youTubeGrab3

use_cookies="no"
chan_name="Arirang Culture TV Korean" ;;


# 346) TBS Live Korea
346)
keyword="LIVE"

channelURL="https://www.youtube.com/channel/UC5HSw5OY2vfVFSihpiB-AVQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="TBS Live Korea" ;;

# 347) YTN DMB Korea
347)
keyword="LIVE"

channelURL="https://www.youtube.com/user/ytndmb/featured"
youTubeGrab3

use_cookies="no"
chan_name="YTN DMB Korea" ;;

# 348) YTN Science Korea
348)
keyword="LIVE"

channelURL="https://www.youtube.com/user/ytnscience/featured"
youTubeGrab3

use_cookies="no"
chan_name="YTN Science Korea" ;;

# 349) Channel 23 Korea
349)
keyword="LIVE"

channelURL="https://www.youtube.com/channel/UCTHCOPwqNfZ0uiKOvFyhGwg/featured"
youTubeGrab3

use_cookies="no"
chan_name="Channel 23 Korea" ;;
# 350) KBS World 24 Korea
350)
keyword="On-Air"

channelURL="https://www.youtube.com/channel/UCWw_gejTX29Yn89LLpcINZQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="KBS World 24 News" ;;

# 351) YTN 27 Korea
351)
keyword="YTN LIVE"

channelURL="https://www.youtube.com/user/ytnnews24/featured"
youTubeGrab3

use_cookies="no"
chan_name="YTN LIVE Korea" ;;

# 352) CGNTV America Korean Los Angeles California
352)

channelURL="https://livestream.com/accounts/13207573/events/9749763"
liveStreamGrab

use_cookies="no"
chan_name="CGNTV America Korean Los Angeles California " ;;

# 353) LLBN Korean TV
353)
keyword="Live"
link="https://t01587-lh.akamaihd.net/i/t01587Korean_1@692076/index_1250_av-p.m3u8"

use_cookies="no"
chan_name="LLBN Korean TV" ;;

# 354) YTV America Live Korean LA CA USA
354)

channelURL="https://livestream.com/accounts/15217951/events/4355473"
liveStreamGrab

use_cookies="no"
chan_name="YTV America Live Korean LA CA USA" ;;


# 355) 

# 356) ANN JapaNews 24 Japan
356)
keyword="LIVE"

channelURL="https://www.youtube.com/user/ANNnewsCH/featured"
youTubeGrab3

use_cookies="no"
chan_name="ANN News 24 Japan" ;;

# 357) Sol!ve 24 Japan
357)
keyword="LIVE"

channelURL="https://www.youtube.com/channel/UCNsidkYpIAQ4QaufptQBPHQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="Sol!ve 24 Japan";;

# 358) KBS Live 24 Japan
358)
keyword="KBSLIVE24"

channelURL="https://www.youtube.com/channel/UChSodm7QfwnUqD63BpqZC6Q/featured"
youTubeGrab3

use_cookies="no"
chan_name="KBS Live 24 Japan" ;;

#  359) QVC JAPAN SHOPPING CHANNEL
359)
keyword="QVC"
#link="https://cdn-live1.qvc.jp/iPhone/1501/1501.m3u8"

channelURL="https://www.youtube.com/user/QVCJapan/featured"
youTubeGrab3

use_cookies="no"
chan_name="QVC JAPAN SHOPPING CHANNEL" ;;

# 360) BSC 24 1
360)
keyword="BSC24-第1"

channelURL="https://www.youtube.com/user/bousaishare/featured"
youTubeGrab3

use_cookies="no"
chan_name="BSC 24 1" ;;

####################################### SOUTH ASIAN ####################################################################
################# TAGALOG FILIPINO #############################
# 361) DZMM ABS-CBN Philippeans Radio
361)
keyword="DZMM Audio Streaming"

channelURL="https://www.youtube.com/channel/UCs_VNu-FQ0WcJnD4QkmIL5w/featured"
youTubeGrab3

use_cookies="no"
chan_name="DZMM Philippeans" ;;
# 362) PTV Philippines
362)
keyword="PTV Live Stream"

channelURL="https://www.youtube.com/user/PTVPhilippines/featured"
youTubeGrab3

use_cookies="no"
chan_name="PTV Philippines";;
################ Indonesia  #########################################

# 363) Net TV Jakarta Indonesia
363)
keyword="NET"

channelURL="https://www.youtube.com/user/NetTVInsight/featured"
youTubeGrab3

use_cookies="no"
chan_name="Net TV Jakarta Indonesia" ;;

# 364) 

# 365) 


##################### Myanmar #########################################
# 366) 


############### Viet Nam  #####################################
# 367) VietTV VN
367)
link=http://www.filmon.com/tv/vtc-10
use_cookies="no"
chan_name="VietTV VN" ;;
# 368) Viet Sky TV Anaheim California
368)

channelURL="https://livestream.com/accounts/27136431/events/8142772"
liveStreamGrab

use_cookies="no"
chan_name="Viet Sky TV Anaheim California" ;;

# 369)
#####################################
# 370) Earthquake 24
370)
keyword="地震監視・24時間LIVE"

channelURL="https://www.youtube.com/channel/UCmw7DsSCQzRcRG6-SHE_ksg/featured"
youTubeGrab3

use_cookies="no"
chan_name="Earthquake 24" ;;
# 371) Arirang News
371)
keyword="Arirang TV"

channelURL="https://www.youtube.com/user/arirangnews/featured"
youTubeGrab3

use_cookies="no"
chan_name="Arirang News TV" ;;

# 372) Arirang TV Korea English
372)
keyword="Arirang"

#link=http://www.filmon.com/tv/arirang-tv
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/arirang/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"


#link=http://worldlive-ios.arirang.co.kr/arirang/arirangtvworldios.mp4.m3u8
link="http://worldlive-ios.arirang.co.kr/cdnlive-hls/arirangwlive/_definst_/liveevent/tvworld2.m3u8"


use_cookies="no"
chan_name="Arirang TV Korea" ;;


# 373) BSC 24 2
373)
keyword="BSC24-第2"

channelURL="https://www.youtube.com/channel/UCeEkbpBLgTEHy9NP-JHnPYQ/featured"
youTubeGrab3

use_cookies="no"
chan_name="BSC 24 2" ;;

# 376)
# 377)
#########################################   AFRICA    ##############################################
# 378) Africa News Live
378)
keyword="africanews Live"
#link=https://www.dailymotion.com/video/x6i7vf8

channelURL="https://www.youtube.com/channel/UC1_E8NeF5QHY2dtdLRBCCLA/featured"
youTubeGrab3
use_cookies="no"
chan_name="Africa News English";;
# 379) Africa24 Francaise
379)
keyword="Africa24 Live"

channelURL="https://www.youtube.com/user/Africa24/featured"
youTubeGrab3

use_cookies="no"
chan_name="Africa24 Francais" ;;
# 380) SIKKA TV Afrique Francaise
380)
keyword="SIKKA TV"

channelURL="https://www.youtube.com/channel/UCplwKOWLV8s2XZBMsimOjvg/featured"
youTubeGrab3

use_cookies="no"
chan_name="SIKKA TV Afrique Francais" ;;
# 381) Channels 24 Nigeria NG
381)
keyword="Channels Television"
#link=http://31.24.231.140/mchannels/channelstv.m3u8
#link=http://31.24.228.207:1935/live/smil:channelstv.smil/playlist.m3u8
#link=http://31.24.228.207:1935/live/mobile_240p/playlist.m3u8

channelURL="https://www.youtube.com/user/channelsweb/featured"
youTubeGrab3

use_cookies="no"
chan_name="Channels 24 Nigeria NG";;
# 382)TVC News Nigeria NG
382)
keyword="TVC News Nigeria"
#link=http://77.92.76.135:1935/tvcnews/livestream/playlist.m3u8

channelURL="https://www.youtube.com/channel/UCgp4A6I8LCWrhUzn-5SbKvA/featured"
youTubeGrab3

use_cookies="no"
chan_name="TVC News Nigeria NG";;
# 383) NTV Uganda UG
383)
keyword="NTV"

channelURL="https://www.youtube.com/user/ntvuganda/featured"
youTubeGrab3

use_cookies="no"
chan_name="NTV Uganda UG" ;;
# 384) SPARK TV Uganda UG
384)
keyword="SPARK TV"

channelURL="https://www.youtube.com/user/ntvuganda/featured"
youTubeGrab3

use_cookies="no"
chan_name="SPARK TV Uganda UG" ;;
# 385)  KTN Kenya KE
385)
keyword="Live"

channelURL="https://www.youtube.com/user/standardgroupkenya/featured"
youTubeGrab3

use_cookies="no"
chan_name="KTN Kenya KE" ;;
# 386) EbruTV Kenya KE
386)
link=http://www.dailymotion.com/video/x67n3k1
use_cookies="no"
#format=hls-720
#format=hls-480
#format=hls-380
format=hls-240
chan_name="EbruTV Kenya KE" ;;
# 387)KTN Home Kenya KE
387)
link=http://www.dailymotion.com/video/x67ck0p
use_cookies="no"
format=hls-1080
#format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
chan_name="KTN Home Kenya KE" ;;
# 388) Joy News Ghana GH
388)
keyword="Joy News"

channelURL="https://www.youtube.com/user/myjoyonlinetube/featured"
youTubeGrab3

use_cookies="no"
chan_name="Joy News Ghana GH";;
# 389)  ADOM TV GH
389)
keyword="Adom"

channelURL="https://www.youtube.com/user/adomtvtube/featured"
youTubeGrab3

use_cookies="no"
chan_name="ADOM TV Ghana GH" ;;
# 390) Bukedde TV GH
390)
keyword="Bukedde"

channelURL="https://www.youtube.com/user/bukeddetv/featured"
youTubeGrab3

use_cookies="no"
chan_name="Bukedde TV GH";;
# 391) EBC Ethiopia
391)
keyword="\#EBC"

channelURL="https://www.youtube.com/channel/UCOhrz3uRCOHmK6ueUstw7_Q/featured"
youTubeGrab3

use_cookies="no"
chan_name="EBC Ethiopia";;
# 392) Walf TV Senegal
392)
link=http://www.dailymotion.com/video/x5s5vw3
use_cookies="no"
chan_name="Walf TV Senegal" ;;
# 393) EriTV Eritrea ET
393)
link=http://www.filmon.com/tv/eri-tv
use_cookies="yes"
chan_name="EriTV Eritrea ET" ;;
# 394)SABC Digital News South Africa ZA
394)
keyword="LIVE"

channelURL="https://www.youtube.com/user/sabcdigitalnews/featured"
youTubeGrab3

use_cookies="no"
chan_name="SABC News South Africa ZA" ;;
# 395) iTV Networks South Africa ZA
395)

channelURL="https://livestream.com/accounts/7079896/events/4406003"
liveStreamGrab

use_cookies="no"
chan_name="iTV Networks South Africa ZA" ;;
# 396) Parliament of the Republic of South Africa ZA
396)
keyword="Plenary"

channelURL="https://www.youtube.com/user/ParliamentofRSA/featured"
youTubeGrab3

use_cookies="no"
chan_name="Parliament of the Republic of South Africa ZA" ;;
# 397) D24
397)
link=https://www.dailymotion.com/video/x6cq41k
use_cookies="no"
chan_name="D24" ;;
# 398) Afrique Media
398)
link=https://www.dailymotion.com/video/x5dk3kj
use_cookies="no"
chan_name="Afrique Media" ;;
# 399) DBM TV
399)
link=https://www.dailymotion.com/video/x5qokx5
use_cookies="no"
chan_name="DBM TV" ;;

# 400)


##################################### LOCAL NEWS USA ####################################################################
# 401) RSBN Auburn Alabama USA
401)
keyword="RSBN"

channelURL="https://www.youtube.com/user/rightsideradio/featured"
youTubeGrab3

use_cookies="no"
chan_name="RSBN Right Side Broadcasting Auburn Alabama USA"  ;;
############################ LOCAL NEWS USA#############################################
# 402) NBC2 South West Florida
402)
keyword="Live"

channelURL="https://www.youtube.com/user/NBC2swfl/featured"
youTubeGrab3

use_cookies="no"
chan_name="NBC2 South West Florida" ;;

######################## PODCAST ###########################################
# 403) PBS NewsHour Video
403)
keyword="PBS NewsHour"
channelURL="https://www.youtube.com/user/PBSNewsHour/videos"
youTubeGrab

use_cookies="no"
chan_name="PBS NewsHour Video" ;;

# 404)  CBC The National
404)
keyword="The National"
channelURL="https://www.youtube.com/user/CBCTheNational/videos"
youTubeGrab3
use_cookies="no"
chan_name="CBC The National" ;;

# 405) AP Top Stories
405)
keyword="Top"
channelURL="https://www.youtube.com/user/AssociatedPress/videos"
youTubeGrab3
use_cookies="no"
chan_name="AP Top Stories" ;;

# 406) Democracy Now Headlines
406)
keyword="Headlines"
channelURL="https://www.youtube.com/user/democracynow/videos"
youTubeGrab3
use_cookies="no"
chan_name="Democracy Now Headlines" ;;

# 407) Reuters TV
407)
if [ "$getlink" = 1 ]
then

#link="https://www.reuters.com/video/"

assets=$(curl 'https://www.reuters.com/video/' | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /file/  )  print $(i+2) } ' | grep assets)
assetNum=""

for x in $assets 
do 
assetNum="$assetNum",$( echo $x | cut -d \/ -f 8 )  
done

link="https://ajo.prod.reuters.tv/rest/v2/playlist/assets/"$assetNum"/master.m3u8"

fi
## method="Tor"
use_cookies="no"
chan_name="Reuters TV" ;;

######################## INTERNATIONAL ENGLISH #####################################

# 408) NDTV India
408)
if [ "$getlink" = 1 ]
then

#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=242880,AVERAGE-BANDWIDTH=246400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=346368,AVERAGE-BANDWIDTH=352000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=484352,AVERAGE-BANDWIDTH=492800,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=622336,AVERAGE-BANDWIDTH=633600,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=933504,AVERAGE-BANDWIDTH=950400,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=105600,AVERAGE-BANDWIDTH=105600,CODECS="mp4a.40.2"
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678/ndtv24x7/masterp_480p@6.m3u8"

link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=274560,AVERAGE-BANDWIDTH=246400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=397056,AVERAGE-BANDWIDTH=352000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=560384,AVERAGE-BANDWIDTH=492800,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=723712,AVERAGE-BANDWIDTH=633600,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1085568,AVERAGE-BANDWIDTH=950400,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x480,FRAME-RATE=25.000
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@5.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=105600,AVERAGE-BANDWIDTH=105600,CODECS="mp4a.40.2"
#link="https://ndtv24x7elemarchana.akamaized.net/hls/live/2003678-b/ndtv24x7/masterb_480p@6.m3u8"

fi
use_cookies="no"
TAG="NDTV_IN______"
chan_name="NDTV India" ;;

# 409)

# 410)

# 411) CBC Comedy
411)
if [ "$getlink" = 1 ]
then
website="https://gem.cbc.ca/"
eventID="xmG9NJkiRwaWromW1c07pw"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"   
googleGrab2
fi
use_cookies="no"
chan_name="CBC Comedy " ;;

# 412)CBC Olympic Channel 1
412)
link="$(curl "https://services.radio-canada.ca/media/validation/v2/?appCode=medianetlive&connectionType=hd&deviceType=ipad&idMedia=15719&multibitrate=true&output=json&tech=hls&manifestType=desktop"  | cut -d \" -f 4)"
use_cookies="no"
chan_name="CBC Olympic Channel" ;;


##########################################

# 413) CBC Olympic Channel 2
413)
website="https://gem.cbc.ca/"
eventID="ZX-bVk6oQHyOaEJSRmxUlg"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
use_cookies="no"
chan_name="CBC Olympic Channel" ;;


############################## SHOPPING ##########################################################
# 414) QVC UK
414)
if [ "$getlink" = 1 ]
then
link="https://d1txbbj1u9asam.cloudfront.net/live/qvcuk_main_clean/bitrate1.isml/3/prog_index.m3u8"
fi
# method="Tor"
use_cookies="no"
TAG="QVC_UK_______"
chan_name="QVC UK" ;;

# 415)  QVC
415)
if [ "$getlink" = 1 ]
then
keyword="QVC Live Stream"

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc1uscln/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc1uscln/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc1uscln/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc1uscln/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc1uscln/medlow.m3u8"

### YOUTUBE
#channelURL="https://www.youtube.com/user/QVC/videos?&view=2" 1
#youTubeGrab

fi
#####method="Tor"
use_cookies="no"
TAG="QVC_EN____"
chan_name="QVC English" ;;

# 416) The Shopping Channel TSC
416)

if [ "$getlink" = 1 ]
then

#link=https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/master.m3u8

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=992000,RESOLUTION=848x480,CODECS="avc1.640029, mp4a.40.2"
link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2200000,RESOLUTION=1280x720,CODECS="avc1.640029, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2200000,RESOLUTION=1280x720,CODECS="avc1.640029, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1428000,RESOLUTION=848x480,CODECS="avc1.640029, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-b.m3u8?sd=10&rebase=on"

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_1_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_2_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2564000,RESOLUTION=1920x1080,CODECS="avc1.77.30, mp4a.40.2"
#link="https://tscstreaming-lh.akamaihd.net/i/TSCLiveStreaming_1@91031/index_3_av-b.m3u8?sd=10&rebase=on"
fi
#####method="Tor"
use_cookies="no"
TAG="TSC_______"
chan_name="The Shopping Channel TSC" ;;

# 417)  QVC 2
417)

if [ "$getlink" = 1 ]
then
keyword="QVC Live Stream"

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc2uscln/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc2uscln/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc2uscln/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc2uscln/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc2uscln/medlow.m3u8"

fi
#####method="Tor"
use_cookies="no"
TAG="QVC2EN____"
chan_name="QVC 2 English" ;;

# 418)  QVC 3 USA
418)

if [ "$getlink" = 1 ]
then
keyword="QVC Live Stream"

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc3uscln/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc3uscln/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc3uscln/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc3uscln/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc3uscln/medlow.m3u8"

fi
#####method="Tor"
use_cookies="no"
TAG="QVC_3_____"
chan_name="QVC 3 USA" ;;

# 419)  QVC 4
419)

if [ "$getlink" = 1 ]
then
keyword="QVC Live Stream"

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc4uscln/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc4uscln/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc4uscln/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc4uscln/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc4uscln/medlow.m3u8"


fi
#####method="Tor"
use_cookies="no"
TAG="QVC_4__"
chan_name="QVC 4" ;;

# 420) HSN
420)
keyword="HSN Live"
#link=http://hsn.mpl.miisolutions.net/hsn-live01/_definst_/smil:HSN1_ipad.smil/playlist.m3u8
#link=http://hsn.mpl.miisolutions.net:1935/hsn-live01/_definst_/mp4:468p500kB31/playlist.m3u8
#link=https://www.hsn.com/watch/live

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn1us/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn1us/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn1us/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn1us/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn1us/medlow.m3u8"

#### YOUTUBE
#channelURL="https://www.youtube.com/user/hsntv/featured"
#youTubeGrab3

use_cookies="no"
chan_name="Home Shopping Network HSN" ;;

# 421) HSN 2
421)

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn2us/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn2us/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn2us/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn2us/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lshsn2us/medlow.m3u8"

############### YOUTUBE
#keyword="HSN2"
#channelURL="https://www.youtube.com/user/hsntv/featured"
#youTubeGrab3

use_cookies="no"
chan_name="HSN2" ;;

# 422) QVC 5
422)
if [ "$getlink" = 1 ]
then
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc5us/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc5us/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc5us/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc5us/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc5us/medlow.m3u8"

use_cookies="no"
fi
##method="Tor"
TAG="QVC5______"
chan_name="QVC5" ;;

# 423) QVC 6
423)
if [ "$getlink" = 1 ]
then

#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc6us/master.m3u8"

#EXT-X-STREAM-INF:BANDWIDTH=4689104,CODECS="avc1.640028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000
link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc6us/high.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3018592,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc6us/medhigh.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1348088,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc6us/med.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=902184,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://qvc-amd-live.akamaized.net/hls/live/2034113/lsqvc6us/medlow.m3u8"

use_cookies="no"
fi
##method="Tor"
TAG="QVC6______"
chan_name="QVC6" ;;

# 425) CGTN Feed 
425)
link="https://live-stream.cgtn.com/event-live/CGTN_1_1wnHqvELSdq/index.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="CGTN Feed";;

# 426) NBC Dateline
426)
keyword="LIVE"
## YOUTUBE
channelURL="https://www.youtube.com/DatelineNBC/streams"
youTubeNBCGrab 1
use_cookies="no"
chan_name="NBC Dateline";;


# 427) Bloomberg BNN 
427)
link="https://pe-ak-lp01a-9c9media.akamaized.net/live/News1BNNDigi/p/dash/00000001/1bba52dc66e4c68e/manifest.mpd"
#####method="Tor"
use_cookies="no"
chan_name="Bloomberg BNN";;

# 428) Overcomers TV Live
428)
link="https://frnksocial.mmdlive.lldns.net/frnksocial/a5e6157524ce49e3a0653d5841619ac3/manifest.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="Overcomers TV Live";;

429)
#ROGERS TV Ottawa
#link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m19_card4/playlist.m3u8"
#link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m19_card4/chunklist.m3u8"
##ROGERS TV Ottawa
##link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m31_card3/playlist.m3u8"
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m31_card3/chunklist.m3u8"
chan_name="ROGERS TV Ottawa CA" ;;

430)
##ROGERS TV Kitchener
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m19_card4/playlist.m3u8"
##link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m19_card4/playlist.m3u8"
chan_name="ROGERS TV Kitchener CA";;

431)
##OMNI NEWS EAST
link="https://debate-elections-2019.akamaized.net/8148dd65883545ad8782d1b3fc8cd38a/us-west-2/89871584001/profile_1/chunklist.m3u8"
chan_name="OMNI TV EAST";;

432)
##OMNI NEWS WEST
link="https://debate-elections-2019.akamaized.net/b121816b6b144428aba07c935c628ff1/us-west-2/89871584001/profile_1/chunklist.m3u8"
chan_name="OMNI TV WEST";;

433)
##OMNI PRARIES
link="https://debate-elections-2019.akamaized.net/edb9a79efdbf44f0ab6f70c122211bec/us-west-2/89871584001/profile_1/chunklist.m3u8"
chan_name="OMNI TV PRARIES";;

434)
##OMNI QUEBEC
link="https://debate-elections-2019.akamaized.net/486596ec5ed2403eb988406927cdd71a/us-west-2/89871584001/profile_1/chunklist.m3u8"
chan_name="OMNI TV WEST";;

435)
##Brighteon Radio 
link="https://rtmp-edge.brighteon.com/hls/brighteonradio-live/index_360p/index.m3u8"
chan_name="BrighteonRadio";;

436)
## Speak Free Radio
##link="https://stream.speakfreeradio.com/listen/sfr_stream/radio.aac48"
##link="https://stream.speakfreeradio.com/hls/sfr_stream/aac_lofi.m3u8"
link="https://stream.speakfreeradio.com/hls/sfr_stream/aac_hifi.m3u8"
chan_name="SpeakFreeRadio";;

437)
### AMI AUDIO
link="https://ice23.securenetsystems.net/AMIAUDIO"
chan_name="AMI AUDIO";;


# 438)VOA Radio
438)
if [ "$getlink" = 1 ]
then

#link="https://rfe-lh.akamaihd.net/i/rfe_tvmc5@383630/master.m3u8"
#link="https://voa-lh.akamaihd.net/i/voa_tvmc6@2033875/master.m3u8"  # didn't work\
## CurrentTime
#link="https://rfe-ingest.akamaized.net/dash/live/2033030/tvmc05/manifest.mpd"
### VOA TV
#link="https://voa-ingest.akamaized.net/dash/live/2033875/tvmc06/manifest.mpd"

## VOA RADIO
link="https://voa-ingest.akamaized.net/dash/live/2035100/161_352R/manifest.mpd"
# link=https://voa-ingest.akamaized.net/dash/live/2035100/161_352R/manifest.mpd

## VOA Africa
#link="https://voa-ingest.akamaized.net/dash/live/2035112/152_134L/manifest.mpd"

fi
##method="Tor"
#use_cookies="no"
TAG="VOA_______"
chan_name="VOA Radio" ;;


############################## ISRAEL ########################################
# 439) i24 News IL
439)

if [ "$getlink" = 1 ]
then
### I24 Radio
#link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_0/chunklist.m3u8"

link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_0/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_1/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_2/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_3/chunklist.m3u8"
#link="https://bcovlive-a.akamaihd.net/fc05f046b68c4513afc19bcb0f144430/eu-central-1/5377161796001/profile_4/chunklist.m3u8"
fi
#method="Tor"
use_cookies="no"
TAG="I24NEWS_IL--"
chan_name="i24 News IL";;


# 440) NYXT Manhattan NYC New York USA
440)
channelURL="https://player-api.new.livestream.com/accounts/19770665/events/10721160/"
liveStreamGrab
use_cookies="no"
chan_name="NYXT Manhattan NYC New York USA" ;;

#############################################################



###############################

# 430) ESPN
#430)
#link="https://pe-ak-lp01a-9c9media.akamaized.net/live/DMCDigi07/p/dash/00000001/459c40b91162c969/manifest.mpd"
#####method="Tor"
#use_cookies="no"
#chan_name="ESPN";;

# 431) Bloomberg BNN 
#431)
#link="https://pe-ak-lp01a-9c9media.akamaized.net/live/News1BNNDigi/p/dash/00000001/1bba52dc66e4c68e/manifest.mpd"
#####method="Tor"
#use_cookies="no"
#chan_name="Bloomberg BNN";;

# 428) CTV News CA
#428)
#keyword="Bloomberg"
#if [ "$getlink" = 1 ]
#then

#link="https://capi.9c9media.com/destinations/ctvnews_web/platforms/desktop/bond/contents/64268/contentpackages/22710/manifest.mpd
#link="https://pe-ak-lp02a-9c9media.akamaized.net/live/News6Digi/p/dash/00000001/dcbf2cb5b9217dcd/manifest.mpd"

## Unknown
#link="https://pe-fa-lp02a.9c9media.com/live/News1Digi/p/hls/00000201/38ef78f479b07aa0/manifest.m3u8"
#link="https://pe-fa-lp02a.9c9media.akamaized.net/live/News1Digi/p/dash/00000201/38ef78f479b07aa0/manifest.mpd"
#link="https://pe-fa-lp02a.9c9media.com/live/News1Digi/p/hls/00000201/38ef78f479b07aa0/index/0c6a10a2/live/stream/h264/v1/3500000/manifest.m3u8"

#link="https://pe-ak-lp02a-9c9media.akamaized.net/live/News1Digi/p/dash/00000001/8e377c581da8df4e/manifest.mpd"
 
#link="https://pe-ak-lp02a-9c9media.akamaized.net/live/CP24/p/dash/20000001/a0da30888996c775/manifest.mpd"
#link="https://pe-ak-lp01a-9c9media.akamaized.net/live/CKY/p/hls/0b000201/066d7dd49631a950/manifest.m3u8" 
#link="https://pe-ak-lp01a-9c9media.akamaized.net/live/CTV2Alberta/p/hls/0b000201/35b42cdc62b85557/manifest.m3u8"

#fi
#method="Tor"
#use_cookies="no"
#TAG=" CTVNEWS_____"
#chan_name="CTV NEWS CA";;


################################# Entertainment ############################################################
# 441) V2Beat
441)
link="https://abr.de1se01.v2beat.live/live/live6/chunks.m3u8"
use_cookies="no"
chan_name="V2Beat" ;;

# 442) DanceStar TV
442)
if [ "$getlink" = 1 ]
then
#link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/playlist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3686400,RESOLUTION=1280x720
link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_720p.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3439489,RESOLUTION=960x540
#link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_540p.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=921600,RESOLUTION=640x360
#link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_360p.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=331776,RESOLUTION=384x216
#link=https://vcndstv.teleosmedia.com/stream/dstv/dstv/seglist_216p.m3u8

fi
####method="Tor"
use_cookies="no"
TAG="DANCESTAR____"
chan_name="DanceStar TV" ;;

# 443) Classic ARTS
443)
if [ "$getlink" = 1 ]
then
# Classic ARTS
link="https://classicarts.akamaized.net/hls/live/1024257/CAS/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3246804,AVERAGE-BANDWIDTH=3246804,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://classicarts.akamaized.net/hls/live/1024257/CAS/master_720p30.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1729002,AVERAGE-BANDWIDTH=1729002,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970
#link="https://classicarts.akamaized.net/hls/live/1024257/CAS/master_480p30.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1223068,AVERAGE-BANDWIDTH=1223068,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970
#link="https://classicarts.akamaized.net/hls/live/1024257/CAS/master_360p30.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=767726,AVERAGE-BANDWIDTH=767726,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=430x240,FRAME-RATE=29.970
#link="https://classicarts.akamaized.net/hls/live/1024257/CAS/master_240p30.m3u8"

fi
#method="livestreamer"
#format="best"
####method="Tor"   Route through USA
use_cookies="no"
TAG="CLASS_ARTS__"
chan_name="Classic ARTS" ;;

# 444) California Music Channel
444)
link="https://cmc-ono.amagi.tv/amRdirect/device[did]=%7BPSID%7D&device[dnt]=%7BDID%7D&us_privacy=%7BUS_PRIVACY%7D&coppa=%7BCOPPA%7D%27)&uid=1h53nrsgu-efqu-jmo-w0qg-mwnfw07e4/hls/amagi_hls_data_cmcAAAAAA-cmc-ono/CDN/playlist.m3u8"
use_cookies="no"
chan_name="California Music Channel" ;;

# 445)  The Country Network
445)
if [ "$getlink" = 1 ]
then
link="https://ba205fc1dd404369b89cccf4ffb2f089.mediatailor.us-east-1.amazonaws.com/v1/dash/4c8323052bc3dbd9aa2eba0b638d8495561e8377/TCN/live/feddb25b-7367-49e4-bbb6-48af01ca7407/live.isml/feddb25b-7367-49e4-bbb6-48af01ca7407.mpd"
fi
use_cookies="no"
TAG="COUNTRY_NETWORK__"
chan_name="The Country Network" ;;

# 446) Ditty TV
446)
if [ "$getlink" = 1 ]
then
link="https://0ba805a2403b4660bbb05c0a210ebbdc.mediatailor.us-east-1.amazonaws.com/v1/manifest/04fd913bb278d8775298c26fdca9d9841f37601f/ONO_DittyTV/615134a8-9d93-463e-86fe-7c7751769f36/3.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"
use_cookies="no"
TAG="DITTY______"
chan_name="Ditty TV" ;;

################################ SPORTS #######################################################

# 447) RED BULL TV
447)
#link=https://dms.redbull.tv/v3/linear-borb/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjYXRlZ29yeSI6InBlcnNvbmFsX2NvbXB1dGVyIiwiY291bnRyeV9jb2RlIjoidXMiLCJleHBpcmVzIjoiMjAxNy0wOS0xNlQxNzo0NjowMy45NjM0NjI4NDJaIiwib3NfZmFtaWx5IjoiaHR0cCIsInJlbW90ZV9pcCI6IjEwLjE1Ny4xMTIuMTQ4IiwidWEiOiJNb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xMl81KSBBcHBsZVdlYktpdC82MDMuMi40IChLSFRNTCwgbGlrZSBHZWNrbykgVmVyc2lvbi8xMC4xLjEgU2FmYXJpLzYwMy4yLjQiLCJ1aWQiOiJkOGZiZWYzMC0yZDhhLTQwYTUtOGNjNy0wNzgxNGJhMTliNzMifQ.Q_38FNpW3so5yrA5FQt9qBuix3dTulKpb6uQ0dRjrtY/playlist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=290400,AVERAGE-BANDWIDTH=290400,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
#link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_264.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=635800,AVERAGE-BANDWIDTH=635800,CODECS="avc1.4d4015,mp4a.40.2",RESOLUTION=426x240,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
#link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_578.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1020800,AVERAGE-BANDWIDTH=1020800,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
#link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_928.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1826000,AVERAGE-BANDWIDTH=1826000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_1660.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3696000,AVERAGE-BANDWIDTH=3696000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
#link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_3360.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=7326000,AVERAGE-BANDWIDTH=7326000,CODECS="avc1.4d4028,mp4a.40.2",RESOLUTION=1920x1080,FRAME-RATE=30.000,CLOSED-CAPTIONS=NONE
#link=https://rbmn-live.akamaized.net/hls/live/590964/BoRB-AT/master_6660.m3u8
#link="https://www.twitch.tv/redbull"
use_cookies="no"
chan_name="RED BULL TV" ;;

# 448) CBS Sports Desktop
448)
if [ "$getlink" = 1 ]
then
#link="https://sportshq-mediapackage-cedexis.cbsaavideo.com/out/v1/be87d7783e5c4270a5830ea5d1164850/desktop.m3u8"
link="https://sportshq-mediapackage-cedexis.cbsaavideo.com/out/v1/be87d7783e5c4270a5830ea5d1164850/desktop_3.m3u8"
#link="https://sportshq-mediapackage-cedexis.cbsaavideo.com/out/v1/be87d7783e5c4270a5830ea5d1164850/desktop_2.m3u8"
#link="https://sportshq-mediapackage-cedexis.cbsaavideo.com/out/v1/be87d7783e5c4270a5830ea5d1164850/desktop_1.m3u8"
fi
#method="livestreamer"
#format="best"
####method="Tor"   Route through USA
use_cookies="no"
TAG="CBS_SPORTS_HQ__"
chan_name="CBS Sports HQ" ;;

# 449) Sorgatronmedia
449)
link=https://www.twitch.tv/sorgatronmedia
use_cookies="no"
####method="Tor"
chan_name="Sorgatronmedia";;

############### TV SHOWS   ######################################

# 450)Tokushoutsu
450)
link=https://www.twitch.tv/tokushoutsu
#####method="Tor"
use_cookies="no"
chan_name="Toku Shout Su";;

#################### ANIMATION ##############################
# 451) Talking Tom and Friends
451)
keyword="LIVE"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/TalkingFriends/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"

channelURL="https://www.youtube.com/user/TalkingFriends/videos?&view=2"
youTubeGrab

use_cookies="no"
chan_name="Talking Tom and Friends" ;;

# 452) PJ Masks
452)
keyword="PJ"

channelURL="https://www.youtube.com/channel/UCY2jUnU118sVkdj2xafiJ0g/videos?&view=2"
youTubeGrab

use_cookies="no"
chan_name="PJ Masks" ;;

#########################################################################################################################################3


###############################################################################################################

# 467) Cherie Lorraine
467)
link="https://www.twitch.tv/cherielorraine"
use_cookies="no"
####method="Tor"
chan_name="Cherie Lorraine";;

# 468) Alia ASMR
468)
link="https://www.twitch.tv/alia_asmr"
use_cookies="no"
####method="Tor"
chan_name="Alia ASMR";;

# 469) Sharon Queen Kick
469)
link="https://kick.com/sharonqueen/"
use_cookies="no"
####method="Tor"
chan_name="Sharonqueen Kick";;

# 470) Amouranth Twitch
470)
link="https://kick.com/amouranth"
#link="https://www.twitch.tv/amouranth"
use_cookies="no"
####method="Tor"
chan_name="Amouranth";;

# 471) Amouranth Kick
471)
#link="https://kick.com/amouranth"
link="https://www.twitch.tv/amouranth"
use_cookies="no"
####method="Tor"
chan_name="Amouranth";;

# 472) Mirys
472)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/mirys"
use_cookies="no"
fi
##method="Tor"
TAG="mirys"
chan_name="mirys" ;;

# 473)Ley Nainu
473)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/leynainu"
use_cookies="no"
fi
##method="Tor"
TAG="LEYNAINU"
chan_name="leynainu" ;;

# 474) Katrine ASMR
474)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/katrine"
use_cookies="no"
fi
##method="Tor"
TAG="Katrine ASMR"
chan_name="Katrine ASMR" ;;

# 475) foxenkin
475)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/foxenkin"
use_cookies="no"
fi
##method="Tor"
TAG="foxenkin"
chan_name="foxenkin" ;;

# 476)SharonQueen
476)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/sharonqueen"
use_cookies="no"
fi
##method="Tor"
TAG="sharonqueen"
chan_name="sharonqueen" ;;

# 477)IJenz
477)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/ijenz"
use_cookies="no"
fi
##method="Tor"
TAG="Ijenz"
chan_name="Ijenz" ;;

# 478) AkuASMR
478)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/akuasmr"
use_cookies="no"
fi
##method="Tor"
TAG="akuasmr"
chan_name="akuasmr" ;;

# 479) Violetta Pur Pur 
479)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/violetta_purpur"
use_cookies="no"
fi
##method="Tor"
TAG="violetta_pur_pur"
chan_name="Violetta Pur Pur" ;; 

#480) RhinoSpirit
480)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/rhinospiritx"
use_cookies="no"
fi
##method="Tor"
TAG="rhinospirit"
chan_name="rhinospirit" ;;

############################### USTREAM  ##################################################
# 479) NASA TV Media
#479)
#keyword="Media"
## https://www.nasa.gov/multimedia/nasatv/#media
#link="https://nasa-i.akamaihd.net/hls/live/253565/NASA-NTV1-Public/master.m3u8"
#link="https://nasa-i.akamaihd.net/hls/live/253565/NASA-NTV1-Public/master_2000.m3u8"
#link="http://hls.ums.ustream.tv/playlist/directhls/channel/6540154/playlist.m3u8"
#link="http://iphone-streaming.ustream.tv/uhls/6540154/streams/live/iphone/playlist.m3u8"
#link=http://www.ustream.tv/channel/nasa-media-channel
# method="Streamlink"
#format="720p"
#252p (worst), 360p, 486p, 720p (best)
### YOUTUBE LINK ###
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/NASAtelevision/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
#use_cookies="no"
#chan_name="NASA TV Media" ;;


# 480) NASA TV Public Education
#480)
#keyword="NASA TV Public-Education"
## https://www.nasa.gov/multimedia/nasatv/#public
#link=http://www.ustream.tv/nasahdtv
#link="https://nasa-i.akamaihd.net/hls/live/253566/NASA-NTV2-Media/master.m3u8"
#link="https://nasa-i.akamaihd.net/hls/live/253566/NASA-NTV2-Media/master_2000.m3u8"
#link="http://iphone-streaming.ustream.tv/uhls/10414700/streams/live/iphone/playlist.m3u8"
#method="Streamlink"
#format="720p"
#252p (worst), 360p, 486p, 720p (best)
### YOUTUBE LINK ###
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/NASAtelevision/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
#use_cookies="no"
#chan_name="NASA TV Public-Education" ;;
##################################################

######################################  RELIGIOUS PROGRAMMING   ###################################################
# 481) Vatican Media
481)
keyword="Live"

channelURL="https://www.youtube.com/user/vatican/featured"
youTubeGrab3

use_cookies="no"
chan_name="Vatican Media" ;;

# 482) EWTN North America English
482)
#keyword="17"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/EWTN/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
#link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409283781001

link="https://cdn3.wowza.com/1/YW5wSWZiRGd2eFlU/bGV0aVBq/hls/live/playlist.m3u8"

use_cookies="no"
chan_name="EWTN America" ;;

# 483) EWTN Europe
483)
#link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409261120001

link="https://cdn3.wowza.com/1/T2NXeHF6UGlGbHY3/WFluRldQ/hls/live/playlist.m3u8"
use_cookies="no"
chan_name="EWTN Europe" ;;

# 484) EWTN Africa
484)
#link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409267772001
link="https://cdn3.wowza.com/1/ZVBYYXFLLzE0c3NC/Qk1FMURC/hls/live/playlist.m3u8"
use_cookies="no"
chan_name="EWTN Africa" ;;

# 485) EWTN Asia
485)
#link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5405034951001
link="https://cdn3.wowza.com/1/QmVNUVhTNTZSS3Uz/YWQ0aHpi/hls/live/playlist.m3u8"
use_cookies="no"
chan_name="EWTN Asia" ;;
# 486) Salt and Light Television Canada
486)
link="https://zm6gdaxeyn93-hls-live.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/index.m3u8"
#link="https://zm6gdaxeyn93-hls-live.5centscdn.com/slworld/d65ce2bdd03471fde0a1dc5e01d793bb.sdp/chunks.m3u8"
use_cookies="no"
chan_name="Salt and Light Television Canada" ;;

# 487) EWTN Canada
487)
link="https://cdn3.wowza.com/1/YW5wSWZiRGd2eFlU/bGV0aVBq/hls/live/playlist.m3u8"
use_cookies="no"
chan_name="EWTN Canada" ;;
# 488) Catholic Television USA
488)
link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2375841,AVERAGE-BANDWIDTH=2745600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master_1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1808281,AVERAGE-BANDWIDTH=2085600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master_2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1240720,AVERAGE-BANDWIDTH=1425600,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970
#link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master_3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=862347,AVERAGE-BANDWIDTH=985600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970
#link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master_4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=625862,AVERAGE-BANDWIDTH=710600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970
#link="https://catholictvhd-lh.akamaized.net/hls/live/2043390/CTVLiveHD/master_5.m3u8"
use_cookies="no"
chan_name="Catholic Television Network USA" ;;

# 489) Shalom Media Catholic USA
489)
channelURL="https://livestream.com/shalomworld/events/7359508"
liveStreamGrab
use_cookies="no"
chan_name="Shalom Media Catholic USA" ;;
# 490) Shalom Media Catholic Australia
490)
channelURL="https://livestream.com/shalomworld/events/7551704"
liveStreamGrab
use_cookies="no"
chan_name="Shalom Media Catholic Australia" ;;
# 491) Shalom Media Catholic Europe
491)
channelURL="https://livestream.com/accounts/25038049/events/7358643"
liveStreamGrab
use_cookies="no"
chan_name="Shalom Media Catholic Europe" ;;
# 492) EWTN Spanish
492)
#link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409267805001
link="https://cdn3.wowza.com/1/SmVrQmZCUXZhVDgz/b3J3MFJv/hls/live/playlist.m3u8"

use_cookies="no"
chan_name="EWTN Espanol" ;;
# 493)  EWTN German
493)
link=http://players.brightcove.net/1675170007001/Hyo4oydd_default/index.html?videoId=5409283775001
use_cookies="no"
chan_name="EWTN Deutsch" ;;
# 494) KtO Catholique
494)
link=http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/master.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x178,CODECS="avc1.66.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x178,CODECS="avc1.66.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_300_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_800_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_800_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=720x404,CODECS="avc1.77.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_1200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=720x404,CODECS="avc1.77.30, mp4a.40.2"
#link="http://livehdkto-lh.akamaihd.net/i/LiveStream_1@178944/index_1200_av-b.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="KtO Catholique" ;;
######################## POLAND #################################
# 495) TRWAM Poland
495)
link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam.mpd"
#link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=646449,RESOLUTION=426x240,CODECS="avc1.4D4015,mp4a.40.2"
#link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1240417,RESOLUTION=640x360,CODECS="avc1.4D401E,mp4a.40.2"
#link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1900417,RESOLUTION=854x480,CODECS="avc1.4D401E,mp4a.40.2"
#link="https://trwamtv.live.e57-po.insyscd.net/cl01/out/u/trwam_3.m3u8"

#link=https://trwamtv.live.e55-po.insyscd.net/trwamtv2.smil/chunklist.m3u8
#link="https://trwamtv.live.e55-po.insyscd.net/trwamtv2.smil/chunklist.m3u8"
use_cookies="no"
chan_name="TRWAM TV 2 Poland" ;;

#########################  CHRISTIAN ################################################
# 496) CBN
496)
link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/master.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_500_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_500_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_1200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_1200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2064000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_2000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2064000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/iptv1_1@194050/index_2000_av-b.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="CBN" ;;
# 497)CBN News
497)
link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/master.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_150_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_150_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_500_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_500_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_900_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=854x480,CODECS="avc1.77.30, mp4a.40.2"
#link="https://bcliveuniv-lh.akamaihd.net/i/news_1@194050/index_900_av-b.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="CBN News" ;;
# 498)NRB Network
498)
#link=https://uni6rtmp.tulix.tv/nrbnetwork/myStream.sdp/playlist.m3u8
link="https://uni6rtmp.tulix.tv/nrbnetwork/myStream.sdp/chunklist_w1520783238.m3u8"
use_cookies="no"
chan_name="NRB Network" ;;
# 499) Trinity Channel
499)
link="https://rtmp1.abnsat.com/hls/trinity.m3u8"
use_cookies="no"
chan_name="Trinity Channel" ;;
# 500) International House of Prayer (IHOP) (Christian)
500)
keyword="Live"

link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/playlist.m3u8"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aud",NAME="English",DEFAULT=YES,AUTOSELECT=YES,LANGUAGE="eng",URI="audio_0_eng.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=480x270,AUDIO="aud"
#link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/video_3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1457843,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=848x480,AUDIO="aud"
#link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/video_2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2368507,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,AUDIO="aud"
#link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/video_1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=4211320,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1920x1080,AUDIO="aud"
#link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/video_0.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=260353,CODECS="mp4a.40.2",AUDIO="aud"
#link="https://storage.sardius.media/archives/-K6FGrVYzVr92SDZiDnc/events/site_68FBe1c2dE/audio_0_eng.m3u8cat: '~': Is a directory

#channelURL="https://www.youtube.com/user/IHOPkc/videos?&view=2" 
#youTubeGrab

use_cookies="no"
chan_name="International House of Prayer (Christian)" ;;
# 501) Amazing Facts TV (Christian
501)
keyword="AFTV"
#link=http://amazingfacts.live-s.cdn.bitgravity.com/cdn-live/_definst_/amazingfacts/live/feed01/master.m3u8
#link=http://amazingfacts.live-s.cdn.bitgravity.com/cdn-live/_definst_/amazingfacts/live/feed01/chunklist_w1134820847.m3u8

channelURL="https://www.youtube.com/user/AmazingFacts/featored"
youTubeGrab3

use_cookies="no"
chan_name="Amzaing Facts TV (Christian)" ;;
# 502) It's Supernatural! Network (Christian)
502)
keyword="Supernatural"

channelURL="https://www.youtube.com/user/SidRoth/featured"
youTubeGrab3

use_cookies="no"
chan_name="It's Supernatural! (Christian)" ;;
# 503) Shepherd's Chapel, Gravette Arkansas
503)
keyword="Chapel"
#link="https://livestream.com/accounts/14403440/events/4227022"

channelURL="https://www.youtube.com/user/TheShepherdsChapel/featured"
youTubeGrab3

use_cookies="no"
chan_name="Shepherd's Chapel, Gravette Arkansas" ;;
# 504) Belivers Voice of Victory Network
504)
keyword="Live"

channelURL="https://www.youtube.com/channel/UCvYVGf_JFME9dVe3WtljP1Q/featured"
youTubeGrab3

use_cookies="no"
chan_name="Belivers Voice of Victory Network" ;;
# 505) Three Angels BroadCasting
505)
keyword="Live"
#link=http://moiptvus-lh.akamaihd.net:80/i/3abnlive_1@328342/index_800_av-p.m3u8

channelURL="https://www.youtube.com/user/3ABNVideos/featured"
youTubeGrab3

use_cookies="no"
chan_name="Three Angels Broadcasting Network" ;;
# 506) 3ABN Latino
506)
keyword="Live"

channelURL="https://www.youtube.com/user/3abnlatino/featured"
youTubeGrab3

use_cookies="no"
chan_name="3ABN Latino" ;;
# 507) 3ABN Francais
507)
#link="http://aos01.3abn.adaptive.level3.net/hls-live/mediaoppremux-fre_multi/_definst_/live/stream3.m3u8"
keyword="Live"

channelURL="https://www.youtube.com/channel/UCMgaz88skVo7HF6ZWlioetw/featured"
youTubeGrab3

use_cookies="no"
chan_name="3ABN Francais" ;;
# 508) LLBN Smart Livestyle TV
508)
keyword="Live"
link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&set-akamai-hls-revision=5&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_700_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&rebase=on"
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=522665,RESOLUTION=320x240,CODECS="avc1.42001e, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_300_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
#EXT-X-STREAM-INF:BANDWIDTH=1102504,RESOLUTION=480x360,CODECS="avc1.42001e, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_700_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
#EXT-X-STREAM-INF:BANDWIDTH=1462188,RESOLUTION=640x480,CODECS="avc1.42001e, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SmartLifeStyle_1@692079/index_1200_av-p.m3u8?sd=10&rebase=on&set-akamai-hls-revision=5&rebase=on"
#live=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/LLBNChristianTV/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="LLBN Smart Lifestyle TV" ;;

# 509) LLBN His Word TV
509)
keyword="Live"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_500_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_800_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1496000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
link="https://t01587-lh.akamaihd.net/i/t01587HisWord_1@692072/index_1400_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="LLBN His Word TV" ;;

# 510) LLBN His Light TV
510)
keyword="Live"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=564000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_500_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=896000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_800_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1496000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
link="https://t01587-lh.akamaihd.net/i/t01587HisLight_1@692073/index_1400_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="LLBN His Light TV" ;;

# 511) #LLBN Latino TV
511)
keyword="Live"
#https://t01587-lh.akamaihd.net/i/t01587Latino_1@692077/index_1200_av-p.m3u8?sd=10&set-akamai-hls-revision=5&rebase=on
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587Latino_1@692077/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587Latino_1@692077/index_700_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
link="https://t01587-lh.akamaihd.net/i/t01587Latino_1@692077/index_1200_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="LLBN Latino TV" ;;

# 512) Salt and Light TV Portage Michigan
512)
keyword="Salt"

channelURL="https://www.youtube.com/channel/UCS1_M4LZ3o3gNmfKbZX6QGw/featured"
youTubeGrab3

use_cookies="no"
chan_name="Salt and Light TV Portage Michigan" ;;
# 513) Harbor Light Radio
513)
keyword="Harbour Light Radio Live Stream"

channelURL="https://www.youtube.com/channel/UCoGlUDLHffMYyJBD4j3zeDw/featured"
youTubeGrab3

use_cookies="no"
chan_name="Harbor Light Radio" ;;
# 514) St. Marys and St. Antonios Coptic
514)
keyword="Live"

channelURL="https://www.youtube.com/channel/UClk9kRoKydqQgZb6bG6GQ-g/featured"
youTubeGrab3

use_cookies="no"
chan_name="St. Marys and St. Antonios Coptic" ;;
# 515) Word of God Greek
515)
keyword="Word"

channelURL="https://www.youtube.com/user/WordofGodGreece/featured"
youTubeGrab3

use_cookies="no"
chan_name="Word of God Greek" ;;
# 516) Shalom Media Catholic America
516)

channelURL="https://livestream.com/shalomworld/events/7511845"
liveStreamGrab

use_cookies="no"
chan_name="Shalom Media Catholic America"  ;;
# 517) Shalom Media Catholic India
517)

channelURL="https://livestream.com/shalomworld/events/7483919"
liveStreamGrab

use_cookies="no"
chan_name="Shalom Media Catholic India" ;;
# 518) Powervision TV
518)
keyword="POWERVISION"

channelURL="https://www.youtube.com/channel/UCzxfpzSF7mz8j7bNIXyZWmA/featured"
youTubeGrab3

use_cookies="no"
chan_name="Powervision TV" ;;

# 519) #LLBN Arabic TV
519)
keyword="Live"
#https://t01587-lh.akamaihd.net/i/t01587Arabic_1@692074/segment1562510758_1200_av-p.ts?sd=10&rebase=on&set-akamai-hls-revision=5
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587Arabic_1@692074/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=480x360,CODECS="avc1.66.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587Arabic_1@692074/index_700_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=640x480,CODECS="avc1.66.30, mp4a.40.2"
link="https://t01587-lh.akamaihd.net/i/t01587Arabic_1@692074/index_1200_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="LLBN Arabic TV" ;;

# 520) #LLBN South Asian TV
520)
keyword="Live"
#https://t01587-lh.akamaihd.net/i/t01587SouthAsia_1@692078/index_1200_av-p.m3u8?sd=10&set-akamai-hls-revision=5&rebase=on
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=320x240,CODECS="avc1.77.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SouthAsia_1@692078/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=764000,RESOLUTION=480x360,CODECS="avc1.77.30, mp4a.40.2"
#link="https://t01587-lh.akamaihd.net/i/t01587SouthAsia_1@692078/index_700_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1264000,RESOLUTION=640x480,CODECS="avc1.77.30, mp4a.40.2"
link="https://t01587-lh.akamaihd.net/i/t01587SouthAsia_1@692078/index_1200_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="LLBN South Asian TV" ;;

###################  MIXER    ###################
# 521) Vatican Media English
521)

channelURL="https://www.youtube.com/channel/UCxIsefyl9g9A5SGWA4FvGIA/featured"
youTubeGrab3

use_cookies="no"
chan_name="Vatican Media English" ;;
# 522) Vatican Media Deutsch
522)
keyword="Live"

channelURL="https://www.youtube.com/user/vaticande/featured"
youTubeGrab3

use_cookies="no"
chan_name="Vatican Media Deutsch" ;;
# 523) Vatican Media Italiano
523)
keyword="Live"

channelURL="https://www.youtube.com/user/vaticanit/featured"
youTubeGrab3

use_cookies="no"
chan_name="Vatican Media Italiano" ;;
# 524) Temple Institute
524)

channelURL="https://www.youtube.com/user/henryporter2/featured"
youTubeGrab3

use_cookies="no"
chan_name="Temple Institute" ;;

# 525) TBN Trinity Broadcasting Network
525)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266920/"
# set the link
liveStreamGrab


fi
use_cookies="no"
chan_name="TBN" ;;

# 526) TBN UK Trinity Broadcasting Network UK
526)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8287186/"
# set the link
liveStreamGrab


fi
use_cookies="no"
chan_name="TBN UK" ;;

# 527) Hillsong Channel
527)
if [ "$getlink" = 1 ]
then
#https://player-api.new.livestream.com/accounts/27460990/events/8266909/broadcasts/195799744.secure.m3u8?dw=14400&hdnea=st=1567495476~exp=1567497276~acl=/i/27460990_8266909_lsiq50tdwb1wkk0ha08_1@446541/*~hmac=98879b74432bcbb3a278cc763b22a7ddfb593e59cd710526cd1db28444a2439c&token=5d6e1660_95424f6ca14b06332b3019b367990a78d4b41d9d
#https://playback.akamaized.net/streams/27460990_8266909_lsiq50tdwb1wkk0ha08_1/master.m3u8?dw=14400&hdnts=exp=1567496076~acl=/streams/27460990_8266909_lsiq50tdwb1wkk0ha08_1/master.m3u8*~hmac=e70da62168652b46bdded48f2ec499f4fe3aba5a1e3e984765a8640d85d53fb3

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266909/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Hillsong Channel" ;;

# 528) TCI Italian
528)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8287184/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="TCI Italian" ;;

# 529) Enlace Latino
529)
if [ "$getlink" = 1 ]
then
#link="$( curl "https://player-api.new.livestream.com/accounts/27460990/events/8266905/"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"

#link="https://livestream.com/accounts/2675843/enlace"
#link="$( curl "https://livestream.com/accounts/2675843/enlace"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"

channelURL= "https://livestream.com/accounts/2675843/enlace"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Enlace Latino" ;;

# 530) Salsa
530)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266915/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Salsa" ;;

# 531) Smile of a Child
531)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266916/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Smile" ;;

# 532) JUCE TV
532)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266912/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="JUCE TV" ;;

# 533) Nejat TV Arabic
533)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266913/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Nejat TV Arabic" ;;

# 534) Al Horreya Arabic
534)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266904/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="Al Horreya Arabic" ;;

# 535) EJTV Latino
535)
if [ "$getlink" = 1 ]
then

channelURL="https://player-api.new.livestream.com/accounts/27460990/events/8266929/"
# set the link
liveStreamGrab

fi
use_cookies="no"
chan_name="EJTV" ;;

#536) Shalom Media Catholic KIDS
536)
if [ "$getlink" = 1 ]
then
#link="https://livestream.com/shalomworld/events/7987357"
channelURL="https://livestream.com/shalomworld/events/7987357"
liveStreamGrab
fi
use_cookies="no"
chan_name="Shalom Media Catholic KIDS" ;;

#537) VTNTV VICTORY TELEVISION NETWORK KVTN KVTH KVTJ Little Rock Arkansas
537)
if [ "$getlink" = 1 ]
then
#link="https://livestream.com/accounts/15669040/events/4554297"
channelURL="https://livestream.com/accounts/15669040/events/4554297"
liveStreamGrab
fi
use_cookies="no"
chan_name="VTNTV VICTORY TELEVISION NETWORK KVTN KVTH KVTJ Little Rock Arkansas" ;;

# 538) St Patrick's Dumbarton
538)
#link="https://livestream.com/accounts/10499782/events/7601596"
channelURL="https://livestream.com/accounts/10499782/events/7601596"
liveStreamGrab
use_cookies="no"
chan_name="St Patrick's Dumbarton" ;;


# 539) Providence Christian Network
539)
link="https://ltv-simul.frankspeech.com/n4s4/FrankS/CT/interlink.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="Providence Christian Network";;



# 539) BYUTV
#539)
#if [ "$getlink" = 1 ]
#then
#"https://byubroadcasting.hb.omtrdc.net/?s:sc:rsid=byutvprod&s:sc:tracking_server=byubroadcasting.sc.omtrdc.net&h:sc:ssl=1&s:user:mid=61234542045940268791717607808247955647&s:user:id=96e4100e-6d79-40e4-bf28-5fc75850610f&s:aam:blob=6G1ynYcLPuiQxYZrsz_pkqfLG9yMXBpb2zX5dvJdYQJzPXImdj0y&l:aam:loc_hint=9&s:sp:channel=BYUtv&s:sp:player_name=BYUtv VOD Player&s:sp:hb_version=js-2.0.1.88-c8c0b1&l:sp:hb_api_lvl=4&s:event:sid=1567475921052861134551&s:event:type=start&l:event:duration=10000&l:event:playhead=0&l:event:ts=1567476596296&l:event:prev_ts=1567476586296&s:asset:type=main&s:asset:name=Schlesinger Family - Striking a Chord&s:asset:video_id=581eb7fd-efa9-48db-b1b3-6eb3cf936c03&s:asset:publisher=8ACB7D44536B846F0A490D4D@AdobeOrg&l:asset:length=0&s:stream:type=vod&l:stream:bitrate=0&l:stream:fps=0&l:stream:dropped_frames=0&l:stream:startup_time=0"
#fi
#use_cookies="no"
#chan_name="BYUTV" ;;

###################################
# 551)
# 552)

# 553) CBC Yellowknife News
553)
link="https://cbcrclinear-tor.akamaized.net/hls/live/2042766/CBCRCLINEAR_TOR_12/master5.m3u8"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042766/CBCRCLINEAR_TOR_12/master4.m3u8"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042766/CBCRCLINEAR_TOR_12/master3.m3u8"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042766/CBCRCLINEAR_TOR_12/master2.m3u8"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042766/CBCRCLINEAR_TOR_12/master1.m3u8"
use_cookies="no"
chan_name="CBC Yellowknife News" ;;

# 554) CBC News Toronto 
554)
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040316/geo_allow_global/ES_REGIONS_4/master_256.m3u8"
use_cookies="no"
chan_name="CBC News Toronto" ;;

# 555) CBC News Ottawa 
555)
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/ES_REGIONS_1/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040317/geo_allow_global/ES_REGIONS_5/master_256.m3u8"
use_cookies="no"
chan_name="CBC News Ottawa" ;;

# 556) CBC News Montreal 
556)
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_256.m3u8"
use_cookies="no"
chan_name="CBC News Montreal" ;;


# 557) CBC News Windsor 
557)
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040318/geo_allow_global/ES_REGIONS_6/master_256.m3u8"
use_cookies="no"
chan_name="CBC News Windsor" ;;

# 558) CBC News Igalaaq Nunavut
558)

#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040320/geo_allow_global/ES_REGIONS_8/master_256.m3u8"
use_cookies="no"
chan_name="CBC News Igalaaq Nunavut" ;;

# 559) CBC Olympic Channel
559)
website="https://gem.cbc.ca/"
eventID="ZX-bVk6oQHyOaEJSRmxUlg"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

use_cookies="no"
chan_name="CBC Olympic Channel" ;;

# 560) CBC Here and Now
560)
website="https://gem.cbc.ca/"

link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master.m3u8"
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclive-tor.akamaized.net/hls/live/2040313/geo_allow_global/ES_REGIONS_1/master_256.m3u8"

use_cookies="no"
chan_name="CBC Here and Now" ;;

################## MENU 3   ##################
########################## CBC CANADA #################################

# 561) CBC News Network Canada
561)

#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master.m3u8
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-INDEPENDENT-SEGMENTS
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="CC",LANGUAGE="eng",NAME="English",INSTREAM-ID="CC1"
#EXT-X-STREAM-INF:BANDWIDTH=2103200,AVERAGE-BANDWIDTH=2305600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=960x540,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master1.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=804760,AVERAGE-BANDWIDTH=875600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master2.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1304160,AVERAGE-BANDWIDTH=1425600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=768x432,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master3.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=505120,AVERAGE-BANDWIDTH=545600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
#link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master4.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3102000,AVERAGE-BANDWIDTH=3405600,CODECS="avc1.640029,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000,CLOSED-CAPTIONS="CC"
link="https://cbcrclinear-tor.akamaized.net/hls/live/2042769/geo_allow_ca/CBCRCLINEAR_TOR_15/master5.m3u8"

#####method="Tor"
use_cookies="no"
chan_name="CBC News Network,CA";;

# 562) CBC Vancouver BC Canada
562)
eventID="veaPAEYfTPSsO9Hh2uP9eg"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
#####method="Tor"
use_cookies="no"
chan_name="CBC Vancouver, British Columbia, Canada ";;

# 563) CBC Yellowknife North West Territories Canada
563)

eventID="qWpNseVnSZmxv0R7Lko0qA"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Yellowknife NWT, Canada ";;

# 564) CBC Edmonton Alberta Canada
564)

eventID="04AxYTacSDGW1AjoSDbKEA"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
use_cookies="no"
chan_name="CBC Edmonton, Alberta,  Canada ";;

# 565) CBC Calgary Alberta Canada
565)

eventID="5SQFM3w4Qbq_mzoHYX5U8Q"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Calgary, Alberta, Canada ";;

# 566) CBC Regina Saskatchewan  Canada
566)
eventID="ZeTKHR3FQvaDTuhiKvLVyQ"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Regina Saskatchewan Canada ";;

# 567) CBC Winnepeg Manitoba Canada
567)
eventID="jLQ8BuGzQ1K-xclwzWf9eg"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
website="https://gem.cbc.ca/"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Winnepeg, Manitoba, Canada ";;

# 568) CBC Windsor  Ontario Canada
568)
website="https://gem.cbc.ca/"
eventID="ATmOOL3PTgCxBYd_cyKhGw/"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Windsor, Ontario, Canada ";;

# 569) CBC Toronto Ontario Canada
569)
website="https://gem.cbc.ca/"
eventID="sfQoQ_zET42kay3DTlOY6Q"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Toronto, Ontario, Canada ";;

# 570) CBC Ottawa Ontario Canada
570)
website="https://gem.cbc.ca/"
eventID="ZX-bVk6oQHyOaEJSRmxUlg"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
#####method="Tor"
use_cookies="no"
chan_name="CBC Ottawa Canada";;

# 571) CBC Montreal Quebec Canada
571)
website="https://gem.cbc.ca/"
eventID="fbbUzrtWRKOeKFUZ8mT5wA"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Montreal, Quebec, Canada ";;

# 572) CBC Fredericton New Brunswick Canada
572)
website="https://gem.cbc.ca/"
eventID="Sop8MbEDTP-HFSXCjYN4hQ"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Fredericton, New Brunswick, Canada ";;

# 573) CBC Charlottetown Prince Edward Island Canada
573)
website="https://gem.cbc.ca/"
eventID="yFn5F2ZLQXuSAsv2oZR6Ag"
ppid="818cea6c47d61fc8e1cd07510d3f092b106230842f3547b30104157a21b93a39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2
#####method="Tor"
use_cookies="no"
chan_name="CBC Charlottetown, Prince Edward Island, Canada ";;

# 574) CBC Halifax Nova Scotia Canada
574)

website="https://gem.cbc.ca/"
eventID="5xdq0YU6RZmykERwRPaoTQ"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC Halifax, Nova Scotia, Canada ";;

# 575) CBC Newfoundland Canada
575)

website="https://gem.cbc.ca/"
eventID="NI3t7RVDSZaWrXE6fo_FzQ"
ppid="da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39"
api_key="0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069"
googleGrab2

#####method="Tor"
use_cookies="no"
chan_name="CBC St. John's, Newfoundland, Canada ";;

# 576)  ICI Tele CB-Yukon
576)
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704017/cancbuft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele CB-Yukon" ;;

# 577)  ICI Tele Alberta
577)

#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master.m3u8"
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-INDEPENDENT-SEGMENTS
#EXT-X-STREAM-INF:BANDWIDTH=2197800,AVERAGE-BANDWIDTH=2340800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_2000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1375000,AVERAGE-BANDWIDTH=1460800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_1200.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=3226300,AVERAGE-BANDWIDTH=3440800,CODECS="avc1.64001f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=30.000
link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_3000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=860750,AVERAGE-BANDWIDTH=910800,CODECS="avc1.64001e,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=552200,AVERAGE-BANDWIDTH=580800,CODECS="avc1.640015,mp4a.40.2",RESOLUTION=480x270,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=395780,AVERAGE-BANDWIDTH=422400,CODECS="avc1.64000d,mp4a.40.2",RESOLUTION=416x234,FRAME-RATE=30.000
#link="https://rcavlive.akamaized.net/hls/live/704020/cancbxft/master_256.m3u8"
use_cookies="no"
chan_name="ICI Tele Alberta" ;;

# 578)ICI Tele Saskatchewan
578)
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704019/cancbkft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Saskatchewan" ;;

# 579) ICI Tele Manitoba
579)
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704018/cancbwft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Manitoba" ;;

# 580)ICI Tele Ontario
580)
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704022/cancblft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Ontario" ;;

# 581)ICI Tele Ottawa-Gatineau
581)
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/664046/cancboft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Ottawa-Gatineau" ;;

# 582)  ICI Tele Acadie
582)
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master.m3u8"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_2500.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704014/cancbaft/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Acadie" ;;

# 583) ICI Tele Estrie
583)
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704016/cancksh/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Estire" ;;

# 584)ICI Tele Mauricie
584)
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704021/cancktm/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Mauricie" ;;

# 585)ICI Tele Montreal
585)
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_2500.m3u8"
link="https://rcavlive-dai.akamaized.net/hls/live/696614/cancbftprem/master_5000.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Montreal" ;;

# 586)ICI Tele Saguenay
586)
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704023/cancktv/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Saguenay" ;;

# 587)ICI Tele Quebec
587)
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/664045/cancbvt/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Quebec" ;;

# 588) ICI Tele Est-Quebec
588)
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=281600,AVERAGE-BANDWIDTH=281600,CODECS="avc1.42c00c,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=14.985,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_256.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=440000,AVERAGE-BANDWIDTH=440000,CODECS="avc1.42c00d,mp4a.40.2",RESOLUTION=320x180,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_400.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=770000,AVERAGE-BANDWIDTH=770000,CODECS="avc1.66.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_700.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1210000,AVERAGE-BANDWIDTH=1210000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_1100.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1980000,AVERAGE-BANDWIDTH=1980000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
#link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_1800.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=2750000,AVERAGE-BANDWIDTH=2750000,CODECS="avc1.4d401f,mp4a.40.2",RESOLUTION=1280x720,FRAME-RATE=29.970,AUDIO="program_audio",CLOSED-CAPTIONS="CC"
link="https://rcavlive.akamaized.net/hls/live/704024/cancjbr/master_2500.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_fr",AUTOSELECT=YES,DEFAULT=YES,URI="master_128.m3u8"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="program_audio",LANGUAGE="fra",NAME="audio_frdv",AUTOSELECT=YES,DEFAULT=NO,URI="master_dv.m3u8"
use_cookies="no"
chan_name="ICI Tele Est-Quebec" ;;

# 589) CityLine CA
589)
#link="https://bthlsamd-i.akamaihd.net/hls/live/621265/BTTOR_HLSAMD/1203be152b3208dae6341ec155726363/3.m3u8"
link="https://bthlsamd-i.akamaihd.net/hls/live/621265/BTTOR_HLSAMD/1203be152b3208dae6341ec155726363/2.m3u8"
#link="https://bthlsamd-i.akamaihd.net/hls/live/621265/BTTOR_HLSAMD/1203be152b3208dae6341ec155726363/1.m3u8"
use_cookies="no"
chan_name="CityLine CA" ;;

# 590) CBC News Montreal Canada
590)
link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_2500_av-p.m3u8?sd=10&rebase=on"
link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_1800_av-p.m3u8?sd=10&rebase=on"
link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_700_av-p.m3u8?sd=10&rebase=on"
link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_400_av-p.m3u8?sd=10&rebase=on"
link="https://cbcnewshd-f.akamaihd.net/i/cbcregional_1@141286/index_256_av-p.m3u8?sd=10&rebase=on"
#link="http://cbcnewshd-f.akamaihd.net/i/cbcnews_1@8981/index_2500_av-p.m3u8"
#####method="Tor"
use_cookies="no"
chan_name="CBC News, Montreal, Canada";;

# 591) Global News BC
591)

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/bc/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="eIIBH8jkR-SWGaD5E4MesA"
googleGrab 


#####method="Tor"
use_cookies="no"
chan_name="Global News BC";;

# 592) Global News Okanagan
592)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/okanagan/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="PLPlPfeDQCCe4GaxAWpi4g"
googleGrab 

#####method="Tor"
use_cookies="no"
chan_name="Global News Okanagan BC CA ";;

# 593) Global News Edmonton
593)

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/edmonton/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="K8ZZN35nQA2N_hskrUB2oQ"
googleGrab 

#####method="Tor"
use_cookies="no"
chan_name="Global News Edmonton AB";;

# 594) Global News Calgary
594)

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/calgary/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="AYQ1ssB7RcOX9D78FtdoQQ"
googleGrab 

#####method="Tor"
use_cookies="no"
chan_name="Global News Calgary AB";;

# 595) Global News Lethbridge
595)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/lethbridge/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="hYQh95EXRwaF0IOhUrJoEQ"
googleGrab 

use_cookies="no"
chan_name="Global News Lethbridge AB";;

# 596) Global News Regina
596)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/regina/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="A69Xh6OaTfOrRf2oHVLaPQ"
googleGrab 

use_cookies="no"
chan_name="Global News Regina SK";;

# 597) Global News Saskatoon
597)

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/saskatoon/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="cAeO9FUXSRatnrvaksoJ9A"
googleGrab 

use_cookies="no"
chan_name="Global News Saskatoon SK";;

# 598) Global News Winnipeg
598)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/winnipeg/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="R5XZJcTAQPuyvhsVWIKRhw"
googleGrab 

use_cookies="no"
chan_name="Global News Winnipeg MB";;

# 599) Global News Toronto
599)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/toronto/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="BblZeSsBRSSCtvkKRZ8XJQ"
googleGrab 

use_cookies="no"
chan_name="Global News Toronto ON";;

# 600) Global News Peterburough 
600)

#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/peterburough/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="CQ82MHxxS7qwe7Zvs4_sUA"
googleGrab 

use_cookies="no"
chan_name="Global News Peterburough ON";;
##################################################################################################################3

#############  CANADA EXTRA  #####################################

# 601) Global News Kingston
601)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/kingston/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="poxVVQNQSMqFBnT6qR-Lwg"
googleGrab 

use_cookies="no"
chan_name="Global News Kingston ON";;

# 602) Global News Montreal
602)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/montreal/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="wI13hMWhRSKbyZ8Q1DQR3Q"
googleGrab 

use_cookies="no"
chan_name="Global News Montreal QC";;

# 603) Global News Halifax
603)
#Upstream source website URL to Global News Canada stations. 
website="https://globalnews.ca/live/halifax/"

#Comment:
#Corus Entertainment publicly broadcasts their content to anyone with a web-browser at the above listed URL 
#distributed free of charge to anyone who navigates to this web URL, published publicly by Global News (Corus Entertainment).  
#They do not have Geo-Location blocking, a pay-wall, a user logon with a password, DRM (digital rights management), encryption, 
#or even a cookie or token scheme to authorize viewers. Their stream and its links are published to the web-browser 
#after a javascript video player is installed, which then publicly publishs the URL hosting the media through a Google API.
#The direct links to these media streams have been removed from this file, and replaced with the Google API based method.
#This is the same method that your web-browser uses to link to the media stream, and is not exclusive to Global News or Corus Entertainment. 

eventID="ljv6O6ZiSiKudWk7qwWbEw"
googleGrab 

use_cookies="no"
chan_name="Global News Halifax NB";;

# 604) ROGERS TV Kitchener
604)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS TV Kitchener";;

# 605) ROGERS TV Ottawa Francais
605)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card7/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS TV Ottawa Francais";;

# 606) ROGERS TV Ottawa
606)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card3/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS TV Ottawa";;

# 607) ROGERS TV  BARRIE ON CA
607)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card4/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS BARRIE ON CA";;

# 608) ROGERS TV BORDEN/ALISTON ON CA
608)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card6/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS BORDEN/ALISTON ON CA";;

# 609) ROGERS TV Brantford ON CA
609)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Brantford ON CA";;

# 610) ROGERS TV Cambridge ON CA
610)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Cambridge ON CA";;

# 611) ROGERS TV Collingwood CA
611)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Collingwood ON CA";;

# 612) ROGERS TV Dufferin-Calderon ON CA
612)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card3/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Dufferin-Calderon ON CA";;

# 613) ROGERS TV Durham ON CA
613)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card1/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Durham ON CA";;

# 614) ROGERS TV Georgina CA
614)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card5/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Georgina CA";;

# 615) ROGERS TV Grey County 
615)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card1/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Grey County CA";;

# 616) ROGERS TV Geulph CA
616)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card7/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Geulph CA";;

# 617) ROGERS TV Kawartha Lake CA
617)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card2/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Kawartha Lake CA";;

# 618) ROGERS TV Kincardine CA
618)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Kincardine CA";;

# 619) ROGERS TV Kitchener CA
619)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Kitchener CA";;

# 620) ROGERS TV London CA
620)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card6/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS London CA";;

# 621) ROGERS TV Midland CA
621)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card5/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Midland CA";;

# 622) ROGERS TV North Durham - Kawartha
622)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card2/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS North Durham - Kawartha CA";;

# 623) ROGERS TV Orillia
623)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card7/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Orillia CA";;

# 624) ROGERS TV St. Thomas
624)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card4/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS St. Thomas CA";;

# 625) ROGERS TV Stratford
625)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Stratford CA";;

# 626) ROGERS TV Strathory-Caradoc
626)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m44_card4/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Strathory-Caradoc CA";;

# 627) ROGERS TV Tilsonburg
627)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card2/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Tilsonburg CA";;

# 628) ROGERS TV Waterloo
628)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m40_card8/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Waterloo CA";;

# 629) ROGERS TV Woodstock
629)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m42_card1/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Woodstock CA";;

# 630) ROGERS TV Cornerbrook NFLD
630)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m37_card4/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Cornerbrook NFLD";;

# 631) ROGERS TV Gander NFLD
631)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m37_card1/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Gander NFLD CA";;

# 632) ROGERS TV St. John's NFLD 
632)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m37_card2/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS St. John's NFLD CA";;

# 633) ROGERS TV Edmunston NB CA Francais
633)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m43_card6/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Edmunston NB CA Francais CA";;

# 634) ROGERS TV Fredericton NB CA
634)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m43_card2/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Fredericton NB CA";;

# 635) ROGERS Miramichi NB CA
635)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m43_card3/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Miramichi NB CA";;

# 636) ROGERS TV Moncton NB CA
636)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m43_card7/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Moncton NB CA";;

# 637) ROGERS TV Moncton NB CA Francais
637)
link="https://livedrm.akamaized.net/hls/live/1021686/rtv/m43_card4/playlist.m3u8"
use_cookies="no"
chan_name="ROGERS Moncton NB CA Francais";;

## 638

## 639

## 640

################################ LATINO III ###############################################################
## 641) Cali TV
641)
link=http://vbox.cehis.net/live-calitv/calitv1/chunklist_w1780377540.m3u8
use_cookies="no"
chan_name="Cali TV CO" ;;

# 642) Sinart Digital Señal Canal 13 CR
642)
#link="https://livestream.com/accounts/1532727/events/8158158"
link="$( curl "https://livestream.com/accounts/1532727/events/8158158"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Sinart Digital Señal Canal 13 CR " ;;
# 643) BethelTV Bethel Panamá
643)
#link="https://livestream.com/accounts/16567960/events/7963429"
link="$( curl "https://livestream.com/accounts/16567960/events/7963429"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="BethelTV Bethel Panamá" ;;
# 644) Poder de Dios TV La Paz Bolivia
644)
#link="https://livestream.com/accounts/25268891/TV"
link="$( curl "https://livestream.com/accounts/25268891/TV"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Poder de Dios TV La Paz Bolivia" ;;
# 645) GUATEVISION Guatemala
645)
#link="https://livestream.com/accounts/25697071/en-vivo"
link="$( curl "https://livestream.com/accounts/25697071/en-vivo"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="GUATEVISION Guatemala" ;;
# 646) Onda Cádiz RTV Spain
646)
#link="https://livestream.com/accounts/22727797/directo"
link="$( curl "https://livestream.com/accounts/22727797/directo"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Onda Cádiz RTV Spain" ;;
# 647) Streaming Medios Públicos Señal Nacional
647)
#link="https://livestream.com/accounts/27228685/events/8175786"
link="$( curl "https://livestream.com/accounts/27228685/events/8175786"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Streaming Medios Públicos Señal Nacional" ;;
# 648) Tele Bahia Santo Domingo ,Dominican Republic
648)
#link="https://livestream.com/accounts/18988261/events/7725211"
link="$( curl "https://livestream.com/accounts/18988261/events/7725211"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Tele Bahia Santo Domingo ,Dominican Republic" ;;
# 649)Iglesia Advenimiento del Séptimo Día Advenimiento TV Dallas Texas
649)
#link="https://livestream.com/accounts/13655021/events/4355864"
link="$( curl "https://livestream.com/accounts/13655021/events/4355864"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Advenimiento TV Dallas Texas" ;;
# 650) Expande TV Puebla Mexico
650)
#link="https://livestream.com/accounts/7277442/envivo"
link="$( curl "https://livestream.com/accounts/7277442/envivo"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Expande TV Puebla Mexico" ;;
# 651) Tv Universal Centro de Ayuda Universal Mexico
651)
#link="https://livestream.com/accounts/4486152/oracionmedianoche"
link="$( curl "https://livestream.com/accounts/4486152/oracionmedianoche"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Tv Universal Centro de Ayuda Universal Mexico" ;;
# 652) Canal 27, El Canal de la Esperanza.
652)
#link="https://livestream.com/accounts/13639189/events/6356013"
link="$( curl "https://livestream.com/accounts/13639189/events/6356013"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Canal 27, El Canal de la Esperanza." ;;
# 653) teleamiga TELEAMIGA INTERNACIONAL
653)
#link="https://livestream.com/accounts/18971084/events/6841479"
link="$( curl "https://livestream.com/accounts/18971084/events/6841479"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TELEAMIGA INTERNACIONAL" ;;
# 654) Politv Poli tv Bogota Colombia
654)
#link="https://livestream.com/accounts/12256908/events/6185792"
link="$( curl "https://livestream.com/accounts/12256908/events/6185792"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Poli tv Bogota Colombia" ;;
# 655) UNTREF UN3 - Tu mirada no está sola Buenos Aires Argentina
655)
#link="https://livestream.com/accounts/5198918/events/3229548"
link="$( curl "https://livestream.com/accounts/5198918/events/3229548"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="UNTREF UN3 - Tu mirada no está sola Buenos Aires Argentina " ;;
# 656) Asociación RUAV Univalle - Canal Universitario Cali Colombia
656)
#link="https://livestream.com/accounts/2541970/events/1932032"
link="$( curl "https://livestream.com/accounts/2541970/events/1932032"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Asociación RUAV Univalle - Canal Universitario Cali Colombia" ;;
# 657) Canal JesusTV Guatemala
657)
#link="https://livestream.com/accounts/17608437/events/4834657"
link="$( curl "https://livestream.com/accounts/17608437/events/4834657"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Canal JesusTV Guatemala " ;;
# 658) FGTV Frecuencias de Gloria Jacksonville Florida
658)
#link="https://livestream.com/accounts/3107466/events/3858724"
link="$( curl "https://livestream.com/accounts/3107466/events/3858724"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="FGTV Frecuencias de Gloria Jacksonville Florida" ;;
# 659) El Evangelio Eterno EEE Network en Los Angeles Canal 63.5
659)
#link="https://livestream.com/accounts/116136/EEENet"
link="$( curl "https://livestream.com/accounts/116136/EEENet"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="El Evangelio Eterno EEE Network en Los Angeles Canal 63.5" ;;
# 660) Cosmovision TV Cosmovision HD
660)
#link="https://livestream.com/accounts/16628908/cosmovisionhd"
link="$( curl "https://livestream.com/accounts/16628908/cosmovisionhd"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Cosmovision TV" ;;
# 661) Emisora Virtual Onda Libre Cali CO
661)
#link="https://livestream.com/accounts/2541970/events/5178171"
link="$( curl "https://livestream.com/accounts/2541970/events/5178171"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Emisora Virtual Onda Libre Cali CO " ;;
# 662) Yuma Virtual TV Barrancabermeja CO
662)
#link="https://livestream.com/accounts/17972814/events/6311476"
link="$( curl "https://livestream.com/accounts/17972814/events/6311476"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Yuma Virtual TV Barrancabermeja CO" ;;
# 663) Dominio Radio: En Vivo Mexico
663)
#link="https://livestream.com/accounts/26841641/events/8163521"
link="$( curl "https://livestream.com/accounts/26841641/events/8163521"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Dominio Radio: En Vivo Mexico" ;;
# 664) Señal UNTREF
664)
#link="https://livestream.com/accounts/16129323/events/7659666"
link="$( curl "https://livestream.com/accounts/16129323/events/7659666"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Señal UNTREF" ;;
# 665)NRT Canal 4 monclova
665)
#link="https://livestream.com/accounts/24089527/events/7172314"
link="$( curl "https://livestream.com/accounts/24089527/events/7172314"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="NRT Canal 4 monclova" ;;
# 666) TVUNAM 20 Transmisión de la Dirección General de Televisión Universitaria
666)
#link="https://livestream.com/accounts/27177136/events/8157904"
link="$( curl "https://livestream.com/accounts/27177136/events/8157904"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TVUNAM 20" ;;
# 667)EVTV Miami
667)
keyword="EVTV"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/elvenezolanotv/videos?view=2&flow=grid" | grep "$keyword" | grep "watch?v=" | head -n 1 |cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="EVTV Miami" ;;
# 668) Cosmovision TV BO
668)
if [ "$getlink" = 1 ]
then
#link="https://livestream.com/accounts/16628908/cosmovisionhd"
link="$( curl "https://livestream.com/accounts/16628908/cosmovisionhd"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
fi
use_cookies="no"
chan_name="Cosmovision BO" ;;

# 669) VIVE Venezuela
669)
keyword="VIVO"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCg6uD_hL72AFeZuMJL5u07w/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="VIVE Venezuela" ;;
# 670) Vatican Media
670)
keyword="Live"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/vaticanes/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Vatican Media" ;;
# 671) Televen
671)
keyword="Televen EN VIVO"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCcNva2dC9BR8QR_G02xDFqw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Televen Venezuela" ;;

# 672) Impacto USA
672)
keyword="EN VIVO"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/impactotv2/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Impacto USA" ;;

# 673) UCVTV CL  Universidad Católica de Valparaíso
673)
keyword="UCVTV EN VIVO"
#link="http://unlimited1-us.dps.live/ucvtv/ucvtv.smil/ucvtv/livestream2/chunks.m3u8?nimblesessionid=14582063"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/UCVTVONLINE/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="UCVTV Chile" ;;
# 674) UCVTV CL  Universidad Católica de Valparaíso
674)
keyword="UCVTV EN VIVO"
link="http://unlimited1-us.dps.live/ucvtv2/ucvtv2.smil/ucvtv2/livestream2/chunks.m3u8?nimblesessionid=14583770"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/UCVTVONLINE/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="UCVTV 2 Chile" ;;
###################################
# 675) Noticiero Univision MX
675)
keyword="Noticiero"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/UnivisionNoticias/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Noticiero Univision MX" ;;
# 676) Canal 2 Cablenet San Vicente Argentina
676)
keyword="en directo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC6y6nCxdSnkIsQTbfO-AvBw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="Canal 2 CABLENET San Vicente Argentina" ;;
# 677)Canal 2 Telpintv Pinamar AR
677)
keyword="Telpin"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/TelpinVideos/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Canal 2 Telpintv Pinamar AR" ;;
# 678) Canal 8 Mar del Plata
678)
keyword="Plata"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCY0QZk2M_ZZi95S-MN1Zndg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 |cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Canal 8 Mar del Plata Argentina" ;;
# 679) Canal 11 de Salta Argentina
679)
keyword="Salta"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCy-r-BQ5BQRU6rzGS73-WBQ/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Canal 11 de Salta Argentina" ;;
# 680) UNITVE AR  Universidad Nacional de Villa Maria, Córdoba ***
680)
keyword="en directo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC_NtgyVHyQJfy3YlM6XdQdw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="UNITVE Cordoba AR" ;;

######################## Portuguese #########################
# 681) Euronews Portugues
681)
keyword="euronews em"
method="Tor"

#ink="http://pt.euronews.com/live"
radix=$(torsocks -i -a $torsocks_ip -P $torsocks_port curl -A "$UA" $(streamlink "http://pt.euronews.com/live" | cut -d "'" -f 2 | cut -d : -f 3  | cut -d "?" -f 1 | cut -d / -f 3,4,5,6,7,8,9 )| cut -d \: -f 4,5 | cut -d , -f 1 | sed 's/\\//g' | sed 's/\"//g'  )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_720p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_540p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_360p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_224p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_180p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptpri_por_90p/' )
link="$radix"
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_720p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_540p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_360p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_224p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_180p/' )
#link=$( echo $radix | sed 's/playlist/ewnsabrptbkp_por_90p/' )

#format="720p"
## Formats 90p (worst), 180p, 224p, 360p, 540p, 720p (best)
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/euronewspt/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1 )"
use_cookies="no"
chan_name="Euronews Portugues" ;;
################ BRAZIL   ################################
# 682) TV Assemblelia BR
682)
keyword="ao vivo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCIxlLEYzjWPLb_CXpc-e74w/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="TV Assemblelia" ;;
# 683) TV Canaco Nova
683)
keyword="Ao Vivo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/tvcancaonova/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="TV Canaco Nova" ;;
# 684) TV Igreja Internacional de Graca
684)
keyword="ao vivo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC_hwWljVyb_o3yzasx-bG2g/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="TV Igreja Internacional de Graca" ;;
# 685) TV Ales Assembleia Legeslativa
685)
keyword="Ales"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/alescomunicacao/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="TV Ales Assembleia Legeslativa" ;;
# 686) TV Boas Nova
686)
keyword="Play"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/boasnovasoficial/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="Boas Nova" ;;
# 687) Fundacao Nazzare de Communicaco
687)
keyword="VIVO"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/FNComunicacao/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 |cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="Fundacao Nazzare de Communicaco" ;;
# 688) STF Brazil
688)
keyword="TV JUSTIÇA – AO VIVO"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/STF/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="STF Brazil" ;;
# 689) TV Estúdio Brasil
689)
link=http://stmv2.srvstm.com:1935/tvestudiobrasil/tvestudiobrasil/playlist.m3u8
use_cookies="no"
chan_name="TV Estúdio Brasil" ;;
# 690) Rádio Justiça - Ao Vivo
690)
keyword="Rádio Justiça"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/STF/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Radio Justicia" ;;
# 691) EXA FM 93.9
691)
keyword="EXA FM 93.9"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCWWzGVZpJsQpFYGrMTGuZcg/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 |cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="EXA FM 93.9" ;;
# 692) RIT TV BR
692)
keyword="RIT"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCA0bOG0NUfJ855eDtHSxOkw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="RIT TV BR" ;;
# 693)  Gott24.TV International
693)
#link="https://livestream.com/accounts/1106752/events/6785217"
link="$( curl "https://livestream.com/accounts/1106752/events/6785217"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Gott24.TV International" ;;
# 694) TV Fátima Paróquia de Fátima em Direto
694)
#link="https://livestream.com/accounts/22203883/events/6579475"
link="$( curl "https://livestream.com/accounts/22203883/events/6579475"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV Fátima Paróquia de Fátima em Direto" ;;
# 695) You Content 98 Live Belo Horizonte Brasil
695)
#link="https://livestream.com/accounts/15418920/98livebh"
link="$( curl "https://livestream.com/accounts/15418920/98livebh"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="98 Live Belo Horizonte Brasil" ;;
# 696) Rede Gênesis Europa TV Gênesis Europa Lisbon Portugal
696)
#link="https://livestream.com/accounts/6602768/events/3378204"
link="$( curl "https://livestream.com/accounts/6602768/events/3378204"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV Gênesis Europa Lisbon Portugal" ;;
# 697) SISTEMA MEIO NORTE DE COMUNICAÇÃO TV MEIO Teresina Brasil
697)
#link="https://livestream.com/accounts/3332377/tvmeionortehd"
link="$( curl "https://livestream.com/accounts/3332377/tvmeionortehd"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV MEIO Teresina Brasil" ;;
# 698)SescTV HD Sao Paulo BR
698)
#link="https://livestream.com/accounts/16991778/NoAr"
link="$( curl "https://livestream.com/accounts/16991778/NoAr"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="SescTV HD Sao Paulo BR" ;;
# 699) Medalhão Persa BR
699)
#link="https://livestream.com/accounts/7533066/tvmedalhao"
link="$( curl "https://livestream.com/accounts/7533066/tvmedalhao"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Medalhão Persa BR" ;;
# 700)Talenu TV TPA Online Portuguese
700)
#link="https://livestream.com/accounts/1181452/events/5141181"
link="$( curl "https://livestream.com/accounts/1181452/events/5141181"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Talenu TV TPA Luanda Angola" ;;
# 701)TV Miramar Mozambique Portuguese
701)
#link="https://livestream.com/accounts/21076186/events/6180705"
link="$( curl "https://livestream.com/accounts/21076186/events/6180705"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV Miramar Mozambique Portuguese" ;;
# 702)TV Zimbo Online Angola Portuguese
702)
#link="https://livestream.com/accounts/19766999/events/5548210"
link="$( curl "https://livestream.com/accounts/19766999/events/5548210"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV Zimbo Online Angola Portuguese" ;;
# 703) TV RAIAR Angola Portuguese
703)
#link="https://livestream.com/accounts/26069467/tv-raiar"
link="$( curl "https://livestream.com/accounts/26069467/tv-raiar"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TV RAIAR Angola Portuguese" ;;
# 704)Rede Super Belo Horizonte BR
704)
#link="https://livestream.com/accounts/10205943/events/3429501"
link="$( curl "https://livestream.com/accounts/10205943/events/3429501"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Rede Super Belo Horizonte BR" ;;
# 705)  SescTV Sao Paulo Brasil
705)
#link="https://livestream.com/accounts/16991778/NoAr"
link="$( curl "https://livestream.com/accounts/16991778/NoAr"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="SescTV Sao Paulo Brasil" ;;


################## PARAGUAY #####################################
# 706) ABC TV Paraguay
706)
keyword="ABC"
link=http://www.ustream.tv/channel/21235831
method="livestreamer"
format="best"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/canalabctv/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="ABC TV Paraguay" ;;
################# BOLIVIA #####################################
# 707) Abya Yala Bolivia  ****
707)
keyword="Abya Yala"
link=https://www.ustream.tv/channel/23484517
method="livestreamer"
format="best"
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCYVYGzj8t64hFAz2T-udG5Q/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 |cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Abya Yala Bolivia" ;;
# 708) UFRO Vision Chile *****
708)
keyword="UFRO"
linkl=https://mdstrm.com/share/live/580a80b827de0ae2086ea6d8
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UC5H9zdp-3M24xWWJunhLJmQ/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="UFRO Vision Chile" ;;
#709) CAMPO ABIERTO Santiago Chile
709)
keyword="TRANSMISIÓN CAMPO ABIERTO TV"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCwcZwWgpdrF-JsOkquSD59w/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="CAMPO ABIERTO Santiago Chile" ;;
# 710) UNITV Universidad Nacional de General Sarmiento AR
710)
keyword="Vivo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCWCJwDsCdRn_pwHNpLwEJcw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="UNITV Universidad Nacional de General Sarmiento AR" ;;

# 711) TelePacifico Colombia  ****
711)
keyword="Vivo"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCpywwd47pfQSwBO8pXZwXrw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="TelePacifico Colombia" ;;

########################################

# 717) BBC News London
717)
keyword=":"
if [ "$getlink" = 1 ]
then
#link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/bbcnews/videos?view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d = -f 11 | cut -d \" -f 1)"
link=https://www.filmon.com/tv/bbc-news
#link="https://1636691764.rsc.cdn77.org/LS-ATL-54548-11/tracks-v1a1/mono.m3u8"
#EXTINF:-1 tvg-logo="https://www.digitaltveurope.com/files/2011/12/BBC-World-News1.jpg" group-title="24/7 WORLD NEWS",BBC World News (Opt-1) (GB)
#link="http://ott-cdn.ucom.am/s24/index.m3u8"
#EXTIF:-1 tvg-logo="https://www.digitaltveurope.com/files/2011/12/BBC-World-News1.jpg" group-title="24/7 WORLD NEWS",BBC World News (Opt-2) (GB)
#link="https://1636691764.rsc.cdn77.org/LS-ATL-54548-11/tracks-v1a1/mono.m3u8"
#EXTINF:-1 tvg-logo="https://www.digitaltveurope.com/files/2011/12/BBC-World-News1.jpg" group-title="24/7 WORLD NEWS",BBC World News (Opt-3) (GB)
#link="http://92.43.140.249/s24/04.m3u8"
#link="http://a.files.bbci.co.uk/media/live/manifesto/audio_video/simulcast/hls/uk/abr_hdtv/ak/bbc_news24.m3u8"
fi

TAG=" BBCNEWS____"
use_cookies="no"
#method="Tor"
chan_name="BBC News London" ;;
############################## Made in ###########################################
# 718) Made in Leeds
718)
if [ "$getlink" = 1 ]
then
link=https://www.dailymotion.com/video/x5eva58
use_cookies="no"
format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
fi
##method="Tor"
TAG="MADEIN_LEEDS"
chan_name="Made in Leeds" ;;
# 719) Made in Tyne & Wear
719)

if [ "$getlink" = 1 ]
then
link=https://www.dailymotion.com/video/x5eva8m
use_cookies="no"
format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
fi
###method="Tor"
TAG="MADEIN_TYNE__"
chan_name="Made in Tyne & Wear" ;;
# 720) Made in Cardiff
720)

if [ "$getlink" = 1 ]
then
link=https://www.dailymotion.com/video/x5ev9xg
use_cookies="no"
format=hls-720
#format=hls-480
#format=hls-380
#format=hls-240
fi
###method="Tor"
TAG="MADEIN_CARDIFF"
chan_name="Made in Cardiff" ;;
#####################################



#######################################################################################################


##################################################################################

#################################   COLUMN 4 ############################################
# 721) FOX News Channel Preview (No Audio)
721)
link="https://fnurtmp-f.akamaihd.net/i/FNCPREV_1@143121/master.m3u8"
use_cookies="no"
chan_name="FOX News Channel Preview Preview (No Audio)" ;;
# 722) Beach TV DTVHD
722)
#link=http://media4.tripsmarter.com:1935/LiveTV/DTVHD/playlist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3472194,CODECS="avc1.100.40,mp4a.40.2",RESOLUTION=1280x720
link="http://media4.tripsmarter.com:1935/LiveTV/DTVHD/chunklist_w1668636762.m3u8"
use_cookies="no"
chan_name="Beach TV -DTVHD" ;;
# 723) Daytona Beach TV
723)
#link=http://oflash.dfw.swagit.com/live/daytonabeachfl/smil:std-4x3-1-a/chucklist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=512000,RESOLUTION=480x360
link="http://oflash.dfw.swagit.com/live/daytonabeachfl/smil:std-4x3-1-a/chunklist_w645874079_b512000.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=312000,RESOLUTION=320x240
#link="http://oflash.dfw.swagit.com/live/daytonabeachfl/smil:std-4x3-1-a/chunklist_w645874079_b312000.m3u8"
use_cookies="no"
chan_name="Daytona Beach TV" ;;
# 724) Shepard Smith Breaking News
724)
link=http://fnurtmp-f.akamaihd.net/i/SHEPSMITH_1@459383/master.m3u8
use_cookies="no"
chan_name="Shepard Smith Breaking News" ;;
# 725) WUSA9 Breaking News
725)
link=https://wusa-lh.akamaihd.net/i/WUSA_Breaking_1@98930/master.m3u8
use_cookies="no"
chan_name="WUSA9 Breaking News" ;;
# 726) WCNC Breaking News audio
726)
link=http://wcnc-lh.akamaihd.net/i/WCNC_Breaking_1@195112/master.m3u8
use_cookies="no"
chan_name="WCNC Breaking News audio" ;;
# 727) WCCB News Rising
727)
link=https://api.new.livestream.com/accounts/8522553/events/live/live.m3u8
use_cookies="no"
chan_name="WCCB News Rising" ;;
# 728) UGA TV
728)
link=http://mmuga-lh.akamaihd.net/i/ctlcable_1@349875/master.m3u8
use_cookies="no"
chan_name="UGA TV" ;;
# 729) TVW2 Washington State TV
729)
link=http://d3ktuc8v2sjk6m.cloudfront.net/livetv/ngrp:TVW2_all/master.m3u8
use_cookies="no"
chan_name="TVW2 Washington State TV" ;;
# 730) Action News Now (KNVN)
730)
link=https://api.new.livestream.com/accounts/26511688/events/7954874/live.m3u8
use_cookies="no"
chan_name="Action News Now (KNVN)" ;;
# 731) Anchorage Alaska ASD TV
731)
link=http://64.22.99.223/AnchorageSchoolsAKLIVE/_definst_/AnchorageSchoolsAKLIVE.stream/chunklist.m3u8
use_cookies="no"
chan_name="Anchorage Alaska ASD TV" ;;
# 732) Bowie TV
732)
link=http://granicusliveus3-a.akamaihd.net/cityofbowie/G0466_001/playlist.m3u8
use_cookies="no"
chan_name="Bowie TV" ;;
# 733) Escambia TV
733)
link=http://58bfeaf58405a.streamlock.net/live/escambiacountyfl/smil:std-4x3-1-a/playlist.m3u8
use_cookies="no"
chan_name="Escambia TV" ;;
# 734) Fox 5 Washington DC (WTTG-TV)
734)
link=https://api.new.livestream.com/accounts/2363281/events/1763520/live.m3u8
use_cookies="no"
chan_name="Fox 5 Washington DC (WTTG-TV)" ;;
# 735) Garland TV
735)
link=http://oflash-alt.dfw.swagit.com/live/garlandtx/smil:hd-16x9-1-a/chunklist.m3u8
use_cookies="no"
chan_name="Garland TV" ;;
# 736) Greenbelt TV
736)
link=http://granicusliveus4-a.akamaihd.net/greenbeltmd/G0610_001/chunklist.m3u8
use_cookies="no"
chan_name="Greenbelt TV" ;;
# 737) House of Representatives
737)
link=http://d3ktuc8v2sjk6m.cloudfront.net/livetv/ngrp:HouseChannel_all/chucklist.m3u8
use_cookies="no"
chan_name="House of Representatives" ;;
# 738) KRBC-TV
738)
link=http://krbc-apple-live.hls.adaptive.level3.net/stream0/master.m3u8
use_cookies="no"
chan_name="KRBC-TV" ;;
# 739)New Orleans TV2
739)
#link=http://media4.tripsmarter.com:1935/LiveTV/NOTVHD/playlist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3382572,CODECS="avc1.66.31,mp4a.40.2",RESOLUTION=1280x720
link="http://media4.tripsmarter.com:1935/LiveTV/NOTVHD/chunklist_w1797542626.m3u8"
use_cookies="no"
chan_name="New Orleans TV" ;;

# 740) KTVB
740)
link=http://ktvb-lh.akamaihd.net/i/KTVB_Shows_1@60359/master.m3u8
use_cookies="no"
chan_name="KTVB" ;;
# 741) Key TV Florida
741)
link=http://media4.tripsmarter.com:1935/LiveTV/KTVHD/chunklist_w363623166.m3u8
use_cookies="no"
chan_name="Key TV Florida" ;;
# 742) KOB4 News Albacurqe NM
742)
link=https://api.new.livestream.com/accounts/10066184/events/3399986/live.m3u8
use_cookies="no"
chan_name="KOB4 News Albacurqe NM" ;;
# 743) KPNX Breaking 1
743)
link=https://b_kpnx-f.akamaihd.net/i/KPNXBreaking_1@398330/master.m3u8
use_cookies="no"
chan_name="KPNX Breaking 1" ;;
# 744) KXAN News Austin TX NBC
744)
link=https://api.new.livestream.com/accounts/1506296/events/1569171/live.m3u8
use_cookies="no"
chan_name="KXAN News Austin TX NBC" ;;
# 745) Miami TV
745)
link=http://oflash.dfw.swagit.com/live/miamibeachfl/smil:std-16x9-1-a/chunklist_w1459206316_b878000.m3u8
use_cookies="no"
chan_name="Miami TV" ;;
# 746) NBC Bay Area (KNTV-TV)
746)
link=https://kntvlive-f.akamaihd.net/i/kntvb2_1@15530/master.m3u8
use_cookies="no"
chan_name="NBC Bay Area (KNTV-TV)" ;;
# 747) KNTV-TV NBC / Telemundo 48 Bay Area
747)
link=https://kntvlive-f.akamaihd.net/i/kntvb1_1@15530/master.m3u8
use_cookies="no"
chan_name="KNTV-TV NBC Telemundo 48 Bay Area" ;;
# 748) NBC2 News (KTUU-TV))
748)
link=httpx://api.new.livestream.com/accounts/7987479/events/2929660/live.m3u8
use_cookies="no"
chan_name="NBC2 News (KTUU-TV)" ;;
# 749) News2 (WCBD-TV)
749)
link=https://api.new.livestream.com/accounts/8360295/events/2976321/live.m3u8
use_cookies="no"
chan_name="News2 (WCBD-TV)" ;;
# 750) News4 (WRC-TV)
750)
link=https://wrclive-f.akamaihd.net/i/wrcb1_1@46880/master.m3u8
use_cookies="no"
chan_name="News4 (WRC-TV)" ;;
# 751)News4 White House Cam (WRC-TV)
751)
link=https://wrclive-f.akamaihd.net/i/wrcb2_1@46880/master.m3u8
use_cookies="no"
chan_name="News4 White House Cam (WRC-TV)" ;;
# 752)News5 WCYB
752)
link=https://api.new.livestream.com/accounts/8522497/events/3012727/live.m3u8
use_cookies="no"
chan_name="News5 WCYB" ;;
# 753)NewsWest 9 (KWES)
753)
link=https://api.new.livestream.com/accounts/16923548/events/4681078/live.m3u8
use_cookies="no"
chan_name="NewsWest 9 (KWES)" ;;
# 754)NBC4 New York News (WNBC-TV)
754)
link=https://wnbclive-f.akamaihd.net/i/wnbca1_1@13992/master.m3u8
use_cookies="no"
chan_name="NBC4 New York News (WNBC-TV)" ;;
# 755) NBC4 New York News (WNBC-TV) alt
755)
link=https://wnbclive-f.akamaihd.net/i/wnbca2_1@13992/master.m3u8
use_cookies="no"
chan_name="NBC4 New York News (WNBC-TV) alt" ;;
# 756) NBC5 News (WMAQ-TV)
756)
link=https://wmaqlive-f.akamaihd.net/i/wmaqa1_1@22923/master.m3u8
use_cookies="no"
chan_name="NBC5 News (WMAQ-TV)" ;;
# 757) NBC 10 News (KTEN-TV)
757)
link=https://kten-lh.akamaihd.net/i/KTEN_1079@5589/master.m3u8
use_cookies="no"
chan_name="NBC 10 News (KTEN-TV)" ;;
# 758) NBC 12 News (WWBT-TV)
758)
link=https://api.new.livestream.com/accounts/11203782/events/3629264/live.m3u8
use_cookies="no"
chan_name="NBC 12 News (WWBT-TV)" ;;
# 759) NBC 29 (WVIR-TV)
759)
link=http://wvir-lh.akamaihd.net/i/WVIR_736@78303/master.m3u8?forceCacheClearSM=530806100000
use_cookies="no"
chan_name="NBC 29 (WVIR-TV)" ;;
# 760) NBC News Channel 13 (WNYT-TV)
760)
link=https://api.new.livestream.com/accounts/12240447/events/3818578/live.m3u8
use_cookies="no"
chan_name="NBC News Channel 13 (WNYT-TV)" ;;
# 761) NewsChannel 12 KTVZ
761)
link=https://api.new.livestream.com/accounts/19128364/events/5285531/live.m3u8
use_cookies="no"
chan_name="NewsChannel 12 KTVZ" ;;
# 762) NewsWest 9 KWES Washington DC USA
762)
link=https://api.new.livestream.com/accounts/2363281/events/1763520/live.m3u8
use_cookies="no"
chan_name="NewsWest 9 KWES Washington DC USA" ;;
# 763) Orange TV  // works behind tor
763)
link=http://otv3.ocfl.net:1936/OrangeTV/smil:OrangeTV.smil/playlist.m3u8
use_cookies="no"
chan_name="Orange TV" ;;
# 764) PGCPS
764)
link=http://reflect.live.pgcps.cablecast.tv/live/WIFI-696k-360p/WIFI-696k-360p.m3u8
use_cookies="no"
chan_name="PGCPS" ;;
# 765) RyeTV
765)
link=http://oflash.dfw.swagit.com/live/ryeny/smil:std-4x3-1-a/playlist.m3u8
use_cookies="no"
chan_name="RyeTV" ;;
# 766) Seattle Channel
766)
link=https://wowzaprod121-i.akamaihd.net/hls/live/266526/d2ea1f60/playlist.m3u8
use_cookies="no"
chan_name="Seattle Channel" ;;
# 767) Atlanta Channel
767)
#link=http://media4.tripsmarter.com:1935/LiveTV/ACVBHD/playlist.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=3418933,CODECS="avc1.100.40,mp4a.40.2",RESOLUTION=1280x720
link="http://media4.tripsmarter.com:1935/LiveTV/ACVBHD/chunklist_w2098604614.m3u8"
use_cookies="no"
chan_name="Atlanta Channel" ;;
# 768)
# 769) Town of Vienna Community Network [HQ]
769)
link=https://granicusliveus2-a.akamaihd.net/vienna-va/G1359_003/playlist.m3u8
use_cookies="no"
fchan_name="Town of Vienna Community Network [HQ]" ;;
# 770) Escambia TV
770)
link=http://58bfeaf58405a.streamlock.net/live/escambiacountyfl/smil:std-4x3-1-a/playlist.m3u8
use_cookies="no"
chan_name="Escambia TV" ;;
# 771)
# 772) WYCW Carolinas
772)
#link="https://livestream.com/accounts/8366412/live"
link="$( curl "https://livestream.com/accounts/8366412/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WYCW Carolinas" ;;
# 773) FOX 10 News
773)
#link="https://livestream.com/accounts/1859803/live"
link="$( curl "https://livestream.com/accounts/1859803/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="FOX 10 News" ;;
# 774) WHO HD 13
774)
link="https://api.new.livestream.com/accounts/9976600/events/3382760/live.m3u8"
use_cookies="no"
chan_name="WHO HD 13" ;;
# 775) Erie News Now (WICU-TV)
775)
link="http://wicu-lh.akamaihd.net/i/WICU_1356@78350/master.m3u8"
use_cookies="no"
chan_name="Erie News Now (WICU-TV)" ;;
# 776) WISTV
776)
link="http://wistv-lh.akamaihd.net/i/WISTV_822@68771/master.m3u8"
use_cookies="no"
chan_name="WISTV" ;;
# 777) Gem Shopping Network USA
777)
#link="https://livestream.com/accounts/3486453/events/7709515"
link="$( curl "https://livestream.com/accounts/3486453/events/7709515"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Gem Shopping Network USA" ;;


########################## AMERICAN GOVERNMENT ####################################################
# 778) C-SPAN 1 HD
778)
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_1000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
####link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_600_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_600_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_1000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_1000_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan1-lh.akamaihd.net/i/cspan1_1@304727/index_200_a-b.m3u8?sd=10&rebase=on"

######################################
#link=http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/master.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan1nontve-lh.akamaihd.net/i/CSpan1NonTVE_1@312667/index_200_a-b.m3u8?sd=10&rebase=on"
##method="Tor"
use_cookies="no"
chan_name="C-SPAN 1" ;;
##########################
# 779) C-SPAN 2 HD
779)
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_1000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#####link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_600_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_600_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_1000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_1000_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan2-lh.akamaihd.net/i/cspan2_1@304728/index_200_a-b.m3u8?sd=10&rebase=on"

#######################################################
#link=http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/master.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan2nontve-lh.akamaihd.net/i/CSpan2NonTVE_1@312669/index_200_a-b.m3u8?sd=10&rebase=on"

####method="Tor"
use_cookies="no"
chan_name="C-SPAN 2 HD" ;;
# 780) C-SPAN 3 HD
780)

#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_1000_av-p.m3u8?sd=10&rebase=on"

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#####link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_600_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=664000,RESOLUTION=960x540,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_600_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_1000_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1064000,RESOLUTION=1024x576,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_1000_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan3-lh.akamaihd.net/i/cspan3_1@304729/index_200_a-b.m3u8?sd=10&rebase=on"
########################################################
#link=http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/master.m3u8

#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=264000,RESOLUTION=480x270,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_400_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=464000,RESOLUTION=640x360,CODECS="avc1.77.30, mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_400_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_200_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="http://cspan3nontve-lh.akamaihd.net/i/CSpan3NonTVE_1@312670/index_200_a-b.m3u8?sd=10&rebase=on"

####method="Tor"
use_cookies="no"
chan_name="C-SPAN 3 HD" ;;


######################## FOX NEWS USA ########################################################

# 781) Fox News Talk
781)

if [ "$getlink" = 1 ]
then
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/master.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=476x268,CODECS="avc1.66.30, mp4a.40.2"
link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=364000,RESOLUTION=476x268,CODECS="avc1.66.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=728000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_600_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=728000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_600_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_1200_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1328000,RESOLUTION=768x432,CODECS="avc1.66.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_1200_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_2500_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2628000,RESOLUTION=1280x720,CODECS="avc1.77.30, mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_2500_av-b.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_a-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=64000,CODECS="mp4a.40.2"
#link="https://fnurtmp-f.akamaihd.net/i/FNRADIO_1@92141/index_300_a-b.m3u8?sd=10&rebase=on"

fi
## method="Tor"
use_cookies="no"
TAG="FOX_TALK_"
chan_name="Fox News Talk" ;;

# 782) KNBC 4 News (Los Angeles)
782)
link=http://knbclive-f.akamaihd.net/i/knbca1_1@13988/index_1286_av-p.m3u8
use_cookies="no"
chan_name="KNBC 4 News Los Angeles" ;;
###########################################################
# 784) ABC News USA  1
784)
link="https://abclive1-lh.akamaihd.net/i/abc_live01@423395/index_4000_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 1" ;;
# 785)ABC News USA 2
785)
link="https://abclive1-lh.akamaihd.net/i/abc_live02@423396/index_4000_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 2" ;;
# 786)ABC News USA 3
786)
link="https://abclive1-lh.akamaihd.net/i/abc_live03@423397/index_4000_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 3" ;;
# 787)ABC News USA 4
787)
link="https://abclive1-lh.akamaihd.net/i/abc_live04@423398/index_4000_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 4" ;;
# 788)ABC News USA 5
788)
link="https://abclive1-lh.akamaihd.net/i/abc_live05@423399/index_2500_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 5" ;;
# 789)ABC News USA 6
789)
link="https://abclive1-lh.akamaihd.net/i/abc_live06@423400/index_2500_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 6" ;;
# 790)ABC News USA 7
790)
link="https://abclive1-lh.akamaihd.net/i/abc_live07@423401/index_4000_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 7" ;;
# 791)ABC News USA 8
791)
link="https://abclive1-lh.akamaihd.net/i/abc_live08@423402/index_1200_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 8" ;;
# 792)ABC News USA 9
792)
link="https://abclive1-lh.akamaihd.net/i/abc_live09@423403/index_1200_av-p.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="ABC Live Stream 9" ;;
# 793) ABC News USA 10
793)
if [ "$getlink" = 1 ]
then
link="https://abclive1-lh.akamaihd.net/i/abc_live10@420897/index_4000_av-p.m3u8?sd=10&rebase=on"
fi
TAG="ABC_NEWS_10"
use_cookies="no"
chan_name="ABC News USA Stream 10" ;;
# 794)ABC News USA 11
794)
if [ "$getlink" = 1 ]
then
#https://abcnews.go.com/Live
#https://abcnews.go.com/live/video/special-live-11
link="https://abclive2-lh.akamaihd.net/i/abc_live11@423404/master.m3u8"
#link="https://content-ause5.uplynk.com/channel/3324f2467c414329b3b0cc5cd987b6be/g.m3u8?v=1&pbs=962b38e9054e487aa50a6e07bfb15c14"
fi
#method="Tor"
use_cookies="no"
TAG="ABC_NEWS_USA"
chan_name="ABC News USA" ;;


################################################ Live Stream #########################################################
# 801)
# 802)
# 803) Dashmesh Culture Centre- Daily Broadcast Sikh Calgary Alberta Canada
803)
#link="https://livestream.com/accounts/472363/events/3109892"
link="$( curl "https://livestream.com/accounts/472363/events/3109892"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Dashmesh Culture Centre- Daily Broadcast Sikh Calgary Alberta Canada" ;;
################## GEORGIAN ##############################################
# 804) Iberia TV Live Georgia
804)
#link="https://livestream.com/accounts/19735751/events/7830877"
link="$( curl "https://livestream.com/accounts/19735751/events/7830877"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Iberia TV Georgia" ;;
# 805) Obieqtivi TV Georgia
805)
#link="https://livestream.com/accounts/2064453/events/1886556"
link="$( curl "https://livestream.com/accounts/2064453/events/1886556"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Obieqtivi TV Georgia" ;;
##################### ENGLISH ###########################
# 806) ortonvilletelevision
806)
#link="https://livestream.com/accounts/17285258/events/7143508"
link="$( curl "https://livestream.com/accounts/17285258/events/7143508"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="ortonvilletelevision" ;;
# 807) Holiday & Cruise TV
807)
#link="https://livestream.com/accounts/22779659/events/6788901"
link="$( curl "https://livestream.com/accounts/22779659/events/6788901"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Holiday & Cruise TV" ;;
# 808) Vision Cruise AU
808)
#link="https://livestream.com/accounts/22779659/events/8027429"
link="$( curl "https://livestream.com/accounts/22779659/events/8027429"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Vision Cruise AU" ;;
# 809) Vision Cruise UK
809)
#link="https://livestream.com/accounts/22779659/events/8027222"
link="$( curl "https://livestream.com/accounts/22779659/events/8027222"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Vision Cruise UK" ;;
# 810) 102.3 NOW! TV Edmonton AB,CA
810)
#link="https://livestream.com/accounts/4683311/events/3747538"
link="$( curl "https://livestream.com/accounts/4683311/events/3747538"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="102.3 NOW! TV Edmonton AB,CA" ;;
# 811)TourbusTV USA
811)
#link="https://livestream.com/accounts/22843174/TourbusTV"
link="$( curl "https://livestream.com/accounts/22843174/TourbusTV"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TourbusTV USA" ;;
# 812)Ezekiel TV Channel
812)
#link="https://livestream.com/accounts/19491040/events/6866917"
link="$( curl "https://livestream.com/accounts/19491040/events/6866917"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Ezekiel TV" ;;
# 813) Emmanuel TV
813)
#link="https://livestream.com/accounts/23202872/events/7200883"
link="$( curl "https://livestream.com/accounts/23202872/events/7200883"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Emmanuel TV" ;;
# 814) Shalom World Australia
814)
#link="https://livestream.com/accounts/25038049/events/7551704"
link="$( curl "https://livestream.com/accounts/25038049/events/7551704"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Shalom World Australia" ;;

########################################## USA LOCAL NEWS ####################################################################3

############################################### NORTH WEST  ###############################################################################

##################Idaho##################
# 815) KIFI ABC 8 Idaho Falls Idaho
815)
#link="https://livestream.com/accounts/18796284/Live"
link="$( curl "https://livestream.com/accounts/18796284/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KIFI ABC 8 Idaho Falls Idaho " ;;
#################Washington##############
# 816) 710 ESPN Seattle Washington
816)
#link="https://livestream.com/accounts/21148436/live"
link="$( curl "https://livestream.com/accounts/21148436/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="710 ESPN Seattle Washington" ;;
# 817) King County TV Preston, Washington USA
817)
#link="https://livestream.com/accounts/15175343/events/4485487"
link="$( curl "https://livestream.com/accounts/15175343/events/4485487"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name=" King County TV Preston, Washington USA " ;;
# 818) KIRO Radio Seattle Washington
818)
#link="https://livestream.com/accounts/21148570/live"
link="$( curl "https://livestream.com/accounts/21148570/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KIRO Radio Seattle Washington" ;;
##################Oregon##################
# 819)  KOIN CBS 6 Portland Oregon USA
819)
#link="https://livestream.com/accounts/1864610/live"
link="$( curl "https://livestream.com/accounts/1864610/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KOIN CBS 6 Portland Oregon USA" ;;
# 820)KPTV FOX 12 Portland Oregon
820)
#link="https://livestream.com/accounts/6908462/Live"
link="$( curl "https://livestream.com/accounts/6908462/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KPTV FOX 12 Portland Oregon" ;;
# 821) KTVZ 21 Bend Oregon
821)
#link="https://livestream.com/accounts/19128364/Live"
link="$( curl "https://livestream.com/accounts/19128364/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KTVZ 21 Bend Oregon" ;;
# 822) KEZI ABC 9 Eugene, Oregon
822)
#link="https://livestream.com/accounts/26511759/live"
link="$( curl "https://livestream.com/accounts/26511759/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KEZI ABC 9 Eugene, Oregon" ;;
# 823) KOIN 6 Extras Portland Oregon
823)
#link="https://livestream.com/accounts/1864610/events/3314050"
link="$( curl "https://livestream.com/accounts/1864610/events/3314050"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KOIN 6 Extras Portland Oregon" ;;

###################Utah####################
# 824) KSL NOW Salt Lake City Utah USA
824)
#link="https://livestream.com/accounts/22711876/live"
link="$( curl "https://livestream.com/accounts/22711876/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSL NOW Salt Lake City Utah USA " ;;

#################Wyoming#################

#################Montana#################

################################################################################## SOUTH WEST #########################

###################California#################
# 825)  KUSI NEWS 24/7 San Diego California USA
825)
#link="https://livestream.com/accounts/25082096/live"
link="$( curl "https://livestream.com/accounts/25082096/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KUSI NEWS 24/7 San Diego California USA" ;;
# 826) KEYT ABC 3 Santa Barbara CA USA
826)
#link="https://livestream.com/accounts/19285506/live"
link="$( curl "https://livestream.com/accounts/19285506/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KEYT ABC 3 Santa Barbara CA USA" ;;
# 827) KHSL Action News NOW  CBS 12  Chico/Redding. California USA
827)
#link="https://livestream.com/accounts/26511688/live"
link="$( curl "https://livestream.com/accounts/26511688/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KHSL Action News NOW Chico/Redding California  USA" ;;
# 828) KRCR ABC 7 Redding California USA
828)
#link="https://livestream.com/accounts/10262876/events/3724366"
link="$( curl "https://livestream.com/accounts/10262876/events/3724366"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KRCR ABC 7 Redding California USA" ;;
# 829) KION CBS 5/46 Salinas California USA
829)
#link="https://livestream.com/accounts/19128738/events/7300156"
link="$( curl "https://livestream.com/accounts/19128738/events/7300156"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KION CBS 5/46 Salinas California USA" ;;
# 830) KSBY NBC 6 Santa Barbara California
830)
#link="https://livestream.com/accounts/15512095/live"
link="$( curl "https://livestream.com/accounts/15512095/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSBY NBC 6 Santa Barbara California" ;;
# 831) KESQ ABC 3 FOX 11 Palm Springs, California
831)
#link="https://livestream.com/accounts/20847880/live"
link="$( curl "https://livestream.com/accounts/20847880/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KESQ ABC 3 FOX 11 Palm Springs, California" ;;
# 832) KCOY CBS 12 Santa Maria California USA
832)
#link="https://livestream.com/accounts/19128628/live"
link="$( curl "https://livestream.com/accounts/19128628/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KCOY CBS 12 Santa Maria California USA" ;;
# 833) MCAET Salinas California
833)
#link="https://livestream.com/accounts/7781243/events/7871771"
link="$( curl "https://livestream.com/accounts/7781243/events/7871771"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="MCAET Salinas California" ;;
# 834) KVVB.TV CH.33 Victorville,California KVVB.TV | Ch 33.1
834)
#link="https://livestream.com/accounts/9450048/events/3542162"
link="$( curl "https://livestream.com/accounts/9450048/events/3542162"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVVB.TV CH.33 Victorville,CA" ;;
####################Colorado#################
# 835) KOAA NBC 5 Colorado Springs Colorado, USA
835)
#link="https://livestream.com/accounts/13725886/live"
link="$( curl "https://livestream.com/accounts/13725886/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KOAA NBC 5 Colorado Springs Colorado, USA" ;;
# 836) KRDO ABC 13 Colorado Springs Colorado
836)
#link="https://livestream.com/accounts/17592934/live"
link="$( curl "https://livestream.com/accounts/17592934/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KRDO ABC 13 Colorado Springs Colorado" ;;
# 837) GalaxyUniverseTV Freedom Solar TV Kersey, CO, USA
837)
#link="https://livestream.com/accounts/12141749/events/7685294"
link="$( curl "https://livestream.com/accounts/12141749/events/7685294" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Freedom Solar TV Kersey, CO, USA" ;;

####################Arizona#################
# 838) KTVK 3 TV Arizona USA
838)
#link="https://livestream.com/accounts/12643960/live"
link="$( curl "https://livestream.com/accounts/12643960/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KTVK 3 TV Arizona USA" ;;
# 839) KMVP 24/7 Phoenix Arizona Sports 98.7 FM
839)
#link="https://livestream.com/accounts/24089066/live"
link="$( curl "https://livestream.com/accounts/24089066/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KMVP 24/7 Phoenix Arizona Sports 98.7 FM " ;;
# 840) KTAR News Phoenix Arizona
840)
#link="https://livestream.com/accounts/24088937/live"
link="$( curl "https://livestream.com/accounts/24088937/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KTAR News Phoenix Arizona " ;;
# 841) KOLD 13 Tucson, Arizona
841)
#link="https://livestream.com/accounts/11042990/live"
link="$( curl "https://livestream.com/accounts/11042990/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KOLD 13 Tucson, Arizona" ;;
# 842) KPHO CBS 5 Pheonix Arizona
842)
#link="https://livestream.com/accounts/6907826/LIVE"
link="$( curl "https://livestream.com/accounts/6907826/LIVE"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KPHO CBS 5 Pheonix Arizona " ;;
# 843) KVOA NBC 4 Tuscon Arizona
843)
#link="https://livestream.com/accounts/15512011/live"
link="$( curl "https://livestream.com/accounts/15512011/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVOA NBC 4 Tuscon Arizona" ;;
# 844) KYMA NBC 11 Yuma Arizona
844)
#link="https://livestream.com/accounts/20242841/live"
link="$( curl "https://livestream.com/accounts/20242841/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KYMA NBC 11 Yuma Arizona" ;;

####################Nevada###################
# 845) NewsChannel5+ Las Vegas, Nevada
845)
#link="https://livestream.com/accounts/3827561/live"
link="$( curl "https://livestream.com/accounts/3827561/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="NewsChannel5+ Las Vegas, Nevada" ;;
# 846) VSiN - Vegas Stats & Information Network Las Vegas Nevada
846)
#link="https://livestream.com/accounts/22774234/events/6897936"
link="$( curl "https://livestream.com/accounts/22774234/events/6897936"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="VSiN - Vegas Stats & Information Network Las Vegas Nevada " ;;
# 847) City of Las Vegas KCLV FOX 2 Nevada
847)
#link="https://livestream.com/accounts/11449855/events/8026296"
link="$( curl "https://livestream.com/accounts/11449855/events/8026296"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="City of Las Vegas KCLV FOX 2 Nevada" ;;
# 848)KVVU FOX 5 Las Vegas Nevada
848)
#link="https://livestream.com/accounts/6910894/Live"
link="$( curl "https://livestream.com/accounts/6910894/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVVU FOX 5 Las Vegas Nevada " ;;
####################New Mexico###############
# 849)Native Media Network NMN Native Media Network Sante Fe New Mexico USA NDN1.com
849)
#link="https://livestream.com/accounts/13196214/events/3994033"
link="$( curl "https://livestream.com/accounts/13196214/events/3994033"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Native Media Network, Santa Fe New Mexico USA" ;;
# 850) Santa Fe Media Network New Mexico USA
850)
#link="https://livestream.com/accounts/13196214/events/5972197"
link="$( curl "https://livestream.com/accounts/13196214/events/5972197"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Santa Fe Media Network New Mexico USA" ;;

#################################################################################### NORTH EAST #########################

##################Connecticut####################
# 851)WTNH 8 New Haven CT
851)
#link="https://livestream.com/accounts/1864656/live"
link="$( curl "https://livestream.com/accounts/1864656/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTNH 8 New Haven CT" ;;
# 852) WFSB 3 Hartford Connecticut USA
852)
#link="https://livestream.com/accounts/6372985/live"
link="$( curl "https://livestream.com/accounts/6372985/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFSB 3 Hartford Connecticut USA" ;;
##################Delaware#######################

###################Maine#########################

####################Maryland#####################

# 853) CharmTV Baltimore Maryland
853)
#link="https://livestream.com/accounts/13988426/events/4134572"
link="$( curl "https://livestream.com/accounts/13988426/events/4134572"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="CharmTV Baltimore Maryland" ;;
################# Washington DC ####################
# 854) WTTG Fox 5 Washington DC USA
854)
#link="https://livestream.com/accounts/2363281/live"
link="$( curl "https://livestream.com/accounts/2363281/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTTG Fox 5 Washington DC USA" ;;

####################Massachusetts################
# 855) WWLP 22 Springfield Massachusetts
855)
#link="https://livestream.com/accounts/1866220/live"
link="$( curl "https://livestream.com/accounts/1866220/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WWLP 22 Springfield Massachusetts" ;;
# 856) Western Mass News Chicopee Massachusetts
856)
#link="https://livestream.com/accounts/6140816/live"
link="$( curl "https://livestream.com/accounts/6140816/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Western Mass News Chicopee Massachusetts" ;;
# 857) Milford TV - Milford, MA Massachusetts
857)
#link="https://livestream.com/accounts/13918823/MilfordTV"
link="$( curl "https://livestream.com/accounts/13918823/MilfordTV"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Milford TV - Milford, MA Massachusetts" ;;
# 858) Milford TV Educational Channel - Milford, MA
858)
#link="https://livestream.com/accounts/13568947/MilfordTVEducational"
link="$( curl "https://livestream.com/accounts/13568947/MilfordTVEducational"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Milford TV Educational Channel - Milford, MA" ;;
####################New Jersey###################
# 859) WWOR Secaucus New Jersey
859)
#link="https://livestream.com/accounts/6372957/live"
link="$( curl "https://livestream.com/accounts/6372957/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WWOR Secaucus New Jersey " ;;

#####################New York####################
# 860)  WNYW Fox 5 New York USA
860)
#link="https://livestream.com/accounts/6372917/live"
link="$( curl "https://livestream.com/accounts/6372917/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WNYW Fox 5 New York USA" ;;
# 861) WROC CBS 8 Rochester NY USA
861)
#link="https://livestream.com/accounts/21078314/live"
link="$( curl "https://livestream.com/accounts/21078314/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WROC CBS 8 Rochester NY USA" ;;
# 862) Cumulus NYC 77 WABC New York USA
862)
#link="https://livestream.com/cumulusnyc/live"
link="$( curl"https://livestream.com/cumulusnyc/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Cumulus NYC 77 WABC New York USA" ;;
# 863) WJHL CBS 11 Johnson City, New York
863)
#link="https://livestream.com/accounts/7264167/live"
link="$( curl "https://livestream.com/accounts/7264167/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WJHL CBS 11 Johnson City, New York" ;;
# 864) DayTraderRockStar Show New York City New York
864)
#link="https://livestream.com/accounts/4878/events/2540723"
link="$( curl "https://livestream.com/accounts/4878/events/2540723"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="DayTraderRockStar Show New York City" ;;

#865

# 866) Manhattan Neighborhood Network MNN-FSTV
866)
channelURL="https://player-api.new.livestream.com/accounts/17251237/events/6391580/"
liveStreamGrab
use_cookies="no"
chan_name="Manhattan Neighborhood Network MNN-FSTV" ;;

#######################Ohio######################
# 867)  Fox 8 Cleveland Ohio USA
867)
#link="https://livestream.com/accounts/57501/live"
link="$( curl "https://livestream.com/accounts/57501/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Fox 8 Cleveland Ohio USA" ;;
# 868) WIVM TV39 WIVM Local TV Canton Ohio
868)
#link="https://livestream.com/accounts/17488475/events/4802826"
link="$( curl "https://livestream.com/accounts/17488475/events/4802826"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WIVM TV39 WIVM Local TV Canton Ohio" ;;
# 869) WBNS 10 Columbus Ohio
869)
#link="https://livestream.com/accounts/18624165/live"
link="$( curl "https://livestream.com/accounts/18624165/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBNS 10 Columbus Ohio" ;;
# 870) WNYT NBC 13 Upper Sandusky, Ohio
870)
#link="https://livestream.com/accounts/12240447/live"
link="$( curl "https://livestream.com/accounts/12240447/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WNYT NBC 13 Upper Sandusky, Ohio" ;;
# 871) WBNS 10 Breaking News Radar Columbus, Ohio
871)
#link="https://livestream.com/accounts/26237278/events/8075621"
link="$( curl "https://livestream.com/accounts/26237278/events/8075621"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBNS 10 Breaking News Radar Columbus, Ohio " ;;
# 872) WBNS 10 Breaking News Columbus, Ohio
872)
#link="https://livestream.com/WBNSbreakingnews/live"
link="$( curl "https://livestream.com/WBNSbreakingnews/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBNS 10 Breaking News Columbus, Ohio " ;;
# 873) WOIO CBS 19 Clevland Ohio
873)
#link="https://livestream.com/accounts/11017897/live"
link="$( curl "https://livestream.com/accounts/11017897/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WOIO CBS 19 Clevland Ohio" ;;
# 874) WTOL CBS 11 Toledo Ohio
874)
#link="https://livestream.com/accounts/12003465/live"
link="$( curl "https://livestream.com/accounts/12003465/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTOL CBS 11 Toledo Ohio" ;;
# 875) WCMH NBC 4 Columbus Ohio
875)
#link="https://livestream.com/accounts/7338206/live"
link="$( curl "https://livestream.com/accounts/7338206/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WCMH NBC 4 Columbus Ohio" ;;

####################Pennsylvania#################
# 876) WTXF FOX 29 News Philadelphia, Pennsylvania USA
876)
#link="https://livestream.com/accounts/6370754/live"
link="$( curl "https://livestream.com/accounts/6370754/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTXF FOX 29 News Philadelphia, Pennsylvania USA" ;;
# 877)WBRE NBC Wilkes Barre Pennslyvannia USA
877)
#link="https://livestream.com/accounts/21077947/live"
link="$( curl "https://livestream.com/accounts/21077947/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBRE NBC Wilkes Barre Pennslyvannia USA" ;;
# 878) WPHL TV ABC 6 Philladelphia Pennsylvania
878)
#link="https://livestream.com/accounts/25565610/live"
link="$( curl "https://livestream.com/accounts/25565610/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WPHL TV ABC 6 Philladelphia, Pennsylvania" ;;
# 879) WFMZ 69 Traffic Allen Town Penslyvania
879)
#link="https://livestream.com/accounts/14384745/traffic"
link="$( curl "https://livestream.com/accounts/14384745/traffic" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFMZ 69 Traffic Allen Town Penslyvania " ;;
####################Rhode Island#################
# 880) WPRI Fox 12 Providence Rhode Island
880)
#link="https://livestream.com/accounts/1864876/live"
link="$( curl "https://livestream.com/accounts/1864876/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WPRI Fox 12 Providence Rhode Island" ;;

#####################Vermont#####################

#####################Virginia####################
# 881) WCYB NBC 5 Bristol Virginia VA
881)
#link="https://livestream.com/accounts/8522497/live"
link="$( curl "https://livestream.com/accounts/8522497/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WCYB NBC 5 Bristol Virginia VA" ;;
# 882) WRIC ABC 8 Petersburg, Virginia
882)
#link="https://livestream.com/accounts/7425298/live"
link="$( curl "https://livestream.com/accounts/7425298/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WRIC ABC 8 Petersburg, Virginia" ;;
# 883) WWBT NBC 12 Richmond Virginia
883)
#link="https://livestream.com/accounts/11203782/live"
link="$( curl "https://livestream.com/accounts/11203782/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WWBT NBC 12 Richmond Virginia" ;;
####################West Virginia################

###################New Hampshire#################
# 884) Brunswick TV3 New Hampshire
884)
#link="https://livestream.com/accounts/13788599/events/6330198"
link="$( curl "https://livestream.com/accounts/13788599/events/6330198"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Brunswick TV3 New Hampshire" ;;
# 885) LRPATV CH25 New Hampshire USA
885)
#link="https://livestream.com/accounts/3480937/channel25"
link="$( curl "https://livestream.com/accounts/3480937/channel25"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="LRPATV CH25 New Hampshire USA" ;;

####################Michigan#####################
# 886) WJBK FOX 2 Detroit Michigan USA
886)
#link="https://livestream.com/accounts/6396566/live"
link="$( curl "https://livestream.com/accounts/6396566/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WJBK FOX 2 Detroit Michigan USA" ;;
# 887) WWTV 9 & 10 News 24/7 Mt. Pleasent Michigan
887)
#link="https://livestream.com/accounts/25637691/live"
link="$( curl "https://livestream.com/accounts/25637691/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WWTV 9 & 10 News 24/7 Mt. Pleasent Michigan" ;;

#####################Indiana#####################
# 888)  WFIE NBC 14 Evansville Indiana USA
888)
#link="https://livestream.com/accounts/11981465/live"
link="$( curl "https://livestream.com/accounts/11981465/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFIE NBC 14 Evansville Indiana USA" ;;
# 889) WANE Ft. Wayne Indiana
889)
#link="https://livestream.com/accounts/1849716/live"
link="$( curl "https://livestream.com/accounts/1849716/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WANE Ft. Wayne Indiana" ;;
# 890) WFFT FOX 55 Indiana USA
890)
#link="https://livestream.com/accounts/26511747/live"
link="$( curl "https://livestream.com/accounts/26511747/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFFT FOX 55 Indiana USA" ;;
# 891) WTHI 10 Terre Haute Indiana
891)
#link="https://livestream.com/accounts/1866274/live"
link="$( curl "https://livestream.com/accounts/1866274/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTHI 10 Terre Haute Indiana" ;;
# 892) WISH 8 Indianapolis Indiana USA
892)
#link="https://livestream.com/accounts/1858612/live"
link="$( curl "https://livestream.com/accounts/1858612/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WISH 8 Indianapolis Indiana USA" ;;
####################Kentucky#####################
# 893) EKB- TV EKBTV Live Pikeville Kentucky
893)
#link="https://livestream.com/accounts/6461963/events/4113877"
link="$( curl "https://livestream.com/accounts/6461963/events/4113877"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="EKB- TV EKBTV Live Pikeville Kentucky" ;;
# 894) WTVQ ABC 36 Lexington Kentucky USA
894)
#link="https://livestream.com/accounts/19871819/live"
link="$( curl "https://livestream.com/accounts/19871819/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTVQ ABC 36 Lexington Kentucky USA" ;;
# 895) WPSD-TV Paducah Kentucky
895)
#link="https://livestream.com/accounts/21317942/live"
link="$( curl "https://livestream.com/accounts/21317942/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WPSD-TV Paducah Kentucky" ;;
# 896) Lex 18 Lexington Kentucky
896)
#link="https://livestream.com/accounts/1493287/live"
link="$( curl "https://livestream.com/accounts/1493287/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Lex 18 Lexington Kentucky" ;;
############################################################################  SOUTH EAST #########################

#####################Florida#####################
# 897) WFLA NBC 8 Tampa Bay Florida USA
897)
#link="https://livestream.com/accounts/6140981/live"
link="$( curl "https://livestream.com/accounts/6140981/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFLA NBC 8 Tampa Bay Florida USA" ;;
# 898)  WTVT / FOX 13 Tampa Bay, Florida USA
898)
#link="https://livestream.com/accounts/6180769/live"
link="$( curl "https://livestream.com/accounts/6180769/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTVT / FOX 13 Tampa Bay, Florida USA" ;;
# 899) Island TV Live Broadcast Miami FL USA
899)
#link="https://livestream.com/accounts/1420/Islandtvlive"
link="$( curl "https://livestream.com/accounts/1420/Islandtvlive"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Island TV Live Broadcast Miami FL USA" ;;
# 900) City of Tampa Television FL, USA
900)
#link="https://livestream.com/accounts/12251681/CTTV"
link="$( curl "https://livestream.com/accounts/12251681/CTTV"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="City of Tampa Television FL, USA" ;;
# 901) WFLX FOX 29 West Palm Beach, Florida,
901)
#link="https://livestream.com/accounts/12755354/live"
link="$( curl "https://livestream.com/accounts/12755354/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFLX FOX 29West Palm Beach, Florida, " ;;
# 902)  WYKE TV 47 Hormosassa Springs Florida
902)
#link="https://livestream.com/accounts/9261275/events/7602204"
link="$( curl "https://livestream.com/accounts/9261275/events/7602204"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WYKE TV 47 Hormosassa Springs Florida" ;;
#####################Georgia#####################
# 903) WJBF Augusta Georgia
903)
#link="https://livestream.com/accounts/7601347/live"
link="$( curl "https://livestream.com/accounts/7601347/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WJBF Augusta Georgia" ;;
# 904)WMGT 41 NBC Macon Georgia USA
904)
#link="https://livestream.com/accounts/15227391/live"
link="$( curl "https://livestream.com/accounts/15227391/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WMGT 41 NBC Macon Georgia USA" ;;
# 905) WSAV NBC 3 Savannah, Georgia
905)
#link="https://livestream.com/accounts/7682273/live"
link="$( curl "https://livestream.com/accounts/7682273/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WSAV NBC 3 Savannah, Georgia" ;;
# 906) WTOC 11 Savannah, Georgia
906)
#link="https://livestream.com/accounts/11006691/live"
link="$( curl "https://livestream.com/accounts/11006691/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTOC 11 Savannah, Georgia" ;;
# 907) WTVM ABC 9 Columbus Georgia
907)
#link="https://livestream.com/accounts/11379799/live"
link="$( curl "https://livestream.com/accounts/11379799/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WTVM ABC 9 Columbus Georgia " ;;
# 908) WRBL News 365 CBS 3 Columbus, GA.
908)
#link="https://livestream.com/accounts/7942874/live"
link="$( curl "https://livestream.com/accounts/7942874/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WRBL News 365 CBS 3 Columbus, GA" ;;
# 909) WGCL CBS46 Atlanta Georgia
909)
#link="https://livestream.com/accounts/6140931/live"
link="$( curl "https://livestream.com/accounts/6140931/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WGCL CBS46 Atlanta Georgia" ;;
# 910) WALB NBC 10 Albany Southwestern Georgia
910)
#link="https://livestream.com/accounts/11279058/live"
link="$( curl "https://livestream.com/accounts/11279058/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WALB NBC 10 Albany Southwestern Georgia" ;;
####################Mississippi##################
# 911) WDAM 7 Hattiesburg Mississippi USA
911)
#link="https://livestream.com/accounts/11595552/live"
link="$( curl "https://livestream.com/accounts/11595552/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WDAM 7 Hattiesburg Mississippi USA" ;;
# 912) WLOX ABC 13  Mississippi USA
912)
#link="https://livestream.com/accounts/11595500/live"
link="$( curl "https://livestream.com/accounts/11595500/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WLOX ABC 13  Mississippi USA" ;;
# 913) WJTV CBS 12 Jackson Mississippi
913)
#link="https://livestream.com/accounts/8374496/live"
link="$( curl "https://livestream.com/accounts/8374496/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WJTV CBS 12 Jackson Mississippi" ;;
# 914) WLBT FOX 40 Jackson Mississippi
914)
#link="https://livestream.com/accounts/11595602/live"
link="$( curl "https://livestream.com/accounts/11595602/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WLBT FOX 40 Jackson Mississippi" ;;
# 915) WHLT Hattiesburg, Mississippi USA
915)
#link="https://livestream.com/accounts/8383566/live"
link="$( curl "https://livestream.com/accounts/8383566/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WHLT Hattiesburg, Mississippi USA" ;;
####################Alabama######################
# 916)  WSFA 12 Montgomory Alabama USA
916)
#link="https://livestream.com/accounts/11981705/live"
link="$( curl "https://livestream.com/accounts/11981705/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WSFA 12 Montgomory Alabama USA" ;;
# 917)  WBRC FOX6 News Birmingham, Alabama USA
917)
#link="https://livestream.com/WBRC/live"
link="$( curl "https://livestream.com/WBRC/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBRC FOX6 News Birmingham, Alabama USA" ;;
# 918) WAKA CBS 8 ABC 32 Alabama
918)
#link="https://livestream.com/accounts/9486828/live"
link="$( curl "https://livestream.com/accounts/9486828/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WAKA CBS 8 ABC 32 Alabama " ;;
# 919) WAAY News ABC 31 Huntsville Alabama
919)
#link="https://livestream.com/accounts/26511741/live"
link="$( curl "https://livestream.com/accounts/26511741/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WAAY News ABC 31 Huntsville Alabama" ;;
# 920) CBS 42 Birmingham Alabama
920)
#link="https://livestream.com/accounts/1848160/live"
link="$( curl "https://livestream.com/accounts/1848160/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="CBS 42 Birmingham Alabama" ;;
# 921) WKRG CBS 5 Mobile, Alabama
921)
#link="https://livestream.com/accounts/7546695/live"
link="$( curl "https://livestream.com/accounts/7546695/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WKRG CBS 5 Mobile, Alabama" ;;
# 922) WALA FOX10 News 24/7 Mobile, Alabama
922)
#link="https://livestream.com/accounts/1859803/live"
link="$( curl "https://livestream.com/accounts/1859803/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WALA FOX10 News 24/7 Mobile, Alabama" ;;
# 923) WBRC FOX 6 Birmingham, Alabama
923)
#link="https://livestream.com/accounts/12446860/live"
link="$( curl "https://livestream.com/accounts/12446860/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBRC FOX 6 Birmingham, Alabama" ;;
# 924) OUBN - Oakwood University Huntsville Alabama
924)
#link="https://livestream.com/accounts/5329025/events/7079597"
link="$( curl "https://livestream.com/accounts/5329025/events/7079597"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="OUBN - Oakwood University Huntsville Alabama " ;;

#####################North Carolina##############
# 925) WJZY FOX 46 Charlotte NC
925)
#link="https://livestream.com/accounts/6370805/live"
link="$( curl "https://livestream.com/accounts/6370805/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WJZY FOX 46 Charlotte NC" ;;
# 926) WCCB Charlotte CW NC
926)
#link="https://livestream.com/accounts/8522553/live"
link="$( curl "https://livestream.com/accounts/8522553/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WCCB Charlotte CW NC" ;;
# 927) WYCW CW 62 Carolinas
927)
#link="https://livestream.com/accounts/8366412/live"
link="$( curl "https://livestream.com/accounts/8366412/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WYCW CW 62 Carolinas" ;;
# 928) WNCT CBS 9 Greenville NC
928)
#link="https://livestream.com/accounts/7601533/live"
link="$( curl "https://livestream.com/accounts/7601533/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WNCT CBS 9 Greenville NC" ;;
# 929) WCBD NBC 2 Charleston North Carolina
929)
#link="https://livestream.com/accounts/8360295/live"
link="$( curl "https://livestream.com/accounts/8360295/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WCBD NBC 2 Charleston NC" ;;
# 930) WWAY News ABC CBS CW 3 Cape Fear Willmington NC
930)
#link="https://livestream.com/accounts/26965546/live"
link="$( curl "https://livestream.com/accounts/26965546/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WWAY News ABC CBS CW 3 Cape Fear Willmington NC" ;;
# 931) WBTV CBS 3 Charlotte, North Carolina
931)
#link="https://livestream.com/accounts/10950088/live"
link="$( curl "https://livestream.com/accounts/10950088/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBTV CBS 3 Charlotte, North Carolina" ;;
# 932) CBS 17 Rahliegh NC
932)
#link="https://livestream.com/accounts/7158447/live"
link="$( curl "https://livestream.com/accounts/7158447/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="CBS 17 Rahliegh NC" ;;
######################South Carolina#############
# 933) WCSC CBS 5 Charleston South Carolina USA
933)
#link="https://livestream.com/accounts/11016888/live"
link="$( curl "https://livestream.com/accounts/11016888/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WCSC CBS 5 Charleston South Carolina USA" ;;
# 934) WSPA CBS 7 WSPA Spartanberg SC
934)
#link="https://livestream.com/accounts/7592531/live"
link="$( curl "https://livestream.com/accounts/7592531/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WSPA CBS 7 WSPA Spartanberg SC" ;;
# 935)WMBF Myrtle Beach, South Carolina
935)
#link="https://livestream.com/accounts/11214123/live"
link="$( curl "https://livestream.com/accounts/11214123/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WMBF Myrtle Beach, South Carolina" ;;
# 936) WIS NBC 10 Columbia South Carolina
936)
#link="https://livestream.com/accounts/11327981/live"
link="$( curl "https://livestream.com/accounts/11327981/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WIS NBC 10 Columbia South Carolina" ;;
####################Tennessee####################
# 937) WSMV NBC 4 Nashville Tennessee
937)
#link="https://livestream.com/accounts/6396556/LIVE"
link="$( curl "https://livestream.com/accounts/6396556/LIVE"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WSMV NBC 4 Nashville Tennessee" ;;
# 938)WBBJ ABC 7 West Tennesee
938)
#link="https://livestream.com/accounts/27132443/live"
link="$( curl "https://livestream.com/accounts/27132443/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WBBJ ABC 7 West Tennesee" ;;
# 939) WDEF News CBS 12 Now Chattanooga Tennessee
939)
#link="https://livestream.com/accounts/21596942/live"
link="$( curl "https://livestream.com/accounts/21596942/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WDEF News CBS 12 Now Chattanooga Tennesse " ;;
# 940) WMC NBC 5 Memphis Tennessee
940)
#link="https://livestream.com/accounts/10894063/live"
link="$( curl "https://livestream.com/accounts/10894063/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WMC NBC 5 Memphis Tennessee" ;;
# 941) Second Presbyterian Church Sunday Worship Memphis Tennessee
941)
#link="https://livestream.com/accounts/15713152/sunday-worship"
link="$( curl "https://livestream.com/accounts/15713152/sunday-worship"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Second Presbyterian Church Sunday Worship Memphis Tennessee" ;;
# 942) ETSU New Construction Camera ETSU Fine Arts Classroom Building Johnson City Tennesse
942)
#link="https://livestream.com/accounts/17402222/FineArts"
link="$( curl "https://livestream.com/accounts/17402222/FineArts"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="ETSU New Construction Camera ETSU Fine Arts Classroom Building Johnson City Tennesse" ;;
# 943) EPlusTV6 Jackson Tennessee
943)
#link="https://livestream.com/accounts/726212/events/4481510"
link="$( curl "https://livestream.com/accounts/726212/events/4481510"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="EPlusTV6 Jackson Tennessee" ;;
########################################################################### NORTH MIDDLE ########################

####################North Dakota##################
# 944) KELO Live Keloland (Dakota, Minisota, Iowa) USA
944)
#link="https://livestream.com/kelo/live"
link="$( curl "https://livestream.com/kelo/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KELO Live Keloland USA" ;;
# 945) KVRR Fargo North Dakota
945)
#link="https://livestream.com/accounts/21298478/live"
link="$( curl "https://livestream.com/accounts/21298478/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVRR Fargo North Dakota" ;;
#####################South Dakota##################
# 946) KDLT Sioux Falls South Dakota
946)
#link="https://livestream.com/accounts/21277277/live"
link="$( curl "https://livestream.com/accounts/21277277/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KDLT Sioux Falls South Dakota" ;;
# 947) GovTV Watertown, South Dakota
947)
#link="https://livestream.com/accounts/21042766/events/6254925"
link="$( curl "https://livestream.com/accounts/21042766/events/6254925"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="GovTV Watertown, South Dakota" ;;
# 948) KELO CBS Sioux Falls, South Dakota
948)
#link="https://livestream.com/accounts/8522446/live"
link="$( curl "https://livestream.com/accounts/8522446/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KELO CBS Sioux Falls, South Dakota" ;;
######################Iowa##########################
# 949) KIMT 3 Mason City, Iowa
949)
#link="https://livestream.com/accounts/1859647/live"
link="$( curl "https://livestream.com/accounts/1859647/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KIMT 3 Mason City, Iowa" ;;
####################Minnesota########################
# 950) WDIO ABC 10/13 Duluth Minnesota
950)
#link="https://livestream.com/accounts/12241516/live"
link="$( curl "https://livestream.com/accounts/12241516/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WDIO  ABC 10/13 Duluth Minnesota" ;;
# 951) KAAL ABC 6 Rochester Minnesota
951)
#link="https://livestream.com/accounts/12240964/live"
link="$( curl "https://livestream.com/accounts/12240964/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KAAL ABC 6 Rochester Minnesota" ;;
# 952) KQDS - FOX 21 Duluth Minnesota USA
952)
#link="https://livestream.com/accounts/21146230/live"
link="$( curl"https://livestream.com/accounts/21146230/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KQDS - FOX 21 Duluth Minnesota USA " ;;
# 953) KSTP ABC 5 St. Paul, Minnesota
953)
#link="https://livestream.com/accounts/12150160/live"
link="$( curl "https://livestream.com/accounts/12150160/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSTP ABC 5 St. Paul, Minnesota" ;;
# 954) KMSP FOX 9 Minneapolis Minnesota
954)
#link="https://livestream.com/accounts/6396280/live"
link="$( curl "https://livestream.com/accounts/6396280/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KMSP FOX 9 Minneapolis Minnesota" ;;
# 955) St. Cloud Times UTVS Minnesota
955)
#link="https://livestream.com/accounts/11549400/UTVS"
link="$( curl "https://livestream.com/accounts/11549400/UTVS"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="St. Cloud Times UTVS Minnesota " ;;
#####################Nebraska#########################

#######################Wisconsin#####################

# 956) WHLT 12 Whitehall, Wisconsin
956)
#link="https://livestream.com/accounts/8383566/live"
link="$( curl "https://livestream.com/accounts/8383566/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WHLT 12 Whitehall, Wisconsin" ;;

#########################Illinois#######################
# 957) WFLD / Fox 32 Chicago, Illinois USA
957)
#link="https://livestream.com/accounts/6370732/live"
link="$( curl "https://livestream.com/accounts/6370732/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFLD Fox 32 Chicago, Illinois USA" ;;
# 958) WAND NBC 17 Decatur Illinois
958)
#link="https://livestream.com/accounts/15004678/live"
link="$( curl "https://livestream.com/accounts/15004678/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WAND NBC 17 Decatur Illinois" ;;
# 959) WFLD Fox 32 Chicago IL
959)
#link="https://livestream.com/accounts/6370732/events/4249677"
link="$( curl "https://livestream.com/accounts/6370732/events/4249677"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WFLD Fox 32 Chicago IL" ;;
##################################################################### SOUTH MIDDLE #########################

########################Texas#####################
# 960)  KRIV FOX 26 News Houston Texas USA
960)
#link="https://livestream.com/accounts/6396012/live"
link="$( curl "https://livestream.com/accounts/6396012/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name=" KRIV FOX 26 News Houston, Texas, USA" ;;
# 961) KLTV ABC 7 Tyler TX USA
961)
#link="https://livestream.com/accounts/11816721/live"
link="$( curl "https://livestream.com/accounts/11816721/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KLTV ABC 7 Tyler TX USA" ;;
# 962) KTXS 12 ABC Abilene Texas
962)
#link="https://livestream.com/accounts/9960439/live"
link="$( curl "https://livestream.com/accounts/9960439/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KTXS 12 ABC Abilene TX" ;;
# 963) KFDA CBS 10 Amarillo TX USA
963)
#link="https://livestream.com/accounts/17606146/live"
link="$( curl "https://livestream.com/accounts/17606146/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KFDA CBS 10 Amarillo TX USA" ;;
# 964) KZTV CBS 10 Corpus Christi TX USA
964)
#link="https://livestream.com/accounts/16030806/live"
link="$( curl "https://livestream.com/accounts/16030806/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KZTV CBS 10 Corpus Christi TX USA" ;;
# 965) KFDX NBC 3 Witchita Falls Texas USA
965)
#link="https://livestream.com/accounts/21184359/live"
link="$( curl "https://livestream.com/accounts/21184359/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KFDX NBC 3 Witchita Falls, Texas USA" ;;
# 966) Galveston County Gulf Freeway Cams Tour Houston Texas USA
966)
#link="https://livestream.com/accounts/21068106/events/6228235"
link="$( curl "https://livestream.com/accounts/21068106/events/6228235"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Galveston County Gulf Freeway Cams Tour Houston Texas USA" ;;
# 967) KAUZ CBS 6 Winters Texas
967)
#link="https://livestream.com/accounts/16991125/live"
link="$( curl "https://livestream.com/accounts/16991125/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KAUZ CBS 6 Winters Texas" ;;
# 968) KXXV ABC 25 Waco Texas
968)
#link="https://livestream.com/accounts/16936343/live"
link="$( curl "https://livestream.com/accounts/16936343/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KXXV ABC 25 Waco Texas" ;;
# 969) KVIA ABC-7 El Paso Texas
969)
#link="https://livestream.com/accounts/18241891/live"
link="$( curl "https://livestream.com/accounts/18241891/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVIA ABC-7 El Paso Texas" ;;
# 970)  KCBD NBC 11 Lubbock, Texas
970)
#link="https://livestream.com/accounts/11816946/live"
link="$( curl "https://livestream.com/accounts/11816946/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KCBD NBC 11 Lubbock, Texas" ;;
# 971) Lex & Terry Lufkin Texas
971)
#link="https://livestream.com/accounts/16950775/live"
link="$( curl "https://livestream.com/accounts/16950775/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Lex & Terry Lufkin Texas" ;;
# 972) KSWO ABC 7 Winters Texas
972)
#link="https://livestream.com/accounts/16991045/live"
link="$( curl "https://livestream.com/accounts/16991045/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSWO ABC 7 Winters Texas" ;;

# 973) ------

# 974) ESPN 97.5 Houston Texas
974)
#link="https://livestream.com/accounts/26800104/live"
link="$( curl "https://livestream.com/accounts/26800104/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="ESPN 97.5 Houston Texas" ;;
# 975) Granbury Media Granbury, TX Tower Camera Live Stream
975)
#link="https://livestream.com/accounts/13120617/TowerCamera"
link="$( curl "https://livestream.com/accounts/13120617/TowerCamera"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Granbury Media Granbury, TX Tower Camera Live Stream" ;;
# 976) KCOH TV Houston Texas
976)
#link="https://livestream.com/accounts/12299560/events/3892224"
link="$( curl "https://livestream.com/accounts/12299560/events/3892224"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KCOH TV Houston Texas" ;;
# 977)KXAN NBC Austin Texas
977)
#link="https://livestream.com/accounts/1506296/live"
link="$( curl "https://livestream.com/accounts/1506296/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KXAN NBC Austin Texas" ;;

#######################Louisiana###################
# 978)  KSLA News 12 Shreveport Louisiana USA
978)
#link="https://livestream.com/KSLA/live"
link="$( curl "https://livestream.com/KSLA/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSLA News 12 Shreveport Louisianna USA  " ;;
# 979) WAFB 9 CBS Baton Rouge Louisiana USA
979)
#link="https://livestream.com/accounts/11595706/live"
link="$( curl "https://livestream.com/accounts/11595706/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WAFB 9 CBS Baton Rouge Louisiana USA" ;;
# 980) WVUE FOX 8 New Orleans LA USA
980)
#link="https://livestream.com/accounts/10891792/live"
link="$( curl "https://livestream.com/accounts/10891792/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WVUE FOX 8 New Orleans LA USA" ;;
# 981) KLFY News 10 Acadiana Lafayette, Louisiana
981)
#link="https://livestream.com/accounts/7520488/live"
link="$( curl "https://livestream.com/accounts/7520488/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KLFY News 10 Acadiana Lafayette, Louisiana" ;;
# 982) WDFL 18 South Carolina, Alabama, Louisiana
982)
#link="https://livestream.com/accounts/26473976/events/7937669"
link="$( curl "https://livestream.com/accounts/26473976/events/7937669"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WDFL 18 South Carolina, Alabama, Louisiana" ;;
# 983) KSLA News CBS 12 Shreveport, Louisiana
983)
#link="https://livestream.com/accounts/11816591/live"
link="$( curl "https://livestream.com/accounts/11816591/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSLA News CBS 12 Shreveport, Louisiana" ;;
# 984) HTV10 Houma Louisiana
984)
#link="https://livestream.com/accounts/1362675/events/3147474"
link="$( curl "https://livestream.com/accounts/1362675/events/3147474"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="HTV10 Houma Louisiana" ;;
# 985) KPLC NBC 7 Lake Charles Louisiana
985)
#link="https://livestream.com/accounts/11595658/live"
link="$( curl "https://livestream.com/accounts/11595658/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KPLC NBC 7 Lake Charles Louisiana" ;;
# 986) KATC Lafayette ABC 3 Louisiana
986)
#link="https://livestream.com/accounts/15228189/live"
link="$( curl "https://livestream.com/accounts/15228189/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KATC Lafayette ABC 3 Louisiana" ;;

#####################Arkansas#########################
# 987)HU16 Harding Sercy Arkansas  USA
987)
#link="https://livestream.com/accounts/8522446/live"
link="$( curl "https://livestream.com/accounts/8522446/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="HU16 Harding Sercy Arkansas  USA" ;;
######################Kansas#########################
# 988) KSNT Weather Wichita Kansas
988)
#link="https://livestream.com/accounts/1866369/live"
link="$( curl "https://livestream.com/accounts/1866369/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSNT Weather Wichita Kansas" ;;
# 989) WPS-TV Wichita Public Schools Kansas
989)
#link="https://livestream.com/accounts/12013978/events/3835724"
link="$( curl "https://livestream.com/accounts/12013978/events/3835724"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WPS-TV Wichita Public Schools, Kansas" ;;
# 990) KSNW NBC 3 Witchita Kansas
990)
#link="https://livestream.com/accounts/1866980/live"
link="$( curl "https://livestream.com/accounts/1866980/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSNW NBC 3 Witchita Kansas" ;;
#####################Oklahoma#########################
# 991) KSNT Kansas OK USA
991)
#link="https://livestream.com/accounts/1866369/live"
link="$( curl "https://livestream.com/accounts/1866369/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KSNT Kansas OK USA" ;;
# 992) Enid Television Network Oklahoma
992)
#link="https://livestream.com/accounts/13638122/events/4063586"
link="$( curl "https://livestream.com/accounts/13638122/events/4063586"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Enid Television Network Oklahoma" ;;
####################Missouri###########################
# 993) KMOV CBS 4 St. Louis Missouri MO USA
993)
#link="https://livestream.com/accounts/12654794/live"
link="$( curl "https://livestream.com/accounts/12654794/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KMOV CBS 4 St. Louis Missouri MO USA" ;;
# 994) KMIZ ABC 17 Missouri
994)
#link="https://livestream.com/accounts/18240993/live"
link="$( curl "https://livestream.com/accounts/18240993/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KMIZ ABC 17 Missouri" ;;
# 995) Polk County Channel 44 Bolivar Missouri USA
995)
#link="https://livestream.com/accounts/15079831/Channel44"
link="$( curl "https://livestream.com/accounts/15079831/Channel44"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Polk County Channel 44 Bolivar Missouri USA" ;;
# 996) KOLR CBS 10 Springfield Missouri
996)
#link="https://livestream.com/accounts/21145355/live"
link="$( curl "https://livestream.com/accounts/21145355/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KOLR CBS 10 Springfield Missouri" ;;
# 997) Branson Visitor TV Branson Misouri
997)
#link="https://livestream.com/accounts/21384612/BVTV"
link="$( curl "https://livestream.com/accounts/21384612/BVTV"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Branson Visitor TV Branson Misouri" ;;
# 998) EUTV - Evangel University EUTV Channel Live Springfield Missouri
998)
#link="https://livestream.com/accounts/10735484/events/3837393"
link="$( curl "https://livestream.com/accounts/10735484/events/3837393"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name=" EUTV Evangelical University, Springfield Missouri" ;;
# 999) KY3 Springfield Missouri
999)
#link="https://livestream.com/accounts/4699618/live"
link="$( curl "https://livestream.com/accounts/4699618/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KY3 Springfield Missouri" ;;
# 1000) KQTV 2 St. Joseph, Missouri
1000)
#link="https://livestream.com/accounts/26511737/live"
link="$( curl "https://livestream.com/accounts/26511737/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KQTV 2 St. Joseph, Missouri" ;;
# 1001) News-Press NOW Fox 26 KNPN Saint Joseph Missouri
1001)
#link="https://livestream.com/accounts/18241682/live"
link="$( curl "https://livestream.com/accounts/18241682/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="News-Press NOW Fox 26 KNPN Saint Joseph Missouri" ;;
# 1002) KCTV CBS 5 Kansas City Missouri
1002)
#link="https://livestream.com/accounts/6370696/live"
link="$( curl "https://livestream.com/accounts/6370696/live" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KCTV CBS 5 Kansas City Missouri" ;;

######################################################################## TERITORIES #########################

###################Hawaii##########################
# 1003) KHNL Honolulu Hawaii News Now
1003)
#link="https://livestream.com/accounts/12139043/live"
link="$( curl "https://livestream.com/accounts/12139043/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KHNL Honolulu Hawaii News Now" ;;
# 1004) ThinkTech Hawaii Honolulu USA
1004)
#link="https://livestream.com/accounts/12650986/events/3950350"
link="$( curl "https://livestream.com/accounts/12650986/events/3950350"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="ThinkTech Hawaii Honolulu USA" ;;
# 1005) KFVE 9 Honolulu Hawaii
1005)
#link="https://livestream.com/accounts/14598737/live"
link="$( curl "https://livestream.com/accounts/14598737/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KFVE Honolulu Hawaii" ;;
# 1006) KHON CBS 2 Ala Mona Honolulu Hawaii
1006)
#link="https://livestream.com/accounts/1858266/live"
link="$( curl "https://livestream.com/accounts/1858266/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KHON CBS 2 Ala Mona Honolulu Hawaii " ;;
####################Alaska##########################

#################### Amerrican Samoa ########################
# 1007) KVZK TV CHANNEL 2 American Samoa
1007)
#link="https://livestream.com/accounts/8956070/events/4561731"
link="$( curl "https://livestream.com/accounts/8956070/events/4561731"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="KVZK TV CHANNEL 2 American Samoa" ;;
########## Guam ##################
# 1008) PNC News First Newstalk K57 Fox 6 Guam
1008)
#link="https://livestream.com/accounts/10612724/newstalk57"
link="$( curl "https://livestream.com/accounts/10612724/newstalk57"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="PNC News First Newstalk K57 Fox 6 Guam " ;;
##################################################################################################


###################### UN SORTED USA ###################################################################
# 1009)  Joe Pags Show
1009)
#link="https://livestream.com/accounts/26896512/events/8077273"
link="$( curl "https://livestream.com/accounts/26896512/events/8077273"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Joe Pags Show" ;;
# 1010) CGTN America Live
1010)
#link="https://livestream.com/accounts/7082210/livenews"
link="$( curl "https://livestream.com/accounts/7082210/livenews"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="CGTN America Live" ;;
# 1011) BlabTV
1011)
#link="https://livestream.com/accounts/22779635/events/7675406"
link="$( curl "https://livestream.com/accounts/22779635/events/7675406"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="BlabTV" ;;
# 1012) Mike Malloy Show
1012)
#link="https://livestream.com/accounts/8522627/live"
link="$( curl "https://livestream.com/accounts/8522627/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Mike Malloy Show" ;;
# 1013) Nasdaq Bell Ceremonies New York City
1013)
#link="https://livestream.com/accounts/888332/live"
link="$( curl "https://livestream.com/accounts/888332/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Nasdaq Bell Ceremonies New York City" ;;
# 1014)Westerville.TV 543 Production Studio
1014)
#link="https://livestream.com/accounts/26666947/events/8163419"
link="$( curl "https://livestream.com/accounts/26666947/events/8163419"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Westerville.TV 543 Production Studio " ;;

###################### Municipal ##################################################
# 1015) Kingdom Access Television Channel 192 LIVE
1015)
#link="https://livestream.com/accounts/4209066/events/8159063"
link="$( curl "https://livestream.com/accounts/4209066/events/8159063"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Kingdom Access Television Channel 192 LIVE" ;;
# 1016) Plaistow Access New Hampshire
1016)
#link="https://livestream.com/accounts/11298895/meetings"
link="$( curl "https://livestream.com/accounts/11298895/meetings"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Plaistow Access New Hampshire" ;;
# 1017) City of Topeka City Kansas
1017)
#link="https://livestream.com/accounts/25008807/events/7970645"
link="$( curl "https://livestream.com/accounts/25008807/events/7970645"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="City of Topeka City Kansas" ;;
# 1018) Shelby County Schools C19TV & 88.5FM Memphis Tennessee
1018)
#link="https://livestream.com/accounts/25133520/c19tv"
link="$( curl "https://livestream.com/accounts/25133520/c19tv"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Shelby County Schools C19TV & 88.5FM Memphis Tennessee " ;;
# 1019) Provincetown Community TV Provincetown Government Meetings  Provincetown, Massachusetts
1019)
#link="https://livestream.com/accounts/6011038/events/6712043"
link="$( curl "https://livestream.com/accounts/6011038/events/6712043"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Provincetown Community TV, Massachusetts" ;;
# 1020) Bermuda Government (CITV) Hamilton, Bermuda
1020)
#link="https://livestream.com/accounts/19270406/events/5372984"
link="$( curl "https://livestream.com/accounts/19270406/events/5372984"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Bermuda Government (CITV) Hamilton, Bermuda " ;;
#################################### RELIGIOUS / FAITH #################################################
# 1021

# 1022) Faith Lutheran Church - Penfield, NY
1022)
#link="https://livestream.com/accounts/4440983/events/6827954"
link="$( curl "https://livestream.com/accounts/4440983/events/6827954" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Faith Lutheran Church - Penfield, NY" ;;
# 1023) Whole Life Ministries SKMNetwork Augusta Georgia
1023)
#link="https://livestream.com/accounts/16502349/SKMNetwork"
link="$( curl "https://livestream.com/accounts/16502349/SKMNetwork"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Whole Life Ministries SKMNetwork Augusta Georgia" ;;
# 1024) St. Catharine Church, Spring Lake, New Jersey
1024)
#link="https://livestream.com/accounts/11714562/events/3786245"
link="$( curl "https://livestream.com/accounts/11714562/events/3786245"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="St. Catharine Church, Spring Lake, New Jersey " ;;
# 1025) Glory to God Ministries International Love of God Classics
1025)
#link="https://livestream.com/accounts/3240767/events/8008064"
link="$( curl "https://livestream.com/accounts/3240767/events/8008064"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Glory to God Ministries" ;;
# 1026) St. Helena Chapel
1026)
#link="https://livestream.com/accounts/25372681/events/7581060"
link="$( curl "https://livestream.com/accounts/25372681/events/7581060"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="St. Helena Chapel" ;;
# 1027)
# 1028)

# 1029) TMN WORD TV Into All the Earth 24/7/365
1029)
#link="https://livestream.com/accounts/16242586/TMN"
link="$( curl "https://livestream.com/accounts/16242586/TMN"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="TMN WORD TV Into All the Earth 24/7/365" ;;
# 1030) Parkside Radio Show / BROOKLYNSTATION.COM
1030)
#link="https://livestream.com/knqradio/events/8191094"
link="$( curl "https://livestream.com/knqradio/events/8191094"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Parkside Radio Show / BROOKLYNSTATION.COM" ;;
# 1031) FGTV Frequencies of Glory LIVE Jacksonville Florida
1031)
#link="https://livestream.com/accounts/3107466/events/3858711"
link="$( curl "https://livestream.com/accounts/3107466/events/3858711"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="FGTV Frequencies of Glory LIVE Jacksonville Florida" ;;
# 1032) HJTV online Healing Jesus TV London England
1032)
#link="https://livestream.com/accounts/15754877/events/4470314"
link="$( curl "https://livestream.com/accounts/15754877/events/4470314"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="HJTV online Healing Jesus TV London England" ;;
# 1033) Apocalypse Channel APTV Live Polaski Tennessse
1033)
#link="https://livestream.com/accounts/5057242/events/4312291"
link="$( curl "https://livestream.com/accounts/5057242/events/4312291"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Apocalypse Channel APTV Live Polaski Tennessse" ;;
# 1034) Marytown Chapel Marytown Online Adoration Chapel Illinois
1034)
#link="https://livestream.com/accounts/15529184/events/4408765"
link="$( curl "https://livestream.com/accounts/15529184/events/4408765"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Marytown Chapel Illinois" ;;
# 1035) Guaranty Media Baton Rouge Louisiana
1035)
#link="https://livestream.com/accounts/25649901/live"
link="$( curl "https://livestream.com/accounts/25649901/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Guaranty Media Baton Rouge Louisiana" ;;
# 1036) Pro Football Hall of Fame Hall of Fame Channel Stream
1036)
#link="https://livestream.com/accounts/24957552/events/8006439"
link="$( curl "https://livestream.com/accounts/24957552/events/8006439"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Pro Football Hall of Fame" ;;
# 1037) Lance Hope RSL FEED
1037)
#link="https://livestream.com/accounts/22999173/events/8078810"
link="$( curl "https://livestream.com/accounts/22999173/events/8078810"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Lance Hope RSL FEED" ;;
# 1038)XBTV Rosecroft Raceway Live Maryland
1038)
#link="https://livestream.com/accounts/9869799/events/6772185"
link="$( curl "https://livestream.com/accounts/9869799/events/6772185"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="XBTV Rosecroft Raceway Live Maryland" ;;
# 1039) Park City Television PCTV Livestream Utah
1039)
#link="https://livestream.com/accounts/11728043/events/3779731"
link="$( curl "https://livestream.com/accounts/11728043/events/3779731"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Park City Television PCTV Livestream Utah" ;;
# 1040) AAA Guayama
1040)
#link="https://livestream.com/accounts/3185486/guayama"
link="$( curl "https://livestream.com/accounts/3185486/guayama"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="AAA Guayama" ;;
# 1041) AWCATV - Education/Government Channel Ashburnham
1041)
#link="https://livestream.com/accounts/22393363/events/6651528"
link="$( curl "https://livestream.com/accounts/22393363/events/6651528"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="AWCATV - Education/Government Channel Ashburnham " ;;
# 1042)FHSU TIGER MEDIA NETWORK TMN TV Livestream Hays Kansas USA
1042)
#link="https://livestream.com/accounts/11135493/events/5339279"
link="$( curl "https://livestream.com/accounts/11135493/events/5339279"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="FHSU TIGER MEDIA NETWORK TMN TV Livestream Hays Kansas USA" ;;
# 1043) Essex County College Newark New Jersey
1043)
#link="https://livestream.com/accounts/5109696/events/7607762"
link="$( curl "https://livestream.com/accounts/5109696/events/7607762"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Essex County College Newark New Jersey" ;;
# 1044) CNPTV Live Caribbean Television.
1044)
#link="https://livestream.com/accounts/22462981/Live"
link="$( curl "https://livestream.com/accounts/22462981/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="CNPTV Live Caribbean Television." ;;
# 1045)  LOBO STATION
1045)
#link="https://livestream.com/accounts/14558256/events/7412168"
link="$( curl "https://livestream.com/accounts/14558256/events/7412168"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="LOBO STATION" ;;
# 1046) Maricopa Colleges Television MCTV Live Feed 115 Phoenix Arizona
1046)
#link="https://livestream.com/accounts/24714287/Live"
link="$( curl "https://livestream.com/accounts/24714287/Live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Maricopa Colleges Television MCTV Live Feed 115 Phoenix Arizona" ;;
# 1047) WLTH AM 1370 Radio
1047)
#link="https://livestream.com/accounts/26670176/events/8011646"
link="$( curl "https://livestream.com/accounts/26670176/events/8011646"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="WLTH AM 1370 Radio" ;;
# 1048) Lake Tahoe TV California
1048)
#link="https://livestream.com/accounts/21822229/events/6450069"
link="$( curl "https://livestream.com/accounts/21822229/events/6450069"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Lake Tahoe TV California" ;;
# 1049) Florida Gaming Sorteo
1049)
#link="https://livestream.com/accounts/25552923/events/7909255"
link="$( curl "https://livestream.com/accounts/25552923/events/7909255"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Florida Gaming Sorteo" ;;
# 1050) Kidd Kraddick Morning Show
1050)
#link="https://livestream.com/accounts/16936513/live"
link="$( curl "https://livestream.com/accounts/16936513/live"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Kidd Kraddick Morning Show " ;;
# 1051) Rover's Morning Glory RMG-TV Cleavland Ohio
1051)
#link="https://livestream.com/accounts/242049/events/1978582"
link="$( curl "https://livestream.com/accounts/242049/events/1978582"| grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
use_cookies="no"
chan_name="Rover's Morning Glory RMG-TV Cleavland Ohio" ;;


### FLUX TESTED

## 1052) Denver 8 TV
1052)
link="http://granicusliveus8-a.akamaihd.net/denver/G0080_002/chunklist.m3u8"
use_cookies="no"
chan_name="Denver 8 TV" ;;

## 1053) Jewlery Maker UK
1053)
link="http://edge01.cdn.aws.subset.host/JewelleryMakerLive/JewelleryMakerLive/playlist.m3u8"
use_cookies="no"
chan_name="Jewlery Maker UK" ;;



###################################### FRANCAIS EXTRA ##########################################

# 1121)SYTRAL Rhone FR
1121)
keyword="DIRECT"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/SytralTCL/videos?view=2&flow=grid" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
chan_name="SYTRAL Rhone FR" ;;

# 1122) Vedia BE
1122)
# https://www.vedia.be/www/live
link=https://5a0b00d270652.streamlock.net/live/vedia-live/playlist.m3u8
use_cookies="no"
#method="Tor"
chan_name="Vedia BE" ;;

# 1123) MABI TV Canada
1123)
keyword="en direct"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/channel/UCC1LyPxWz4t2PGfIr2ETwPw/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
use_cookies="no"
chan_name="MABI TV Canada" ;;

# 1124) Vatican Media
1124)
keyword="Live"
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/vaticanfr/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2)"
use_cookies="no"
chan_name="Vatican Media" ;;

# 1125) TVM FR
1125)
#link=https://cineplume.vedge.infomaniak.com/livecast/cineplume/chunklist_w1158771188.m3u8
#link=https://cineplume.vedge.infomaniak.com/livecast/cineplume/chunklist.m3u8
link=https://cineplume.vedge.infomaniak.com/livecast/cineplume/playlist.m3u8
use_cookies="no"
#method="Tor"
chan_name="TVM FR" ;;

# 1126) C-Star
1126)
link=https://www.dailymotion.com/video/x5idxor
#link=https://stream-07.dc3.dailymotion.com/41/dm/3/x5idxor/live-2.m3u8
use_cookies="no"
chan_name="C-Star" ;;

# 1127) Direct Journal TVLandes
1127) 
#link=https://www.dailymotion.com/video/x1z2d07_direct-journal-tvlandes_news
link="https://www.dailymotion.com/video/x1z2d07"
use_cookies="no"
#method="Tor"
chan_name="Direct Journal Tvlandes"  ;;

# 1128) TV 7 Francais
1128)
link=http://tv7.hdr-tv.com:1935/live/tv7/livestream/playlist.m3u8
use_cookies="no"
#method="Tor"
chan_name="TV 7 Francais" ;;

# 1129) Generations TV
1129)
link="https://www.dailymotion.com/video/x2fxcwq"
#####method="Tor"
use_cookies="no"
chan_name="Generations TV";;

# 1130) Suivez Telesud
1130)
link="https://www.dailymotion.com/video/x52et3w"
#####method="Tor"
use_cookies="no"
chan_name="Suivez Telesud";;

# 1131)  BFM TV
1131)
link="https://www.dailymotion.com/video/xgz4t1"
#####method="Tor"
use_cookies="no"
chan_name="BFM TV";;

# 1132) 8 Mont Blanc Live 2
1132)
link="https://www.dailymotion.com/video/x6nhqs0"
#####method="Tor"
use_cookies="no"
chan_name="8 Mont Blanc Live 2";;

# 1133) OUI FM
1133)
link="https://www.dailymotion.com/video/x10990v"
#####method="Tor"
use_cookies="no"
chan_name="OUI FM";;

# 1134) D24TV
1134)
link="https://www.dailymotion.com/video/x6cq41k"
#####method="Tor"
use_cookies="no"
chan_name="D24TV";;

# 1135)Canal Savoir Francais
1135)
if [ "$getlink" = 1 ]
then
link=http://stream.canalsavoir.tv/livestream/stream.m3u8
fi
use_cookies="no"
#method="Tor"
chan_name="Canal Savoir Canada" ;;

# 1136) RFI
1136)
keyword="RFI en Direct"
if [ "$getlink" = 1 ]
then
link=https://www.youtube.com/watch?v="$(curl -A "$UA" "https://www.youtube.com/user/rfivideos/videos?&view=2" | grep "$keyword" | grep "watch?v=" | head -n 1 | cut -d ? -f 2 | cut -d \" -f1 | cut -d = -f 2 )"
fi
use_cookies="no"
chan_name="RFI Francais" ;;

############################################
###############################  GOVERNMENT #####################################################################

###################### EUROPEAN UNION #################################
# 1161) EBS European Commision
1161)
if [ "$getlink" = 1 ]
then
#link="https://ott.ec.streamcloud.be/live/disk1/EBS/hls_or/EBS-audio_AACL_qaa_66400_201=66400-video=800000.m3u8"
#link="https://ott.ec.streamcloud.be/live/disk1/EBS/hls_or/EBS-audio_AACL_qaa_66400_201=66400-video=800000.m3u8"
link="https://ott.ec.streamcloud.be/live/disk1/EBS/hls_en/EBS-audio_AACL_eng_66400_202=66400-video=800000.m3u8"

fi
use_cookies="no"
##method="Tor"
TAG="EBS_EU______"
chan_name="EBS European Commision" ;;
# 1162) EBS European Commision
1162)
if [ "$getlink" = 1 ]
then
#link="https://ott.ec.streamcloud.be/live/disk1/EBSplus/hls_or/EBSplus-audio_AACL_qaa_66400_401=66400-video=800000.m3u8"
#link="https://ott.ec.streamcloud.be/live/disk1/EBSplus/hls_or/EBSplus-audio_AACL_qaa_66400_401=66400-video=800000.m3u8"
link="https://ott.ec.streamcloud.be/live/disk1/EBSplus/hls_en/EBSplus-audio_AACL_eng_66400_402=66400-video=800000.m3u8"
fi
use_cookies="no"
##method="Tor"
TAG="EBS+_EU______"
chan_name="EBS Plus European Commision" ;;
############## IRELAND ###############
# 1163) Dail Eireann IE
1163)
link=https://oirlive.heanet.ie/dail/ngrp:dail.stream_all/chunklist_b1228000.m3u8
#link=https://oirlive.heanet.ie/dail/ngrp:dail.stream_all/playlist.m3u8
#link=https://media.heanet.ie/oirlive/dail/ngrp:dail.stream_all/playlist.m3u8
use_cookies="no"
chan_name="Dail Eireann IE" ;;
# 1164) Senad Eireann IE
1164)
link=https://oirlive.heanet.ie/seanad/ngrp:seanad.stream_all/playlist.m3u8
#link=https://media.heanet.ie/oirlive/seanad/ngrp:seanad.stream_all/playlist.m3u8
use_cookies="no"
chan_name="Senad Eireann IE" ;;
# 1165)# 540)Oireachtas Committee Room 1
1165)
link=https://oirlive.heanet.ie/cr1/ngrp:cr1.stream_all/chunklist_b1228000.m3u8
use_cookies="no"
chan_name="Oireachtas Committee Room 1" ;;
# 1166)# 540)Oireachtas Committee Room 2
1166)
link=https://oirlive.heanet.ie/cr2/ngrp:cr2.stream_all/chunklist_b1228000.m3u8
use_cookies="no"
chan_name="Oireachtas Committee Room 2" ;;
# 1167) Oireachtas Committee Room 3
1167)
link=https://oirlive.heanet.ie/cr3/ngrp:cr3.stream_all/chunklist_b1228000.m3u8
use_cookies="no"
chan_name="Oireachtas Committee Room 3" ;;
# 1168)Oireachtas Committee Room 4
1168)
link=https://oirlive.heanet.ie/cr4/ngrp:cr4.stream_all/chunklist_b1228000.m3u8
use_cookies="no"
chan_name="Oireachtas Committee Room 4" ;;

############################################




################### MENU 5 ########################################

############################### AUSTRALIA /New Zealand ##########################################
## 1201) 2UE Sydney
1201)
#link="http://syd2uevid-lh.akamaihd.net/i/sydneyuevid_1@110994/master.m3u8"
link="http://syd2uevid-lh.akamaihd.net/i/sydneyuevid_1@110994/index_500_av-p.m3u8"
use_cookies="no"
chan_name="2UE Sydney" ;;

## 1202) 3AW Melbourne
1202)
# link="http://melb3awvid-lh.akamaihd.net/i/melbournevid_1@109381/master.m3u8"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=198000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
link="http://melb3awvid-lh.akamaihd.net/i/melbournevid_1@109381/index_150_av-p.m3u8?sd=10&rebase=on"
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=198000,RESOLUTION=320x240,CODECS="avc1.66.30, mp4a.40.2"
#link="http://melb3awvid-lh.akamaihd.net/i/melbournevid_1@109381/index_150_av-b.m3u8?sd=10&rebase=on"
use_cookies="no"
chan_name="3AW Melbourne" ;;

## 1203) 4BC Brisbane
1203)
link="http://bris4bcvid-lh.akamaihd.net/i/brisbanebcvida_1@110989/master.m3u8"
use_cookies="no"
chan_name="4BC Brisbane" ;;

## 1204) 3 News Live New Zealand
1204)
## 3 News Live New Zealand
#link="http://mediaworks-i.akamaihd.net/hls/live/220435/3812193411001/3news_live/master.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=1058932,AVERAGE-BANDWIDTH=1205600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=852x480,FRAME-RATE=25.000
link="http://mediaworks-i.akamaihd.net/hls/live/220435/3812193411001/3news_live/master_1500.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=772932,AVERAGE-BANDWIDTH=875600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=640x360,FRAME-RATE=25.000
#link="http://mediaworks-i.akamaihd.net/hls/live/220435/3812193411001/3news_live/master_720.m3u8"
#EXT-X-STREAM-INF:BANDWIDTH=391600,AVERAGE-BANDWIDTH=435600,CODECS="avc1.77.30,mp4a.40.2",RESOLUTION=426x240,FRAME-RATE=25.000
#link="http://mediaworks-i.akamaihd.net/hls/live/220435/3812193411001/3news_live/master_325.m3u8"
use_cookies="no"
chan_name="3 News Live New Zealand" ;;



#1240

################### TWITCH #############################
# 1241) hasanabi
1241)
link=https://www.twitch.tv/hasanabi
use_cookies="no"
####method="Tor"
chan_name="hasanabi";;

# 1242) smidjen 
1242)
link=https://www.twitch.tv/smidjen
use_cookies="no"
####method="Tor"
chan_name="smidjen";;

# 1243) blondiewondie
1243)
link=https://www.twitch.tv/blondiewondie
use_cookies="no"
####method="Tor"
chan_name="blondiewondie";;

# 1244) Alinity
1244)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/alinity"
use_cookies="no"
fi
##method="Tor"
TAG="Alinity"
chan_name="Alinity" ;;

# 1245) My Kinky Dope
1245)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/mykinkydope"
use_cookies="no"
fi
##method="Tor"
TAG="MyKinkyDope"
chan_name="MyKinkyDope" ;;

# 1246)ShyPhoebe
1246)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/shyphoebe"
use_cookies="no"
fi
##method="Tor"
TAG="shyphoebe"
chan_name="shyphoebe" ;;

# 1247) LoserFruit
1247)
link="https://www.twitch.tv/loserfruit"
#####method="Tor"
use_cookies="no"
chan_name="LoserFruit";;

# 1248) Staryuuki
1248)
link="https://www.twitch.tv/staryuuki"
#####method="Tor"
use_cookies="no"
chan_name="Staryuuki";;

# 1249) Loraveee
1249)
link="https://www.twitch.tv/loraveee"
#####method="Tor"
use_cookies="no"
chan_name="Loraveee";;

# 1250) Bunny Bombshell
1250)
link="https://www.twitch.tv/bunnyybombshell"
#####method="Tor"
use_cookies="no"
chan_name="Bunny Bombshell";;


# 1251) Gonsabellla
1251)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/gonsabellla"
use_cookies="no"
fi
##method="Tor"
TAG="Gonsabellla"
chan_name="Gonsabellla" ;; 


# 1252) Cat Like Meow  
1252)
link="https://www.twitch.tv/catlikemeow"
use_cookies="no"
####method="Tor"
chan_name="CatLikeMeow";;

# 1253) DizzyKitten
1253)
link="https://www.twitch.tv/dizzykitten"
use_cookies="no"
####method="Tor"
chan_name="DizzyKitten";;

# 1254) keelyvalentine
1254)
link="https://www.twitch.tv/keelyvalentine"
use_cookies="no"
####method="Tor"
chan_name="keelyvalentine";;

# 1255) Devon Jenelle
1255)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/devonjenelle"
use_cookies="no"
fi
##method="Tor"
TAG="Devon Jenelle"
chan_name="Devon Jenelle" ;;

# 1256) Cristina Scabbia
1256)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/cristinascabbia"
use_cookies="no"
fi
##method="Tor"
TAG="CristinaScabbia"
chan_name="Cristina Scabbia" ;;

# 1257) taylor_jevaux
1257)
link="https://www.twitch.tv/taylor_jevaux"
use_cookies="no"
####method="Tor"
chan_name="taylor_jevaux";;

# 1258) kneecoleslaw
1258)
link="https://www.twitch.tv/kneecoleslaw/"
use_cookies="no"
####method="Tor"
chan_name="kneecoleslaw";;

# 1259) courtneyysmoke
1259)
link="https://www.twitch.tv/courtneyysmoke"
use_cookies="no"
####method="Tor"
chan_name="courtneyysmoke";;

# 1260) ninjastarasmr
1260)
link="https://www.twitch.tv/ninjastarasmr"
use_cookies="no"
####method="Tor"
chan_name="ninjastarasmr";;

# 1261) jadethejaguar
1261)
link="https://www.twitch.tv/jadethejaguar"
use_cookies="no"
####method="Tor"
chan_name="jadethejaguar";;

# 1262) intraventus
1262)
link="https://www.twitch.tv/intraventus"
use_cookies="no"
####method="Tor"
chan_name="intraventus";;

# 1263) annacramling
1263)
link="https://www.twitch.tv/annacramling"
use_cookies="no"
####method="Tor"
chan_name="anncramling";;

# 1264) TYT
1264)
if [ "$getlink" = 1 ]
then
link="https://www.twitch.tv/tyt"
use_cookies="no"
fi
##method="Tor"
TAG="TYT"
chan_name="The Young Turks TYT" ;;

# 1265) PekeASMR
1265)
link="https://www.twitch.tv/pekeasmr"
#####method="Tor"
use_cookies="no"
chan_name="PekeASMR";;

# 1266) Geek and Sundry
1266)
link="https://www.twitch.tv/geekandsundry"
use_cookies="no"
####method="Tor"
chan_name="Geek and Sundry";;

############## COZY /DLIVE ########################

## 1281)
1281)
link="https://cozycdn.foxtrotstream.xyz/live/lofi/index.m3u8"
chan_name="CozyTV LoFi";;

###
1282)
link="https://cozycdn.foxtrotstream.xyz/live/alexjones/index.m3u8"
chan_name="alexjones";;

###
1283)
#link="https://live.prd.dlive.tv/hls/live/dlive-05900794.m3u8"
link="https://b7i4j3n3.stackpathcdn.com/dlive-05900794/1688965557/src/live.m3u8"
#link="https://b7i4j3n3.stackpathcdn.com/dlive-05900794/1688965557/360p/live.m3u8"
#link="https://b7i4j3n3.stackpathcdn.com/dlive-05900794/1688965557/480p/live.m3u8"
chan_name="PatriotSoapBox" ;;

### SloanTV
1284)
#link="https://live.prd.dlive.tv/hls/live/dlive-05900794.m3u8"
link="https://b7i4j3n3.stackpathcdn.com/tcue/1688965355/src/live.m3u8"
chan_name="SloanTV" ;;

###
1285)
link="https://live.prd.dlive.tv/hls/live/surplusprepper.m3u8"
chan_name="PreperSurplus";;

###
1286)
link="https://live.prd.dlive.tv/hls/live/jtea.m3u8"
chan_name="WTC-7";;

#####
1287)
link="https://cozycdn.foxtrotstream.xyz/live/chieftrumpster/index.m3u8"
chan_name="chieftrumpster";;

####
1288)
link="https://live.prd.dlive.tv/hls/live/dlive-11213965.m3u8"
chan_name="Red Ice TV";;

#####
1289)
link="https://live.prd.dlive.tv/hls/live/dlive-83056406.m3u8"
chan_name="MarfoggleNews";;

######
1290)
link="https://live.prd.dlive.tv/hls/live/hatebus.m3u8"
chan_name="HateBus";;

#####
1291)
link="https://cozycdn.foxtrotstream.xyz/live/ethanralph/index.m3u8"
chan_name="EthanRalph";;

#####
1292)
link="https://cozycdn.foxtrotstream.xyz/live/paultown/index.m3u8"
chan_name="PaulTown";;

######
1293)
link="https://cozycdn.foxtrotstream.xyz/live/politicallyprovoked/index.m3u8"
chan_name="politicallyprovoked";;

######
1294)
link="https://cozycdn.foxtrotstream.xyz/live/veyta/index.m3u8"
chan_name="veyta";;

######
1295)
link="https://cozycdn.foxtrotstream.xyz/live/nick/index.m3u8"
chan_name="nick";;

#######
1296)
link="https://cozycdn.foxtrotstream.xyz/live/aff/index.m3u8"
chan_name="aff" ;;

#######
1297)
link="https://cozycdn.foxtrotstream.xyz/live/emichaeljones/index.m3u8"
chan_name="emichaeljones" ;;

#######
1298)
link="https://cozycdn.foxtrotstream.xyz/live/vince/index.m3u8"
chan_name="vince" ;;

######
1299)
link="https://cozycdn.foxtrotstream.xyz/live/bakedalaska/index.m3u8"
chan_name="bakedalaska";;

#######
1300)
link="https://live.prd.dlive.tv/hls/live/nptvpl.m3u8"
chan_name="NPTV PL" ;;

######
1301)
link="https://live.prd.dlive.tv/hls/live/resistancechicks.m3u8"
chan_name="Resistance Chicks";;

#######
1302)
link="https://live.prd.dlive.tv/hls/live/vlynnq.m3u8"
chan_name="Patriot Pool Party";;

#######
1303) 
link="https://live.prd.dlive.tv/hls/live/knightsofthestorm.m3u8"
chan_name="Knights of The Storm";;

#######
1304)
link="https://live.prd.dlive.tv/hls/live/dlive-42299268.m3u8"
chan_name="Free Talk Live" ;;

######
1305)
link="https://live.prd.dlive.tv/hls/live/adamdunnshow.m3u8"
chan_name="Adamdunshow";;

######
1306)
link="https://live.prd.dlive.tv/hls/live/dlive-36788915.m3u8"
chan_name="TLAVagabond" ;;

#######
1307)
link="https://live.prd.dlive.tv/hls/live/wtfr.m3u8"
chan_name="We Think Freely Radio";;

#######
1308)
link="https://cozycdn.foxtrotstream.xyz/live/cancelproof/index.m3u8"
chan_name="CancelProof" ;;

########
1309)
link="https://cozycdn.foxtrotstream.xyz/live/wurzelroot/index.m3u8"
chan_name="wuzleroot";;

#######
1310)
link="https://cozycdn.foxtrotstream.xyz/live/hw/index.m3u8"
chan_name="HW";;

#######
1311)
link="https://cozycdn.foxtrotstream.xyz/live/keithwoods/index.m3u8"
chan_name="keithwoods";;

######
1312)
link="https://cozycdn.foxtrotstream.xyz/live/stewpeters/index.m3u8"
chan_name="stewpeters";;

#######
1313)
link="https://cozycdn.foxtrotstream.xyz/live/joetheboomer/index.m3u8"
chan_name="joetheboomer";;

#######
1314)
link="https://cozycdn.foxtrotstream.xyz/live/beardson/index.m3u8"
chan_name="beardson";;

######
1315)
link="https://cozycdn.foxtrotstream.xyz/live/loulz/index.m3u8"
chan_name="loulz";;

######
1316)
link="https://cozycdn.foxtrotstream.xyz/live/trsartor/index.m3u8"
chan_name="trsartor";;

#######
1317)
link="https://cozycdn.foxtrotstream.xyz/live/tylerrussell/index.m3u8"
chan_name="tylerrussell";;

#######
1318)
link="https://cozycdn.foxtrotstream.xyz/live/bigtech/index.m3u8"
chan_name="bigtech";;

#######
1319)
link="https://cozycdn.foxtrotstream.xyz/live/jimbozoomer/index.m3u8"
chan_name="JimboZoomer";;

#######
#1320
1320)
link="https://b7i4j3n3.stackpathcdn.com/dudeman76/1688801908/src/live.m3u8"
#link="https://b7i4j3n3.stackpathcdn.com/dudeman76/1688801908/360p/live.m3u8"
#link="https://b7i4j3n3.stackpathcdn.com/dudeman76/1688801908/480p/live.m3u8"
#link="https://b7i4j3n3.stackpathcdn.com/dudeman76/1688801908/720p/live.m3u8"
chan_name="DudeMan76";;

############################################################
# 1321) Brighteon Live 1
1321)
link="https://rtmp-edge.brighteon.com/hls/btlive000001-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 1";;

# 1322) Brighteon Live 2
1322)
link="https://rtmp-edge.brighteon.com/hls/btlive000002-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 2";;

# 1323) Brighteon Live 3
1323)
link="https://rtmp-edge.brighteon.com/hls/btlive000003-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 3";;

# 1324) Brighteon Live 4
1324)
link="https://rtmp-edge.brighteon.com/hls/btlive000004-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 4";;

# 1325) Brighteon Live 5
1325)
link="https://rtmp-edge.brighteon.com/hls/btlive000005-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 5";;

# 1326) Brighteon Live 6
1326)
link="https://rtmp-edge.brighteon.com/hls/btlive000006-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 6";;

# 1327) Brighteon Live 7
1327)
link="https://rtmp-edge.brighteon.com/hls/btlive000007-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 7";;

# 1328) Brighteon Live 8
1328)
link="https://rtmp-edge.brighteon.com/hls/btlive000008-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 8";;

# 1329) Brighteon Live 9
1329)
link="https://rtmp-edge.brighteon.com/hls/btlive000009-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 9";;

# 1330) Brighteon Live 10
1330)
link="https://rtmp-edge.brighteon.com/hls/btlive000010-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 10";;

# 1331) Brighteon Live 11
1331)
link="https://rtmp-edge.brighteon.com/hls/btlive000011-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 11";;

# 1332) Brighteon Live 12
1332)
link="https://rtmp-edge.brighteon.com/hls/btlive000012-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 12";;

# 1333) Brighteon Live 13
1333)
link="https://rtmp-edge.brighteon.com/hls/btlive000013-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 13";;

# 1334) Brighteon Live 14
1334)
link="https://rtmp-edge.brighteon.com/hls/btlive000014-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 14";;

# 1335) Brighteon Live 15
1335)
link="https://rtmp-edge.brighteon.com/hls/btlive000015-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 15";;

# 1336) Brighteon Live 16
1336)
link="https://rtmp-edge.brighteon.com/hls/btlive000016-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 16";;

# 1337) Brighteon Live 17
1337)
link="https://rtmp-edge.brighteon.com/hls/btlive000017-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 17";;

# 1338) Brighteon Live 18
1338)
link="https://rtmp-edge.brighteon.com/hls/btlive000018-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 18";;

# 1339) Brighteon Live 19
1339)
link="https://rtmp-edge.brighteon.com/hls/btlive000019-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 19";;

# 1340) Brighteon Live 20
1340)
link="https://rtmp-edge.brighteon.com/hls/btlive000020-live/index.m3u8"
use_cookies="no"
chan_name="Brighteon Live 20";;


esac
}


playMaker(){
#initialize="$(curl "https://tokens.playmakerservices.com/" -X "OPTIONS" -H "authority: tokens.playmakerservices.com" -H "accept: */*" -H "accept-language: en-US,en;q=0.9" -H "access-control-request-headers: content-type" -H "access-control-request-method: POST" -H "origin: https://www.nbcnews.com" -H "referer: https://www.nbcnews.com/" -H "sec-fetch-dest: empty" -H "sec-fetch-mode: cors" -H "sec-fetch-site: cross-site" -H "user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36" --compressed)"
#token="$( curl "https://tokens.playmakerservices.com/" -H 'authority: tokens.playmakerservices.com' -H 'accept: application/json, text/plain, */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/json' -H 'origin: https://www.nbcnews.com' -H 'referer: https://www.nbcnews.com/' -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' --data-raw $'{\n  "requestorId": "nbcnews",\n  "pid": "2007524",\n  "application": "NBCSports",\n  "version": "v1",\n  "platform": "desktop",\n  "token": "",\n  "resourceId": "",\n  "inPath": "false",\n  "authenticationType": "unauth",\n  "cdn": "akamai",\n  "url": "https://nbcnews3.akamaized.net/hls/live/723429/NBCNewsNowa418c506/clear/master.m3u8"\n}' --compressed | cut -d \: -f 3 | cut -d \" -f 2 )"
#info="$( curl "https://tokens.playmakerservices.com/" -H 'authority: tokens.playmakerservices.com' -H 'accept: application/json, text/plain, */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/json' -H 'origin: https://www.nbcnews.com' -H 'referer: https://www.nbcnews.com/' -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' --data-raw $'{\n  "requestorId": "nbcnews",\n  "pid": "2007524",\n  "application": "NBCSports",\n  "version": "v1",\n  "platform": "desktop",\n  "token": "",\n  "resourceId": "",\n  "inPath": "false",\n  "authenticationType": "unauth",\n  "cdn": "akamai",\n  "url": "https://nbcnews3.akamaized.net/hls/live/723429/NBCNewsNowa418c506/clear/master.m3u8"\n}' --compressed )"
#echo "$info"
#echo "$token"

#link="$( curl "https://tokens.playmakerservices.com/" -H "authority: tokens.playmakerservices.com" -H "accept: application/json, text/plain, */*" -H "accept-language: en-US,en;q=0.9" -H "content-type: application/json" -H "origin: https://www.nbcnews.com" -H "referer: https://www.nbcnews.com/" -H "sec-ch-ua: "Not_A_Brand";v="8", "Chromium";v="108"" -H "sec-ch-ua-mobile: ?0" -H "sec-ch-ua-platform: "Linux"" -H "sec-fetch-dest: empty" -H "sec-fetch-mode: cors" -H "sec-fetch-site: cross-site" -H "user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36" --data-raw $'{\n  "requestorId": "nbcnews",\n  "pid": "2007524",\n  "application": "NBCSports",\n  "version": "v1",\n  "platform": "desktop",\n  "token": "",\n  "resourceId": "",\n  "inPath": "false",\n  "authenticationType": "unauth",\n  "cdn": "akamai",\n  "url": "https://nbcnews3.akamaized.net/hls/live/723429/NBCNewsNowa418c506/clear/master.m3u8"\n}' --compressed  | cut -d \: -f 4,5 | cut -d \, -f 1 | cut -d\" -f 2)"

## Working in bash not working in sh problem is $ in --data-raw section (can't solve it right now)
link="$( curl "https://tokens.playmakerservices.com/" -H "authority: tokens.playmakerservices.com" -H "accept: application/json, text/plain, */*" -H "accept-language: en-US,en;q=0.9" -H "content-type: application/json" -H "origin: https://www.nbcnews.com" -H "referer: https://www.nbcnews.com/" -H "sec-ch-ua: "Not_A_Brand";v="8", "Chromium";v="108"" -H "sec-ch-ua-mobile: ?0" -H "sec-ch-ua-platform: "Linux"" -H "sec-fetch-dest: empty" -H "sec-fetch-mode: cors" -H "sec-fetch-site: cross-site" -H "user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36" --data-raw $'{\n  "requestorId": "nbcnews",\n  "pid": "2007524",\n  "application": "NBCSports",\n  "version": "v1",\n  "platform": "desktop",\n  "token": "",\n  "resourceId": "",\n  "inPath": "false",\n  "authenticationType": "unauth",\n  "cdn": "akamai",\n  "url": "https://nbcnews3.akamaized.net/hls/live/723429/NBCNewsNowa418c506/clear/master.m3u8" \n }'  --compressed  | cut -d \: -f 4,5 | cut -d \, -f 1 | cut -d\" -f 2)"

#echo "$link"


}

googleGBNews(){ 
  stream_id="$( curl 'https://pubads.g.doubleclick.net/ssai/pods/api/v1/network/22885101344/custom_asset/286166234322-europe-west1-gbnews-3-v8/stream' -H 'authority: pubads.g.doubleclick.net' -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' -H 'cookie: APC=Aa3gxNpaBisDNRW--oqlxBhbf8rPu3V0Niq1WnkWOaxdZJrlXu21-A' -H 'origin: https://www.gbnews.com' -H 'referer: https://www.gbnews.com/watch/live' -H 'sec-ch-ua: "Not.A/Brand";v="8", "Chromium";v="114"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' -H 'x-client-data: CLjwygE=' --data-raw 'cust_params=autoplay%253Dclick%2526muted%253D0%2526platform%253Dweb&description_url=https%3A%2F%2Fwww.gbnews.com%2Fwatch%2Flive&url=https%3A%2F%2Fwww.gbnews.com%2Fwatch%2Flive&vpmute=0&vpa=click&gdpr=0&gdpr_consent=null&sas=0&ctv=0&correlator=2741083640448245&ptt=20&osd=2&sdr=1&sdki=445&sdkv=h.3.579.0&uach=WyJMaW51eCIsIjYuMS4wIiwieDg2IiwiIiwiMTE0LjAuNTczNS4xOTgiLFtdLDAsbnVsbCwiNjQiLFtbIk5vdC5BL0JyYW5kIiwiOC4wLjAuMCJdLFsiQ2hyb21pdW0iLCIxMTQuMC41NzM1LjE5OCJdXSwwXQ..&eid=44752657%2C44765701%2C44772139%2C44773379%2C44777649%2C44781409%2C44781753%2C44782991%2C44788275&frm=0&omid_p=Google1%2Fh.3.579.0&sdk_apis=7%2C8&sid=08C08789-99ED-4DB7-8849-EA116D1FC491&a3p=EloKDWNyd2RjbnRybC5uZXQSQDI4Nzg5Y2NmNzRmNTgwOTFmYzQyMzUyMmZhOWIxNmQ1MzkzODE3NjBlOWEyNThlNzM5M2NiYTNlYWUzZDhiNmQYnKzw4JMxSAASwgEKCHJ0YmhvdXNlEqwBMXUxazc4bVI2VTVqcG9pK0k4ZkdzWnZHL05rVElkdmhxMmJuSmtmbkhPUFkvSXE2MzVNTlVzTHI0Qm1FaUdmUTFQWlBwUHMyQkEyZjlBeVhMUE9zdHpOY3RJSVc4bGV1U01ZSDk1YXhhUVJEZ1VWTTFZWjh6Uzk5dGt3NUtTMElwSWZMdE9sU08rY0gxQ2Vwc3dIWFlYVVlxMkpuRmhPa2YrQlg1Q1VubWFNPRj3sfDgkzFIABIbCgwzM2Fjcm9zcy5jb20Yv8LjvZMxSABSAghkEhQKBW9wZW54GO-x8OCTMUgAUgIIbxLkAQoOZXNwLmNyaXRlby5jb20SxAFhaWY1SVY5aEpUSkdKVEpHU21WalRVaGFXakIwSlRKR0pUSkdSV1ZZVGtwTVQxaHdXV2xsZDFZMGREVTJZVmRKYlRKbFQyb3lhRWMwVkhWRVUwTnRZVEVsTWtZMU4wWm5aMVZKTUZsNVlreHRXV3RVTmt0dmJrOXliWGRyUVVsQlpYRTJKVEpDUVZSSk1tSjRabXR4VjBnMlZHNUlZMkp5UXlVeVJtTjVPSGxTVmpoSU5WVlRlREkzWWxRMFRrZzFSVmx6GJ2s8OCTMUgAUgIIZA..&ssss=gima&cookie=ID%3D7446f9c74e822370%3AT%3D1688857015%3ART%3D1688930617%3AS%3DALNI_MYk3DBP4XknqjYzJTMJK0YgBrXh7g&manifest-type=hls' --compressed | cut -d \: -f 2,3 | cut -d \" -f 2 )"
  link="$( curl 'https://videostitcher.googleapis.com/v1/projects/gbn-video-stitcher/locations/europe-west1/liveSessions' -H 'authority: videostitcher.googleapis.com' -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'authorization: Bearer ya29.c.b0Aaekm1LgIZpP6sH5o5-XzaSQvePW5Yi4OJSP0ai1bMWAfpmoL3v5fgy05yvPTgBBaWrm0oTo4sj71ZywXgdSAQSjLBv4YQU9eLtckDHCZeLH5SN23UkC89zd3rpVU2eITXwNW2yEXMDj2UMNEYtL-LvTPpf_b01ZRljLZ5LG0ySrwr6Hk-NB_ctK3BrERUjcFEaLnIg-OPHJFLGZXiPgtJojnVjf8CG95dN1oFx51Vv-Fr9Drs3-xvbc3fr4eau90K6Svsjoe2X_A73LBiezTRsBTUYLjAWpTq9hd3Os4BHzfHv0awkcHv21vqTZEC4JU5XzS_qm_EUL340C639cUrOFbclYy3w3kknw8qizuc_MpS6pb9j5l62ceYeW5wfR7V9r3OOIBnqb-u-QlsstgRlz1cgold199z1VQ8y3cBB6FkzIUJBr-n3IJQWsvgtkpfir5-jX0nQMbOx3h8loi4huyrfhzchVxr8zwjeo2FV0z41asgzBdiSu7-eJXaco42-844Rsum12jXXkSd9IizSI1c71tapFWVZenx9dSBdpRfsbn4qlhOxYaJjRkk91fYsBiohnUnxnoWoFbUX4tXZkSr9S13tBlylajawxmZVbbopfYh7xIt8WzQFMrnSsny0p0J-zhORIijvkwOZcru7dQqgl92_1kWUWFBZ77__yZklqMbIh1d6M-Is8M-FiQXd883zbx05MFospRSWIcz00jgSp-gXi5koRWqW_-fperXaz8vzg1YmvQw6Jyz4QVjQS79Z50QMx9o6joa2sf-4lJIFZcilXq4gQ3x1sVR6O8kjzFoj_R3eV4h8IzSJJu8W-0ak4BtXau-jFu6tXdzuaRRVzz1vf3vZ6-OkbrObFzwrQsFUrZ0rgwkoWitpIIjQ0oeO2bytjnk_x3pVMx_lptbuIfZqBXz7tJFpjRkajXduB6o_fantiXZ1MrJ3t4bW5Xtnv0w9Wx-xyh4nbhVtnF4BzYh3wn3Y12gfru76e6jdIrwbF5ms' -H 'content-type: application/json' -H 'origin: https://www.gbnews.com' -H 'referer: https://www.gbnews.com/watch/live' -H 'sec-ch-ua: "Not.A/Brand";v="8", "Chromium";v="114"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' -H 'x-client-data: CLjwygE=' --data-raw '{"live_config":"projects/gbn-video-stitcher/locations/europe-west1/liveConfigs/gbnews-3-v8","gam_settings":{"stream_id":"$stream_id"}}' --compressed | cut -d \{ -f 2 | cut -d } -f 1 | head -n 3 | tail -n 1 | cut -d \" -f 4 )"
}

googleGBNews2(){
link="$( curl "https://videostitcher.googleapis.com/v1/projects/gbn-video-stitcher/locations/europe-west1/liveSessions" -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'authorization: Bearer ya29.c.c0ASRK0GZ3KyolxoKzbl4ShT13EJ0o8LfflDipJ3CeNvl0acWkMJdCTd6Wh3buxYtYdoHPA3U7EVrAo-GNL0l3dLn-7_TYQToM_eX3kJrftYhO7pwf6oCQT7uel9TnFlJpCcSVk-TWi1rtob1aQpUIk0-Bhmdd_9ecjQ7h1ZbKXDdO-BitWfcuTnChIdfl1bD7_fUiHNXK8eUHwSg6CGNuvdd22mnbovuXagsk94GaxfF5C8NqrMXQxIfW5Mivg8eP0vfmRrXSSmYTa8MaL9i0tHpJTHllnWv4O0pDCvv58lpw2iU5rkvdoguOojwN_J1RTalevsKfVVO4dS0_VmWxmXSk4FVTNDlFCcdKkYc582UDWv4CKlDPXLDiH385AyJ2kf8oBU0ww62FRldhFOi065ZBup5vqI-QO64d2fz5g91hxo21k7eYVfhI9S2mShrOFzXOyQfdraes-aXouIhBs2XRQpjZyQFnnvBSSdYBOp4IQ2Mgtsy3o5XJskz--RpfVSztjr75v7ngRysrXB1k4aZlznd5XZ5OwxFi-utxlWcQVwow08w3W7sMSFc5lIwvynq8rFjy8IXnhwdQk6lcur7JYy163aod3RpiclR-9jVs3vf_Mfv5zgbvkBbS8a_O36tSrjdtRiu51J5Q9igS9V-fsQYB__p9vFuydM6MqM5xvj78axjfRdgzW0skow7mkw_-mY9cS6tzcuV8VZ3le2w_6OF190t1UJOag2a0MSFvoh66dhbhe2xcSntB0SpOYoYYgvQFlps--rJdzq8ZyYkuXjmuVFwmybtkbJ3n_nn53J2vQ3R-lzO_uMMcF3exf4eYm0brgdmijf3Zbqe14dW4d31_evn5e0bh3WQjWzikf9aWU-iy0ModSue9-lsUxBbWgfXpwxlF_o8kk5yzXdiY3t59JsqfaWYkI-ZlsaJvURWmRem1q125X3Si5B5uBt41-v96aejpWRo-tWUeQujQUn1SWa8lq4moiya8sxZvi3hek47mm__'   -H 'content-type: application/json' -H 'origin: https://www.gbnews.com' -H 'priority: u=1, i' -H 'referer: https://www.gbnews.com/watch/live' -H 'sec-ch-ua: "Not/A)Brand";v="8", "Chromium";v="126"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty'-H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'   -H 'x-client-data: CLjwygE=' --data-raw '{"live_config":"projects/gbn-video-stitcher/locations/europe-west1/liveConfigs/gbnews-3-v7","gam_settings":{"stream_id":"b688d28e-8292-4d22-86be-c152750da203:TUL"}}' | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /playUri/  )  print $(i+2) } ' )"
}

googleGrab(){
base="$(curl "https://pubads.g.doubleclick.net/ssai/event/"$eventID"/streams"   -H 'authority: pubads.g.doubleclick.net'   -H 'accept: */*'   -H 'accept-language: en-US,en;q=0.9'   -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8'   -H 'origin: "$website"'   -H 'referer: "$website"'   -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102"'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-ch-ua-platform: "Linux"'   -H 'sec-fetch-dest: empty'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-site: cross-site'   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.115 Safari/537.36'   --data-raw ''   --compressed | cut -d \: -f 6,7 | cut -d \" -f 1)"
link=https:"$base"
}

googleGrab2(){
base="$(curl "https://pubads.g.doubleclick.net/ssai/event/"$eventID"/streams" -H 'authority: pubads.g.doubleclick.net' -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' -H "origin: "$website"" -H "referer: "$website"" -H 'sec-ch-ua: "Chromium";v="104", "/Not)A;Brand";v="24", "Microsoft Edge";v="104"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.20 Safari/537.36 Edg/104.0.1293.5' --data-raw "cust_params=ppid="$ppid"&api-key="$api_key"" --compressed | cut -d \: -f 6,7 | cut -d \" -f 1)" 
link=https:"$base"
}

googleGrab3(){
base="$(curl "https://pubads.g.doubleclick.net/ssai/event/"$eventID"/streams" -H 'authority: pubads.g.doubleclick.net' -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' -H "origin: "$website"" -H "referer: "$website"" -H 'sec-ch-ua: "Chromium";v="104", "/Not)A;Brand";v="24", "Microsoft Edge";v="104"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.20 Safari/537.36 Edg/104.0.1293.5' --data-raw "cust_params=ppid="$ppid"&api-key="$api_key"" --compressed | cut -d \: -f 6,7 | cut -d \" -f 1)" 
#base="$(curl "https://pubads.g.doubleclick.net/ssai/event/"$eventID"/streams" -H 'accept: */*' -H 'accept-language: en-US,en;q=0.9' -H 'content-type: application/x-www-form-urlencoded;charset=UTF-8' -H 'cookie: receive-cookie-deprecation=1; APC=AfxxVi7AhVpiVL__th3cU8NrCurlsNjGmSlCt7t1BnaU-pXF7qAMKA' -H 'origin: https://gem.cbc.ca' -H 'priority: u=1, i' -H 'referer: https://gem.cbc.ca/' -H 'sec-ch-ua: "Not/A)Brand";v="8", "Chromium";v="126"' -H 'sec-ch-ua-mobile: ?0'-H 'sec-ch-ua-platform: "Linux"' -H 'sec-fetch-dest: empty' -H 'sec-fetch-mode: cors' -H 'sec-fetch-site: cross-site' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36' -H 'x-client-data: CLjwygE=' --data-raw 'description_url=https%3A%2F%2Fgem.cbc.ca%2Flive%2F7884&url=https%3A%2F%2Fgem.cbc.ca%2Flive%3Fautoplay%3D1&correlator=966980880638249&ppid=da23187f46d43d7f884508784adf329a3b7788b1990df76bac572a4d1aee8b39&env=vp&gdfp_req=1&unviewed_position_start=1&ad_rule=1&hl=en&sz=320x240&label=viewable_impression&pp=web-app&scp=bu%3Dgem&output=xml_vast4&vpi=0&ifa_type=ppid%2Fsessionid&lmt=1&cust_params=plat%3Dott%26ut%3Dpre%26player%3Dxlarge%26device%3Dweb-app%26site%3Dgem%26channel%3DGem%26avdur%3D000&api-key=0A753C2A9BE994A75562DD9EAE366396307A3E2F489D692A561E2D3665AB1069&sas=0&ctv=0&ptt=20&osd=2&sdr=1&sdki=41&sdkv=h.3.650.0&uach=WyJMaW51eCIsIjYuMS4wIiwieDg2IiwiIiwiMTI2LjAuNjQ3OC4xMjYiLG51bGwsMCxudWxsLCI2NCIsW1siTm90L0EpQnJhbmQiLCI4LjAuMC4wIl0sWyJDaHJvbWl1bSIsIjEyNi4wLjY0NzguMTI2Il1dLDBd&ua=Mozilla%2F5.0%20(X11%3B%20Linux%20x86_64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F126.0.0.0%20Safari%2F537.36&eid=31078663%2C31078670%2C95322027%2C95326337%2C95331589%2C95332046%2C95336957&frm=0&omid_p=Google1%2Fh.3.650.0&sdk_apis=7&wta=0&sid=5F7E49C7-F19F-4C0B-B15C-B07FC32D3749&ssss=gima&ref=https%3A%2F%2Flogin.cbc.radio-canada.ca%2F&cookie=ID%3De86a553b6a8b007a%3AT%3D1716458888%3ART%3D1720498235%3AS%3DALNI_MbJEe00_7AIbH7At9QsUCpNi9rstA'
link=https:"$base"
}

youTubeGrab()
{
## current link grabbing formula
base="$(curl -A "$UA"  "$channelURL"| grep "$keyword" | grep "watch?v=" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /videoId/  )  print $(i+2) } '| head -n 1)"
#echo "$base"
link="https://www.youtube.com/watch?v="$base""
}

youTubeGrab2()
{
## current link grabbing formula
base="$(curl -A "$UA"  "$channelURL"| grep "$keyword" | grep "watch?v=" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /videoId/  )  print $(i+2) } '| tail -n 1)"
#echo "$base"
link="https://www.youtube.com/watch?v="$base""
}

youTubeGrab3()
{
## current link grabbing formula
base="$(curl -A "$UA" "$channelURL"| grep -E "$keyword" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /videoId/  )  print $(i+2) } '| head -n 1)"
#echo "$base"
link="https://www.youtube.com/watch?v="$base""
}

youTubeNBCGrab()
{
position="$1"
## current link grabbing formula
base="$(curl -A "$UA" "$channelURL"| grep -E "$keyword" | awk -v a="$keyword" 'BEGIN { FS="\"" }  { for (i=1 ; i<=NF ; i++ )   if ( $i~/videoId/ && $(i+16)~/a/ )  print $(i+2) } ' | uniq | head -n "$position" |tail -n 1)"
## echo "$base"
link="https://www.youtube.com/watch?v="$base""
}

KSAGrab(){
# set the link
link="$(curl $channelURL | cut -d \{ -f 5 | cut -d \: -f 2,3 | cut -d \, -f 1 | sed 's/[\\"]//g')"
}

liveStreamGrab(){
## set the link
link="$( curl -A "$UA" "$channelURL" | grep "secure_play_url" | awk ' BEGIN { FS="\"" } { for (i=1 ; i<=NF ; i++ )  if ( $i ~ /secure_m3u8_url/ && $(i+2) ~ /broadcasts/  )  print $(i+2) } ' | cut -d \? -f 1  | head -n 1  )"
}

#######################################################################
dump_channels()
{
channel_counter=1
while [ "$channel_counter" -lt "$max_chan" ]
do
 channel_select "$channel_counter"
 echo "Channel #"$channel_counter" "$chan_name""
 sleep 1
 ## pipe this into more once the channel link get is supressed
 channel_counter=$( expr "$channel_counter" + 1 )
done
}


cmat_ng()
{
clear
echo "========================================="$product"  "$version"  ========================================================"
echo "||  ENGLISH  ||  ENGLISHII  ||  FRANCAIS  ||   ESPANOL   ||   E.EUROPE   ||   S.EUROPE   ||   ARABIC   ||"
echo "================================================================================================================"

channel_counter=1
while [ "$channel_counter" -lt 41 ]
do
 channel_select "$channel_counter"
 Column1=""$channel_counter") "$TAG""
 channel_select $( expr "$channel_counter" + 40 )
 Column2=""$( expr "$channel_counter" + 40 )")"$TAG""
 channel_select $( expr "$channel_counter" + 80 )
 Column3=""$( expr "$channel_counter" + 80 )")"$TAG""
 channel_select $( expr "$channel_counter" + 120 )
 Column4=""$( expr "$channel_counter" + 120 )")"$TAG""
 channel_select $( expr "$channel_counter" + 160 )
 Column5=""$( expr "$channel_counter" + 160 )")"$TAG""
 channel_select $( expr "$channel_counter" + 200 )
 Column6=""$( expr "$channel_counter" + 200 )")"$TAG""
 channel_select $( expr "$channel_counter" + 200 )
 Column7=""$( expr "$channel_counter" + 240 )")"$TAG""
 echo ""$Column1" "$Column2" "$Column3" "$Column4" "$Column5" "$Column6" "$Column7" "
 ## pipe this into more once the channel link get is supressed
 channel_counter=$( expr "$channel_counter" + 1 )
done
}

######################### Function to check the menu status and deal with user input ###################################################
menu_status()
{
input=$1
if [ "$input" = "" ]
then
chan_state="return"
menstat="no"
elif [ "$input" = "q" ]
then
menstat="yes"
menu="q"
elif [ "$input" = "Q" ]
then
menstat="yes"
menu="q"
elif [ "$input" = "n" ]
then
menstat="yes"
menu="n"
elif [ "$input" = "N" ]
then
menstat="yes"
menu="n"
elif [ "$input" = "b" ]
then
menstat="yes"
menu="b"
elif [ "$input" = "B" ]
then
menstat="yes"
menu="b"
elif [ "$input" = "m" ]
then
menstat="yes"
menu="m"
elif [ "$input" = "M" ]
then
menstat="yes"
menu="m"
elif [ "$input" = "ua-tor" ]
then
menstat="yes"
menu="$menu"
uastate="tor"
uamode="on"
elif [ "$input" = "ua-row1" ]
then
menstat="yes"
menu="$menu"
uastate="row1"
uamode="on"
elif [ "$input" = "ua-rand" ]
then
menstat="yes"
menu="$menu"
uastate="rand"
uamode="on"
elif [ "$input" = "ua-ranstr" ]
then
menstat="yes"
menu="$menu"
uastate="ranstr"
uamode="on"
elif [ "$input" = "ua-off" ]
then
menstat="yes"
menu="$menu"
uastate="off"
uamode="off"
elif [ "$input" = "+" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "]" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "]]" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "++" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "+++" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "++++" ]
then
menstat="no"
chan_state="+"
elif [ "$input" = "-" ]
then
menstat="no"
chan_state="-"
elif [ "$input" = "[" ]
then
menstat="no"
chan_state="-"
elif [ "$input" = "[[" ]
then
menstat="no"
chan_state="-"
elif [ "$input" = "--" ]
then
menstat="no"
chan_state="-"
elif [ "$input" = "---" ]
then
menstat="no"
chan_state="-"
elif [ "$input" -le "$max_chan" ]
then
menstat="no"
chan_state="numeric"
else
menstat="no"
chan_state="alpha"
fi
}

############################## Function for Channel Menu Switching, m,n,q channel matrix display
menu_switch()
{
input=$1
case "$input" in
q) echo "Type endstream to restart program. Bye."
exit "$?" ;;
s)
men_num="$men_num"
channel_matrix_"$men_num"
menu="s"
echo "Please Select a Number corresponding to a Media Stream, press + or ] to increment, - or [ to decrement, n for the next menu, or q to quit:" ;;
m)
men_num=0
channel_matrix_"$men_num"
menu="s"
echo "Please Select a Number corresponding to a Media Stream, press + or ] to increment, - or [ to decrement, n for the next menu, or q to quit:" ;;
n)
men_num=$(expr "$men_num" + 1)
men_num=$(expr "$men_num" % "$max_menu" )
channel_matrix_"$men_num"
menu="s"
echo "Please Select a Number corresponding to a Media Stream, press + or ] to increment, - or [ to decrement, m for the main menu, n for the next menu, b for previous menu, or q to quit:" ;;
b)
men_num=$(expr "$men_num" - 1)
if [ "$men_num" -ge 0 ]
then
men_num=$(expr "$men_num" % "$max_menu")
else
men_num=0
fi
channel_matrix_"$men_num"
menu="s"
echo "Please Select a Number corresponding to a Media Stream, press + or ] to increment, - or [ to decrement, m for the main menu, n for the next menu, b for previous menu, or q to quit:" ;;

esac
}

################################ Function to set the channel number
set_channel()
{
chan_state=$1
if [ "$chan_state" = "+" ]
then
num=$(expr "$num" + 1 )
num=$(expr "$num" % "$max_chan" )
elif [ "$chan_state" = "-" ]
then
num=$(expr "$num" - 1 )
if [ "$num" -gt 0 ]
then
num=$(expr "$num" % "$max_chan" )
else
num=1
fi
elif [ "$chan_state" = "return" ]
then
num="$num"
elif [ "$chan_state" = "numeric" ]
then
num="$entry"
else
num="$num"
fi
}

################################# Function to select the user agent
select_agent()
{
if [ "$uamode" = "on" ]
 then
   if [ "$uastate" = "rand" ]
   then
    # pick a random user agent
    UA=$( grep -v "#" "$USERAGENTS" | shuf -n 1 )
   elif [ "$uastate" = "ranstr" ]
   then
     # make a random string as the user agent
     bytes="$( expr 12 + $(head -c 2 /dev/urandom | od -A n -i) % 48 | awk '{print $1}')"
     UA="$( head -c "$bytes" /dev/urandom | base64 -i | tr -d "\n=+-\/" | tr -s " " | awk '{print $1}')"
   elif [ "$uastate" = "tor" ]
   then
     UA="$UA_torbrowser"
   elif [ "$uastate" = "row1" ]
   then
     UA=$( grep -v "#" "$USERAGENTS" | head -n 1 )
   else
     UA=""
   fi
 fi
}


######################## FUNCTION FOR PLAYING MEDIA STREAM CHANNELS #############################
play_channel()
{
if [ "$menstat" = "no" ]
then
getlink=1
channel_select "$num"
echo "$chan_name Channel $num"

  if [ "$uamode" = "on" ]
  then
  echo "$UA"

    if [ "$use_cookies" = "yes" ]
    then
    echo "Fetching Cookie, Please Wait..."
    curl -A "$UA" --cookie-jar "$cookie" --silent "$link"  >  /dev/null 2>&1
    mpv --user-agent="$UA" --ytdl-format="$format" --no-resume-playback --cache="yes" --fullscreen --loop-playlist=inf --stream-lavf-o=timeout=10000000 --cookies  --cookies-file "$cookie" --aid="$audio_track" --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    # clear the cookie
    echo " " > "$cookie"
    elif [ "$method" = "Streamlink" ]
    then
    streamlink --player "mpv --user-agent="$UA" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" " "$link"  "$format"
    elif [ "$method" = "Tor" ]
    then
    torsocks -a "$torsocks_ip" -P "$torsocks_port" -i mpv --user-agent="$UA" --ytdl-format="$format" --no-resume-playback --loop-playlist=inf --cache="yes"  --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    elif [ "$method" = "Tor-Streamlink" ]
    then
    torsocks -a "$torsocks_ip" -P "$torsocks_port" -i streamlink --player "mpv --user-agent="$UA" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num"" "$link"  "$format"
    elif [ "$method" = "Proxychains" ]
    then
    proxychains mpv --user-agent="$UA" --ytdl-format "$format" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    else
    mpv --user-agent="$UA" --ytdl-format="$format" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    fi
  else

    if [ "$use_cookies" = "yes" ]
    then
    echo "Fetching Cookie, Please Wait..."
    curl --cookie-jar "$cookie" --silent "$link"  >  /dev/null 2>&1
    mpv --ytdl-format="$format" --no-resume-playback --cache="yes" --aid="$audio_track" --fullscreen --loop-playlist=inf --stream-lavf-o=timeout=10000000 --cookies  --cookies-file "$cookie" --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    # clear the cookie
    echo " " > "$cookie"
    elif [ "$method" = "Streamlink" ]
    then
    streamlink --player "mpv --user-agent="$UA" --no-resume-playback --loop-playlist=inf --cache="yes" --fullscreen --screen="$screen_num""  "$link"  "$format"
    elif [ "$method" = "Tor" ]
    then
    torsocks -a "$torsocks_ip" -P "$torsocks_port" -i mpv --user-agent="$UA" --ytdl-format="$format" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    elif [ "$method" = "Tor-Streamlink" ]
    then
    torsocks -a "$torsocks_ip" -P "$torsocks_port" -i streamlink --player "mpv --user-agent="$UA" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" " "$link"  "$format"
    elif [ "$method" = "Proxychains" ]
    then
    proxychains mpv --user-agent="$UA" --ytdl-format "$format" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    else
    mpv --ytdl-format="$format" --no-resume-playback --loop-playlist=inf --cache="yes" --aid="$audio_track" --fullscreen --screen="$screen_num" --fs-screen="$fs_screen_num" "$link"
    fi

  fi
clear
menu_switch "$menu"
echo "You were watching "$chan_name" on Channel "$num" "
chan_state="normal"
format=""
method=""
audio_track="1"
read entry
else
clear
menu_switch "$menu"
chan_state="normal"
menstat="no"
format=""
method=""
read entry
fi
}

### Some more commands to add
# mpv --http-header-fields='Field1: value1','Field2: value2'
# --tls-verify
# --referrer=<string>
# --cache-secs=<seconds>
# --cache-file-size=<kBytes>
# --cache-pause  --cache=<kBytes|yes|no|auto>
# https://mpv.io/manual/master/
################################################ MAIN PROGRAM #####################################################################


######################### Deal with shell arguments ################################################
for arg in $@
do
 if [ "$arg" = "--help" ]
 then
   echo "ENDSTREAM: watch news live-streams in CLEARNET from youtube using youtube-dl and mpv"
   echo "Type in the terminal $ endstream "
   echo "Now read the list and pick a number,input it and press enter."
   echo ""
   echo "USAGE:"
   echo "$ endstream --help         # usage messages"
   echo "$ endstream --version      # print version information"
   echo "$ endstream --list-matrix  # channel list in matrix format"
   echo "$ endstream --list-all     # channel list in column format"
   echo "$ endstream --ua-tor       # use tor-browser user-agent"
   echo "$ endstream --ua-rand      # use random user-agent from user_agents.txt "
   echo "$ endstream --ua-ranstr    # use a random string as the user agent"
   echo "$ endstream  55            # use channel number in command line"
   echo "$ endstream  "
   shift
   exit 0
   elif [ "$arg" = "--version" ]
   then
   echo "ENDSTREAM: version: "$version", branch: "$branch" , revision date: "$rev_date" "
   echo "Copyright: The Endware Development Team, 2016"
   shift
   exit 0
   elif [ "$arg" = "--list-matrix" ]
   then
   clear
   channel_matrix_0
   sleep 2
   clear
   channel_matrix_1
   sleep 2
   clear
   channel_matrix_2
   sleep 2
   clear
   channel_matrix_3
   sleep 2
   clear
   channel_matrix_4
   sleep 2
   clear
   channel_matrix_5
   exit 0
   elif [ "$arg" = "--list-all" ]
   then
   # more "$chan_columns"
   getlink=0
   dump_channels
   exit 0
   elif [ "$arg" = "--testmat" ]
   then
   getlink=0
   cmat_ng
   exit 0
   elif [ "$arg" = "--ua-rand" ]
   then
   uastate="rand"
   uamode="on"
   shift
   elif [ "$arg" = "--ua-ranstr" ]
   then
   uastate="ranstr"
   uamode="on"
   shift
   elif [ "$arg" = "--ua-tor" ]
   then
   uastate="tor"
   uamode="on"
   shift
   elif [ "$arg" = "--ua-row1" ]
   then
   uastate="row1"
   uamode="on"
   shift
   elif [ "$arg" = "--no-agent" ]
   then
   uamode="off"
   shift
   elif [ "$arg" = "--no-header" ]
   then
   headmode="off"
   shift
 fi
done

########################################### FIRST RUN  ####################################################################
clear

## select the user agent
select_agent

# initialize menu and channels
menu="s"
men_num=0
entry=1
num=1
format="best"

running=1

############## USER INPUT FIRST RUN  ###################################
##  If input is non empty display and select
if [ "$1" != "" ]
then
  echo "$1"
  # take channel input from command line
  entry="$1"
elif [ "$1" = "" ]  # else redisplay the channel matrix at previous page and ask for user input
then
  channel_matrix_"$men_num"
  echo "Please Select a Number corresponding to a Media Live Stream:"
  read entry
  if [ "$entry" = "q" ]
  then
   echo "Type endstream to open a new stream."
   exit "$?"
  elif [ "$entry" = "" ]
  then
   entry=1
   num=1
  fi
fi

### DECIDE WHAT THE USER INPUT IS
menu_status $entry

### Case to remove void input on channel +/- at first selection
if [ "$chan_state" = "+" ]
then
chan_state="return"
entry=1
num=1
elif [ "$chan_state" = "-" ]
then
chan_state="return"
entry=1
num=1
fi

### Select the channel number to play
set_channel $chan_state
### Play the media stream
play_channel

## return to base level
format=""
method=""

############################# MENU LOOP  #######################################################3
## While loop to keep menu up after each stream
while [ "$entry" != "q" ]
do
  ## select the user agent
  select_agent
  ### Check the user input and decide what it is
  menu_status $entry
  ### Set the channel number
  set_channel "$chan_state"
  #### Call function to play the channel
  play_channel
done
############################## END OF MENU LOOP #################################################

echo "Type endstream to open a new stream."

### Remove any existing cookies
if [ -e "$cookie" ]
then
rm "$cookie"
fi

exit "$?"

############################################     END OF PROGRAM      ############################################################
