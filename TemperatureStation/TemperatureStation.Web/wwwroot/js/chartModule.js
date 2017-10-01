//function updateWindow() {
//    frontPageChart();
//}

var frontPageChart = function () {
    var margin = { top: 20, right: 20, bottom: 30, left: 50 };
    //var margin = { top: 0, right: 0, bottom: 0, left: 0 };
    //var width = $('.col-md-6').width() - margin.left - margin.right;
    var width = $('#chartContainer').width() - 30 - margin.left - margin.right;
    
    // var height = ($('.col-md-6').width() / 2) - margin.top - margin.bottom;
    //var height = $('.col-md-6').width() / 2 - margin.top - margin.bottom;
    var height = $('#chartContainer').width() / 1.5 - margin.top - margin.bottom;
    //var height = $('#chartContainer').width() / 1.5 - margin.top - margin.bottom;
    // parse the date / time
    var parseTime = d3.timeParse("%Y-%m-%dT%H:%M:%S.%L");    

    //d3.select(window).on('resize.updatesvg', updateWindow);

    // set the ranges
    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);
    $('#chartLegend').empty('li');
    var valuelines = [];

    for (var i = 0; i < data[0].length; i++) {
        var valueline = d3.line()
                          .x(function (d) { return x(d.date); })
                          .y(function (d) { return y(d['value' + i]); });

        var legendItem = "<span style='background-color:" + (strokes[i] || 'black') + "'>";
        legendItem += '</span> ' + data[0][i].Source;
        $('#chartLegend').append('<li>' + legendItem + '</li>');
        valuelines.push(valueline);
    }

    // append the svg obgect to the body of the page
    // appends a 'group' element to 'svg'
    // moves the 'group' element to the top left margin
    //d3.select('#chartContainer').select('svg').remove();    
    d3.select('#chartContainer').select('div').remove();  

    //var svg = d3.select('#chartContainer')
    //    .append("div")
    //    .classed("svg-container", true)
    //    .append("svg")
    //    .attr("width", width + margin.left + margin.right)
    //    .attr("height", height + margin.top + margin.bottom)
    //    .append("g")
    //    .attr("transform",
    //    "translate(" + margin.left + "," + margin.top + ")");

    var svg = d3.select('#chartContainer')
        .append("div")
        .classed("svg-container", true)
        .append("svg")
        //.attr("width", width + margin.left + margin.right)
        //.attr("height", height + margin.top + margin.bottom)
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

    //var svg = d3.select('#chartContainer')
    //    .append("div")
    //    .classed("svg-container", true) //container class to make it responsive
    //    .append("svg")
    //    //responsive SVG needs these 2 attributes and no width and height attr
    //    .attr("preserveAspectRatio", "xMinYMin meet")
    //    .attr("viewBox", "0 0 600 400")
    //    //class to make it responsive
    //    .classed("svg-content-responsive", true); 

    data.forEach(function (d) {
        var date = new Date();
        date.setTime(Date.parse(d[0].ReadingTime) - 60 * 60 * 1000 * offset);
        d.date = date;

        for (var i = 0; i < d.length; i++) {
            d['value' + i] = +d[i].Value;
        }
    });

    x.domain(d3.extent(data, function (d) { return d.date; }));
    //y.domain(d3.extent(data, function (d) { return d.value; }));
    y.domain([
        d3.min(data, function (d) {
            var values = [];
            for (var i = 0; i < valuelines.length; i++) {
                values.push(d['value' + i] - 1);
            }
        
            return Math.min.apply(null, values);
        }),
        d3.max(data, function (d) {
            var values = [];
            for (var i = 0; i < valuelines.length; i++) {
                values.push(d['value' + i] + 1);
            }        
            return Math.max.apply(null, values);
        })]);

    for (i = 0; i < valuelines.length; i++) {
        svg.append("path")
           .data([data])
           .attr("class", "line")
           .style("stroke", strokes[i] || 'black')
           .attr("d", valuelines[i]);
    }

    // Add the X Axis
    svg.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    // Add the Y Axis
    svg.append("g")
        .call(d3.axisLeft(y));
};