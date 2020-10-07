window.addEventListener("load", function () {

    //要素を取得してくる記述をする
    const items1 = document.getElementById("item-price");
    const items2 = document.getElementById("add-tax-price");
    const items3 = document.getElementById("profit");

    //イベントはinputで発火させる
    items1.addEventListener("input",function () {
    //  items１の中身を取る記述

    const price = items1.value;
      // 要素取得した値を使って計算処理をしていただく

      console.log("price")
  
      const tax = Math.floor(price * 0.1); //販売手数料
      const profit = Math.floor(price * 0.9); //販売利益
     
      items2.textContent = tax; 
      items3.textContent = profit; 


  })
})
