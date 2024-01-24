cabbrev vb vert sb
cabbrev vsz vertical resize +10
cabbrev hsz resize +10
cabbrev ssp set syntax=cpp

cabbrev csf vert scs find f
cabbrev cse vert scs find e

cabbrev lns %s/^/\=printf('%-4d', line('.'))
cabbrev flt %y z\|vnew\|0put=@z\|%!grep
cabbrev ci !tmux send-keys -t Dev:1.1 'build' C-m

cabbrev flr %s/field/\rfield/g


cabbrev evg EV git blame %

cabbrev evs EV svn blame --verbose %
cabbrev evg EV git blame %

cabbrev svnb EV svn blame --verbose %


cabbrev pb set mp=cd\ ~/home/build\ &&\ make\ -j10\ $*
cabbrev kb set mp=cd\ ~/home/kit/build\ &&\ make\ -j10\ $*
cabbrev eb set mp=cd\ ~/home/emea/build\ &&\ make\ -j10\ $*

cabbrev dbc DBSetOption dbname=config
cabbrev dbs DBSetOption dbname=statics
cabbrev dbt DBSetOption dbname=timescale

"cabbrev rc vnew | read !g++ -fpreprocessed -E %

set mp=cd\ ~/home/core/build\ &&\ make\ -j10\ $*

cabbrev gtd Git difftool -y
