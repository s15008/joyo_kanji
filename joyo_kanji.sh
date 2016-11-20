#!/bin/bash

readonly URL="https://ja.wikipedia.org/wiki/%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97%E4%B8%80%E8%A6%A7"

# usage
function usage {
    echo "usage: $0 [-h] [-gorilla]"
    exit 1
}

# output Joyo Kanji as scv
function get_joyo_kanji_as_csv {
    curl $URL\
        | sed -n '/<table/,/<\/table>/p'\
        | sed -n '/<a.*class="extiw".*>.<\/a>.*/p'\
        | sed -E 's/.*<a.*>(.)<\/a>.*/\1/'\
        | tr '\n' ','\
        | sed 's/,$//'
}

# add gorilla to csv header
function gorilla {
    cat <<'EOS'
　　　　　　　　　,r"´⌒｀ﾞ`ヽ
　　　　　　　／　,　　　-‐- !､
　　　 　　／　{,}f　　-‐- ,,,__､)
　　　　／　　 /　　.r'~"''‐--､)
　　,r''"´⌒ヽ{　　 ヽ　(・)ﾊ(・)}､
　/　　　　　　＼　　（⊂｀-'つ）i-､
　　　　　　　　　 `}. （__,,ノヽ_ﾉ,ﾉ　 ＼
　　　　　　　　　　 l　　 ｀-" ,ﾉ　　　 ヽ
　　　　　　　　　　 }　､､___,j''　　　　　 l
EOS
}

# main
## option
while getopts gh OPT
do
    case $OPT in
        g)
            gorilla
            ;;
        h)
            usage
            ;;
        \?)
            usage
            ;;
    esac
done

shift $((OPTIND - 1))

# beautifull command
if [ $# = 0 ]; then
    get_joyo_kanji_as_css
else
    echo "Option is bad!!!"
    usage
fi
