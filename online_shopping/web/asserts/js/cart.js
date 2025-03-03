//let creament = document.getElementById("creament")
//        let uncreament = document.getElementById("uncreament")
//        let text = document.getElementById("text")
//        let click = document.getElementById("click")
//        let tien = document.getElementById("tien")
//        let tienok = document.getElementById("tienok")
//
//        let count = 1;
//        let productId = document.getElementById("productId").value; // Lấy ID sản phẩm
//
//        function updateQuantity(change) {
//        let quantity = parseInt(text.value) + change;
//                if (quantity < 1) return;
//                text.value = quantity; // Cập nhật giá trị hiển thị
//
//                // Gửi POST request đến server
//                method: "POST",
//                headers: {
//                "Content-Type": "application/x-www-form-urlencoded"
//                },
//                body: new URLSearchParams({
//                quantity: quantity,
//                        id: productId
//                })
//        }).then(response => {
//if (!response.ok) {
//console.error("Lỗi khi cập nhật số lượng");
//}
//}).catch(error => console.error(error));
//}
//
//uncreament.addEventListener("click", () => {
//updateQuantity(1);
//})
//
//        creament.addEventListener("click", () => {
//        if (text.value > 1) {
//        updateQuantity( - 1);
//        }
//
//        })
//
//        click.addEventListener("change", (e) => {
//        if (e.target.checked === true) {
//        tien.innerHTML = parseInt(text.value) * parseInt(tienok.textContent)
//        }
//        if (e.target.checked === false) {
//        tien.innerHTML = '₫0'
//        }
//        })
function toggleCheckboxes(checkboxElem) {
    let index = checkboxElem.dataset.index; // Lấy index của nhóm checkbox
    let isChecked = checkboxElem.checked; // Trạng thái check

    // Chọn tất cả các checkbox con có cùng data-index
    document.querySelectorAll(`.item-checkbox-${index}`).forEach((checkboxItem) => {
        checkboxItem.checked = isChecked;
    });

    // Nếu bỏ check nhóm, bỏ check luôn all-checkbox-first
    if (!isChecked) {
        document.querySelector("#all-checkbox-first").checked = false;
    }

    // Kiểm tra nếu tất cả nhóm đều được check, thì check luôn all-checkbox-first
    document.querySelector("#all-checkbox-first").checked = isAllChecked(".all-checkbox");

    // Cập nhật tổng tiền và số lượng
    updateTotal();
}

function checkAll(checkboxElem) {
    let isChecked = checkboxElem.checked; // Trạng thái check

    // Chọn tất cả item-checkbox và nhóm-checkbox
    document.querySelectorAll(".item-checkbox, .all-checkbox").forEach((checkboxItem) => {
        checkboxItem.checked = isChecked;
    });

    // Cập nhật tổng tiền và số lượng
    updateTotal();
}

function checkItem(checkboxElem) {
    let index = checkboxElem.dataset.index;

    // Kiểm tra nếu tất cả các checkbox con của nhóm đều được check
    let groupCheckbox = document.querySelector(`#group-checkbox-${index}`);
    if (groupCheckbox) {
        groupCheckbox.checked = isAllChecked(`.item-checkbox-${index}`);
    }

    // Kiểm tra nếu tất cả nhóm đều được check, thì check luôn all-checkbox-first
    document.querySelector("#all-checkbox-first").checked = isAllChecked(".all-checkbox");

    // Cập nhật tổng tiền và số lượng
    updateTotal();
}

// Kiểm tra xem tất cả checkbox có selector cụ thể có được check không
function isAllChecked(selector) {
    let checkboxes = document.querySelectorAll(selector);
    return checkboxes.length > 0 && [...checkboxes].every((checkbox) => checkbox.checked);
}

// Hàm cập nhật tổng tiền và tổng số lượng của tất cả các item-checkbox được chọn
function updateTotal() {
    let totalPrice = 0;
    let totalQuantity = 0;

    // Xóa tất cả input hidden cũ trước khi thêm mới
    document.querySelectorAll("input[name='productIds']").forEach(input => input.remove());

    // Lặp qua tất cả item-checkbox đang được check
    document.querySelectorAll(".item-checkbox:checked").forEach((checkbox) => {
        let index = checkbox.dataset.index;
        let { currentPrice, quantity } = calculateMoney(index);

        totalPrice += currentPrice * quantity;
        totalQuantity += quantity;

        // Lấy productId từ thẻ <a>
        let productLink = document.querySelector(`.product-id-${index}`);
        if (productLink) {
            let productId = productLink.dataset.productid;

            // Tạo input hidden và thêm vào form
            let hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = "productIds";
            hiddenInput.value = productId;
            document.querySelector("#product-id-inputs-list").appendChild(hiddenInput);
        }
    });

    // Cập nhật vào phần tử hiển thị tổng tiền
    document.querySelector("#totalAmount").textContent = `${totalPrice.toLocaleString()} $`;
}


// Hàm tính tiền và số lượng của một item dựa trên index
function calculateMoney(index) {
    let currentPrice = 0;
    let quantity = 0;

    let currentPriceElement = document.querySelector(`.current-price-${index}`);
    if (currentPriceElement) {
        currentPrice = parseFloat(currentPriceElement.dataset.price);
    }

    let quantityElement = document.querySelector(`.quantity-${index}`);
    if (quantityElement) {
        quantity = parseInt(quantityElement.value) || 0;
    }

    return { currentPrice, quantity };
}


