…
bC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\ApplicationDI.cs
	namespace 	
Application
 
{ 
public 

static 
class 
ApplicationDI %
{		 
public

 
static

 
void

 
AddApplication

 )
(

) *
this

* .
IServiceCollection

/ A
services

B J
)

J K
{ 	
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
} 	
} 
} ›
rC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Constants\PaginationConstants.cs
	namespace 	
Application
 
. 
	Constants 
{ 
public 

static 
class 
PaginationConstants +
{ 
public 
static 
int 
	PageIndex #
=>$ &
$num' (
;( )
public 
static 
int 
PageSize "
=># %
$num& )
;) *
} 
} ∫
rC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\DTO\Authentication\LoginModel.cs
	namespace 	
Application
 
. 
DTO 
. 
Authentication (
{ 
public 

class 

LoginModel 
{ 
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ©
rC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\DTO\Authentication\LoginToken.cs
	namespace 	
Application
 
. 
DTO 
. 
Authentication (
{ 
public 

class 

LoginToken 
{ 
public 
string 
? 
Token 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
ValidTo 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Ë
uC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\DTO\Authentication\RegisterModel.cs
	namespace 	
Application
 
. 
DTO 
. 
Authentication (
{ 
public 

class 
RegisterModel 
{ 
public 
string 
? 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
} 
}		 Ï
aC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\DTO\HouseDTO.cs
	namespace 	
Application
 
. 
DTO 
{ 
public 

class 
HouseDTO 
{ 
public 
DateTime 
DateSold  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
double 
Price 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Bedrooms 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
	Bathrooms  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
decimal		 

LivingArea		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
decimal

 
LotArea

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
decimal 
Floors 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 

Waterfront 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
View 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
	Condition 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Grade 
{ 
get 
; 
set  #
;# $
}% &
public 
decimal 
	AboveArea  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
decimal 
BasementArea #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
	YearBuilt 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
YearRenovated  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
Zipcode 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¢
`C:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\DTO\UserDTO.cs
	namespace 	
Application
 
. 
DTO 
{ 
public 

class 
UserDTO 
{ 
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 æ
vC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Enumerations\AuthenticationStatus.cs
	namespace 	
Application
 
. 
Enumerations "
{ 
public 

enum  
AuthenticationStatus $
{ 
SUCCESS 
, 
INVALID_USERNAME 
, 
INVALID_PASSWORD 
} 
}		 û
wC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Exceptions\EntityNotFoundException.cs
	namespace 	
Application
 
. 

Exceptions  
{ 
public 

class #
EntityNotFoundException (
:) *
	Exception+ 4
{ 
public #
EntityNotFoundException &
(& '
)' (
:) *
base+ /
(/ 0
)0 1
{ 	
} 	
public		 #
EntityNotFoundException		 &
(		& '
string		' -
message		. 5
)		5 6
:		7 8
base		9 =
(		= >
message		> E
)		E F
{

 	
} 	
} 
} Œ
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Authentication\LoginCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Authentication -
{ 
public 

class 
LoginCommand 
: 
IRequest  (
<( )
() * 
AuthenticationStatus* >
Status? E
,E F

LoginTokenG Q
?Q R
TokenS X
,X Y
stringZ `
?` a
ErrorMessageb n
)n o
>o p
{ 
public		 

LoginModel		 
?		 
	LoginInfo		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
}

 
} È
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Authentication\LoginCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Authentication -
{ 
public 

class 
LoginCommandHandler $
:% &
IRequestHandler' 6
<6 7
LoginCommand7 C
,C D
(E F 
AuthenticationStatusF Z
Status[ a
,a b

LoginTokenc m
?m n
Tokeno t
,t u
stringv |
?| }
ErrorMessage	~ ä
)
ä ã
>
ã å
{		 
private

 
readonly

 "
IAuthenticationManager

 /!
authenticationManager

0 E
;

E F
public 
LoginCommandHandler "
(" #"
IAuthenticationManager# 9!
authenticationManager: O
)O P
{ 	
this 
. !
authenticationManager &
=' (!
authenticationManager) >
;> ?
} 	
public 
async 
Task 
< 
(  
AuthenticationStatus /
Status0 6
,6 7

LoginToken8 B
?B C
TokenD I
,I J
stringK Q
?Q R
ErrorMessageS _
)_ `
>` a
Handleb h
(h i
LoginCommandi u
requestv }
,} ~
CancellationToken	 ê
cancellationToken
ë ¢
)
¢ £
{ 	
if 
( 
request 
. 
	LoginInfo !
==" $
null% )
)) *
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
return 
await !
authenticationManager .
.. /
Login/ 4
(4 5
request5 <
.< =
	LoginInfo= F
)F G
;G H
} 	
} 
} ë
|C:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Authentication\RegisterCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Authentication -
{ 
public 

class 
RegisterCommand  
:! "
IRequest# +
<+ ,
(, - 
AuthenticationStatus- A
StatusB H
,H I
stringJ P
?P Q
ErrorMessageR ^
)^ _
>_ `
{ 
public		 
RegisterModel		 
?		 
RegisterInfo		 *
{		+ ,
get		- 0
;		0 1
set		2 5
;		5 6
}		7 8
}

 
} Í
ÉC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Authentication\RegisterCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Authentication -
{ 
public 

class "
RegisterCommandHandler '
:( )
IRequestHandler* 9
<9 :
RegisterCommand: I
,I J
(K L 
AuthenticationStatusL `
Statusa g
,g h
stringi o
?o p
ErrorMessageq }
)} ~
>~ 
{ 
private		 
readonly		 "
IAuthenticationManager		 /!
authenticationManager		0 E
;		E F
public "
RegisterCommandHandler %
(% &"
IAuthenticationManager& <!
authenticationManager= R
)R S
{ 	
this 
. !
authenticationManager &
=' (!
authenticationManager) >
;> ?
} 	
public 
async 
Task 
< 
(  
AuthenticationStatus /
Status0 6
,6 7
string8 >
?> ?
ErrorMessage@ L
)L M
>M N
HandleO U
(U V
RegisterCommandV e
requestf m
,m n
CancellationToken	o Ä
cancellationToken
Å í
)
í ì
{ 	
if 
( 
request 
. 
RegisterInfo $
==% '
null( ,
), -
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
return 
await !
authenticationManager .
.. /
Register/ 7
(7 8
request8 ?
.? @
RegisterInfo@ L
)L M
;M N
} 	
} 
} Ù
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\CreateHouseCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public 

class 
CreateHouseCommand #
:$ %
IRequest& .
<. /
Guid/ 3
>3 4
{ 
public 
HouseDTO 
? 
NewHouse !
{" #
get$ '
;' (
set) ,
;, -
}. /
}		 
}

 ›!
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\CreateHouseCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public 

class %
CreateHouseCommandHandler *
:+ ,
IRequestHandler- <
<< =
CreateHouseCommand= O
,O P
GuidQ U
>U V
{ 
private		 
readonly		 
IHouseRepository		 )

repository		* 4
;		4 5
public %
CreateHouseCommandHandler (
(( )
IHouseRepository) 9

repository: D
)D E
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Guid 
> 
Handle  &
(& '
CreateHouseCommand' 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
if 
( 
request 
. 
NewHouse  
==! #
null$ (
)( )
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
House 
createdHouse 
=  
new! $
House% *
{ 
DateSold 
= 
request "
." #
NewHouse# +
.+ ,
DateSold, 4
,4 5
Price 
= 
request 
.  
NewHouse  (
.( )
Price) .
,. /
Bedrooms 
= 
request "
." #
NewHouse# +
.+ ,
Bedrooms, 4
,4 5
	Bathrooms 
= 
request #
.# $
NewHouse$ ,
., -
	Bathrooms- 6
,6 7

LivingArea 
= 
request $
.$ %
NewHouse% -
.- .

LivingArea. 8
,8 9
LotArea 
= 
request !
.! "
NewHouse" *
.* +
LotArea+ 2
,2 3
Floors 
= 
request  
.  !
NewHouse! )
.) *
Floors* 0
,0 1

Waterfront 
= 
request $
.$ %
NewHouse% -
.- .

Waterfront. 8
,8 9
View   
=   
request   
.   
NewHouse   '
.  ' (
View  ( ,
,  , -
	Condition!! 
=!! 
request!! #
.!!# $
NewHouse!!$ ,
.!!, -
	Condition!!- 6
,!!6 7
Grade"" 
="" 
request"" 
.""  
NewHouse""  (
.""( )
Grade"") .
,"". /
	AboveArea## 
=## 
request## #
.### $
NewHouse##$ ,
.##, -
	AboveArea##- 6
,##6 7
BasementArea$$ 
=$$ 
request$$ &
.$$& '
NewHouse$$' /
.$$/ 0
BasementArea$$0 <
,$$< =
	YearBuilt%% 
=%% 
request%% #
.%%# $
NewHouse%%$ ,
.%%, -
	YearBuilt%%- 6
,%%6 7
YearRenovated&& 
=&& 
request&&  '
.&&' (
NewHouse&&( 0
.&&0 1
YearRenovated&&1 >
,&&> ?
Zipcode'' 
='' 
request'' !
.''! "
NewHouse''" *
.''* +
Zipcode''+ 2
}(( 
;(( 
await** 

repository** 
.** 
AddAsync** %
(**% &
createdHouse**& 2
)**2 3
;**3 4
return++ 
createdHouse++ 
.++  
Id++  "
;++" #
},, 	
}// 
}00 €
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\DeleteHouseCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public 

class 
DeleteHouseCommand #
:$ %
IRequest& .
<. /
Guid/ 3
>3 4
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
}		 ±
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\DeleteHouseCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public 

class %
DeleteHouseCommandHandler *
:+ ,
IRequestHandler- <
<< =
DeleteHouseCommand= O
,O P
GuidQ U
>U V
{		 
private

 
readonly

 
IHouseRepository

 )

repository

* 4
;

4 5
public %
DeleteHouseCommandHandler (
(( )
IHouseRepository) 9

repository: D
)D E
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Guid 
> 
Handle  &
(& '
DeleteHouseCommand' 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
House 
house 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
house 
== 
null 
) 
{ 
throw 
new #
EntityNotFoundException 1
(1 2
$"2 4
$str4 B
{B C
requestC J
.J K
IdK M
}M N
$strN ^
"^ _
)_ `
;` a
} 
await 

repository 
. 
DeleteAsync (
(( )
house) .
). /
;/ 0
return 
house 
. 
Id 
; 
} 	
} 
} ı
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\UpdateHouseCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public 

class 
UpdateHouseCommand #
:$ %
IRequest& .
<. /
Guid/ 3
>3 4
{ 
public 
House 
? 
UpdatedHouse "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 ç
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Commands\UpdateHouseCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Commands '
{ 
public		 

class		 %
UpdateHouseCommandHandler		 *
:		+ ,
IRequestHandler		- <
<		< =
UpdateHouseCommand		= O
,		O P
Guid		Q U
>		U V
{

 
private 
readonly 
IHouseRepository )

repository* 4
;4 5
public %
UpdateHouseCommandHandler (
(( )
IHouseRepository) 9

repository: D
)D E
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
Guid 
> 
Handle  &
(& '
UpdateHouseCommand' 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
if 
( 
request 
. 
UpdatedHouse $
==% '
null( ,
), -
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
House 
house 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
UpdatedHouse@ L
.L M
IdM O
)O P
;P Q
if 
( 
house 
== 
null 
||  
house! &
.& '
Id' )
==* ,
Guid- 1
.1 2
Empty2 7
)7 8
{ 
throw 
new #
EntityNotFoundException 1
(1 2
$"2 4
$str4 B
{B C
requestC J
.J K
UpdatedHouseK W
.W X
IdX Z
}Z [
$str[ k
"k l
)l m
;m n
} 
Array 
. 
ForEach 
( 
house 
.  
GetType  '
(' (
)( )
.) *
GetProperties* 7
(7 8
)8 9
,9 :
property; C
=>D F
updatePropertyG U
(U V
propertyV ^
,^ _
house` e
,e f
requestg n
.n o
UpdatedHouseo {
){ |
)| }
;} ~
await   

repository   
.   
UpdateAsync   (
(  ( )
house  ) .
)  . /
;  / 0
return!! 
house!! 
.!! 
Id!! 
;!! 
}"" 	
private$$ 
void$$ 
updateProperty$$ #
($$# $
PropertyInfo$$$ 0
currentProperty$$1 @
,$$@ A
House$$B G
currentHouse$$H T
,$$T U
House$$V [
updatedHouse$$\ h
)$$h i
{%% 	
if&& 
(&& 
currentProperty&& 
.&&  
GetValue&&  (
(&&( )
updatedHouse&&) 5
)&&5 6
!=&&7 9
null&&: >
)&&> ?
{'' 
currentProperty(( 
.((  
SetValue((  (
(((( )
currentHouse(() 5
,((5 6
currentProperty((7 F
.((F G
GetValue((G O
(((O P
updatedHouse((P \
)((\ ]
)((] ^
;((^ _
})) 
}** 	
}++ 
},, µ
ÅC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\PricePrediction\PredictHouseCommand.cs
	namespace 	
Application
 
. 
Features 
. 
PricePrediction .
{ 
public 

class 
PredictHouseCommand $
:% &
IRequest' /
</ 0
HouseDTO0 8
>8 9
{ 
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
HouseDTO		 
?		 
	HouseForm		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
}

 
} ›-
àC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\PricePrediction\PredictHouseCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
PricePrediction .
{ 
public		 

class		 &
PredictHouseCommandHandler		 +
:		, -
IRequestHandler		. =
<		= >
PredictHouseCommand		> Q
,		Q R
HouseDTO		S [
>		[ \
{

 
private 
readonly 
IUsersManager &
usersManager' 3
;3 4
private 
readonly 
IHouseRepository )
houseRepository* 9
;9 :
private 
readonly "
IUserHistoryRepository /!
userHistoryRepository0 E
;E F
public &
PredictHouseCommandHandler )
() *
IUsersManager* 7
usersManager8 D
,D E
IHouseRepositoryF V
houseRepositoryW f
,f g"
IUserHistoryRepositoryh ~"
userHistoryRepository	 î
)
î ï
{ 	
this 
. 
usersManager 
= 
usersManager  ,
;, -
this 
. 
houseRepository  
=! "
houseRepository# 2
;2 3
this 
. !
userHistoryRepository &
=' (!
userHistoryRepository) >
;> ?
} 	
public 
async 
Task 
< 
HouseDTO "
>" #
Handle$ *
(* +
PredictHouseCommand+ >
request? F
,F G
CancellationTokenH Y
cancellationTokenZ k
)k l
{ 	
if 
( 
request 
. 
	HouseForm !
==" $
null% )
||* ,
request- 4
.4 5
UserName5 =
==> @
nullA E
)E F
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
House 
createdHouse 
=  
new! $
House% *
{ 
DateSold 
= 
request "
." #
	HouseForm# ,
., -
DateSold- 5
,5 6
Price 
= 
request 
.  
	HouseForm  )
.) *
Price* /
,/ 0
Bedrooms   
=   
request   "
.  " #
	HouseForm  # ,
.  , -
Bedrooms  - 5
,  5 6
	Bathrooms!! 
=!! 
request!! #
.!!# $
	HouseForm!!$ -
.!!- .
	Bathrooms!!. 7
,!!7 8

LivingArea"" 
="" 
request"" $
.""$ %
	HouseForm""% .
."". /

LivingArea""/ 9
,""9 :
LotArea## 
=## 
request## !
.##! "
	HouseForm##" +
.##+ ,
LotArea##, 3
,##3 4
Floors$$ 
=$$ 
request$$  
.$$  !
	HouseForm$$! *
.$$* +
Floors$$+ 1
,$$1 2

Waterfront%% 
=%% 
request%% $
.%%$ %
	HouseForm%%% .
.%%. /

Waterfront%%/ 9
,%%9 :
View&& 
=&& 
request&& 
.&& 
	HouseForm&& (
.&&( )
View&&) -
,&&- .
	Condition'' 
='' 
request'' #
.''# $
	HouseForm''$ -
.''- .
	Condition''. 7
,''7 8
Grade(( 
=(( 
request(( 
.((  
	HouseForm((  )
.(() *
Grade((* /
,((/ 0
	AboveArea)) 
=)) 
request)) #
.))# $
	HouseForm))$ -
.))- .
	AboveArea)). 7
,))7 8
BasementArea** 
=** 
request** &
.**& '
	HouseForm**' 0
.**0 1
BasementArea**1 =
,**= >
	YearBuilt++ 
=++ 
request++ #
.++# $
	HouseForm++$ -
.++- .
	YearBuilt++. 7
,++7 8
YearRenovated,, 
=,, 
request,,  '
.,,' (
	HouseForm,,( 1
.,,1 2
YearRenovated,,2 ?
,,,? @
Zipcode-- 
=-- 
request-- !
.--! "
	HouseForm--" +
.--+ ,
Zipcode--, 3
}.. 
;.. 
var00 
userId00 
=00 
await00 
usersManager00 +
.00+ ,
GetUserIdByName00, ;
(00; <
request00< C
.00C D
UserName00D L
)00L M
;00M N
if11 
(11 
userId11 
==11 
null11 
)11 
{22 
throw33 
new33 #
EntityNotFoundException33 1
(331 2
$str332 H
)33H I
;33I J
}44 
await66 
houseRepository66 !
.66! "
AddAsync66" *
(66* +
createdHouse66+ 7
)667 8
;668 9
await77 !
userHistoryRepository77 '
.77' (
AddHouseAsync77( 5
(775 6
userId776 <
,77< =
createdHouse77> J
)77J K
;77K L
return99 
request99 
.99 
	HouseForm99 $
;99$ %
}:: 	
};; 
}<< ÿ
wC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Queries\GetHouseByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
Queries &
{ 
public 

class 
GetHouseByIdQuery "
:# $
IRequest% -
<- .
House. 3
>3 4
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
}		 
}

 ˘
~C:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Queries\GetHouseByIdQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Queries &
{ 
public 

class $
GetHouseByIdQueryHandler )
:* +
IRequestHandler, ;
<; <
GetHouseByIdQuery< M
,M N
HouseO T
>T U
{		 
private

 
readonly

 
IHouseRepository

 )

repository

* 4
;

4 5
public $
GetHouseByIdQueryHandler '
(' (
IHouseRepository( 8

repository9 C
)C D
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
House 
>  
Handle! '
(' (
GetHouseByIdQuery( 9
request: A
,A B
CancellationTokenC T
cancellationTokenU f
)f g
{ 	
House 
house 
= 
await 

repository  *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
house 
== 
null 
) 
{ 
throw 
new #
EntityNotFoundException 1
(1 2
$"2 4
$str4 B
{B C
requestC J
.J K
IdK M
}M N
$strN ^
"^ _
)_ `
;` a
} 
return 
house 
; 
} 	
} 
} ∆
tC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Queries\GetHousesQuery.cs
	namespace 	
Application
 
. 
Features 
. 
Queries &
{ 
public 

class 
GetHousesQuery 
:  !
IRequest" *
<* +
IEnumerable+ 6
<6 7
House7 <
>< =
>= >
{ 
public 
int 
? 
	PageIndex 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
int		 
?		 
PageSize		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} Ü
{C:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Queries\GetHousesQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Queries &
{ 
public 

class !
GetHousesQueryHandler &
:' (
IRequestHandler) 8
<8 9
GetHousesQuery9 G
,G H
IEnumerableI T
<T U
HouseU Z
>Z [
>[ \
{		 
private

 
readonly

 
IHouseRepository

 )

repository

* 4
;

4 5
public !
GetHousesQueryHandler $
($ %
IHouseRepository% 5

repository6 @
)@ A
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
House& +
>+ ,
>, -
Handle. 4
(4 5
GetHousesQuery5 C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
int 
	pageIndex 
= 
( 
int  
)  !
(! "
request" )
.) *
	PageIndex* 3
==4 6
null7 ;
?< =
PaginationConstants> Q
.Q R
	PageIndexR [
:\ ]
request^ e
.e f
	PageIndexf o
)o p
;p q
int 
pageSize 
= 
( 
int 
)  
(  !
request! (
.( )
PageSize) 1
==2 4
null5 9
||: <
request= D
.D E
PageSizeE M
==N P
$numQ R
?S T
PaginationConstantsU h
.h i
PageSizei q
:r s
requestt {
.{ |
PageSize	| Ñ
)
Ñ Ö
;
Ö Ü
Console 
. 
	WriteLine 
( 
	pageIndex '
)' (
;( )
Console 
. 
	WriteLine 
( 
pageSize &
)& '
;' (
return 
await 

repository #
.# $
GetAllAsync$ /
(/ 0
	pageIndex0 9
,9 :
pageSize; C
)C D
;D E
} 	
} 
} ‚
ÖC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\UserHistory\Queries\GetUserHistoryQuery.cs
	namespace 	
Application
 
. 
Features 
. 
UserHistory *
.* +
Queries+ 2
{ 
public 

class 
GetUserHistoryQuery $
:% &
IRequest' /
</ 0
IEnumerable0 ;
<; <
HouseDTO< D
>D E
>E F
{ 
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
}		 
}

 ¯
åC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\UserHistory\Queries\GetUserHistoryQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
UserHistory *
.* +
Queries+ 2
{ 
public 

class &
GetUserHistoryQueryHandler +
:, -
IRequestHandler. =
<= >
GetUserHistoryQuery> Q
,Q R
IEnumerableS ^
<^ _
HouseDTO_ g
>g h
>h i
{		 
private

 
readonly

 
IUsersManager

 &
usersManager

' 3
;

3 4
private 
readonly "
IUserHistoryRepository /!
userHistoryRepository0 E
;E F
public &
GetUserHistoryQueryHandler )
() *
IUsersManager* 7
usersManager8 D
,D E"
IUserHistoryRepositoryF \!
userHistoryRepository] r
)r s
{ 	
this 
. 
usersManager 
= 
usersManager  ,
;, -
this 
. !
userHistoryRepository &
=' (!
userHistoryRepository) >
;> ?
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
HouseDTO& .
>. /
>/ 0
Handle1 7
(7 8
GetUserHistoryQuery8 K
requestL S
,S T
CancellationTokenU f
cancellationTokeng x
)x y
{ 	
if 
( 
request 
. 
UserName  
==! #
null$ (
)( )
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
request7 >
)> ?
)? @
;@ A
} 
var 
userId 
= 
await 
usersManager +
.+ ,
GetUserIdByName, ;
(; <
request< C
.C D
UserNameD L
)L M
;M N
if 
( 
userId 
== 
null 
) 
{ 
throw 
new #
EntityNotFoundException 1
(1 2
$str2 H
)H I
;I J
} 
return 
await !
userHistoryRepository .
.. /
GetAllHousesAsync/ @
(@ A
userIdA G
)G H
;H I
}   	
}!! 
}"" ë
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Users\Queries\GetUserByName.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Queries% ,
{ 
public 

class 
GetUserByName 
:  
IRequest! )
<) *
UserDTO* 1
>1 2
{ 
public 
string 
? 
UserName 
{  !
get" %
;% &
set' *
;* +
}, -
}		 
}

 ù
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Users\Queries\GetUserByNameHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Queries% ,
{ 
public 

class  
GetUserByNameHandler %
:& '
IRequestHandler( 7
<7 8
GetUserByName8 E
,E F
UserDTOG N
>N O
{ 
private		 
readonly		 
IUsersManager		 &
usersManager		' 3
;		3 4
public  
GetUserByNameHandler #
(# $
IUsersManager$ 1
usersManager2 >
)> ?
{ 	
this 
. 
usersManager 
= 
usersManager  ,
;, -
} 	
public 
async 
Task 
< 
UserDTO !
>! "
Handle# )
() *
GetUserByName* 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 	
if 
( 
request 
. 
UserName  
==! #
null$ (
)( )
{ 
throw 
new !
ArgumentNullException .
(. /
nameof/ 5
(5 6
request6 =
)= >
)> ?
;? @
} 
return 
await 
usersManager %
.% &
GetUserByName& 3
(3 4
request4 ;
.; <
UserName< D
)D E
;E F
} 	
} 
} ù
yC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Users\Queries\GetUsersQuery.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Queries% ,
{ 
public 

class 
GetUsersQuery 
:  
IRequest! )
<) *
IEnumerable* 5
<5 6
UserDTO6 =
>= >
>> ?
{ 
} 
}		 È
ÄC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Features\Users\Queries\GetUsersQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Queries% ,
{ 
public 

class  
GetUsersQueryHandler %
:& '
IRequestHandler( 7
<7 8
GetUsersQuery8 E
,E F
IEnumerableG R
<R S
UserDTOS Z
>Z [
>[ \
{ 
private		 
readonly		 
IUsersManager		 &
usersManager		' 3
;		3 4
public  
GetUsersQueryHandler #
(# $
IUsersManager$ 1
usersManager2 >
)> ?
{ 	
this 
. 
usersManager 
= 
usersManager  ,
;, -
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
UserDTO& -
>- .
>. /
Handle0 6
(6 7
GetUsersQuery7 D
requestE L
,L M
CancellationTokenN _
cancellationToken` q
)q r
{ 	
return 
await 
usersManager %
.% &
GetUsers& .
(. /
)/ 0
;0 1
} 	
} 
} Œ
vC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Interfaces\IAuthenticationManager.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface "
IAuthenticationManager +
{ 
public 
Task 
< 
(  
AuthenticationStatus )
Status* 0
,0 1
string2 8
?8 9
ErrorMessage: F
)F G
>G H
RegisterI Q
(Q R
RegisterModelR _
registerModel` m
)m n
;n o
public

 
Task

 
<

 
(

  
AuthenticationStatus

 )
Status

* 0
,

0 1

LoginToken

2 <
?

< =
Token

> C
,

C D
string

E K
?

K L
ErrorMessage

M Y
)

Y Z
>

Z [
Login

\ a
(

a b

LoginModel

b l

loginModel

m w
)

w x
;

x y
} 
} °
pC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Interfaces\IHouseRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IHouseRepository %
:& '
IRepository( 3
<3 4
House4 9
>9 :
{; <
} 
} È
kC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Interfaces\IRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where* /
TEntity0 7
:8 9

BaseEntity: D
{ 
Task 
< 
TEntity 
> 
AddAsync 
( 
TEntity &
entity' -
)- .
;. /
Task 
< 
TEntity 
> 
UpdateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task		 
<		 
TEntity		 
>		 
DeleteAsync		 !
(		! "
TEntity		" )
entity		* 0
)		0 1
;		1 2
Task

 
<

 
IEnumerable

 
<

 
TEntity

  
>

  !
>

! "
GetAllAsync

# .
(

. /
)

/ 0
;

0 1
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "
GetAllAsync# .
(. /
int/ 2
	pageIndex3 <
,< =
int> A
pageSizeB J
)J K
;K L
Task 
< 
TEntity 
> 
GetByIdAsync "
(" #
Guid# '
id( *
)* +
;+ ,
} 
} ì
vC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Interfaces\IUserHistoryRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface "
IUserHistoryRepository +
:, -
IRepository. 9
<9 :
UserHistory: E
>E F
{ 
Task 
< 
IEnumerable 
< 
HouseDTO !
>! "
>" #
GetAllHousesAsync$ 5
(5 6
string6 <
userId= C
)C D
;D E
Task		 
<		 
House		 
>		 
AddHouseAsync		 !
(		! "
string		" (
userId		) /
,		/ 0
House		1 6
createdHouse		7 C
)		C D
;		D E
}

 
} ˇ
mC:\Users\rbulb\source\repos\roxana413\.NET-Project\PricePredictionApp\Application\Interfaces\IUsersManager.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IUsersManager "
{ 
Task 
< 
IEnumerable 
< 
UserDTO  
>  !
>! "
GetUsers# +
(+ ,
), -
;- .
Task 
< 
UserDTO 
> 
GetUserByName #
(# $
string$ *
userName+ 3
)3 4
;4 5
Task		 
<		 
string		 
?		 
>		 
GetUserIdByName		 %
(		% &
string		& ,
userName		- 5
)		5 6
;		6 7
}

 
} 