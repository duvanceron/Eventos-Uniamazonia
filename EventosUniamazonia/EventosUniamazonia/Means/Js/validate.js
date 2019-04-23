
(function () {//Funciones autoejecutables
    var form = document.getElementById("formRegisterID").elements;

    function focusInput() {
        this.parentElement.children[1].className = "labelDesign labelActive";
        this.parentElement.children[0].className = this.parentElement.children[0].className.replace("error", "  ");
    }
    function blurInput() {
        if (this.value <= 0 ) {
            this.parentElement.children[1].className = "labelDesign";
            this.parentElement.children[0].className = this.parentElement.children[0].className + " error";

        }
    }


    for (let i = 0; i < form.length; i++) {
        if (form[i].type == "password" || form[i].type == "text" || form[i].type == "email") {
            form[i].addEventListener("focus", focusInput);
            form[i].addEventListener("blur", blurInput);
        }

    }


    function send(e) {
        if (!blurInput()) {
            console.log("Datos incorrectos(inputs)");
            e.preventDefault();
        } else {
            console.log("Datos correctos (enviando)");
        }
    }
    function nameNotIsLetter() {
        var userValue = document.getElementById("name").value;
        var userLast = document.getElementById("lastName").value;
        if (!isNaN(userValue) ) {
            return true;
        }
    }

})();

