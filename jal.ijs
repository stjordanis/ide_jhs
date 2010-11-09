NB. J HTTP Server - jal/pacman app
coclass'jal'
coinsert'jhs'
require'pacman'

jhostpath_j_=: jpath_j_ NB.! required by remove - temp fix

HBS=: 0 : 0
jhma''
 jhjmlink''
jhmz''

'<h1>J Active Library - pacman - Package Manager<h1>'
'<a href="http://www.jsoftware.com/jwiki/addons">www.jsoftware.com/jwiki/addons</a>'
'<hr>'
'upable' jhb'Upgradeable'
'remable'jhb'Removeable'
'inst'   jhb'Installed'
'notin'  jhb'Not Installed'
'desc'   jhb'Descriptions'
'buttons'jhdiv'<BUTTONS>'
jhresize''
'result' jhdiv'<RESULT>'
)

maketable=: 3 : 0
b=. ((<'c_'),each{."1 y)jhcheckbox each <'';0
NB. b=. ,.(('c'),each ":each <"0 i.#y)jhcheckbox each <'';0
t=. jhtablea
t=. t,,jhtr"1 b,.y
t,jhtablez
)

create=: 3 : 0 NB. create - y replaces <RESULT> in body
'jal'jhr'BUTTONS RESULT';y
)

jev_get=: 3 : 0
create '';('update'jpkg'')rplc LF;'<br>'
)

ev_upable_click=: 3 : 0
'update'jpkg'' NB. update to make current
d=. 'showupgrade'jpkg''
if. #d do.
 b=. 'upgrade'jhb'Upgrade Selected'
 t=. maketable d
 create b;t
else.
 create '';'No upgrades available.'
end.
)

ev_remable_click=: 3 : 0
'update'jpkg'' NB. update to make current
d=. 'showinstalled'jpkg''
d=. d#~-.({."1 d) e. 'base library';'ide/jhs'
if. #d do.
 b=. 'remove'jhb'Remove Selected'
 t=. maketable d
 create b;t
else.
 create '';'Nothing to remove.'
end.
)

ev_notin_click=: 3 : 0
'update'jpkg'' NB. update to make current
b=. 'install'jhb'Install Selected'
t=. maketable'shownotinstalled'jpkg''
create b;t
)

ev_inst_click=: 3 : 0
'update'jpkg'' NB. update to make current
b=. 'upgrade'jhb'Upgrade Selected'
t=. maketable'showinstalled'jpkg''
create b;t
)

doselect=: 3 : 0
d=. {."1 NV
b=. (<'c_')=2{.each d
d=. b#d
y jpkg 2}.each d
jev_get''
)

ev_install_click=: 3 : 0
doselect'install'
)

ev_upgrade_click=: 3 : 0
doselect'upgrade'
)

ev_remove_click=: 3 : 0
doselect'remove'
)

descfix=: 3 : 0
i=. y i.LF
'<span style="color:red">',(i{.y),'</span>',}.i}.y
)

ev_desc_click=: 3 : 0
d=. ('showinstalled'jpkg''),'shownotinstalled'jpkg''
d=. /:~{."1 d
d=. 'show'jpkg d
d=. d rplc '== ';0{a.
d=. <;._1 d
d=. descfix each d
r=. ;d
create '';r rplc LF;'<br>'
)

JS=: 0 : 0
function evload(){if(jform.select) jform.select.focus();jresize();}
function ev_status_click() {jsubmit();}
function ev_update_click() {jsubmit();}
function ev_notin_click()  {jsubmit();}
function ev_inst_click()   {jsubmit();}
function ev_upable_click() {jsubmit();}
function ev_remable_click(){jsubmit();}
function ev_install_click(){jsubmit();}
function ev_desc_click()   {jsubmit();}
function ev_upgrade_click(){jsubmit();}
function ev_remove_click() {jsubmit();}
)
