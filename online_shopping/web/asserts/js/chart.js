/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const hi=document.querySelectorAll(".product-item--name");
for (var item in hi) {
    console.log(item);
}
const pieChart = {
  chart: null,
  data: [
    ['Product', 'Sales'],
    [document.querySelectorAll(".category-item-name")[0].value, parseInt(document.querySelectorAll(".category-item-quantity")[0].value)],
    [document.querySelectorAll(".category-item-name")[1].value, parseInt(document.querySelectorAll(".category-item-quantity")[1].value)],
    [document.querySelectorAll(".category-item-name")[2].value, parseInt(document.querySelectorAll(".category-item-quantity")[2].value)],
    [document.querySelectorAll(".category-item-name")[3].value, parseInt(document.querySelectorAll(".category-item-quantity")[3].value)],
  ],
  element: '#pie-chart',
  options: {
    title: 'Danh mục sản phẩm đã bán',
    width: 500,
    height: 300
  }
};

const barChart = {
  chart: null,
  data: [
    ['Product', 'Sales'],
    [document.querySelectorAll(".product-item--name")[0].value, parseInt(document.querySelectorAll(".product-item-quantity")[0].value)],
    [document.querySelectorAll(".product-item--name")[1].value, parseInt(document.querySelectorAll(".product-item-quantity")[1].value)],
    [document.querySelectorAll(".product-item--name")[2].value, parseInt(document.querySelectorAll(".product-item-quantity")[2].value)],
    [document.querySelectorAll(".product-item--name")[3].value, parseInt(document.querySelectorAll(".product-item-quantity")[3].value)],
    [document.querySelectorAll(".product-item--name")[4].value, parseInt(document.querySelectorAll(".product-item-quantity")[4].value)]
  ],
  element: '#bar-chart',
  options:  {
    title: 'Sản phẩm đã bán',
    width: 500,
    height: 300
  }
};

const lineChart = {
  chart: null,
  data: [
    ['Year', 'Sales'],
    [document.querySelectorAll(".product-item--year")[0].value, parseInt(document.querySelectorAll(".product-item--quantity--year")[0].value)],
    [document.querySelectorAll(".product-item--year")[1].value, parseInt(document.querySelectorAll(".product-item--quantity--year")[1].value)],
    [document.querySelectorAll(".product-item--year")[2].value, parseInt(document.querySelectorAll(".product-item--quantity--year")[2].value)],
    [document.querySelectorAll(".product-item--year")[3].value, parseInt(document.querySelectorAll(".product-item--quantity--year")[3].value)],
    [document.querySelectorAll(".product-item--year")[4].value, parseInt(document.querySelectorAll(".product-item--quantity--year")[4].value)]
  ],
  element: '#line-chart',
  options: {
    title: 'Tông số lượng đã bán trong lịch sử',
    width: 500,
    height: 300
  }
};

// https://developers.google.com/chart/interactive/docs/gallery/piechart
// https://developers.google.com/chart/interactive/docs/gallery/barchart
// https://developers.google.com/chart/interactive/docs/gallery/linechart
// https://developers.google.com/chart/interactive/docs/reference#draw
// https://developers.google.com/chart/interactive/docs/reference#arraytodatatable
const init = () => {
  pieChart.chart = new google.visualization.PieChart(
    document.querySelector(pieChart.element)
  );
  pieChart.chart.draw(
    google.visualization.arrayToDataTable(pieChart.data),
    pieChart.options
  );
  
  barChart.chart = new google.visualization.BarChart(
    document.querySelector(barChart.element)
  );
  barChart.chart.draw(
    google.visualization.arrayToDataTable(barChart.data),
    barChart.options
  );
  
  lineChart.chart = new google.visualization.LineChart(
    document.querySelector(lineChart.element)
  );
  lineChart.chart.draw(
    google.visualization.arrayToDataTable(lineChart.data),
    lineChart.options
  );
};

// https://developers.google.com/chart/interactive/docs/quick_start
google.charts.load('current', {
  packages: ['corechart'],
  callback: init
});

// https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector
// https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
document.querySelector('#update-pie-chart').addEventListener('click', () => {
  pieChart.data = [
    ['Product', 'Sales'],
    ['Laptops', 1508],
    ['Desktops', 1497],
    ['Cameras', 360],
    ['Phones', 1790],
    ['Accessories', 518]
  ];
  pieChart.chart.draw(
    google.visualization.arrayToDataTable(pieChart.data),
    pieChart.options
  );
});
