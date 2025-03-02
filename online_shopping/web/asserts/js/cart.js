let creament = document.getElementById("creament")
        let uncreament = document.getElementById("uncreament")
        let text = document.getElementById("text")
        let click = document.getElementById("click")
        let tien = document.getElementById("tien")
        let tienok = document.getElementById("tienok")

        let count = 1;
        let productId = document.getElementById("productId").value; // Lấy ID sản phẩm

        function updateQuantity(change) {
        let quantity = parseInt(text.value) + change;
                if (quantity < 1) return;
                text.value = quantity; // Cập nhật giá trị hiển thị

                // Gửi POST request đến server
                method: "POST",
                headers: {
                "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams({
                quantity: quantity,
                        id: productId
                })
        }).then(response => {
if (!response.ok) {
console.error("Lỗi khi cập nhật số lượng");
}
}).catch(error => console.error(error));
}

uncreament.addEventListener("click", () => {
updateQuantity(1);
})

        creament.addEventListener("click", () => {
        if (text.value > 1) {
        updateQuantity( - 1);
        }

        })

        click.addEventListener("change", (e) => {
        if (e.target.checked === true) {
        tien.innerHTML = parseInt(text.value) * parseInt(tienok.textContent)
        }
        if (e.target.checked === false) {
        tien.innerHTML = '₫0'
        }
        })
