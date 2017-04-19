<!--Jquery-->
<script src="jQuery/jquery-1.12.3.js" type="text/javascript"></script>

<!--Bootstrap-->
<script src="Bootstrap/js/bootstrap.min.js"></script>

<!--jPush Menu-->
<script src="jPushMenu/js/jPushMenu.js" type="text/javascript"></script>

<!--Datepicker + Datepicker Bootstrap-->
<script src="Bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="js/datePickerScript.js" type="text/javascript"></script>


<!--Datables-->
<script src="datatables/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="datatables-responsive/dataTables.responsive.js" type="text/javascript"></script>
<!--<script src="datatables/js/dataTables.foundation.min.js" type="text/javascript"></script>-->

<!--Datables extesion-->
<script src="datatables/extensions/Buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="datatables/extensions/Buttons/js/buttons.foundation.min.js" type="text/javascript"></script>



<!--Metis Menu-->
<script src="metisMenu/metisMenu.min.js" type="text/javascript"></script>

<!--Controle menu lateral-->
<!--<script src="js/sb-admin-2.js" type="text/javascript"></script>-->

<!--Chama o menu lateral-->
<!--<script type="text/javascript">
    $("#btn-navTopMenu").click(function () {
        $("#teste").toggleClass("menuWrapper");
    });
</script>-->


<!--Chama o menu jPush para funcionamento com a classe toggle-menu-->
<script>

    /*Execução do JPsuh*/
    jQuery(document).ready(function ($) {
        $('.toggle-menu').jPushMenu();
    });

    /*Execução do Metis*/
    $(document).ready(function () {
        $(function () {
            $('#side-menu').metisMenu();
        });
    });

</script>

<!--Ativação da Datables-->
<script>
    $(document).ready(function () {
        $('#tabela').DataTable({
            "filter": false
        });
    });

</script>  

<script>
//    $(document).ready(function () {
//        var table = $('#example').DataTable({
//            lengthChange: false,
//            buttons: ['copy', 'excel', 'pdf', 'colvis']
//        });
//
//        table.buttons().container()
//                .appendTo('#example_wrapper .col-sm-6:eq(0)');
//    });
</script>

<!--A variável ?index? receberá como valor, a coluna que contém o input que invocou o evento. Para recuperar este objeto, foi utilizado o método parent() da biblioteca jQuery.

4. A variável ?nth? é apenas um string para ser usado posteriormente na seleção da coluna filtrada em todas as linhas da tabela. Por exemplo, ao filtrar a primeira coluna, seu conteúdo deverá ser ?#tabela td:nth-child(1)?, ou seja, um seletor CSS.

5. A variável ?valor? receberá o conteúdo o input que está sendo utilizado para fazer o filtro, convertendo o texto para maiúsculo. Essa conversão é feita para que a consulta seja ?case insensitive?, ou seja, não diferencie letras maiúsculas de minúsculas.

6. Para iniciar o filtro, todas as linhas são exibidas inicialmente para serem ocultadas depois, se for o caso.

7. Utilizamos a função each() da jQuery para realizar uma ação para cada coluna filtrada pelo seletor definido anteriormente pela variável ?nth?.

8-9. Caso a coluna filtrada contenha o texto digitado, a linha que a contém é ocultada. Para isso usamos novamente a função parent() para recuperar a tag TR que contém a tag TD utilizada para a verificação. A existência ou não do texto digitado na coluna nos é informada pela função indexOf() do Javascript, que retornará -1 se o valor informado não estiver contido no texto alvo. Assim, se a coluna não contém o texto digitado, a linha que a contém é ocultada. Vale notar que convertemos também o conteúdo da célula para maiúsculo, par não haver diferenciação na hora do filtro.

13-14. Nessas linhas, programamos o evento blur dos inputs para que seu conteúdo seja limpo ao perderem o foco.

Read more: http://www.linhadecodigo.com.br/artigo/3511/criando-um-filtro-automatico-nas-colunas-de-uma-tabela-html.aspx#ixzz4MXVy3iwD-->


<!--Controle para os filtros das tebelas-->
<script>
    $(function () {
        $("#tabela input").keyup(function () {
            var index = $(this).parent().index();
            var nth = "#tabela td:nth-child(" + (index + 1).toString() + ")";
            var valor = $(this).val().toUpperCase();
            $("#tabela tbody tr").show();
            $(nth).each(function () {
                if ($(this).text().toUpperCase().indexOf(valor) < 0) {
                    $(this).parent().hide();
                }
            });
        });
        $("#tabela input").blur(function () {
            $(this).val("");
        });
    });
//            Read more: http://www.linhadecodigo.com.br/artigo/3511/criando-um-filtro-automatico-nas-colunas-de-uma-tabela-html.aspx#ixzz4JbzZr1Ll

</script>
