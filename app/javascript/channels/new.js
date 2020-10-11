function price(){

const item_price = document.getElementById("item-price")
const tax_price = document.getElementById("add-tax-price")
const get_money = document.getElementById("profit")

item_price.addEventListener('keyup', function(){
     let amount = document.getElementById('item-price').value; 
     let tax = Math.ceil(amount * 0.1);
     let profit = Math.floor(amount * 0.9);
     tax_price.innerHTML = tax;
     get_money.innerHTML = profit;
     })
}
window.addEventListener('load', price)
