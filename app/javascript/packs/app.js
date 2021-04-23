document.addEventListener("turbolinks:load", function() {

    document.getElementById("sideopen").addEventListener("click", ToggleSidebar)

    document.getElementById("closeSidebar").addEventListener("click", ToggleSidebar)

    document.getElementById("toggle-menu").addEventListener("click", ToggleMenu)


    function ToggleSidebar() {
        var open = document.getElementById("sidebarcontent")
        if (open.style.width != "20vh") {
            open.style.width = "20vh"
            document.body.style.marginLeft = "20vh";
        } else {
            open.style.width = "0"
            document.body.style.marginLeft = "0";
        }
    }

    function ToggleMenu() {
        var menu = document.getElementById("menu");
        var user = document.getElementById("groupMenu")
        if (menu.style.display != "block") {
            menu.style.display = "block";
        } else if (menu.style.display == "block") {
            menu.style.display = "none";
        }
        if (user.style.display == "block") {
            menu.style.display = "block"
        }
    }

    var prevScrollpos = window.pageYOffset;
    window.onscroll = function() {
        var currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            document.querySelector(".navbar").style.top = "0";


        } else {
            document.querySelector(".navbar").style.top = "-100px";
        }
        prevScrollpos = currentScrollPos;
    }

    /*------*/
});