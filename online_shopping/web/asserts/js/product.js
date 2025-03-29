function submitForm(value) {
    document.getElementById("leadTo").value = value; // Đặt giá trị leadTo
    document.getElementById("form-product").submit(); // Submit form
}

 document.addEventListener("DOMContentLoaded", function () {
    let creament = document.getElementById("creament");
    let uncreament = document.getElementById("uncreament");
    let text = document.getElementById("text");
    let click = document.getElementById("click");
    let unitElement = document.getElementById("unit");
    let dataValue = parseInt(unitElement.getAttribute("data")); // Chuyển sang số

    uncreament.addEventListener("click", () => {
        console.log(text);
        if (parseInt(text.value) < dataValue) {
            text.value++;
        }
    });

    creament.addEventListener("click", () => {
        console.log(text.value);
        if (parseInt(text.value) > 1) {
            text.value--;
        }
    });

   text.addEventListener("input", function (e) {
        setTimeout(() => {
            let value = text.value;
            if (isNaN(value) || value < 1) {
               text.value = 1;
            } else if (value > dataValue) {
                text.value = dataValue;
            }
        }, 0); // Delay 1 chút để xử lý giá trị
    });
});
