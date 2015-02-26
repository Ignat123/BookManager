function saveCookie(name, value){
  var CookieDate = new Date;
  CookieDate.setFullYear(CookieDate.getFullYear( ) +10);
  document.cookie = name + "=" + value + "; path=/; expires=" + CookieDate + ";";
}

function saveCookieWithReload(name, value){
  saveCookie(name, value);
  location.reload();
}