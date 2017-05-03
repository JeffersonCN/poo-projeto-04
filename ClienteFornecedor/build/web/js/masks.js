$(document).ready(function () {
    $(".table-cpf").mask("000.000.000-00", {reverse: true});
    $("#cpf").mask("000.000.000-00", {reverse: true});
    $(".table-cnpj").mask('00.000.000/0000-00', {reverse: true});
    $("#cnpj").mask('00.000.000/0000-00', {reverse: true});
    $(".table-telefone").mask('(00) 0000-0000');
    $("#telefone").mask('(00) 0000-0000');
});