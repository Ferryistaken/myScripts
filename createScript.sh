#!/bin/sh

#touch $1 && chmod +x $1 && nvim $1
nvim $1; if [ -e $1 ] ; then chmod +x $1 && echo "#!/bin/sh" > $1; fi
