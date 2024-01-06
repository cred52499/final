function submitForm(cartDetailsID){
    var formId = 'deleteCart';
    var form = document.getElementById(formId);
    if (form) {
        document.getElementById('deleteCartId').value = cartDetailsID;
        form.submit();
    } else {
        console.error('Form with ID ' + formId + ' not found.');
    }
}