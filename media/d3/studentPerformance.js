/*===================================================================
	Grouped barchart comparing student and class average
	grouped by subject.
-------------------------------------------------------------------*/
var studentRecentPerf = document.getElementsByTagName('studentRecentPerf')[0];
var datafile = studentRecentPerf.getAttribute('src');

var gmargin = {top: 20, right: 120, bottom: 80, left: 60},
    gwidth = 700 - gmargin.left - gmargin.right,
    gheight = 400 - gmargin.top - gmargin.bottom;

var gx0 = d3.scale.ordinal()
    .rangeRoundBands([0, gwidth], .4);

var gx1 = d3.scale.ordinal();

var gy = d3.scale.linear()
    .range([gheight, 0]);

var color = d3.scale.category20();

var gxAxis = d3.svg.axis()
    .scale(gx0)
    .orient("bottom");

var gyAxis = d3.svg.axis()
    .scale(gy)
    .orient("left")

var gsvg = d3.select("studentRecentPerf").append("svg")
    .attr("width", gwidth + gmargin.left + gmargin.right)
    .attr("height", gheight + gmargin.top + gmargin.bottom)
  .append("g")
    .attr("transform", "translate(" + gmargin.left + "," + gmargin.top + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = d3.keys(data[0]).filter(function(key) { return key !== "Subject"; });

  data.forEach(function(d) {
    d.groups = groupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  gx0.domain(data.map(function(d) { return d.Subject; }));
  gx1.domain(groupNames).rangeRoundBands([0, gx0.rangeBand()]);
  gy.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  gsvg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + gheight + ")")
      .call(gxAxis)
    .append("text")
      .attr("transform", "translate(" + gwidth/2 + "," + gmargin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Subject");

  gsvg.append("g")
      .attr("class", "y axis")
      .call(gyAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -100)
      .attr("y", -40)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Percentage (%)");

  var gstate = gsvg.selectAll(".gstate")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + gx0(d.Subject) + ",0)"; });

  gstate.selectAll("rect")
      .data(function(d) { return d.groups; })
    .enter().append("rect")
      .attr("width", gx1.rangeBand())
      .attr("x", function(d) { return gx1(d.name); })
      .attr("y", function(d) { return gy(d.value); })
      .attr("height", function(d) { return gheight - gy(d.value); })
      .style("fill", function(d) { return color(d.name); });

  var glegend = gsvg.selectAll(".glegend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  glegend.append("rect")
      .attr("x", gwidth - 6)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  glegend.append("text")
      .attr("x", gwidth + 18)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "begin")
      .text(function(d) { return d; });

});


/*===================================================================
	Multiline chart showing student's performance across exams with
	one line per subject.
-------------------------------------------------------------------*/
var studentTimePerf = document.getElementsByTagName('studentTimePerf')[0];
var datafile = studentTimePerf.getAttribute('src');

var margin = {top: 20, right: 55, bottom: 30, left: 60},
    width  = 900 - margin.left - margin.right,
    height = 400  - margin.top  - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .rangeRound([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .interpolate("cardinal")
    .x(function (d) { return x(d.label) + x.rangeBand() / 2; })
    .y(function (d) { return y(d.value); });

var mcolor = d3.scale.category10();

var svg = d3.select("studentTimePerf").append("svg")
    .attr("width",  width  + margin.left + margin.right)
    .attr("height", height + margin.top  + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv(datafile, function (error, data) {
  var labelVar = 'quarter';
  var varNames = d3.keys(data[0]).filter(function (key) { return key !== labelVar;});
  mcolor.domain(varNames);

  var seriesData = varNames.map(function (name) {
    return {
      name: name,
      values: data.map(function (d) {
        return {name: name, label: d[labelVar], value: +d[name]};
      })
    };
  });

  x.domain(data.map(function (d) { return d.quarter; }));
  y.domain([
    d3.min(seriesData, function (c) { 
      return d3.min(c.values, function (d) { return d.value; });
    }),
    d3.max(seriesData, function (c) { 
      return d3.max(c.values, function (d) { return d.value; });
    })
  ]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -100)
      .attr("y", -40)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Percentage (%)");

  var series = svg.selectAll(".series")
      .data(seriesData)
    .enter().append("g")
      .attr("class", "series");

  series.append("path")
    .attr("class", "line")
    .attr("d", function (d) { return line(d.values); })
    .style("stroke", function (d) { return mcolor(d.name); })
    .style("stroke-width", "2px")
    .style("fill", "none")

  series.selectAll(".point")
    .data(function (d) { return d.values; })
    .enter().append("circle")
     .attr("class", "point")
     .attr("cx", function (d) { return x(d.label) + x.rangeBand()/2; })
     .attr("cy", function (d) { return y(d.value); })
     .attr("r", "3px")
     .style("fill", function (d) { return mcolor(d.name); })
     .style("stroke", "grey")
     .style("stroke-width", "2px")

  var legend = svg.selectAll(".legend")
      .data(varNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function (d, i) { return "translate(55," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 10)
      .attr("width", 10)
      .attr("height", 10)
      .style("fill", mcolor)
      .style("stroke", "grey");

  legend.append("text")
      .attr("x", width - 12)
      .attr("y", 6)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function (d) { return d; });
});
