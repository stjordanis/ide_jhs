NB. J HTTP Server - jhelp app
coclass'jfiles'
coinsert'jhs'

HBS=: 0 : 0
jhresize''
files''
)

jev_get=: 3 : 0
'jfiles'jhr''
)

files=: 3 : 0
addrecent_jsp_''
'</div>',~'<div>',;fx each SPFILES_jsp_
)

fx=: 3 : 0
s=. ;shorts_jsp_ y
t=. jhref 'jijs';y;s NB. (jpath y);s
t=. t,(;(1>.20-#s)#<'&nbsp;'),y
NB.! t=. t,(;(1>.20-#s)#<'&nbsp;'),(_4}.isotimestamp>1{,(1!:0@jpath y)),' ',y
t,'<br>'
)


CSS=: 0 : 0
*{font-family:<PC_FONTFIXED>;}
)

JS=: 0 : 0
function ev_body_load(){jresize();}
)
