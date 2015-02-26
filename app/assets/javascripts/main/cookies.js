function saveCookie(name, value){
  document.cookie = name + "=" + value + "; path=/";
}

function saveCookieWithReload(name, value){
  saveCookie(name, value);
  location.reload();
}