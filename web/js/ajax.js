$(document).ready(function(){
    $('select[name=selCidade]').on('change', function(){
        console.log('Select Ativo');
//        $.ajax({
//            type: 'POST',
//            url: 'ControllerCliente',
//            data: 'codigoCidade='+ $('#selCidades').val(),
//            statusCode: {
//                404: function() {
//                    console.log('Pagina não encontrada');
//                },
//                500: function(){
//                    console.log('Erro no servidor');
//                }
//            },
//            success: function(dados){
//                console.log('requisicao efetuada com sucesso');
////                pegadados = dados.split(":");
//                limparselect();
//                if(dados == '')
//                    $('#nomeprovincia').append('<option>Pais sem nenhuma provincia</option>');
//                else{
//                    for(var i = 0; i < pegadados.length - 1; i++){
//                        var codigoprovincia = pegadados[i].split("-")[0]; 
//                        var nomeprovincia = pegadados[i].split("-")[1];
//                        $('#nomeprovincia').append('<option value ="'+codigoprovincia+'">'+nomeprovincia+'</option>');
//
//                    }
//                }
//            }
//        }) 
//        function limparselect(){
////            $('#nomeprovincia option').remove();
//        }
    }); 
});