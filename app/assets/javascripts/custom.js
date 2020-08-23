$(document).on("turbolinks:load ajaxComplete", function() {
  // ハンバーガーメニュー
  $('#nav-toggle').on('click', function() {
    $('body').toggleClass('open');
  });
  // フラッシュのフェイドアウト
  $(".alert").delay(3000).fadeOut( 3000 );

  // セレクトボックスの変更でform送信
  $("#select_status").change(function () {
    // $("#contact_status_form").submit();
    // $(this).parent().submit();
    // $(this).parent().fadeOut();
    Rails.fire($("#contact_status_form")[0], 'submit');
  });
});
