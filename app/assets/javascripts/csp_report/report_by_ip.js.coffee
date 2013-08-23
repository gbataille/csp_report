$().ready(() ->
  data = $.parseJSON( $("#chart")[0].attributes["data-chart"].value )
  window.chart = new Highcharts.Chart(data)
)
