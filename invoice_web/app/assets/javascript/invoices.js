function update_subtotal() {
    var subtotal = 0;
    $('.price').each(function (i) {
        var price = $(this).html();
        if (!isNaN(price)) subtotal += Number(price);
    });

    subtotal = subtotal.toFixed(2);
    $('#subtotal').html(subtotal);
    discount();
    update_balance();
}

function update_balance() {
    var total = Number($('#invoice_total').html()) * Number($('#9').val()) + Number($('#invoice_total').html());
    total = total.toFixed(2);
    $('.due').html(total);
    $('#invoice_total').html(total);
}

function discount() {
    var dis = Number($('#subtotal').html()) * Number($('#discount').val());
    dis = Number($('#subtotal').html()) - dis;
    dis = dis.toFixed(2);
    $('.due').html(dis);
    $('#invoice_total').html(dis);
}

function update_price() {
    var row = $(this).parents('.item-row');
    var price = row.find('.cost').val() * row.find('.qty').val();
    price = price.toFixed(2);
    isNaN(price) ? row.find('.price').html('NaN') : row.find('.price').html(price);
    update_subtotal();

}
function bind1() {
    $('.cost').blur(update_price);
    $('.qty').blur(update_price);
}

function bind(main, modal) {
    var n = main.val();
    modal.empty();
    modal.append(n);
}

function bind2(main, modal) {
    var n = main.text();
    modal.empty();
    modal.append(" " + n);
}

