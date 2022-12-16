ps axu |grep run.all |sed 's/\s\+/ /g' |cut -d' ' -f2|xargs -i kill -9 {}
ps axu |grep "tjx_train.py" |sed 's/\s\+/ /g' |cut -d' ' -f2|xargs -i kill -9 {}
# ps axu |grep "multiprocessing.spawn" |sed 's/\s\+/ /g' |cut -d' ' -f2|xargs -i kill -9 {}