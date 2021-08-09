window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxValue = Math.floor(inputValue * 0.1);
    const profitValue = (inputValue - taxValue)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = taxValue;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profitValue;
  })
});