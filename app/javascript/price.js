function price() {
  const itemPrice = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  itemPrice.addEventListener('input',() =>{
    const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1).toLocaleString();
        addTaxDom.innerHTML = tax ;
        profitDom.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
  })

}

window.addEventListener('load', price);