function check() {
    //要素を取得してくる記述をする
    const items = document.getElementById(".item-price");
    const items = document.getElementById(".dd-tax-price");
    const items = document.getElementById(".profit");
    
    //イベントはinputで発火させる
    items.addEventListener("input", () => {
     
      // 要素取得した値を使って計算処理をしていただく
  
      const add-tax-price = 10%
      var profit = 90%
      var item-price =add-tax-price + profit
     
      console.log(item-price);
      console.log(Math.floor(add-tax-price));
      console.log(Math.floor(profit));

  });
}
  window.addEventListener("load", check);
