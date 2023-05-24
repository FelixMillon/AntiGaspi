<%@ Import Namespace="Intranet" %>

<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-12" style="margin-bottom:30px ;width: 100%;">
            <h2 >Stats generales</h2>
        </div>
        <div class="col-md-6" id="chart2" style=" height: 300px; width: 50%;"></div>
        <div class="col-md-6" id="chart1" style=" height: 300px; width: 50%;"></div>
        <div class="col-md-6" id="chart3" style=" height: 400px; width: 50%;"></div>
        <div class="col-md-6" id="chart4" style=" height: 400px; width: 50%;"></div>
        <div class="col-md-12" style="margin-bottom:30px ;width: 100%;">
            <h2 >Mes demandes</h2>
        </div>
        <div class="col-md-6" id="chart5" style=" height: 300px; width: 50%;"></div>
        <div class="col-md-6" id="chart6" style=" height: 300px; width: 50%;"></div>
    </div>
</div>
<%

if(Session["id"] != null)
{
    dataperso = Controleur.DashboardDataPerso(Int16.Parse(Session["id"].ToString()));
}
%>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"> </script>
<script>
    let datadash = "<%= datadash %>";
    datadash = JSON.parse(datadash);
    let dataperso = "<%= dataperso %>";
    dataperso  = JSON.parse(dataperso);
    let serie_demande_autre=[];
    let serie_demande_rh=[];
    let uneserie = {};
    let demande_annee_value= [];
    Object.entries(datadash.demande_Autre.resolution_mois).forEach(entry => {
        const [key, value] = entry;
        uneserie["name"] = key;
        Object.entries(datadash.demande_Autre.resolution_mois[key]).forEach(entry2 => {
            const [key, value] = entry2;
            if(key != "total")
            {
                demande_annee_value.push(value);
            }
        });
        uneserie["data"] = demande_annee_value;
        serie_demande_autre.push(uneserie);
        uneserie={};
        demande_annee_value=[];
    });
    
    Object.entries(datadash.demande_RH.resolution_mois).forEach(entry => {
        const [key, value] = entry;
        uneserie["name"] = key;
        Object.entries(datadash.demande_RH.resolution_mois[key]).forEach(entry2 => {
            const [key, value] = entry2;
            if(key != "total")
            {
                demande_annee_value.push(value);
            }
        });
        uneserie["data"] = demande_annee_value;
        serie_demande_rh.push(uneserie);
        uneserie={};
        demande_annee_value=[];
    });
var options = {
    chart: {
        height: 280,
        width: '100%',
        type: 'donut',
    },
    title: {
        text: 'Demandes Autre. Total: '+datadash.demande_Autre.total
    },
    series: [datadash.demande_Autre.accepte, datadash.demande_Autre.refuse, datadash.demande_Autre.non_traite],
    colors: ["#008450","#B81D13","#EFB700"],
    labels: ["Acceptée","Refusée","Non Traitée"],
    legend: {
            show: true,
            position: 'right',
        },
    plotOptions: {
        pie: {
        donut: {
            size: '70%'
            }
        },

    }
};
new ApexCharts(document.querySelector("#chart1"), options).render();

var options = {
    chart: {
        height: 280,
        width: '100%',
        type: 'donut',
    },
    title: {
        text: 'Demandes RH. Total: '+datadash.demande_RH.total
    },
    series: [datadash.demande_RH.accepte, datadash.demande_RH.refuse, datadash.demande_RH.non_traite],
    colors: ["#008450","#B81D13","#EFB700"],
    labels: ["Acceptée","Refusée","Non Traitée"],
    legend: {
            show: true,
            position: 'right',
        },
    plotOptions: {
        pie: {
        donut: {
            size: '70%'
            }
        },

    }
};

new ApexCharts(document.querySelector("#chart2"), options).render();

var options = {
        series: serie_demande_rh,
        chart: {
        type: 'bar',
        height: 350,
    },
    colors: ["#0962A2","#59826D","#0CA2A7"],
    plotOptions: {
        bar: {
        horizontal: false,
        columnWidth: '100%',
        endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        show: true,
        width: 1,
        colors: ['transparent']
    },
    xaxis: {
        type: 'category',
        categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    },
    yaxis: {
        title: {
            text: 'Demandes RH traitées par mois'
        }
    },
    fill: {
        opacity: 1
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return val
            }
        }
    }
};

new ApexCharts(document.querySelector("#chart3"), options).render();

var options = {
        series: serie_demande_autre,
        chart: {
        type: 'bar',
        height: 350,
    },
    colors: ["#0962A2","#59826D","#0CA2A7"],
    plotOptions: {
        bar: {
        horizontal: false,
        columnWidth: '100%',
        endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        show: true,
        width: 1,
        colors: ['transparent']
    },
    xaxis: {
        type: 'category',
        categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    },
    yaxis: {
        title: {
        text: 'Demandes Autres traitées par mois'
        }
    },
    fill: {
        opacity: 1
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return val
            }
        }
    }
};


new ApexCharts(document.querySelector("#chart4"), options).render();

var options = {
    chart: {
        height: 280,
        width: '100%',
        type: 'donut',
    },
    title: {
        text: 'Demandes Autre. Total: '+dataperso.demande_Autre.total
    },
    series: [dataperso.demande_Autre.accepte, dataperso.demande_Autre.refuse, dataperso.demande_Autre.non_traite],
    colors: ["#008450","#B81D13","#EFB700"],
    labels: ["Acceptée","Refusée","Non Traitée"],
    legend: {
            show: true,
            position: 'right',
        },
    plotOptions: {
        pie: {
        donut: {
            size: '70%'
            }
        },

    }
};
new ApexCharts(document.querySelector("#chart5"), options).render();

var options = {
    chart: {
        height: 280,
        width: '100%',
        type: 'donut',
    },
    title: {
        text: 'Demandes RH. Total: '+dataperso.demande_RH.total
    },
    series: [dataperso.demande_RH.accepte, dataperso.demande_RH.refuse, dataperso.demande_RH.non_traite],
    labels: ["Acceptée","Refusée","Non Traitée"],
    colors: ["#008450","#B81D13","#EFB700"],
    legend: {
            show: true,
            position: 'right',
        },
    plotOptions: {
        pie: {
        donut: {
            size: '70%'
            }
        },

    }
};

new ApexCharts(document.querySelector("#chart6"), options).render();

</script>
