const pay = () => {
  Payjp.setPublicKey("");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("ship_purchase[number]"),
      cvc: formData.get("ship_purchase[cvc]"),
      exp_month: formData.get("ship_purchase[exp_month]"),
      exp_year: `20${formData.get("ship_purchase[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("ship_purchase_number").removeAttribute("name");
      document.getElementById("ship_purchase_cvc").removeAttribute("name");
      document.getElementById("ship_purchase_exp_month").removeAttribute("name");
      document.getElementById("ship_purchase_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);