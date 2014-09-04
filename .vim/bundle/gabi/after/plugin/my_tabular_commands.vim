" tabularize: spatiere dupa :
" todo: executa evenimentul de addtabularpattern dupa ce s-a incarcat
" plugin-ul
" posibila solutie aici:
" http://stackoverflow.com/questions/5010162/if-existscommand-fails-on-startup-using-pathogen
if exists(':Tabularize')
    AddTabularPattern! asterisk /*/l1
    " first :
    " util in js cand vrei sa aranjezi dupa primul :
    " nu l-am denumit f: pentru ca : este un caracer special
    " acronimul este 'first double colon'
    AddTabularPattern! fdc /^[^:]*:\s*\zs/l1l0
    " first ,
    " util in php cand vrei sa aranjezi dupa primul ,
    AddTabularPattern! f, /^[^,]*,\s*\zs/l1l0
    " first =
    " util in php cand vrei sa aranjezi dupa primul =
    AddTabularPattern! f= /^[^=]*\zs=/l1l1
    " first =>
    " util in php cand vrei sa aranjezi dupa primul =>
    AddTabularPattern! f=> /^[^=]*\zs=>/l1l1
endif
