$(document).on('turbolinks:load', function() {
  $('.bottomm').jscroll({
    // 無限に追加する要素は、どこに入れる？
    contentSelector: '.tweet-item', 
    // 次のページにいくためのリンクの場所は？ ＞aタグの指定
    nextSelector: 'a.next',
    // 読み込み中の表示はどうする？
    loadingHtml: 'ロード中'
  });
});

