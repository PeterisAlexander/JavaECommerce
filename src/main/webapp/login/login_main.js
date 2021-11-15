/**
 * 
 */

//Notification
let notifSuccess = document.getElementById('notifSuccess-content');
let notifFail = document.getElementById('notifFail-content');
let btnUp = document.getElementById('btnUp');

//Audio notification success
var audioSuccess = new Audio('../assets/sounds/notif-success.mp3');
var audioFail = new Audio('../assets/sounds/notif-fail.mp3');


function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}


function genererPassword() {
    var alphaNumber = "abcdefghijklmnopqrstuvwxyz0123456789";
    const charactersLength = alphaNumber.length;
    const numbers = [8, 9, 10, 11, 12];
    const ramdomLenght = numbers[Math.floor(Math.random() * numbers.length)];
    let result = ' ';
    for (let i = 0; i < ramdomLenght; i++) {
        result += alphaNumber.charAt(Math.floor(Math.random() * charactersLength));
    }
    console.log(result);
    document.getElementById('inputPassword').value = result;
}

function showPassword() {
    var x = document.getElementById("inputPassword");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function authentifier() {
    var name = document.getElementById('inputName').value;
    var email = document.getElementById('inputEmail').value;
    var password = document.getElementById('inputPassword').value;

    if (name == "admin" && password == "admin") {
        sleep(1000).then(()=> {
            audioSuccess.play();
            notifSuccess.style.display = 'block';
            sleep(3000).then(() => {
                window.location.href = '../accueil/accueil.html'; 
            });
        });
    }
    else {
        sleep(1000).then(()=> {
            audioFail.play();
            notifFail.style.display = 'block';
            sleep(4000).then(() => {
                notifFail.style.display = 'none';
            });
        });
    }
}

