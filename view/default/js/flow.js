window.onload = function () {
    var fm = document.flow;
    var total = document.getElementById('total');
    var sum = 0;
    for (var i = 0; i < fm.delivery_radio.length; i++) {
        if (fm.delivery_radio[i].checked == true) {
            document.getElementById('price1').innerHTML = fm.delivery_radio[i].value;
            document.getElementById('price2').innerHTML = fm.delivery_radio[i].getAttribute('add');
            //计算重量
            var weight = parseFloat(fm.delivery_radio[i].getAttribute('weight')) > 10 ? parseFloat(fm.delivery_radio[i].getAttribute('weight')) : 10;
            var priceTotal = parseFloat(fm.delivery_radio[i].value) + (weight - 10) * fm.delivery_radio[i].getAttribute('add');
            //总价格
            document.getElementById('price3').innerHTML = priceTotal;
            total.getElementsByTagName('strong')[1].innerHTML = priceTotal;
            document.getElementById('delivery').innerHTML = priceTotal;


            fm.delivery.value = fm.delivery_radio[i].title;
        }
    }
    for (i = 0; i < fm.pay_radio.length; i++) {
        if (fm.pay_radio[i].checked == true) {
            document.getElementById('pay').innerHTML = fm.pay_radio[i].value;
            total.getElementsByTagName('strong')[2].innerHTML = fm.pay_radio[i].value;
            fm.pay.value = fm.pay_radio[i].title;
        }
    }
    for (i = 0; i < total.getElementsByTagName('strong').length; i++) {
        sum += Number(total.getElementsByTagName('strong')[i].innerHTML);
    }
    document.getElementById('price').innerHTML = sum;
    fm.price.value = sum;
};

function changeDelivery(delivery) {
    var fm = document.flow;
    var sum = 0;
    var total = document.getElementById('total');
    document.getElementById('price1').innerHTML = delivery.value;
    document.getElementById('price2').innerHTML = delivery.getAttribute('add');

    //计算重量
    var weight = parseFloat(delivery.getAttribute('weight')) > 10 ? parseFloat(delivery.getAttribute('weight')) : 10;
    var priceTotal = parseFloat(delivery.value) + (weight - 10) * delivery.getAttribute('add');
    //总价格
    document.getElementById('price3').innerHTML = priceTotal;
    total.getElementsByTagName('strong')[1].innerHTML = priceTotal;
    document.getElementById('delivery').innerHTML = priceTotal;

    fm.delivery.value = delivery.title;
    for (var i = 0; i < total.getElementsByTagName('strong').length; i++) {
        sum += Number(total.getElementsByTagName('strong')[i].innerHTML);
    }
    document.getElementById('price').innerHTML = sum;
    fm.price.value = sum;
}

function changePay(pay) {
    var fm = document.flow;
    var sum = 0;
    var total = document.getElementById('total');
    document.getElementById('pay').innerHTML = pay.value;
    total.getElementsByTagName('strong')[2].innerHTML = pay.value;
    fm.pay.value = pay.title;
    for (var i = 0; i < total.getElementsByTagName('strong').length; i++) {
        sum += Number(total.getElementsByTagName('strong')[i].innerHTML);
    }
    document.getElementById('price').innerHTML = sum;
    fm.price.value = sum;
}



