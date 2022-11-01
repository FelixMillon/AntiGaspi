

        <main>
            <h1 style="text-align: center;">Dashboard</h1>   
        </main>
        <div class="container">
          <div class="row justify-content-center align-items-center">
            <div class="col-md-6" id="chart1" style=" height: 300px; width: 50%;"></div>
            <div class="col-md-6" id="chart2" style=" height: 300px; width: 50%;"></div>
            <div class="col-md-6" id="chart3" style=" height: 400px; width: 50%;"></div>
            <div class="col-md-6" id="chart4" style=" height: 400px; width: 50%;"></div>
          </div>
        </div>

          

    </body>
</html>
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
  series: [67, 84, 97, 61],
  title: {
    text: 'Participation par categorie'
  },
  plotOptions: {
    radialBar: {
      dataLabels: {
        total: {
          show: true,
          label: 'TOTAL'
        }
      }
    }
  },
  labels: ['TEAM A', 'TEAM B', 'TEAM C', 'TEAM D']
};
new ApexCharts(document.querySelector("#chart1"), options1).render();

var options = {
  chart: {
    height: 280,
    width: '100%',
    type: 'donut',
  },
  title: {
    text: 'Satisfaction par categorie'
  },
  series: [44, 55, 41, 17, 15],
  labels: ["Livraison", "Produits", "Site", "SAV", "Autre"],
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
  chart: {
    height: 280,
    width: '100%',
    type: 'bar'
  },
  plotOptions: {
    bar: {
      horizontal: true
    }
  },
  title: {
    text: 'Satisfaction par produit'
  },
  series: [{
    data: [{
      x: 'category A',
      y: 10
    }, {
      x: 'category B',
      y: 12
    }, {
      x: 'category C',
      y: 13
    }, {
      x: 'category D',
      y: 15
    }
    , {
      x: 'category E',
      y: 17
    }
    , {
      x: 'category F',
      y: 20
    }
    , {
      x: 'category G',
      y: 22
    }
    , {
      x: 'category H',
      y: 30
    }
    ]
  }]
}

new ApexCharts(document.querySelector("#chart3"), options).render();

var options = {
    series: [{
    name: 'Marine Sprite',
    data: [44, 55, 41, 37, 22, 43, 21]
  }, {
    name: 'Striking Calf',
    data: [53, 32, 33, 52, 13, 43, 32]
  }, {
    name: 'Tank Picture',
    data: [12, 17, 11, 9, 15, 11, 20]
  }, {
    name: 'Bucket Slope',
    data: [9, 7, 5, 8, 6, 9, 4]
  }, {
    name: 'Reborn Kid',
    data: [25, 12, 19, 32, 25, 24, 10]
  }],
    chart: {
    type: 'bar',
    height: 350,
    width: '100%',
    stacked: true,
  },
  plotOptions: {
    bar: {
      horizontal: true,
      dataLabels: {
        total: {
          enabled: true,
          offsetX: 0,
          style: {
            fontSize: '13px',
            fontWeight: 900
          }
        }
      }
    },
  },
  stroke: {
    width: 1,
    colors: ['#fff']
  },
  title: {
    text: 'Satisfaction par année'
  },
  xaxis: {
    categories: [2008, 2009, 2010, 2011, 2012, 2013, 2014],
    labels: {
      formatter: function (val) {
        return val + "K"
      }
    }
  },
  yaxis: {
    title: {
      text: undefined
    },
  },
  tooltip: {
    y: {
      formatter: function (val) {
        return val + "K"
      }
    }
  },
  fill: {
    opacity: 1
  },
  legend: {
    position: 'top',
    horizontalAlign: 'left',
    offsetX: 40
  }
  };

  new ApexCharts(document.querySelector("#chart4"), options).render();

 
</script>