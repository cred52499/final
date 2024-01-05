function submitForm(cartDetailsID){
    var formId = 'delete' + cartDetailsID;
    var form = document.getElementById(formId);
    if (form) {
        form.submit();
    } else {
        console.error('Form with ID ' + formId + ' not found.');
    }
}