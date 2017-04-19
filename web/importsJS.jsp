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

    /*Execu��o do JPsuh*/
    jQuery(document).ready(function ($) {
        $('.toggle-menu').jPushMenu();
    });

    /*Execu��o do Metis*/
    $(document).ready(function () {
        $(function () {
            $('#side-menu').metisMenu();
        });
    });

</script>

<!--Ativa��o da Datables-->
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

<!--A vari�vel ?index? receber� como valor, a coluna que cont�m o input que invocou o evento. Para recuperar este objeto, foi utilizado o m�todo parent() da biblioteca jQuery.

4. A vari�vel ?nth? � apenas um string para ser usado posteriormente na sele��o da coluna filtrada em todas as linhas da tabela. Por exemplo, ao filtrar a primeira coluna, seu conte�do dever� ser ?#tabela td:nth-child(1)?, ou seja, um seletor CSS.

5. A vari�vel ?valor? receber� o conte�do o input que est� sendo utilizado para fazer o filtro, convertendo o texto para mai�sculo. Essa convers�o � feita para que a consulta seja ?case insensitive?, ou seja, n�o diferencie letras mai�sculas de min�sculas.

6. Para iniciar o filtro, todas as linhas s�o exibidas inicialmente para serem ocultadas depois, se for o caso.

7. Utilizamos a fun��o each() da jQuery para realizar uma a��o para cada coluna filtrada pelo seletor definido anteriormente pela vari�vel ?nth?.

8-9. Caso a coluna filtrada contenha o texto digitado, a linha que a cont�m � ocultada. Para isso usamos novamente a fun��o parent() para recuperar a tag TR que cont�m a tag TD utilizada para a verifica��o. A exist�ncia ou n�o do texto digitado na coluna nos � informada pela fun��o indexOf() do Javascript, que retornar� -1 se o valor informado n�o estiver contido no texto alvo. Assim, se a coluna n�o cont�m o texto digitado, a linha que a cont�m � ocultada. Vale notar que convertemos tamb�m o conte�do da c�lula para mai�sculo, par n�o haver diferencia��o na hora do filtro.

13-14. Nessas linhas, programamos o evento blur dos inputs para que seu conte�do seja limpo ao perderem o foco.

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
