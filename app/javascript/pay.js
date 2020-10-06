window.addEventListener('load',function(){
  let pay = document.getElementById("item-price")
  pay.addEventListener('input',function(){
    let pay_price = pay.value
    let tax = document.getElementById("add-tax-price")
    let profits = document.getElementById("profit")
    tax_price = (pay_price * 0.1)
    profits_price = (pay_price - tax_price)
    tax.innerHTML = tax_price
    profits.innerHTML = profits_price
  })
})