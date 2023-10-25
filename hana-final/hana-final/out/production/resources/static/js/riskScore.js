const chart1 = document.querySelector('.doughnut1');

const makeChart = (percent, classname, color) => {
    let i = 1;
    let chartFn = setInterval(function() {
        if (i < percent) {
            colorFn(i, classname, color);
            i++;
        } else {
            clearInterval(chartFn);
        }
    }, 10);
}

const colorFn = (i, classname, color) => {
    classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
}

makeChart(scoreDG01, chart1, '#00a39e');

const chart2 = document.querySelector('.doughnut2');
makeChart(scoreDG02, chart2, '#00a39e');

const chart3 = document.querySelector('.doughnut3');
makeChart(scoreDG03, chart3, '#00a39e');

const chart4 = document.querySelector('.doughnut4');
makeChart(scoreDG04, chart4, '#00a39e');

const chart5 = document.querySelector('.doughnut5');
makeChart(scoreDG05, chart5, '#00a39e');

const chart6 = document.querySelector('.doughnut6');
makeChart(scoreDG06, chart6, '#00a39e');

const chart7 = document.querySelector('.doughnut7');
makeChart(scoreDG07, chart7, '#00a39e');

const chart8 = document.querySelector('.doughnut8');
makeChart(scoreDG08, chart8, '#00a39e');