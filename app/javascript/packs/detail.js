document.addEventListener("turbolinks:load", function() {
    var MainImg = document.getElementById("MainImg")
    var thumbnail = document.getElementsByClassName("product-thumbnail")
    var thumbnailImg = document.getElementsByClassName("product-thumbnail-img")


    for (var i = 0; i < thumbnail.length; i++) {
        thumbnail[i].addEventListener("click", ShowImg)
    }

    MainImg.addEventListener("mousemove", function(event) {
        ZoomImg(event);
    })

    MainImg.addEventListener("mouseleave", ZoomOut)


    function ShowImg() {

        thumbnail[0].addEventListener("click", function() {
            MainImg.src = thumbnailImg[0].src
        })
        thumbnail[1].addEventListener("click", function() {
            MainImg.src = thumbnailImg[1].src
        })
        thumbnail[2].addEventListener("click", function() {
            MainImg.src = thumbnailImg[2].src
        })

    }


    function ZoomImg(event) {

        clientX = event.clientX - MainImg.offsetLeft
        clientY = event.clientY - MainImg.offsetTop
        Width = MainImg.offsetWidth
        Height = MainImg.offsetHeight
        clientX = clientX / Width * 40
        clientY = clientY / Height * 40
        MainImg.style.transform = "translate(-" + clientX + "%,-" + clientY + "%) scale(1.5)"

    }

    function ZoomOut() {
        MainImg.style.transform = "translate(-50%,-20%) scale(1)"
    }
    /*------*/
});