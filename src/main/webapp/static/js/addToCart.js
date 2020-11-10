let addToCartBtnCollection = document.getElementsByClassName("btn btn-success");
let cartIcon = document.querySelector("#cart-icon")
let cartCount = 0;
let cartIconInnerHtml = cartIcon.innerHTML;

for (let i = 0; i < addToCartBtnCollection.length; i++) {
    addToCartBtnCollection[i].addEventListener("click", addToCart);
}

function addToCart() {
    cartCount++;
    cartIcon.innerHTML = cartIconInnerHtml + cartCount;
}