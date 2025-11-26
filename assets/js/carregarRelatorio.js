
let carregando = false;


$(document).on("click", ".card", function () {


    $(".card").removeClass("selected");
    $(this).addClass("selected");

    if (carregando) return;
    carregando = true;

    let tipo = $(this).data("relatorio");

    $.ajax({
        url: "/SistemaBookare/includes/dashboard/tabViews/carregarRelatorio.php",
        type: "GET",
        data: { tipo: tipo },
        success: function (data) {
            $("#relatorios-em-tabela").html(data);
            carregando = false;
        },
        error: function(){
            console.error("Erro ao carregar o relatório da tabela.");
            carregando = false;
        }
    });

});



function carregarGrafico() {
    $.getJSON('/SistemaBookare/includes/dashboard/tabViews/carregarGrafico.php', function(data) {
        
        let chartStatus = Chart.getChart("meuGrafico");
        if (chartStatus !== undefined) {
            chartStatus.destroy();
        }

        const nomesDosMeses = data.map(item => item.mes);
        const totaisDeLivros = data.map(item => item.total);

        new Chart(document.getElementById('meuGrafico'), {  
            type: 'line', // Tipo de gráfico (use 'line', 'pie', etc.)
            data: {
                labels: nomesDosMeses,
                datasets: [{
                    label: 'Total de Livros Cadastrados',
                    data: totaisDeLivros,
                    backgroundColor: '#62e2a6',               //style do grafico
                    borderColor: '#62e2a6',
                    borderWidth: 5,
                    color: '#ffffff'
                    
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color:'#ffffffff',
                           
                            lineWidth: 1.5 // Aumenta de 1 para 1.5px   //style das linhas do grafico
                        },
                        ticks: {
                            color: "#ffffff"
                        }
                    },

                    x: {
                        grid: {
                            color:'#ffffffff',
                          
                            lineWidth: 1.5 // Aumenta de 1 para 1.5px    //style das linhas do grafico
                        },
                        ticks: {
                            color: "#ffffff"
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            color: "#ffffff"
                        }
                    }
                }

            }
        });
    }).fail(function() {
        console.error("Erro ao carregar os dados do gráfico.");
    });
}


document.addEventListener("abaCarregada", function(e) {

    if (e.detail.aba === "relatorios") {
        console.log("✔ Aba RELATÓRIOS carregada, iniciando carregamento...");
        
        carregarGrafico(); 

        setTimeout(() => {
            let card = document.querySelector('.card[data-relatorio="usuarios"]');

            if (card) {
                // Dispara o evento de clique, que carrega a tabela via AJAX
                card.click();
                console.log("🔥 Card de USUÁRIOS clicado automaticamente!");
            }
        }, 200);
    }
});

