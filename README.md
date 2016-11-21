# joyo_kanji
[常用漢字一覧](https://ja.wikipedia.org/wiki/%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97%E4%B8%80%E8%A6%A7)をCSVで取得します

usage: joyo_kanji [-h] [-g] [-a] [-t]

## js
list = []; Array.prototype.forEach.call(document.getElementsByTagName('table')[1].getElementsByClassName('extiw'), function(node) { list.push(node.textContent);}); console.log(list.join(','));
