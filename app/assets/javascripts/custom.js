$(document).on("turbolinks:load", function() {
  // ハンバーガーメニュー
  $('#nav-toggle').on('click', function() {
    $('body').toggleClass('open');
  });
  // フラッシュのフェイドアウト
  $(".alert").delay(3000).fadeOut( 3000 );
});
