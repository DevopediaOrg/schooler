/*===================================================================
	Piechart showing sponsorships.
-------------------------------------------------------------------*/
var sponsorship = document.getElementsByTagName('sponsorship')[0];
var datafile = sponsorship.getAttribute('src');

var piemargin = {top: 0, right: 200, bottom: 40, left: 0};
var piewidth = 400,
    pieheight = 400,
    radius = Math.min(piewidth, pieheight) / 2;

var piecolor = d3.scale.category20();

var arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(0);

var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.count; });

var piesvg = d3.select("sponsorship").append("svg")
    .attr("width", piewidth+piemargin.right)
    .attr("height", pieheight+piemargin.bottom)
  .append("g")
    .attr("transform", "translate(" + piewidth / 2 + "," + pieheight / 2 + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = [];
 
  var total = 0;
  data.forEach(function(d) {
    d.count = +d.count;
    total += +d.count;
    groupNames.push(d.group);
  });

  var g = piesvg.selectAll(".arc")
      .data(pie(data))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return piecolor(d.data.group); });

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .style("font-size", "1em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.value; });
  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", "1.5em")
      .style("text-anchor", "middle")
      .text(function(d) { return d3.round(d.value*100/total,1) + ' %'; });
  g.append("text")
      .attr("transform", "translate(0," + (pieheight+piemargin.bottom)/2 + ")")
      .style("text-anchor", "middle")
      .text("Total students: " + total);

  var legend = piesvg.selectAll(".legend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(-40," + (i*20) + ")"; });

  legend.append("rect")
      .attr("x", piewidth - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", piecolor);

  legend.append("text")
      .attr("x", piewidth - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

});


/*===================================================================
	Grouped barchart showing histogram of male and female students
	grouped by age.
-------------------------------------------------------------------*/
var sponsored = document.getElementsByTagName('sponsored')[0];
var spdatafile = sponsored.getAttribute('src');

var margin = {top: 20, right: 20, bottom: 60, left: 60},
    width = 600 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

var spx0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .4);

var spx1 = d3.scale.ordinal();

var spy = d3.scale.linear()
    .range([height, 0]);

var spcolor = d3.scale.category20();

var spxAxis = d3.svg.axis()
    .scale(spx0)
    .orient("bottom");

var spyAxis = d3.svg.axis()
    .scale(spy)
    .orient("left")

var spsvg = d3.select("sponsored").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv(spdatafile, function(error, data) {
  var spgroupNames = d3.keys(data[0]).filter(function(key) { return key !== "Age"; });

  data.forEach(function(d) {
    d.groups = spgroupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  spx0.domain(data.map(function(d) { return d.Age; }));
  spx1.domain(spgroupNames).rangeRoundBands([0, spx0.rangeBand()]);
  spy.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  spsvg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(spxAxis)
    .append("text")
      .attr("transform", "translate(" + width/2 + "," + margin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Age");

  spsvg.append("g")
      .attr("class", "y axis")
      .call(spyAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("No. of Students");

  var spstate = spsvg.selectAll(".state")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + spx0(d.Age) + ",0)"; });

  spstate.selectAll("rect")
      .data(function(d) { return d.groups; })
    .enter().append("rect")
      .attr("width", spx1.rangeBand())
      .attr("x", function(d) { return spx1(d.name); })
      .attr("y", function(d) { return spy(d.value); })
      .attr("height", function(d) { return height - spy(d.value); })
      .style("fill", function(d) { return spcolor(d.name); });

  var legend = spsvg.selectAll(".legend")
      .data(spgroupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", spcolor);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

});


/*===================================================================
	Grouped barchart showing histogram of male and female students
	grouped by age.
-------------------------------------------------------------------*/
var unsponsored = document.getElementsByTagName('unsponsored')[0];
var datafile = unsponsored.getAttribute('src');

var margin = {top: 20, right: 20, bottom: 60, left: 60},
    width = 600 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

var x0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .4);

var x1 = d3.scale.ordinal();

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.ordinal()
			.range(["#ff7f0e", "#ffbb78"]);

var xAxis = d3.svg.axis()
    .scale(x0)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")

var svg = d3.select("unsponsored").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = d3.keys(data[0]).filter(function(key) { return key !== "Age"; });

  data.forEach(function(d) {
    d.groups = groupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  x0.domain(data.map(function(d) { return d.Age; }));
  x1.domain(groupNames).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("transform", "translate(" + width/2 + "," + margin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Age");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("No. of Students");

  var state = svg.selectAll(".state")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + x0(d.Age) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d.groups; })
    .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d) { return x1(d.name); })
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.value); })
      .style("fill", function(d) { return color(d.name); });

  var legend = svg.selectAll(".legend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

});