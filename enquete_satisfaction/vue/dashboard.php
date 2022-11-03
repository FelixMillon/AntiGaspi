
        <div class="container">
          <div class="row justify-content-center align-items-center">
            <div class="col-md-12" style="margin-bottom:30px ;width: 100%;">
              <h2 >Stats generales</h2>
            </div>
            <div class="col-md-6" id="chart2" style=" height: 300px; width: 50%;"></div>
            <div class="col-md-6" id="chart1" style=" height: 300px; width: 50%;"></div>
            <div class="col-md-6" id="chart3" style=" height: 400px; width: 50%;"></div>
            <div class="col-md-6" id="chart4" style=" height: 400px; width: 50%;"></div>
          </div>
        </div>
        <div class="question">
            <a type="button" class="btn btn-primary btn-sm" href="index.php?page=4" onclick="gestion_perso()">  Commencer une nouvelle enquête </a> 
        </div>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>

var options1 = {
  chart: {
    height: 280,
    width: '100%',
    type: "radialBar",
  },
  legend: {
        show: true,
        position: 'right',
      },
  series: [<?php foreach($moyEnquete as $uneMoy){echo "10*".$uneMoy.",";} ?>],
  title: {
    text: 'moyenne par enquete'
  },
  plotOptions: {
    radialBar: {
      dataLabels: {
        total: {
          show: false,
          label: 'TOTAL'
        }
      }
    }
  },
  labels: [<?php foreach($nomEnquetes as $unNom){echo "'".$unNom."',";} ?>]
};
new ApexCharts(document.querySelector("#chart1"), options1).render();

var options = {
  chart: {
    height: 280,
    width: '100%',
    type: 'donut',
  },
  title: {
    text: 'Participation par enquete'
  },
  series: [<?php foreach($countParticip as $unCount){echo $unCount.",";} ?>],
  labels: [<?php foreach($nomParticip as $unNom){echo "'".$unNom."',";} ?>],
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
    series: [{
    data: [<?php foreach($CountParAge as $unCount){echo $unCount.",";} ?>]
  }],
    chart: {
    height: 280,
    width: '100%',
    type: 'bar'
  },
  plotOptions: {
    bar: {
      borderRadius: 4,
      horizontal: true,
    }
  },
  title: {
    text: 'participation par tranche d\'age'
  },
  dataLabels: {
    enabled: false
  },
  xaxis: {
    categories:  [<?php foreach($LibParAge as $unAge){echo "'".$unAge."',";} ?>],
  }
};


new ApexCharts(document.querySelector("#chart3"), options).render();


var options = {
          series: [{
            name: "Desktops",
            data: [<?php foreach($MoyParAge as $uneMoy){echo $uneMoy.",";} ?>]
        }],
          chart: {
            height: 280,
            width: '100%',
          type: 'line',
          zoom: {
            enabled: false
          }
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'straight'
        },
        title: {
          text: 'Satisfaction par tranche d\'âge',
          align: 'left'
        },
        grid: {
          row: {
            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
            opacity: 0.5
          },
        },
        xaxis: {
          categories: [<?php foreach($LibParAge as $uneMoy){echo "'".$uneMoy."',";} ?>],
        }
        };


new ApexCharts(document.querySelector("#chart4"), options).render();


function perso_value(nb_enquete)
{
    let chaineCookies = document.cookie;
    let tab = chaineCookies.split(";");
    let lesCookies = {};
    for(let j =1; j<=nb_enquete;j++)
    {
        var reg = new RegExp('reponse_'+j.toString()+'_[0-9]+');
        lesCookies['enquete_'+j.toString()]=[];
        for (let i=0; i<tab.length; i++) {            
            let tab2 = tab[i].split("=");
            while(tab2[0].charAt(0) == ' ') {
                tab2[0] = tab2[0].substring(1);
            }
            if (reg.test(tab2[0])) {
                lesCookies['enquete_'+j.toString()].push(tab2[1]);
            }
        }
    }
    console.log(lesCookies);
    return lesCookies;
}


</script>