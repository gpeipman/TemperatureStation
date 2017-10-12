var frontPageChart = function () {
    var _self = this;

    _self.addReading = function (r) {
        data.push(_self.transformReading(r));
    };

    _self.rescale = function () {
        _self.x.domain(d3.extent(data, function (d) { return d.date; }));
        _self.y.domain([
            d3.min(data, function (d) {
                var values = [];
                for (var i = 0; i < _self.valuelines.length; i++) {
                    values.push(d['value' + i] - 1);
                }

                return Math.min(...values);
            }),
            d3.max(data, function (d) {
                var values = [];
                for (var i = 0; i < _self.valuelines.length; i++) {
                    values.push(d['value' + i] + 1);
                }
                return Math.max(...values);
            })
        ]);

        var svg = d3.select("body").transition();
        svg.select(".x.axis") // change the x axis
            .duration(750)
            .call(xAxis);
        svg.select(".y.axis") // change the y axis
            .duration(750)
            .call(yAxis);
        svg.select(".line")   // change the line
            .duration(750)
            .attr("d", _self.valuelines[0](data));

    };

    _self.transformReading = function (d) {
        var date = new Date();
        date.setTime(Date.parse(d[0].ReadingTime) - 60 * 60 * 1000 * offset);
        d.date = date;

        for (var i = 0; i < d.length; i++) {
            d['value' + i] = +d[i].Value;
        }

        // fill missing values with nulls
        for (var i = d.length; i < dataAttrs; i++) {
            d['value' + i] = null;
        }

        return d;
    };

    var margin = { top: 20, right: 20, bottom: 30, left: 50 };
    var width = $('#chartContainer').width() - margin.left - margin.right;
    var height = $('#chartContainer').width() / 1.5 - margin.top - margin.bottom;
    var parseTime = d3.timeParse("%Y-%m-%dT%H:%M:%S.%L");
    bisectDate = d3.bisector(function (d) { return d.date; }).left;
    //d3.select(window).on('resize.updatesvg', updateWindow);

    // set the ranges
    _self.x = d3.scaleTime().range([0, width]);
    _self.y = d3.scaleLinear().range([height, 0]);
    $('#chartLegend').empty('li');
    _self.valuelines = [];    

    // find data with biggest number of attributes
    var dataIndex = 0;
    var dataAttrs = data[0].length;
    for (var i = 1; i < data.length; i++) {
        if (data[i].length > dataAttrs)
        {
            dataIndex = i;
            dataAttrs = data[i].length;
        }
    }

    for (var i = 0; i < data[dataIndex].length; i++) {
        
        var valueline = d3.line()
            .curve(d3.curveMonotoneX)
            .x(function (d) { return x(d.date); })
            .y(function (d) { return y(d['value' + i]); });

        var name = data[dataIndex][i].Name;
        if (labelMappings[name])
            name = labelMappings[name];
        var legendItem = "<span style='background-color:" + (strokes[i] || 'black') + "'>";
        legendItem += '</span> ' + name;
        $('#chartLegend').append('<li>' + legendItem + '</li>');
        _self.valuelines.push(valueline);
    }
 
    d3.select('#chartContainer').select('div').remove();
    d3.select('.chartTooltip').remove();

    var svg = d3.select('#chartContainer')
        .append("div")
        .classed("svg-container", true)
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform","translate(" + margin.left + "," + margin.top + ")");
    
    data.forEach(this.transformReading);
    
    _self.x.domain(d3.extent(data, function (d) { return d.date; }));
    //y.domain(d3.extent(data, function (d) { return d.value; }));
    _self.y.domain([
        d3.min(data, function (d) {
            var values = [];
            for (var i = 0; i < _self.valuelines.length; i++) {
                values.push(d['value' + i] - 1);
            }

            return Math.min(...values);
        }),
        d3.max(data, function (d) {
            var values = [];
            for (var i = 0; i < _self.valuelines.length; i++) {
                values.push(d['value' + i] + 1);
            }
            return Math.max(...values);
        })]);

    for (i = 0; i < _self.valuelines.length; i++) {
        svg.append("path")
            .data([data])
            .attr("class", "line")
            .style("stroke", strokes[i] || 'black')
            .attr("d", _self.valuelines[i]);
    }

    // Dots
    var div = d3.select("body").append("p")
        .attr("class", "chartTooltip")
        .style("display", "none");
    div.append("div")
        .attr("class", "chartTooltipDate");
    div.append("div")
        .attr("class", "chartTooltipTime");
    div.append("div")
        .attr("class", "chartTooltipReadings");
    //var div = $('.chartTooltip');
    
    var formatTime = d3.timeFormat("%e %B");
    var formatTooltipDate = d3.timeFormat("%e %B");
    var formatTooltipTime = d3.timeFormat("%H:%M");
    var focusPoints = new Array();

    for (var i = 0; i < dataAttrs; i++)
    {
        var focus = svg.append("g")
            .attr("class", "focus")
            .style("display", "none");

        focus.append("circle")
            .attr("r", 3)
            .style("stroke", strokes[i] || 'black')
            .style("stroke-width", '3pt')
            .style("opacity", 0.4);

        focus.append("circle")
            .attr("r", 1)
            .style("stroke", strokes[i] || 'black');

        focusPoints.push(focus);
    }

    svg.append("rect")
        .attr("class", "overlay")
        .attr("width", width)
        .attr("height", height)
        .on("mouseover", function () {
            for (var i = 0; i < dataAttrs; i++)
            {
                focusPoints[i].style("display", null);
            }
            $('.chartTooltip').show();
        })
        .on("mouseout", function () {            
            for (var i = 0; i < dataAttrs; i++)
            {
                focusPoints[i].style("display", 'none');
            }
            $('.chartTooltip').hide();
        })
        .on("mousemove", mousemove);

    function mousemove() {

        var x0 = x.invert(d3.mouse(this)[0]),
            i = bisectDate(data, x0, 1),
            d0 = data[i - 1],
            d1 = data[i],
            d = x0 - d0.date > d1.date - x0 ? d1 : d0;

        for (var j = 0; j < dataAttrs; j++)
        {
            var focusPoint = focusPoints[j];
            focusPoint.attr("transform", "translate(" + x(d.date) + "," + y(d['value' + j]) + ")");
        }

        var left = $('#chartContainer').position().left;
        var top = $('#chartContainer').position().top;
        //div.html(formatTime(d.date) + "<br/>" + d.value0);
        div.select(".chartTooltipDate").html(formatTooltipDate(d.date));
        div.select(".chartTooltipTime").html(formatTooltipTime(d.date));

        var readingsText = '';
        for (var j = 0; j < d.length; j++)
        {
            var name = data[dataIndex][j].Name;
            if (labelMappings[name])
                name = labelMappings[name];

            readingsText += name;
            readingsText += ': ';
            readingsText += d['value' + j];
            readingsText += '<br />';
        }

        div.select(".chartTooltipReadings").html(readingsText);
        div.style("left", (x(d.date)+left+60) + "px")
           .style("top", (y(d.value0)+top-28) + "px");
    }


    // Add the X Axis
    _self.xAxis = svg.append("g")
                     .attr("class", "x axis")
                     .attr("transform", "translate(0," + height + ")")
                     .call(d3.axisBottom(x));

    // Add the Y Axis
    _self.yAxis = svg.append("g")
                     .attr("class", "y axis")
                     .call(d3.axisLeft(y));

    var lastDate = null;
    var isFirstDate = true;
    var dates = [];

    for (var i = 0; i < data.length; i++) {
        var date = new Date(data[i][0].ReadingTime);
        date = new Date(date.getFullYear(), date.getMonth(), date.getDate());
        if (!dates.containsDate(date)) {
            dates.push(date);
        }
    }

    for (var i = 0; i < dates.length; i++)
    {
        // first date is usually not shown on chart and line is drawn threrfore left from Y-axis
        if (i == 0) {
            continue;
        }

        var date = dates[i];
        svg.append("line")
            .attr("x1", x(date))  //<<== change your code here
            .attr("y1", 0)
            .attr("x2", x(date))  //<<== and here
            .attr("y2", height + margin.top - margin.bottom + 10)
            .style("stroke-width", 1)
            .style("stroke", "green")
            .style("stroke-dasharray", "5,5")
            .style("fill", "none");
    }

    return this;
};