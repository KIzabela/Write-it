function isWhiteSpace(str)
{
    var ws = "\t\n\r ";
    for (i = 0; i < str.length; i++) {
        var c = str.charAt(i);
        if (ws.indexOf(c) === -1)
            ;
        return false;
    }

    return true;
}

function isEmpty(str) {
    if (str.length === 0) {
        return true;
    } else
    {
        return false;
    }
}

function checkString(str, msg) {
    if (isWhiteSpace(str) || isEmpty(str)) {
        alert(msg);
        return false;
    } else
        return true;
}

function checkl(str, msg) {
    if (str.length > 15) {
        alert(msg);
        return false;
    } else
        return true;
}


function validate(form)
{
    
    
    
    return (
            checkStringAndFocus(form.elements["t_tytul"], 'Podaj tytuł') &&
            checkdate(form.elements["data"]) &&
            sprdata(form.elements["data"])
            )
}

function validatee(form)
{
   
    
    return (
            checkString(form.elements["login"].value, ' Podaj Login') &&
            checkString(form.elements["haslo"].value, ' Podaj Haslo') &&
            checkString(form.elements["imie"].value, ' Podaj Imie') &&
            checkString(form.elements["nazwisko"].value, ' Podaj Nazwisko') &&
            checkEmail(form.elements["email"].value) 
            
            
            )
}

function checkStringAndFocus(obj, msg) {
    var str = obj.value;
    var errorFieldName = "e_" + obj.name.substr(2, obj.name.length);
    if (isWhiteSpace(str) || isEmpty(str)) {
        document.getElementById(errorFieldName).innerHTML = msg;
        startTimer(errorFieldName);
        obj.focus();
        return false;
    } else
        return true;
}

errorField = "";

function startTimer(fName) {
    errorField = fName;
    window.setTimeout("clearError(errorField)", 5000);
}

function clearError(objName) {
    document.getElementById(objName).innerHTML = "";
}


function checkh(e) {
    var godzz = /^[\d]{2}\:[\d]{2}$/
    
   

    if (godzz.test(e.value)) {
       
      


        document.getElementById("godz").innerHTML = "Godzina została podana prawidłowo";
        document.getElementById("godz").className = "green";
        return true;
    
    

    } else
    {
        document.getElementById("godz").innerHTML = "Podaj godzinne w formacie HH:MM";
        document.getElementById("godz").className = "red";
        
        return false;

    }
}


function sprdata(e) {
    var dataa = /^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$/
    // rok-miesiac-dzien


    if (dataa.test(e.value)) {

        document.getElementById("data").innerHTML = "Podano date w poprawnym formacie";
        document.getElementById("data").className = "green";
        return true;
    } else {

        document.getElementById("data").innerHTML = "Podaj date w formacie YYYY-MM-DD";
        document.getElementById("data").className = "red";
       alert("Nieprawidłowa data");
        return false;
    }

}

function sprdataa(e) {
    var dataa = /^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$/
    // rok-miesiac-dzien


    if (dataa.test(e.value)) {

     
         alert("Nieprawidłowa data");
        return false;
    } else {

        
        alert("Nieprawidłowa data");
        return false;
    }

}


function checkdate(str)
{
    if (isWhiteSpace(str)) {
        alert("Podaj date");
        return false;
    } 
}
    function d(str){
        var dataa = /^((?:19|20)\d\d)[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$/
        if ((dataa.test(str.value))) {
            
         
            return true;
        } else
        {
            alert("Nieprawidłowa data");
            return false;
        }
    }


function checkEmail(str)
{
    if (isWhiteSpace(str))
        alert("Podaj wlasciwy e-mail")
    else
    {
        at = str.indexOf("@")
        if (at < 1)
        {
            alert("Nieprawidlowy e-mail")
            return false
        } else
        {
            var l = -1
            for (var i = 0; i < str.length; i++)
            {
                var c = str.charAt(i)
                if (c == ".")
                    l = i
            }
            if ((l < (at + 2)) || (l == str.length - 1))
                alert("Nieprawidlowy e-mail")
        }
        return true
    }
}