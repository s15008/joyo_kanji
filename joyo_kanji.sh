#!/bin/bash

readonly cmdname=`basename $0 .sh`
readonly URL="https://ja.wikipedia.org/wiki/%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97%E4%B8%80%E8%A6%A7"

# usage
function usage {
    echo "usage: ${cmdname} [-h] [-g] [-a]"
    echo ""
    echo "Arguments:"
    echo "-h    This!!!"
    echo "-g    Print out JOYO KANJI list and a gorilla simply"
    echo "-a    Print out JOYO KANJI list and an alpaca simply"
    exit 1
}

# output Joyo Kanji as CSV
function get_joyo_kanji_as_csv {
    curl $URL\
        | sed -n '/<table/,/<\/table>/p'\
        | sed -n '/<a.*class="extiw".*>.<\/a>.*/p'\
        | sed -E 's/.*<a.*>(.)<\/a>.*/\1/'\
        | tr '\n' ','\
        | sed 's/,$//'
}

# add gorilla to CSV header
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

# add alpaca to CSV header
function alpaca {
    cat <<'EOS'
　　　,へ, ‐- ‐､,へ
　　　 〉′ ,　、 ｀〈
　　　ﾉ _, ｲ __ﾄ-､　',
　 　 |　冫´Y ｀′　l
　 　 ｌ　 '､_ '＾'_,ノ　 l
　　　ヽ｀=三ﾆ－'　 |
　　　 │ =二ﾆ-　　|　　　　　　 　__ , ､ - ､ _
　　　　l　 -三ﾆ－ ├ー￢ ' ´￣ 　 　 　 　　｀ヽ,
　　　　「　_ﾆ二－　　　　 　 　 　 　 　 　 　 、 　丶
　　　　 l　 -三ﾆ -　　　　　　　　　　　 　 　 丶　　｀､
　　　　 〈　-ﾆ二ｰ _　　　　　　　　　　 　 　 　 '　　　冫
　　　　　〈　-三ﾆ-　 　 　 　 、　　 　 　 　 　 ,'　 　 /
　 　 　 　 ヽ ﾆ二ｰ -　　　 、　、　　 　 　 　 /,′　,′
　　　　　 　 ｀､ 三ﾆ -　　　 丶　、　　 　 _,彡′　 ,'
　　　　　　　　ヽ-二= - _　　　ヽ_≧==≦三=- 　 ﾉ
　　　　　　　　　ヾ三=三= -　　ﾉ￣〈ﾐ≦|ﾆ二ｰ　〈
　　　　　　　　 　 |｀ﾐ彳=　　 　 |　　 'ﾐ三lﾆ‐ﾆ-　 l
　　　　　 　 　 　 ｌ、ミ|ｰ　　　　 !　 　 ',二ﾐ_-_- 　 |
　　　　　　　　 　 ｢、ﾐ|二　　　　;　　　 lｰミ|－　　ﾉ
　　　　　　　　　　ﾐ,=人三_ 　 _,'　　　 ├ ﾐ|‐　　,′
　　　　　　　　　　 | 三|ﾐ、　｀´|　　　　 |　ﾐ|　　 !
　　　　　　　　　　 |　ﾆ| ﾐ、　 │　　　　l　=|　　冫
　　　　　　　 　 　 ｌ　‐｣　ﾐ、　 |　　　　 j､_/|　 /
　　　　　　　　　　 ヽ=ﾉ　 ﾐ_彡′ 　 　 ｀´　｀"′
EOS
}

# main
## option
while getopts agh OPT
do
    case $OPT in
        a)
            alpaca
            ;;
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
    get_joyo_kanji_as_csv
else
    echo "Option is bad!!!"
    usage
fi
