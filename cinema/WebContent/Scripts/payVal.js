function changepaytest(p) {

    if (p == "p1") {
        document.getElementById("pay1").className = "pay_lft";
        document.getElementById("pay2").className = "pay_lft2";
        document.getElementById("pay3").className = "pay_lft2";
        document.getElementById("pay4").className = "pay_lft2";
        //document.getElementById("pay2").className = "pay_lft";
        // document.getElementById("liGiftCard").className = "pay_lft";
        document.getElementById("block13").style.display = 'none';
        document.getElementById("block11").style.display = 'block';
        document.getElementById("block12").style.display = 'none';
    }
    else {
        document.getElementById("pay1").className = "pay_lft2";
        document.getElementById("pay2").className = "pay_lft2";
        document.getElementById("pay3").className = "pay_lft2";
        document.getElementById("pay4").className = "pay_lft2";
    }
    if (p == "p2") {
        //document.getElementById("pay1").className = "pay_lft";
        document.getElementById("pay2").className = "pay_lft";
        // document.getElementById("liGiftCard").className = "pay_lft";
        document.getElementById("block13").style.display = 'none';
        document.getElementById("block11").style.display = 'none';
        document.getElementById("block12").style.display = 'block';
    }
    else {
        document.getElementById("pay1").className = "pay_lft2";
        document.getElementById("pay2").className = "pay_lft2";
        document.getElementById("pay3").className = "pay_lft2";
        document.getElementById("pay4").className = "pay_lft2";
    }
    if (p == "p3") {
        //document.getElementById("pay1").className = "pay_lft";
        //document.getElementById("pay2").className = "pay_lft";
        document.getElementById("pay3").className = "pay_lft";
        document.getElementById("block13").style.display = 'block';
        document.getElementById("block11").style.display = 'none';
        document.getElementById("block12").style.display = 'none';
    }
    else {
        document.getElementById("pay1").className = "pay_lft2";
        document.getElementById("pay2").className = "pay_lft2";
        document.getElementById("pay3").className = "pay_lft2";
        document.getElementById("pay4").className = "pay_lft2";
    }
    if (p == "p4") {
        //document.getElementById("pay1").className = "pay_lft";
        //document.getElementById("pay2").className = "pay_lft";
        document.getElementById("pay4").className = "pay_lft";
        document.getElementById("block13").style.display = 'block';
        document.getElementById("block11").style.display = 'none';
        document.getElementById("block12").style.display = 'none';
    }
    else {
        document.getElementById("pay1").className = "pay_lft2";
        document.getElementById("pay2").className = "pay_lft2";
        document.getElementById("pay3").className = "pay_lft2";
        document.getElementById("pay4").className = "pay_lft2";
    }
}