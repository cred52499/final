window.onload = function() {
    promptEvent();
};

function promptEvent() {
    var name = prompt("輸入後台帳號:");
    if (name == null || name == "" || name != "root") 
        location.assign('../index.jsp');
    else {
        var password = prompt("輸入後台密碼:");
        if(password==null||password!="1234")
            location.assign('../index.jsp');
        alert("登入成功!");
    } 
}