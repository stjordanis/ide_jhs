coclass'jlogin'
coinsert'jhs'

HBS=: 0 : 0
login
'<MSG>'
jhtablea
 jhtr 'user: '    ;'user' jhtext'';15
 jhtr 'password: ';'pass' jhpassword'';15
jhtablez
loggedin
)

login=: 0 : 0
<h1>J login</h1>
)

loggedin=: 0 : 0
<br/><span style="color:red;">
<h1>SECURITY!</h1>
Logout when you are finished
(close browser or menu command logout).
</span>
)

NB. does not work
goto=: 3 : 0
create_jijx_'  '
)

NB. login not allowed after LIMIT failures
NB. jum sets to _ (multiple users)
LIMIT=: 10

CSS=: JS=: ''

count=: 0
logins=: ''

jev_get=: create

ev_pass_enter=: create

invalid=: 0 : 0
<span style="color:red;">Invalid login (<COUNT>).<br>
Check with system admin if you are unable to login.
</span><br><br>
)

getmessage=: 3 : 0
>(count>0){'';invalid hrplc 'COUNT';":count
)

expires=: 'jcookie=; Mon, 1-Jan-2000 00:00:00 GMT;'

NB. called from core input if cookie required and not set
NB. valid login   - goes to page and does SetCookie
NB. invalid login - shows page with setcookie expires and no-cache
create=: 3 : 0
p=. PASS
if. -.p-:PASS do. count=: 0 end. NB. new password resets count
u=. getv'user'
p=. getv'pass'
logins=: logins,u,'/',p,LF
if. (count<:LIMIT)*.(u-:USER)*.p-:PASS do.
 count=: 0
 SETCOOKIE_jhs_=: 1
 PROMPT_jhs_=: '   '
 goto''
else.
 count=: count+METHOD-:'post'
 b=. (jhbs HBS)hrplc 'MSG';getmessage''
 t=. hrtemplate rplc (CRLF,CRLF);CRLF,'Cache-Control: no-cache',CRLF,CRLF
 t=. t rplc (LF,LF);LF,'Set-Cookie: ',expires,LF,LF
 htmlresponse t hrplc'TITLE CSS JS BODY';'jlogin';(css CSS);(js JS);b
end.
)

JS=: 0 : 0
function ev_body_load(){try{jform.user.focus();}catch(ex){;}}

// jsubmit done by default only for buttons (no state change)
function ev_pass_enter(){jsubmit();} 
)
