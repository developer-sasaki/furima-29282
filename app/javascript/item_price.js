// // 販売価格が入力されたら、販売手数料と販売利益を計算してくれます
// $(function(){
//   $( document ).on( 'keyup', 'ここに販売価格入力欄のclassもしくはid名', function(){ 
//     // 販売価格の入力欄に入力すると動きます
//     let amount = $( this ).val();
//     // 販売価格の入力欄に入力された値を変数「amount」に代入
//     let tax = Math.ceil(amount * 0.1);
//     // 販売手数料は10%としています。またMath.ceilメソッドで1円単位に切り上げています。
//     // 計算結果を変数「tax」に代入
//     let profit = Math.floor(amount * 0.9);
//     // 利益は残りの金額。Math.floorメソッドで、1円単位で切り捨てておけば「販売価格 = 販売手数料 + 販売利益」が成り立ちます。
//     // 計算結果は変数「profit」に代入。
//     $('ここに販売手数料の欄のclassもしくはid名').html(tax);
//     // htmlメソッドを使って販売手数料の欄を丸ごと書き換えます。
//     $('ここに販売利益の欄のclassもしくはid名').html(profit);
//     // 同じように販売利益の欄も書き換えます。
//   });
//  });

function check() {
    //要素を取得してくる記述をする
    const items = document.getElementById(".item-price");
    const items = document.getElementById(".dd-tax-price");
    const items = document.getElementById(".profit");
    
    //イベントはinputで発火させる
    items.addEventListener("input", () => {
     

      // 要素取得した値を使って計算処理をしていただく
      
      const add-tax-price = item-price * 0.1;
      const profit = price * 0.9;
     
      console.log(item-price);
      console.log(add-tax-price);
      console.log(profit);

  });
}
  window.addEventListener("load", check);
