??       ?     ?   ?  <      ?   ~  ?  p  x   ?  ?   F  ?   I  ?     )   0  I     z     ?     ?   ,  ?     ?   %     ,  1   -  ^      ?   &  ?     ?     ?   L     J  a   -  ?   5  ?   (     L  9     ?   D  ?   ?  ?   B  %   D  h     ?   I  ?   =     A  U   J  ?   =  ?   8      9  Y   C  ?   F  ?   (     @  G   B  ?   M  ?   K     8  e   ,  ?   J  ?   9     /  P   0  ?   K  ?   $  ?   G  "   )  j  V  ?   9  ?     %   G  D   A  ?   <  ?   .     C  :   ,  ~   ?  ?   <  ?   E   (   B   n   %   ?   5   ?   F  !   .  !T   >  !?   >  !?   A  "   8  "C   3  "|   #  "?   /  "?   D  #   /  #I   4  #y   ?  #?   !  $?     $?   !  $?     $?   I  %   &  %_     %?     %?   I  %?   1  &   &  &9     &`     &w     &?     &?   $  &?     &?     &?     '     '+     '4     'N     'm   #  '}     '?   '  '?   ?  '?   =  (?   '  (?     (?     )   %  )     )=     )R     )d     )v     )?   "  )?   4  )?     )?   .  *
   "  *9   (  *\   *  *?     *?   )  *?   !  *?   '  +   )  +7     +a     +x      +?      +?     +?     +?   	  ,   A  ,
     -L     -_     -d     -y   1  -?   2  -?   0  -?     .!   #  .<     .`   )  .|   1  .?   -  .?     /     /"     /7     /J     /[     /i   "  /?   %  /?     /?     /?     /?     /?   	  0     0     0&     0-     0<     0L   !  0k     0?     0?     0?   
  0?     0?  u  0?   ?  2Y  c  2?   ?  4@   I  5   E  5N     5?   +  5?      5?   #  6     6%   0  6E   #  6v   ,  6?   0  6?   1  6?   &  7*   *  7Q      7|      7?   _  7?   a  8   )  8?   d  8?   ,  9   k  9<      9?   H  9?   l  :   O  :   n  :?   $  ;>   L  ;c   O  ;?   M  <    d  <N   C  <?   @  <?   F  =8   A  =   b  =?   ,  >$   <  >Q   R  >?   P  >?   J  ?2   <  ?}   3  ??   N  ??   Y  @=   @  @?   4  @?   y  A   -  A?   D  A?   0  A?  z  B+   6  C?   '  C?   W  D   ;  D]   C  D?   =  D?   D  E   0  E`   :  E?   J  E?   K  F   N  Fc   (  F?   A  F?   K  G   :  Gi   5  G?   >  G?   <  H   9  HV   G  H?   &  H?   9  H?   D  I9   5  I~   C  I?   ?  I?     J?   %  J?   (  K    $  KI   k  Kn   1  K?     L   &  L&   P  LM   F  L?   -  L?     M     M0     MO     Mn   -  M?     M?     M?     M?     N	     N     N0     NP   )  Nb     N?   9  N?   ?  N?   3  O?   7  O?     O?     P   7  P     PK     Pc     Py     P?     P?   (  P?   <  P?   $  Q   *  Q?   '  Qj   ;  Q?   /  Q?     Q?   '  R   0  R=   =  Rn   9  R?     R?     S    )  S   )  S;   )  Se   #  S?     S?  ?  S?     U?     U?     U?     U?   A  U?   A  V   C  VW     V?   (  V?     V?   =  W   ?  WA   D  W?      W?     W?     X     X"   	  X6     X@   )  X^   &  X?     X?     X?     X?     X?     X?     X?     Y     Y     Y+   #  Y>     Yb     Y?     Y?     Y?     Y?     Y?      P              ?   Q   V   ?       /          ?   ?          S   ?   ?   ;       o   "   @   ?   F   r                      ?   ?   ?   2      G   1           A       y   O   |   ?   Y   f   )       k   4   ?   ?   g           H   L   0   :      \   `   X       ?          8   %   Z   <       i   #              N   .   ~               ?   ]   q   d          -       {   p       b      6       ?   ?       7   ,          a   B                 
   ?               ?   ?   U       T       ?   t      x   }              s   ?               '   ?   D              [   J       ?   C   ?   ?   =   ?   K   v       !   $   j      ?         ?      ?   9           	   h       ?       ?         ?   M          ?   ?          I   E   ?   ?   ?   _   n   ?      >       ?   ^   &   (       ?   +   W           *       ?      e   R       ?   w      ?       ?       3       c   ?   ?   u   5       z   ?   m   ?   l   ?   ?      ?      Either GFMT or LFMT may contain:
    %%  %
    %c'C'  the single character C
    %c'\OOO'  the character with octal code OOO   GFMT may contain:
    %<  lines from FILE1
    %>  lines from FILE2
    %=  lines common to FILE1 and FILE2
    %[-][WIDTH][.[PREC]]{doxX}LETTER  printf-style spec for LETTER
      LETTERs are as follows for new group, lower case for old group:
        F  first line number
        L  last line number
        N  number of lines = L-F+1
        E  F-1
        M  L+1   LFMT may contain:
    %L  contents of line
    %l  contents of line, excluding any trailing newline
    %[-][WIDTH][.[PREC]]{doxX}n  printf-style spec for input line number   LTYPE is `old', `new', or `unchanged'.  GTYPE is LTYPE or `changed'.   Skip the first SKIP1 bytes of FILE1 and the first SKIP2 bytes of FILE2. %s %s differ: byte %s, line %s
 %s %s differ: byte %s, line %s is %3o %s %3o %s
 %s: diff failed:  %s: illegal option -- %c
 %s: invalid option -- %c
 %s: option `%c%s' doesn't allow an argument
 %s: option `%s' is ambiguous
 %s: option `%s' requires an argument
 %s: option `--%s' doesn't allow an argument
 %s: option `-W %s' doesn't allow an argument
 %s: option `-W %s' is ambiguous
 %s: option requires an argument -- %c
 %s: unrecognized option `%c%s'
 %s: unrecognized option `--%s'
 --GTYPE-group-format=GFMT  Similar, but format GTYPE input groups with GFMT. --LTYPE-line-format=LFMT  Similar, but format LTYPE input lines with LFMT. --binary  Read and write data in binary mode. --diff-program=PROGRAM  Use PROGRAM to compare files. --from-file and --to-file both specified --from-file=FILE1  Compare FILE1 to all operands.  FILE1 can be a directory. --help  Output this help. --horizon-lines=NUM  Keep NUM lines of the common prefix and suffix. --ignore-file-name-case  Ignore case when comparing file names. --line-format=LFMT  Similar, but format all input lines with LFMT. --no-ignore-file-name-case  Consider case when comparing file names. --normal  Output a normal diff. --speed-large-files  Assume large files and many scattered small changes. --strip-trailing-cr  Strip trailing carriage return on input. --tabsize=NUM  Tab stops are every NUM (default 8) print columns. --to-file=FILE2  Compare all operands to FILE2.  FILE2 can be a directory. --unidirectional-new-file  Treat absent first files as empty. -3  --easy-only  Output unmerged nonoverlapping changes. -A  --show-all  Output all changes, bracketing conflicts. -B  --ignore-blank-lines  Ignore changes whose lines are all blank. -D NAME  --ifdef=NAME  Output merged file to show `#ifdef NAME' diffs. -D option not supported with directories -E  --ignore-tab-expansion  Ignore changes due to tab expansion. -E  --show-overlap  Output unmerged changes, bracketing conflicts. -H  --speed-large-files  Assume large files and many scattered small changes. -I RE  --ignore-matching-lines=RE  Ignore changes whose lines all match RE. -L LABEL  --label=LABEL  Use LABEL instead of file name. -N  --new-file  Treat absent files as empty. -S FILE  --starting-file=FILE  Start with FILE when comparing directories. -T  --initial-tab  Make tabs line up by prepending a tab. -W  --ignore-all-space  Ignore all white space. -X  Output overlapping changes, bracketing them. -X FILE  --exclude-from=FILE  Exclude files that match any pattern in FILE. -a  --text  Treat all files as text. -b  --ignore-space-change  Ignore changes in the amount of white space. -b  --print-bytes  Print differing bytes. -c  -C NUM  --context[=NUM]  Output NUM (default 3) lines of copied context.
-u  -U NUM  --unified[=NUM]  Output NUM (default 3) lines of unified context.
  --label LABEL  Use LABEL instead of file name.
  -p  --show-c-function  Show which C function each change is in.
  -F RE  --show-function-line=RE  Show the most recent line matching RE. -d  --minimal  Try hard to find a smaller set of changes. -e  --ed  Output an ed script. -e  --ed  Output unmerged changes from OLDFILE to YOURFILE into MYFILE. -i  --ignore-case  Consider upper- and lower-case to be the same. -i  --ignore-case  Ignore case differences in file contents. -i  Append `w' and `q' commands to ed scripts. -i SKIP  --ignore-initial=SKIP  Skip the first SKIP bytes of input. -i SKIP1:SKIP2  --ignore-initial=SKIP1:SKIP2 -l  --left-column  Output only the left column of common lines. -l  --paginate  Pass the output through `pr' to paginate it. -l  --verbose  Output byte numbers and values of all differing bytes. -m  --merge  Output merged file instead of ed script (default -A). -n  --rcs  Output an RCS format diff. -n LIMIT  --bytes=LIMIT  Compare at most LIMIT bytes. -o FILE  --output=FILE  Operate interactively, sending output to FILE. -q  --brief  Output only whether files differ. -r  --recursive  Recursively compare any subdirectories found. -s  --quiet  --silent  Output nothing; yield exit status only. -s  --report-identical-files  Report when two files are the same. -s  --suppress-common-lines  Do not output common lines. -t  --expand-tabs  Expand tabs to spaces in output. -v  --version  Output version info. -w  --ignore-all-space  Ignore all white space. -w NUM  --width=NUM  Output at most NUM (default 130) print columns. -x  --overlap-only  Output overlapping changes. -x PAT  --exclude=PAT  Exclude files that match PAT. -y  --side-by-side  Output in two columns.
  -W NUM  --width=NUM  Output at most NUM (default 130) print columns.
  --left-column  Output only the left column of common lines.
  --suppress-common-lines  Do not output common lines. Common subdirectories: %s and %s
 Compare files line by line. Compare three files line by line. Compare two files byte by byte. FILES are `FILE1 FILE2' or `DIR1 DIR2' or `DIR FILE...' or `FILE... DIR'. File %s is a %s while file %s is a %s
 Files %s and %s are identical
 Files %s and %s differ
 If --from-file or --to-file is given, there are no restrictions on FILES. If a FILE is `-' or missing, read standard input. If a FILE is `-', read standard input. Invalid back reference Invalid character class name Invalid collation character Invalid content of \{\} Invalid preceding regular expression Invalid range end Invalid regular expression Memory exhausted No match No newline at end of file No previous regular expression Only in %s: %s
 Premature end of regular expression Regular expression too big Report bugs to <bug-gnu-utils@gnu.org>. SKIP values may be followed by the following multiplicative suffixes:
kB 1000, K 1024, MB 1,000,000, M 1,048,576,
GB 1,000,000,000, G 1,073,741,824, and so on for T, P, E, Z, Y. SKIP1 and SKIP2 are the number of bytes to skip in each file. Side-by-side merge of file differences. Success Trailing backslash Try `%s --help' for more information. Unknown system error Unmatched ( or \( Unmatched ) or \) Unmatched [ or [^ Unmatched \{ Usage: %s [OPTION]... FILE1 FILE2
 Usage: %s [OPTION]... FILE1 [FILE2 [SKIP1 [SKIP2]]]
 Usage: %s [OPTION]... FILES
 Usage: %s [OPTION]... MYFILE OLDFILE YOURFILE
 `-%ld' option is obsolete; omit it `-%ld' option is obsolete; use `-%c %ld' `-' specified for more than one input file block special file both files to be compared are directories cannot compare `-' to a directory cannot compare file names `%s' and `%s' cannot interactively merge standard input character special file cmp: EOF on %s
 conflicting %s option value `%s' conflicting output style options conflicting tabsize options conflicting width options directory ed:	Edit then use both versions, each decorated with a header.
eb:	Edit then use both versions.
el:	Edit then use the left version.
er:	Edit then use the right version.
e:	Edit a new version.
l:	Use the left version.
r:	Use the right version.
s:	Silently include common lines.
v:	Verbosely include common lines.
q:	Quit.
 extra operand `%s' fifo incompatible options input file shrank internal error: invalid diff type in process_diff internal error: invalid diff type passed to output internal error: screwup in format of diff blocks invalid --bytes value `%s' invalid --ignore-initial value `%s' invalid context length `%s' invalid diff format; incomplete last line invalid diff format; incorrect leading line chars invalid diff format; invalid change separator invalid horizon length `%s' invalid tabsize `%s' invalid width `%s' memory exhausted message queue missing operand after `%s' options -l and -s are incompatible pagination not supported on this host program error read failed regular empty file regular file semaphore shared memory object socket stack overflow standard output subsidiary program `%s' failed subsidiary program `%s' not found symbolic link too many file label options typed memory object weird file write failed Project-Id-Version: diffutils 2.8.3
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2004-04-13 00:07-0700
PO-Revision-Date: 2004-01-19 17:22+0100
Last-Translator: Andras Timar <timar@fsf.hu>
Language-Team: Hungarian <translation-team-hu@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.2
   GFMT ?s LFMT is tartalmazhatja:
    %%  %
    %c'C'  egyetlen C karakter
    %c'\OOO'  karakter nyolcas sz?mrendszer beli ?rt?ke   GFMT tartalmazhatja:
    %<  a F?JL1 sorait
    %>  a F?JL2 sorait
    %=  a F?JL1 ?s F?JL2 k?z?s sorait
    %[-][WIDTH][.[PREC]]{doxX}BET?  printf-st?lus? form?z?st
      BET? a k?vetkez? lehet az ?j csoportra, kisbet?vel r?gi csoportra:
        F  els? sor sz?ma
        L  utols? sor sz?ma
        N  sorok sz?ma = L-F+1
        E  F-1
        M  L+1   LFMT tartalmazhatja:
    %L  sor tartalma
    %l  sor tartalma, ?j sorral n?lk?l
    %[-][WIDTH][.[PREC]]{doxX}n  bemeneti sorok sz?m?nak printf-st?lus?                                 megad?sa   az LTYPE `old', `new', vagy `unchanged'.  a GTYPE LTYPE vagy `changed'.   ?tl?pi a F?JL1 els? UGR?S1 byte-j?t ?s a F?JL2 els? UGR?S2 byte-j?t %s %s elt?r: byte: %s, sor: %s
 %s %s elt?r: byte %s, sor %s %3o %s %3o %s
 %s: ?sszehasonl?t?s sikertelen:  %s: nem megengedett kapcsol? -- %c
 %s: ?rv?nytelen kapcsol? -- %c
 %s: a `%c%s' kapcsol? nem fogad el argumentumot
 %s: a `%s' kapcsol? nem egy?rtelm?
 %s: a `%s' kapcsol?hoz argumentum sz?ks?ges
 %s: a `--%s' kapcsol? nem fogad el argumentumot
 %s: a `-W %s' kapcsol? nem fogad el argumentumot
 %s: a `-W %s' kapcsol? nem egy?rtelm?
 %s: a kapcsol? argumentumot ig?nyel -- %c
 %s: ismeretlen kapcsol?: `%c%s'
 %s: ismeretlen kapcsol?: `--%s'
 --GTYPE-group-format=GFMT  Hasonl?, de a GTYPE bemeneti csoportokat form?zza a GFMT form?tumra. --LTYPE-line-format=LFMT  Hasonl?, de az LTYPE t?pus? bemeneti sorokat LFMT form?tum?ra form?zza. --binary  Olvas?s ?s ?r?s bin?ris m?dban. --diff-program=PROGRAM  A PROGRAM-ot haszn?lja a f?jlok
                        ?sszehasonl?t?s?hoz. a --from-file ?s a --to-file is meg van adva --from-file=F?JL1  F?JL1 ?sszehasonl?t?sa minden operandussal.
                    F?JL1 lehet k?nyvt?r is. --help  Ki?rja ezt a seg?ts?get. --horizon-lines=SZ?M  SZ?M sz?m? sort tart meg a k?z?s el? ?s ut?tagb?l. --ignore-file-name-case  F?jlnevekn?l nem tesz k?l?nbs?get
                        a kis- ?s nagybet?k k?zt. --line-format=LFMT  Hasonl?, de minden bemeneti sort a LFMT form?tum?ra form?z. --no-ignore-file-name-case  F?jlnevekn?l figyeli a kis- ?s nagybet?k
                        k?zti k?l?nbs?get --normal  A kimenet egy norm?l diff. --speed-large-files  Nagy f?jlokat felt?telez sok, elsz?rt, kis v?ltoz?ssal. --strip-trailing-cr  A bemenetb?l elhagyja a befejez? kocsivissza karaktereket. --tabsize=NUM  Tabul?torpoz?ci? minden NUM. nyomtat?si oszlopban (alapb?l 8). --to-file=F?JL2  Minden operandus ?sszehasonl?t?sa F?JL2-vel.
                 F?JL2 lehet k?nyvt?r. --unidirectional-new-file  A hi?nyz? els? f?jlokat ?resk?nt kezeli. -3  --easy-only  Ki?rja a nem ?tvitt ?s nem ?tfed? v?ltoz?sokat. -A  --show-all  Ki?rja az ?sszes v?ltoz?st, z?r?jelezi az ?tk?z?seket. -B  --ignore-blank-lines  Figyelmen k?v?l hagyja az ?res sorokat. -D N?V--ifdef=N?V  Ki?rja az ?sszef?s?lt f?jlt `#ifdef N?V' direkt?v?kkal jel?lve a k?l?nbs?geket. -D kapcsol? nem t?mogatott k?nyvt?rak eset?n -E  --ignore-tab-expansion  Nem figyeli a tab/sz?k?z cser?t. -E  --show-overlap  Ki?rja az ?t nem vitt v?ltoz?sokat, z?r?jelezi az ?tk?z?seket. -H  --speed-large-files  Nagy f?jlokat felt?telez sok, elsz?rt, kis v?ltoz?ssal. -I RK  --ignore-matching-lines=RK  Nem figyeli a RK-re illeszked? sorokat. -L C?MKE  --label=C?MKE  A C?MK?-t haszn?lja f?jln?v helyet. -N  --new-file  A hi?nyz? f?jlokat ?resk?nt kezeli. -S F?JL  --starting-file=F?JL  A F?JL-lal kezdi a k?nyvt?rak ?sszehasol?t?s?t. -T  --initial-tab  A tabul?torok helyesen jelennek meg a kezd? tabul?tornak k?sz?nhet?en. -W  --ignore-all-space  Figyelmen k?v?l hagy minden ?res helyet.  -X  Ki?rja ?s z?r?jelezi az ?tfed? v?ltoztat?sokat. -X F?JL  --exclude-from=F?JL  Kihagyja a F?JL-ban megtal?lhat? mint?kra
                             illeszked? f?jlokat. -a  --text  Az ?sszes f?jlt sz?vegk?nt kezeli -b  --ignore-space-change  Nem figyeli az ?res helyek v?ltoztat?s?t. -b  --print-bytes  Ki?rja a k?l?nb?z? byte-okat. -c  -C SZ?M  --context[=SZ?M]  SZ?M (alapb?l 3) sor 'm?solt' k?rnyezetet ?r ki.
-u  -U SZ?M  --unified[=SZ?M]  SZ?M (alapb?l 3) sor 'egyes?tett' k?rnyezetet ?r ki.
  --label C?MKE  C?MKE haszn?lata a f?jln?v helyett.
  -p  --show-c-function  Megmutatja, hogy a v?ltoz?s melyik C f?ggv?nyben van.
  -F RK  --show-function-line=RK  Megmutatja a legk?zelebbi RK-ra illeszked? sort. -d  --minimal  Megpr?b?l kevesebb k?l?nbs?get tal?lni. -e  --ed  A kimenet egy ed-parancsf?jl. -e  --ed  A R?GI f?jlb?l az ?J f?jlba ?t nem ker?lt v?ltoz?sokat ki?rja a SAJ?T f?jlba. -i  --ignore-case  A kis- ?s nagybet?ket azonosnak tekinti. -i  --ignore-case  Nem tesz k?l?nbs?get a kis- ?s nagybet?k k?z?tt. -i  Hozz?f?zi a `w' ?s a`q' parancsokat az ed-parancsf?jlhoz. -i UGR?S  --ignore-initial=UGR?S  Az els? UGR?S db byte-ot kihagyja. -i UGR?S1:UGR?S2  --ignore-initial=UGR?S1:UGR?S2 -l  --left-column  A k?z?s sorokat csak bal oldra ?rja ki. -l  --paginate  A kimenet oldalainak a lapokra t?rdel?se a`pr' programmal. -l  --verbose  Ki?rja a byte-ok sz?m?t ?s az ?sszes k?l?nb?z? byte ?rt?k?t. -m  --merge  Az ?sszef?s?lt f?jlt ?rja ki ed-parancsf?jl helyett (alapb?l -A). -n  --rcs  A kimenet RCS form?tum? diff. -n HAT?R  --bytes=HAT?R  Legfeljebb HAT?R byte-ot hasonl?t ?ssze. -o F?JL  --output=F?JL  Interakt?van dolgozik, a kimenetet a F?JL-ba k?ldi. -q  --brief  Csak akkor van kimenet, ha a f?jlok elt?rnek. -r  --recursive  Az ?sszes alk?nyvt?rat megvizsg?lja. -s  --quiet  --silent  Nincs kimenet, csak visszat?r?si ?rt?k. -s  --report-identical-files  Jelenti, ha a k?t f?jl azonos. -s  --suppress-common-lines  Nem ?rja ki a k?z?s sorokat. -t  --expand-tabs  A tabul?torokat sz?k?zzel helyettes?ti a kimenetben. -v  --version  A kimenet a verzi?sz?m. -w  --ignore-all-space  Nem figyel semmilyen ?res helyet. -w SZ?M  --width=SZ?M  Legfeljebb SZ?M sz?les kimenet (alapb?l 130). -x  --overlap-only  Ki?rja az ?tfed? v?ltoztat?sokat. -x MINTA  --exclude=MINTA  Kihagyja a MINT?-ra illeszked? f?jlokat. -y  --side-by-side  A kimenet k?t oszlop.
  -W SZ?M  --width=SZ?M  Legfeljebb SZ?M sz?les kimenet (alapb?l 130).
  --left-column  A k?z?s sorokat csak bal oldalon ?rja ki.
  --suppress-common-lines  Nem ?rja ki a k?z?s sorokat. K?z?s alk?nyvt?rak: %s ?s %s
 F?jlok ?sszehasonl?t?sa sorr?l sorra. H?rom f?jlt hasonl?t ?ssze sorr?l sorra. ?sszehasonl?t k?t f?jlt byte-onk?nt. A F?JLOK lehetnek `F?JL1 F?JL2' vagy `K?NYVT?R1 K?NYVT?R2' vagy
`K?NYVT?R F?JL...' vagy `F?JL... K?NYVT?R'. A(z) %s f?jl egy %s, viszont a(z) %s f?jl egy %s
 %s ?s %s f?jlok azonosak
 A(z) %s ?s a(z) %s f?jlok k?l?nb?znek
 Ha --from-file vagy --to-file meg van adva, nincsenek megszor?t?sok a F?JLOK-ra. Ha a F?JL a `-' vagy hi?nyzik, akkor a szabv?nyos bemenetet haszn?lja. Ha a F?JL `-', a szabv?nyos bemenetr?l olvas. ?rv?nytelen visszahivatkoz?s ?rv?nytelen karakteroszt?lyn?v ?rv?nytelen collation karakter ?rv?nytelen tartalom a \{\}-ben ?rv?nytelen volt az el?z? regul?ris kifejez?s ?rv?nytelen tartom?nyv?g ?rv?nytelen regul?ris kifejez?s Elfogyott a mem?ria Nincs tal?lat Nincs ?jsor a f?jl v?g?n Nincs el?z? regul?ris kifejez?s Csak %s -ben: %s
 A regul?ris kifejez?s t?l hamar ?rt v?get T?l nagy regul?ris kifejez?s A hib?kat <bug-gnu-utils@gnu.org> c?mre k?rj?k jelenteni. Az UGR?S ?rt?kek ut?n a k?vetkez? szorz?ut?tagokat lehet ?rni:
kB 1000, K 1024, MB 1 000 000, M 1 048 576,
GB 1 000 000 000, G 1 073 741 824, ?s ?gy tov?bb: T, P, E, Z, Y. UGR?S1 ?s UGR?S2 byte-ot l?p ?t az egyes f?jlokban. Egym?s mellett jelen?ti a f?jlokat ?s a k?l?nbs?geiket. Siker?lt Z?r? backslash Pr?b?lja a `%s --help' kapcsol?t tov?bbi inform?ci??rt. Ismeretlen rendszerhiba P?r n?lk?li ( vagy \( P?r n?lk?li ) vagy \) P?r n?lk?li [ vagy [^ P?r n?lk?li \{ Haszn?lat: %s [KAPCSOL?]... F?JL1 F?JL2
 Haszn?lat: %s [KAPCSOL?]... F?JL1 [F?JL2 [UGR?S1 [UGR?S2]]]
 Haszn?lat: %s [KAPCSOL?K]... F?JLOK
 Haszn?lat: %s [KAPCSOL?]... SAJ?T R?GI ?J
 a `-%ld' kapcsol? elavult; ne haszn?lja a `-%ld' kapcsol? elavult; haszn?lja a `-%c %ld' kapcsol?t  `-' t?bb mint egy bemeneti f?jlhoz lett megadva blokkos speci?lis f?jl mindk?t ?sszehasonl?tand? f?jl k?nyvt?r `-'-t nem lehet ?sszehasonl?tani egy k?nyvt?rral nem lehet a(z) `%s' ?s a(z) `%s' f?jlneveket ?sszehasonl?tani nem lehet interakt?van ?sszef?zni a szabv?nyos bemenetet. karakteres speci?lis f?jl cmp: EOF %s-n?l
 ?sszef?rhetetlen %s kapcsol? ?rt?ke: `%s' ?sszef?rhetetlen kimenetist?lus-kapcsol?k ?sszef?rhetlen tabul?torm?ret-be?ll?t?sok ?sszef?rhetlen sz?less?gbe?ll?t?sok k?nyvt?r ed:	Szerkeszt?s, majd mind a k?t v?ltozat haszn?lata fejl?cekkel d?sz?tve.
eb:	Szerkeszt?s, majd mind a k?t v?ltozat haszn?lata.
el:	Szerkeszt?s, majd a bal oldali v?ltozat haszn?lata.
er:	Szerkeszt?s, majd a jobb oldali v?ltozat haszn?lata.
e:	?j v?ltozat ?r?sa.
l:	A bal oldali v?ltozat haszn?lata.
r:	A jobb oldali v?ltozat haszn?lata.
s:	Az azonos sorok be?p?t?se figyelmeztet?s n?lk?l.
v:	Az azonos sorok be?p?t?se figyelmeztet?ssel.
q:	Kil?p?s.
 felesleges operandus `%s' fifo ?sszef?rhetetlen kapcsol?k a bementi f?jl ?sszement bels? hiba: ?rv?nytelen ?sszehasonl?t?si t?pus a process_diff-ben bels? hiba: ?rv?nytelen ?sszehasonl?t?si t?pus ker?lt a kimenetre bels? hiba: a program megzavarodott a k?l?nbs?gblokkok form?tum?n?l ?rv?nytelen --bytes ?rt?k `%s' ?rv?nytelen --ignore-initial ?rt?k: `%s' ?rv?nytelen k?rnyezethossz `%s' ?rv?nytelen ?sszehasonl?t?s-form?tum; befejezetlen utols? sor ?rv?nytelen ?sszehasonl?t?si form?tum; rossz sor eleji karakter ?rv?nytelen ?sszehasonl?t?s-form?tum; ?rv?nytelen v?ltoz?selv?laszt? ?rv?nytelen munkaszinthossz `%s' ?rv?nytelen tabul?torm?ret `%s' ?rv?nytelen sz?less?g `%s' elfogyott a mem?ria ?zenetsor hi?nyz? operandus a `%s' ut?n a -l ?s a -s kapcsol?k ?sszef?rhetetlenek a t?rdel?s nem t?mogatott ezen a g?pen programhiba olvas?s sikertelen regul?ris ?res f?jl regul?ris f?jl szemafor osztott mem?riaobjektum socket veremt?lcsordul?s szabv?nyos kimenet `%s' seg?dprogram fut?sa sikertelen `%s' seg?dprogram nem tal?lhat? szimbolikus link t?l sok f?jlc?mke-be?ll?t?s t?pusos mem?ria objektum furcsa f?jl az ?r?s sikertelen 