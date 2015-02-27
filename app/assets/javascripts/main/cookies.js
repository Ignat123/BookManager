function saveCookie(name, value){
  var CookieDate = new Date;
  CookieDate.setFullYear(CookieDate.getFullYear( ) +10);
  document.cookie = name + "=" + value + "; path=/;" + getNextYear();
}

function saveCookieWithReload(name, value){
  saveCookie(name, value);
  location.reload();
}

function getNextYear() {
  var expiration_date = new Date();
  expiration_date.setFullYear(expiration_date.getFullYear() + 1);
  return "; expires=" + expiration_date.toGMTString();
}