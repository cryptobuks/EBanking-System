var r={
  
  'notnumbers':/[^\d]/g
}

function valid(o,w){
  o.value = o.value.replace(r[w],'');
}
