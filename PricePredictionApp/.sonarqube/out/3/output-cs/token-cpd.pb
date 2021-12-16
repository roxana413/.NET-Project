øe
sC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\DataImporter\HouseDataImporter.cs
	namespace 	
Persistence
 
. 
DataImporter "
{ 
public 

static 
class 
HouseDataImporter )
{ 
public 
static 
IList 
< 
House !
>! "
ReadRecords# .
(. /
string/ 5
filename6 >
,> ?
bool@ D
	hasHeaderE N
=O P
trueQ U
)U V
{ 	
var		 
records		 
=		 
new		 
List		 "
<		" #
House		# (
>		( )
(		) *
)		* +
;		+ ,
var

 
bulkContent

 
=

 
File

 "
.

" #
ReadAllText

# .
(

. /
filename

/ 7
)

7 8
;

8 9
var 
	bulkLines 
= 
bulkContent '
.' (
Split( -
(- .
$str. 2
)2 3
. 
ToList 
( 
) 
; 
if 
( 
	hasHeader 
) 
{ 
	bulkLines 
. 
RemoveAt "
(" #
$num# $
)$ %
;% &
} 
foreach 
( 
var 
line 
in  
	bulkLines! *
)* +
{ 
var 
mappedRecord  
=! "
MapLineToRecord# 2
(2 3
line3 7
)7 8
;8 9
if 
( 
mappedRecord  
!=! #
null$ (
)( )
{ 
records 
. 
Add 
(  
mappedRecord  ,
), -
;- .
} 
} 
return 
records 
; 
} 	
private 
static 
House 
MapLineToRecord ,
(, -
string- 3
line4 8
)8 9
{   	
char!! 
[!! 
]!! 
delimiterChars!! !
=!!" #
{!!$ %
$char!!& )
,!!) *
$char!!+ .
}!!/ 0
;!!0 1
var"" 

properties"" 
="" 
line"" !
.""! "
Split""" '
(""' (
delimiterChars""( 6
,""6 7
StringSplitOptions""8 J
.""J K
RemoveEmptyEntries""K ]
)""] ^
;""^ _
for$$ 
($$ 
int$$ 
i$$ 
=$$ 
$num$$ 
;$$ 
i$$ 
<$$ 

properties$$  *
.$$* +
Length$$+ 1
;$$1 2
i$$3 4
++$$4 6
)$$6 7
{%% 
if&& 
(&& 

properties&& 
[&& 
i&&  
]&&  !
.&&! "
Equals&&" (
(&&( )
$str&&) /
)&&/ 0
)&&0 1
{'' 

properties(( 
[(( 
i((  
]((  !
=((" #
null(($ (
;((( )
})) 
}** 
if,, 
(,, 

properties,, 
.,, 
Length,, !
==,," $
$num,,% &
),,& '
{-- 
return.. 
null.. 
;.. 
}// 
string11 
dateSold11 
=11 

properties11 (
[11( )#
HousesDataDefaultMapper11) @
.11@ A
DateSold_Index11A O
]11O P
;11P Q
string22 
year22 
=22 
$str22 
;22 
string33 
month33 
=33 
$str33 
;33 
string44 
day44 
=44 
$str44 
;44 
for55 
(55 
int55 
i55 
=55 
$num55 
;55 
i55 
<55 
$num55  !
;55! "
i55# $
++55$ &
)55& '
{66 
year77 
+=77 
(77 

properties77 #
[77# $#
HousesDataDefaultMapper77$ ;
.77; <
DateSold_Index77< J
]77J K
.77K L
	ElementAt77L U
(77U V
i77V W
)77W X
)77X Y
;77Y Z
}99 
for;; 
(;; 
int;; 
i;; 
=;; 
$num;; 
;;; 
i;; 
<;; 
$num;;  !
;;;! "
i;;# $
++;;$ &
);;& '
{<< 
month== 
+=== 
(== 

properties== $
[==$ %#
HousesDataDefaultMapper==% <
.==< =
DateSold_Index=== K
]==K L
.==L M
	ElementAt==M V
(==V W
i==W X
+==Y Z
$num==[ \
)==\ ]
)==] ^
;==^ _
day>> 
+=>> 
(>> 

properties>> "
[>>" ##
HousesDataDefaultMapper>># :
.>>: ;
DateSold_Index>>; I
]>>I J
.>>J K
	ElementAt>>K T
(>>T U
i>>U V
+>>W X
$num>>Y Z
)>>Z [
)>>[ \
;>>\ ]
}?? 
month@@ 
+=@@ 
$str@@ 
;@@ 
dayAA 
+=AA 
$strAA 
;AA 
stringBB 
dateBB 
=BB 
monthBB 
+BB  !
dayBB" %
+BB& '
yearBB( ,
;BB, -
stringDD 
priceDD 
=DD 

propertiesDD %
[DD% &#
HousesDataDefaultMapperDD& =
.DD= >
Price_IndexDD> I
]DDI J
;DDJ K
doubleEE 
house_priceEE 
=EE  
$numEE! "
;EE" #
ifFF 
(FF 
priceFF 
.FF 
ContainsFF 
(FF 
$charFF "
)FF" #
)FF# $
{GG 
intHH 
powHH 
=HH 
priceHH 
.HH  
LastOrDefaultHH  -
(HH- .
)HH. /
-HH0 1
$numHH2 4
;HH4 5
house_priceII 
=II 
doubleII $
.II$ %
ParseII% *
(II* +
GetUntilOrEmptyII+ :
(II: ;
priceII; @
,II@ A
$strIIB E
)IIE F
)IIF G
;IIG H
doubleJJ 

multiplierJJ !
=JJ" #
MathJJ$ (
.JJ( )
PowJJ) ,
(JJ, -
$numJJ- /
,JJ/ 0
powJJ1 4
)JJ4 5
;JJ5 6
house_priceKK 
=KK 
house_priceKK )
*KK* +

multiplierKK, 6
;KK6 7
}LL 
elseMM 
{NN 
house_priceOO 
=OO 
doubleOO $
.OO$ %
ParseOO% *
(OO* +

propertiesOO+ 5
[OO5 6#
HousesDataDefaultMapperOO6 M
.OOM N
Price_IndexOON Y
]OOY Z
)OOZ [
;OO[ \
}PP 
boolRR 

waterfrontRR 
=RR 
falseRR #
;RR# $
ifSS 
(SS 

propertiesSS 
[SS #
HousesDataDefaultMapperSS 2
.SS2 3
Waterfront_IndexSS3 C
]SSC D
==SSE G
$strSSH K
)SSK L

waterfrontTT 
=TT 
falseTT "
;TT" #
elseUU 

waterfrontVV 
=VV 
trueVV !
;VV! "
varXX 
recordXX 
=XX 
newXX 
HouseXX "
{YY 
DateSold[[ 
=[[ 
DateTime[[ #
.[[# $

ParseExact[[$ .
([[. /
date[[/ 3
,[[3 4
$str[[5 A
,[[A B
null[[C G
)[[G H
,[[H I
Price\\ 
=\\ 
house_price\\ #
,\\# $
Bedrooms]] 
=]] 
int]] 
.]] 
Parse]] $
(]]$ %

properties]]% /
[]]/ 0#
HousesDataDefaultMapper]]0 G
.]]G H
Bedrooms_Index]]H V
]]]V W
)]]W X
,]]X Y
	Bathrooms^^ 
=^^ 
decimal^^ #
.^^# $
Parse^^$ )
(^^) *

properties^^* 4
[^^4 5#
HousesDataDefaultMapper^^5 L
.^^L M
Bathrooms_Index^^M \
]^^\ ]
)^^] ^
,^^^ _

LivingArea__ 
=__ 
decimal__ $
.__$ %
Parse__% *
(__* +

properties__+ 5
[__5 6#
HousesDataDefaultMapper__6 M
.__M N
LivingArea_Index__N ^
]__^ _
)___ `
,__` a
LotArea`` 
=`` 
decimal`` !
.``! "
Parse``" '
(``' (

properties``( 2
[``2 3#
HousesDataDefaultMapper``3 J
.``J K
LotArea_Index``K X
]``X Y
)``Y Z
,``Z [
Floorsaa 
=aa 
decimalaa  
.aa  !
Parseaa! &
(aa& '

propertiesaa' 1
[aa1 2#
HousesDataDefaultMapperaa2 I
.aaI J
Floors_IndexaaJ V
]aaV W
)aaW X
,aaX Y

Waterfrontbb 
=bb 

waterfrontbb '
,bb' (
Viewcc 
=cc 
intcc 
.cc 
Parsecc  
(cc  !

propertiescc! +
[cc+ ,#
HousesDataDefaultMappercc, C
.ccC D

View_IndexccD N
]ccN O
)ccO P
,ccP Q
	Conditiondd 
=dd 
intdd 
.dd  
Parsedd  %
(dd% &

propertiesdd& 0
[dd0 1#
HousesDataDefaultMapperdd1 H
.ddH I
Condition_IndexddI X
]ddX Y
)ddY Z
,ddZ [
Gradeee 
=ee 
intee 
.ee 
Parseee !
(ee! "

propertiesee" ,
[ee, -#
HousesDataDefaultMapperee- D
.eeD E
Grade_IndexeeE P
]eeP Q
)eeQ R
,eeR S
	AboveAreaff 
=ff 
decimalff #
.ff# $
Parseff$ )
(ff) *

propertiesff* 4
[ff4 5#
HousesDataDefaultMapperff5 L
.ffL M
AboveArea_IndexffM \
]ff\ ]
)ff] ^
,ff^ _
BasementAreagg 
=gg 
decimalgg &
.gg& '
Parsegg' ,
(gg, -

propertiesgg- 7
[gg7 8#
HousesDataDefaultMappergg8 O
.ggO P
BasementArea_IndexggP b
]ggb c
)ggc d
,ggd e
	YearBuilthh 
=hh 
inthh 
.hh  
Parsehh  %
(hh% &

propertieshh& 0
[hh0 1#
HousesDataDefaultMapperhh1 H
.hhH I
YearBuild_IndexhhI X
]hhX Y
)hhY Z
,hhZ [
YearRenovatedii 
=ii 
intii  #
.ii# $
Parseii$ )
(ii) *

propertiesii* 4
[ii4 5#
HousesDataDefaultMapperii5 L
.iiL M
YearRenovated_IndexiiM `
]ii` a
)iia b
,iib c
Zipcodejj 
=jj 
(jj 

propertiesjj %
[jj% &#
HousesDataDefaultMapperjj& =
.jj= >
Zipcode_Indexjj> K
]jjK L
)jjL M
,jjM N
}ll 
;ll 
returnmm 
recordmm 
;mm 
}nn 	
privatepp 
staticpp 
ReadOnlySpanpp #
<pp# $
charpp$ (
>pp( )
GetUntilOrEmptypp* 9
(pp9 :
stringpp: @
textppA E
,ppE F
stringppG M
stopAtppN T
)ppT U
{qq 	
ifss 
(ss 
!ss 
stringss 
.ss 
IsNullOrWhiteSpacess *
(ss* +
textss+ /
)ss/ 0
)ss0 1
{tt 
intuu 
charLocationuu  
=uu! "
textuu# '
.uu' (
IndexOfuu( /
(uu/ 0
stopAtuu0 6
,uu6 7
StringComparisonuu8 H
.uuH I
OrdinaluuI P
)uuP Q
;uuQ R
ifww 
(ww 
charLocationww  
>ww! "
$numww# $
)ww$ %
{xx 
returnyy 
textyy 
.yy  
	Substringyy  )
(yy) *
$numyy* +
,yy+ ,
charLocationyy- 9
)yy9 :
;yy: ;
}zz 
}{{ 
return}} 
string}} 
.}} 
Empty}} 
;}}  
}~~ 	
} 
}€€ ¾&
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\DataImporter\HousesDataDefaultMapper.cs
	namespace 	
Persistence
 
. 
DataImporter "
{ 
public 

class #
HousesDataDefaultMapper (
{ 
public 
static 
int 
DateSold_Index (
=>) +
$num, -
;- .
public 
static 
int 
Price_Index %
=>& (
$num) *
;* +
public 
static 
int 
Bedrooms_Index (
=>) +
$num, -
;- .
public 
static 
int 
Bathrooms_Index )
=>* ,
$num- .
;. /
public		 
static		 
int		 
LivingArea_Index		 *
=>		+ -
$num		. /
;		/ 0
public

 
static

 
int

 
LotArea_Index

 '
=>

( *
$num

+ ,
;

, -
public 
static 
int 
Floors_Index &
=>' )
$num* +
;+ ,
public 
static 
int 
Waterfront_Index *
=>+ -
$num. /
;/ 0
public 
static 
int 

View_Index $
=>% '
$num( )
;) *
public 
static 
int 
Condition_Index )
=>* ,
$num- /
;/ 0
public 
static 
int 
Grade_Index %
=>& (
$num) +
;+ ,
public 
static 
int 
AboveArea_Index )
=>* ,
$num- /
;/ 0
public 
static 
int 
BasementArea_Index ,
=>- /
$num0 2
;2 3
public 
static 
int 
YearBuild_Index )
=>* ,
$num- /
;/ 0
public 
static 
int 
YearRenovated_Index -
=>. 0
$num1 3
;3 4
public 
static 
int 
Zipcode_Index '
=>( *
$num+ -
;- .
public 
static 
int 
Id_Index "
=># %
$num& '
;' (
public 
static 
string 
DateSold_Name *
=>+ -
$str. 8
;8 9
public 
static 
string 

Price_Name '
=>( *
$str+ 2
;2 3
public 
static 
string 
Bedrooms_Name *
=>+ -
$str. 8
;8 9
public 
static 
string 
Bathrooms_Name +
=>, .
$str/ :
;: ;
public 
static 
string 
LivingArea_Name ,
=>- /
$str0 <
;< =
public 
static 
string 
LotArea_Name )
=>* ,
$str- 6
;6 7
public 
static 
string 
Floors_Name (
=>) +
$str, 4
;4 5
public 
static 
string 
Waterfront_Name ,
=>- /
$str0 <
;< =
public   
static   
string   
	View_Name   &
=>  ' )
$str  * 0
;  0 1
public!! 
static!! 
string!! 
Condition_Name!! +
=>!!, .
$str!!/ :
;!!: ;
public"" 
static"" 
string"" 

Grade_Name"" '
=>""( *
$str""+ 2
;""2 3
public## 
static## 
string## 
AboveArea_Name## +
=>##, .
$str##/ :
;##: ;
public$$ 
static$$ 
string$$ 
BasementArea_Name$$ .
=>$$/ 1
$str$$2 @
;$$@ A
public%% 
static%% 
string%% 
YearBuilt_Name%% +
=>%%, .
$str%%/ :
;%%: ;
public&& 
static&& 
string&& 
YearRenovated_Name&& /
=>&&0 2
$str&&3 B
;&&B C
public'' 
static'' 
string'' 
ZipCode_Name'' )
=>''* ,
$str''- 6
;''6 7
public(( 
static(( 
string(( 
Id_Name(( $
=>((% '
$str((( ,
;((, -
})) 
}** ÐL
€C:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\Authentication\AuthenticationManager.cs
	namespace 	
Persistence
 
. 
EFCore 
. 
Authentication +
{ 
public 

class !
AuthenticationManager &
:' ("
IAuthenticationManager) ?
{ 
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
userManager3 >
;> ?
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
readonly "
IUserHistoryRepository /!
userHistoryRepository0 E
;E F
public !
AuthenticationManager $
($ %
UserManager% 0
<0 1
IdentityUser1 =
>= >
userManager? J
,J K
IConfigurationL Z
configuration[ h
,h i#
IUserHistoryRepository	j €#
userHistoryRepository
 –
)
– —
{ 	
this 
. 
userManager 
= 
userManager *
;* +
this 
. 
configuration 
=  
configuration! .
;. /
this 
. !
userHistoryRepository &
=' (!
userHistoryRepository) >
;> ?
} 	
public 
async 
Task 
< 
(  
AuthenticationStatus /
Status0 6
,6 7
string8 >
?> ?
ErrorMessage@ L
)L M
>M N
RegisterO W
(W X
RegisterModelX e
registerModelf s
)s t
{ 	
var 

userExists 
= 
await "
userManager# .
.. /
FindByNameAsync/ >
(> ?
registerModel? L
.L M
UserNameM U
)U V
;V W
if 
( 

userExists 
!= 
null "
)" #
{ 
return   
(    
AuthenticationStatus   ,
.  , -
INVALID_USERNAME  - =
,  = >
$str  ? U
)  U V
;  V W
}!! 
IdentityUser## 
newUser##  
=##! "
new### &
IdentityUser##' 3
{$$ 
UserName%% 
=%% 
registerModel%% (
.%%( )
UserName%%) 1
,%%1 2
Email&& 
=&& 
registerModel&& %
.&&% &
Email&&& +
,&&+ ,
}'' 
;'' 
var)) 
result)) 
=)) 
await)) 
userManager)) *
.))* +
CreateAsync))+ 6
())6 7
newUser))7 >
,))> ?
registerModel))@ M
.))M N
Password))N V
)))V W
;))W X
if** 
(** 
!** 
result** 
.** 
	Succeeded** !
)**! "
{++ 
var,, 
errors,, 
=,, 
new,,  
List,,! %
<,,% &
string,,& ,
>,,, -
(,,- .
),,. /
;,,/ 0
errors-- 
.-- 
Add-- 
(-- 
$str-- :
)--: ;
;--; <
foreach.. 
(.. 
var.. 
error.. "
in..# %
result..& ,
..., -
Errors..- 3
)..3 4
{// 
errors00 
.00 
Add00 
(00 
error00 $
.00$ %
Description00% 0
)000 1
;001 2
}11 
return22 
(22  
AuthenticationStatus22 ,
.22, -
INVALID_PASSWORD22- =
,22= >
string22? E
.22E F
Join22F J
(22J K
$str22K O
,22O P
errors22Q W
)22W X
)22X Y
;22Y Z
}33 
await55 !
userHistoryRepository55 '
.55' (
AddAsync55( 0
(550 1
new551 4
UserHistory555 @
(55@ A
)55A B
{55C D
UserId55E K
=55L M
newUser55N U
.55U V
Id55V X
}55Y Z
)55Z [
;55[ \
return77 
(77  
AuthenticationStatus77 (
.77( )
SUCCESS77) 0
,770 1
null772 6
)776 7
;777 8
}88 	
public:: 
async:: 
Task:: 
<:: 
(::  
AuthenticationStatus:: /
Status::0 6
,::6 7

LoginToken::8 B
?::B C
Token::D I
,::I J
string::K Q
?::Q R
ErrorMessage::S _
)::_ `
>::` a
Login::b g
(::g h

LoginModel::h r

loginModel::s }
)::} ~
{;; 	
var<< 
user<< 
=<< 
await<< 
userManager<< (
.<<( )
FindByNameAsync<<) 8
(<<8 9

loginModel<<9 C
.<<C D
UserName<<D L
)<<L M
;<<M N
if== 
(== 
user== 
==== 
null== 
)== 
{>> 
return?? 
(??  
AuthenticationStatus?? ,
.??, -
INVALID_USERNAME??- =
,??= >
null??? C
,??C D
$str??E [
)??[ \
;??\ ]
}@@ 
ifAA 
(AA 
!AA 
(AA 
awaitAA 
userManagerAA #
.AA# $
CheckPasswordAsyncAA$ 6
(AA6 7
userAA7 ;
,AA; <

loginModelAA= G
.AAG H
PasswordAAH P
)AAP Q
)AAQ R
)AAR S
{BB 
returnCC 
(CC  
AuthenticationStatusCC ,
.CC, -
INVALID_PASSWORDCC- =
,CC= >
nullCC? C
,CCC D
$strCCE Z
)CCZ [
;CC[ \
}DD 
varGG 
	userRolesGG 
=GG 
awaitGG !
userManagerGG" -
.GG- .
GetRolesAsyncGG. ;
(GG; <
userGG< @
)GG@ A
;GGA B
varHH 

authClaimsHH 
=HH 
newHH  
ListHH! %
<HH% &
ClaimHH& +
>HH+ ,
{II 
newJJ 
ClaimJJ 
(JJ 

ClaimTypesJJ $
.JJ$ %
NameJJ% )
,JJ) *
userJJ+ /
.JJ/ 0
UserNameJJ0 8
)JJ8 9
,JJ9 :
newKK 
ClaimKK 
(KK 
	MicrosoftKK #
.KK# $
IdentityModelKK$ 1
.KK1 2
JsonWebTokensKK2 ?
.KK? @#
JwtRegisteredClaimNamesKK@ W
.KKW X
JtiKKX [
,KK[ \
GuidKK] a
.KKa b
NewGuidKKb i
(KKi j
)KKj k
.KKk l
ToStringKKl t
(KKt u
)KKu v
)KKv w
}LL 
;LL 
foreachNN 
(NN 
varNN 
userRoleNN !
inNN" $
	userRolesNN% .
)NN. /
{OO 

authClaimsPP 
.PP 
AddPP 
(PP 
newPP "
ClaimPP# (
(PP( )

ClaimTypesPP) 3
.PP3 4
RolePP4 8
,PP8 9
userRolePP: B
)PPB C
)PPC D
;PPD E
}QQ 
varSS 
authSigningKeySS 
=SS  
newSS! $ 
SymmetricSecurityKeySS% 9
(SS9 :
EncodingSS: B
.SSB C
UTF8SSC G
.SSG H
GetBytesSSH P
(SSP Q
configurationSSQ ^
[SS^ _
$strSS_ k
]SSk l
)SSl m
)SSm n
;SSn o
varTT 
expirationDateTT 
=TT  
DateTimeTT! )
.TT) *
NowTT* -
.TT- .
AddHoursTT. 6
(TT6 7
$numTT7 8
)TT8 9
;TT9 :
varVV 
tokenVV 
=VV 
newVV 
JwtSecurityTokenVV ,
(VV, -
issuerWW 
:WW 
configurationWW %
[WW% &
$strWW& 7
]WW7 8
,WW8 9
audienceXX 
:XX 
configurationXX '
[XX' (
$strXX( ;
]XX; <
,XX< =
expiresYY 
:YY 
expirationDateYY '
,YY' (
claimsZZ 
:ZZ 

authClaimsZZ "
,ZZ" #
signingCredentials[[ "
:[[" #
new[[$ '
SigningCredentials[[( :
([[: ;
authSigningKey[[; I
,[[I J
SecurityAlgorithms[[K ]
.[[] ^

HmacSha256[[^ h
)[[h i
)\\ 
;\\ 
var]] 

loginToken]] 
=]] 
new]]  

LoginToken]]! +
(]]+ ,
)]], -
{]]. /
Token]]0 5
=]]6 7
new]]8 ;#
JwtSecurityTokenHandler]]< S
(]]S T
)]]T U
.]]U V

WriteToken]]V `
(]]` a
token]]a f
)]]f g
,]]g h
ValidTo]]i p
=]]q r
expirationDate	]]s 
}
]]‚ ƒ
;
]]ƒ „
return^^ 
(^^  
AuthenticationStatus^^ (
.^^( )
SUCCESS^^) 0
,^^0 1

loginToken^^2 <
,^^< =
null^^> B
)^^B C
;^^C D
}`` 	
}aa 
}bb ÿ
gC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\DataContext.cs
	namespace 	
Persistence
 
. 
EFCore 
{ 
public 

class 
DataContext 
: 
IdentityDbContext 0
<0 1
IdentityUser1 =
,= >
IdentityRole? K
,K L
stringM S
>S T
{		 
public

 
DataContext

 
(

 
DbContextOptions

 +
<

+ ,
DataContext

, 7
>

7 8
options

9 @
)

@ A
:

B C
base

D H
(

H I
options

I P
)

P Q
{ 	
} 	
public 
DbSet 
< 
House 
> 
Houses "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DbSet 
< 
UserHistory  
>  !
UserHistory" -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
async 
Task 
< 
int 
> 
SaveChangesAsync /
(/ 0
)0 1
{ 	
return 
await 
base 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
} 	
} 
} »
kC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\HouseRepository.cs
	namespace 	
Persistence
 
. 
EFCore 
{ 
public 

class 
HouseRepository  
:! "

Repository# -
<- .
House. 3
>3 4
,4 5
IHouseRepository6 F
{ 
public		 
HouseRepository		 
(		 
DataContext		 *
context		+ 2
)		2 3
:		4 5
base		6 :
(		: ;
context		; B
)		B C
{

 	
} 	
public 
override 
async 
Task "
<" #
IEnumerable# .
<. /
House/ 4
>4 5
>5 6
GetAllAsync7 B
(B C
intC F
	pageIndexG P
,P Q
intR U
pageSizeV ^
)^ _
{ 	
return 
await 
context  
.  !
Houses! '
. 
OrderByDescending "
(" #
h# $
=>% '
h( )
.) *
DateSold* 2
)2 3
. 
Skip 
( 
	pageIndex 
*  !
pageSize" *
)* +
. 
Take 
( 
pageSize 
) 
. 
ToListAsync 
( 
) 
; 
} 	
} 
} Ÿ.
fC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\Repository.cs
	namespace 	
Persistence
 
. 
EFCore 
{ 
public 

class 

Repository 
< 
TEntity #
># $
:% &
IRepository' 2
<2 3
TEntity3 :
>: ;
where< A
TEntityB I
:J K

BaseEntityL V
{ 
	protected		 
readonly		 
DataContext		 &
context		' .
;		. /
public 

Repository 
( 
DataContext %
context& -
)- .
{ 	
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
TEntity !
>! "
AddAsync# +
(+ ,
TEntity, 3
entity4 :
): ;
{ 	
if 
( 
entity 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
$"0 2
{2 3
nameof3 9
(9 :
entity: @
)@ A
}A B
$strB T
"T U
)U V
;V W
} 
await 
context 
. 
AddAsync "
(" #
entity# )
)) *
;* +
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
return 
entity 
; 
} 	
public 
async 
Task 
< 
TEntity !
>! "
DeleteAsync# .
(. /
TEntity/ 6
entity7 =
)= >
{ 	
if 
( 
entity 
== 
null 
) 
{ 
throw   
new   !
ArgumentNullException   /
(  / 0
$"  0 2
{  2 3
nameof  3 9
(  9 :
DeleteAsync  : E
)  E F
}  F G
$str  G _
"  _ `
)  ` a
;  a b
}!! 
context## 
.## 
Remove## 
(## 
entity## !
)##! "
;##" #
await$$ 
context$$ 
.$$ 
SaveChangesAsync$$ *
($$* +
)$$+ ,
;$$, -
return%% 
entity%% 
;%% 
}&& 	
public(( 
async(( 
Task(( 
<(( 
IEnumerable(( %
<((% &
TEntity((& -
>((- .
>((. /
GetAllAsync((0 ;
(((; <
)((< =
{)) 	
return** 
await** 
context**  
.**  !
Set**! $
<**$ %
TEntity**% ,
>**, -
(**- .
)**. /
.**/ 0
ToListAsync**0 ;
(**; <
)**< =
;**= >
}++ 	
public,, 
virtual,, 
async,, 
Task,, !
<,,! "
IEnumerable,," -
<,,- .
TEntity,,. 5
>,,5 6
>,,6 7
GetAllAsync,,8 C
(,,C D
int,,D G
	pageIndex,,H Q
,,,Q R
int,,S V
pageSize,,W _
),,_ `
{-- 	
return.. 
await.. 
context..  
...  !
Set..! $
<..$ %
TEntity..% ,
>.., -
(..- .
)... /
.// 
Skip// 
(// 
	pageIndex// 
*//  !
pageSize//" *
)//* +
.00 
Take00 
(00 
pageSize00 
)00 
.11 
ToListAsync11 
(11 
)11 
;11 
}22 	
public44 
async44 
Task44 
<44 
TEntity44 !
>44! "
GetByIdAsync44# /
(44/ 0
Guid440 4
id445 7
)447 8
{55 	
if66 
(66 
id66 
==66 
Guid66 
.66 
Empty66  
)66  !
{77 
throw88 
new88 
ArgumentException88 +
(88+ ,
$"88, .
{88. /
nameof88/ 5
(885 6
GetByIdAsync886 B
)88B C
}88C D
$str88D Y
"88Y Z
)88Z [
;88[ \
}99 
return;; 
await;; 
context;;  
.;;  !
	FindAsync;;! *
<;;* +
TEntity;;+ 2
>;;2 3
(;;3 4
id;;4 6
);;6 7
;;;7 8
}<< 	
public>> 
async>> 
Task>> 
<>> 
TEntity>> !
>>>! "
UpdateAsync>># .
(>>. /
TEntity>>/ 6
entity>>7 =
)>>= >
{?? 	
if@@ 
(@@ 
entity@@ 
==@@ 
null@@ 
)@@ 
{AA 
throwBB 
newBB !
ArgumentNullExceptionBB /
(BB/ 0
$"BB0 2
{BB2 3
nameofBB3 9
(BB9 :
UpdateAsyncBB: E
)BBE F
}BBF G
$strBBG _
"BB_ `
)BB` a
;BBa b
}CC 
contextEE 
.EE 
UpdateEE 
(EE 
entityEE !
)EE! "
;EE" #
awaitFF 
contextFF 
.FF 
SaveChangesAsyncFF *
(FF* +
)FF+ ,
;FF, -
returnGG 
entityGG 
;GG 
}HH 	
}II 
}JJ Ä&
qC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\UserHistoryRepository.cs
	namespace 	
Persistence
 
. 
EFCore 
{ 
public 

class !
UserHistoryRepository &
:' (

Repository) 3
<3 4
UserHistory4 ?
>? @
,@ A"
IUserHistoryRepositoryB X
{		 
public

 !
UserHistoryRepository

 $
(

$ %
DataContext

% 0
context

1 8
)

8 9
:

: ;
base

< @
(

@ A
context

A H
)

H I
{ 	
} 	
public 
async 
Task 
< 
House 
>  
AddHouseAsync! .
(. /
string/ 5
userId6 <
,< =
House> C
createdHouseD P
)P Q
{ 	
var 
userHistory 
= 
await #
context$ +
.+ ,
UserHistory, 7
. 
Include 
( 
uh 
=> 
uh !
.! "
CreatedHouses" /
)/ 0
. 
Where 
( 
uh 
=> 
uh 
.  
UserId  &
==' )
userId* 0
)0 1
. 
FirstOrDefaultAsync $
($ %
)% &
;& '
userHistory 
. 
CreatedHouses %
.% &
Add& )
() *
createdHouse* 6
)6 7
;7 8
await 
context 
. 
SaveChangesAsync *
(* +
)+ ,
;, -
return 
createdHouse 
;  
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
HouseDTO& .
>. /
>/ 0
GetAllHousesAsync1 B
(B C
stringC I
userIdJ P
)P Q
{ 	
var 
userHistory 
= 
await #
context$ +
.+ ,
UserHistory, 7
. 
Include 
( 
uh 
=> 
uh !
.! "
CreatedHouses" /
)/ 0
. 
Where 
( 
uh 
=> 
uh 
.  
UserId  &
==' )
userId* 0
)0 1
.   
FirstOrDefaultAsync   $
(  $ %
)  % &
;  & '
var"" 

userHouses"" 
="" 
userHistory"" (
.""( )
CreatedHouses"") 6
.## 
Select## 
(## 
uh## 
=>## 
new## !
HouseDTO##" *
(##* +
)##+ ,
{$$ 
DateSold%% 
=%% 
uh%% !
.%%! "
DateSold%%" *
,%%* +
Price&& 
=&& 
uh&& 
.&& 
Price&& $
,&&$ %
Bedrooms'' 
='' 
uh'' !
.''! "
Bedrooms''" *
,''* +
	Bathrooms(( 
=(( 
uh((  "
.((" #
	Bathrooms((# ,
,((, -

LivingArea)) 
=))  
uh))! #
.))# $

LivingArea))$ .
,)). /
LotArea** 
=** 
uh**  
.**  !
LotArea**! (
,**( )
Floors++ 
=++ 
uh++ 
.++  
Floors++  &
,++& '

Waterfront,, 
=,,  
uh,,! #
.,,# $

Waterfront,,$ .
,,,. /
View-- 
=-- 
uh-- 
.-- 
View-- "
,--" #
	Condition.. 
=.. 
uh..  "
..." #
	Condition..# ,
,.., -
Grade// 
=// 
uh// 
.// 
Grade// $
,//$ %
	AboveArea00 
=00 
uh00  "
.00" #
	AboveArea00# ,
,00, -
BasementArea11  
=11! "
uh11# %
.11% &
BasementArea11& 2
,112 3
	YearBuilt22 
=22 
uh22  "
.22" #
	YearBuilt22# ,
,22, -
YearRenovated33 !
=33" #
uh33$ &
.33& '
YearRenovated33' 4
,334 5
Zipcode44 
=44 
uh44  
.44  !
Zipcode44! (
}55 
)55 
.66 
ToList66 
(66 
)66 
;66 
return88 

userHouses88 
;88 
}99 	
}:: 
};; ‡!
nC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\EFCore\Users\UsersManager.cs
	namespace 	
Persistence
 
. 
EFCore 
. 
Users "
{ 
public 

class 
UsersManager 
: 
IUsersManager  -
{		 
private

 
readonly

 
UserManager

 $
<

$ %
IdentityUser

% 1
>

1 2
userManager

3 >
;

> ?
private 
readonly 
DataContext $
context% ,
;, -
public 
UsersManager 
( 
UserManager '
<' (
IdentityUser( 4
>4 5
userManager6 A
,A B
DataContextC N
contextO V
)V W
{ 	
this 
. 
userManager 
= 
userManager *
;* +
this 
. 
context 
= 
context "
;" #
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
UserDTO& -
>- .
>. /
GetUsers0 8
(8 9
)9 :
{ 	
var 
users 
= 
await 
context %
.% &
Users& +
.+ ,
Select, 2
(2 3
user3 7
=>8 :
new; >
UserDTO? F
{ 
UserName 
= 
user 
.  
UserName  (
,( )
Password 
= 
user 
.  
PasswordHash  ,
,, -
Email 
= 
user 
. 
Email "
} 
) 
. 
ToListAsync 
( 
) 
; 
return 
users 
; 
} 	
public 
async 
Task 
< 
UserDTO !
>! "
GetUserByName# 0
(0 1
string1 7
userName8 @
)@ A
{ 	
var   
currentUser   
=   
await   #
userManager  $ /
.  / 0
FindByNameAsync  0 ?
(  ? @
userName  @ H
)  H I
;  I J
var!! 
user!! 
=!! 
await!! 
context!! $
.!!$ %
Users!!% *
.!!* +
Select!!+ 1
(!!1 2
user!!2 6
=>!!7 9
new!!: =
UserDTO!!> E
{"" 
UserName## 
=## 
user## 
.##  
UserName##  (
,##( )
Password$$ 
=$$ 
user$$ 
.$$  
PasswordHash$$  ,
,$$, -
Email%% 
=%% 
user%% 
.%% 
Email%% "
}&& 
)&& 
.&&  
SingleOrDefaultAsync&& #
(&&# $
user&&$ (
=>&&) +
user&&, 0
.&&0 1
UserName&&1 9
==&&: <
currentUser&&= H
.&&H I
UserName&&I Q
)&&Q R
;&&R S
return(( 
user(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
string++  
?++  !
>++! "
GetUserIdByName++# 2
(++2 3
string++3 9
userName++: B
)++B C
{,, 	
var-- 
currentUser-- 
=-- 
await-- #
userManager--$ /
.--/ 0
FindByNameAsync--0 ?
(--? @
userName--@ H
)--H I
;--I J
if.. 
(.. 
currentUser.. 
==.. 
null.. #
)..# $
{// 
return00 
null00 
;00 
}11 
return33 
currentUser33 
.33 
Id33 !
;33! "
}44 	
}55 
}66 €7
bC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Persistence\PersistenceDI.cs
	namespace 	
Persistence
 
{ 
public 

static 
class 
PersistenceDI %
{ 
public 
static 
void 
AddPersistence )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
AddDbContext !
<! "
DataContext" -
>- .
(. /
options/ 6
=>7 9
options: A
.A B
UseInMemoryDatabaseB U
(U V
$strV d
)d e
)e f
;f g
services 
. 
AddTransient !
(! "
typeof" (
(( )
IRepository) 4
<4 5
>5 6
)6 7
,7 8
typeof9 ?
(? @

Repository@ J
<J K
>K L
)L M
)M N
;N O
services 
. 
AddTransient !
<! "
IHouseRepository" 2
,2 3
HouseRepository4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! ""
IUserHistoryRepository" 8
,8 9!
UserHistoryRepository: O
>O P
(P Q
)Q R
;R S
services 
. 
AddIdentity  
<  !
IdentityUser! -
,- .
IdentityRole/ ;
>; <
(< =
)= >
. $
AddEntityFrameworkStores )
<) *
DataContext* 5
>5 6
(6 7
)7 8
. $
AddDefaultTokenProviders )
() *
)* +
;+ ,
services 
. 
AddAuthentication &
(& '
options' .
=>/ 1
{ 
options 
. %
DefaultAuthenticateScheme 1
=2 3
JwtBearerDefaults4 E
.E F 
AuthenticationSchemeF Z
;Z [
options 
. "
DefaultChallengeScheme .
=/ 0
JwtBearerDefaults1 B
.B C 
AuthenticationSchemeC W
;W X
options   
.   
DefaultScheme   %
=  & '
JwtBearerDefaults  ( 9
.  9 : 
AuthenticationScheme  : N
;  N O
}!! 
)!! 
.!! 
AddJwtBearer!! 
(!! 
options!! #
=>!!$ &
{"" 
options## 
.## 
	SaveToken## !
=##" #
true##$ (
;##( )
options$$ 
.$$  
RequireHttpsMetadata$$ ,
=$$- .
false$$/ 4
;$$4 5
options%% 
.%% %
TokenValidationParameters%% 1
=%%2 3
new%%4 7%
TokenValidationParameters%%8 Q
(%%Q R
)%%R S
{&& 
ValidateIssuer'' "
=''# $
true''% )
,'') *
ValidateAudience(( $
=((% &
true((' +
,((+ ,
ValidAudience)) !
=))" #
configuration))$ 1
[))1 2
$str))2 E
]))E F
,))F G
ValidIssuer** 
=**  !
configuration**" /
[**/ 0
$str**0 A
]**A B
,**B C
IssuerSigningKey++ $
=++% &
new++' * 
SymmetricSecurityKey+++ ?
(++? @
Encoding++@ H
.++H I
UTF8++I M
.++M N
GetBytes++N V
(++V W
configuration++W d
[++d e
$str++e q
]++q r
)++r s
)++s t
},, 
;,, 
}-- 
)-- 
;-- 
services// 
.// 
AddTransient// !
<//! ""
IAuthenticationManager//" 8
,//8 9!
AuthenticationManager//: O
>//O P
(//P Q
)//Q R
;//R S
services00 
.00 
AddTransient00 !
<00! "
IUsersManager00" /
,00/ 0
UsersManager001 =
>00= >
(00> ?
)00? @
;00@ A
}22 	
public44 
static44 
async44 
Task44  
CreateRoles44! ,
(44, -
IServiceProvider44- =
provider44> F
)44F G
{55 	
var66 
roleManager66 
=66 
provider66 &
.66& '
GetRequiredService66' 9
<669 :
RoleManager66: E
<66E F
IdentityRole66F R
>66R S
>66S T
(66T U
)66U V
;66V W
string77 
[77 
]77 
	roleNames77 
=77  
{77! "
$str77# *
,77* +
$str77, 2
}773 4
;774 5
foreach99 
(99 
string99 
roleName99 $
in99% '
	roleNames99( 1
)991 2
{:: 
var;; 

roleExists;; 
=;;  
await;;! &
roleManager;;' 2
.;;2 3
RoleExistsAsync;;3 B
(;;B C
roleName;;C K
);;K L
;;;L M
if<< 
(<< 
!<< 

roleExists<< 
)<<  
{== 
await>> 
roleManager>> %
.>>% &
CreateAsync>>& 1
(>>1 2
new>>2 5
IdentityRole>>6 B
(>>B C
roleName>>C K
)>>K L
)>>L M
;>>M N
}?? 
}@@ 
}AA 	
publicCC 
staticCC 
asyncCC 
TaskCC  
SeedDatabaseCC! -
(CC- .
IServiceProviderCC. >
providerCC? G
)CCG H
{DD 	
varEE 
contextEE 
=EE 
providerEE "
.EE" #

GetServiceEE# -
<EE- .
DataContextEE. 9
>EE9 :
(EE: ;
)EE; <
;EE< =
contextFF 
.FF 
DatabaseFF 
.FF 
EnsureCreatedFF *
(FF* +
)FF+ ,
;FF, -
varGG 
importedHousesGG 
=GG  
HouseDataImporterGG! 2
.GG2 3
ReadRecordsGG3 >
(GG> ?
$strGG? o
)GGo p
;GGp q
awaitHH 
contextHH 
.HH 
HousesHH  
.HH  !
AddRangeAsyncHH! .
(HH. /
importedHousesHH/ =
)HH= >
;HH> ?
awaitII 
contextII 
.II 
SaveChangesAsyncII *
(II* +
)II+ ,
;II, -
}JJ 	
}KK 
}LL 