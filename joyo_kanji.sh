#!/bin/bash

readonly URL="https://ja.wikipedia.org/wiki/%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97%E4%B8%80%E8%A6%A7"

curl $URL\
    | sed -n '/<table/,/<\/table>/p'\
    | sed -n '/<a.*class="extiw".*>.<\/a>.*/p'\
    | sed -E 's/.*<a.*>(.)<\/a>.*/\1/'\
    | tr '\n' ','\
    | sed 's/,$//'
