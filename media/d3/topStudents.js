/*===================================================================
	Grouped barchart showing male and female toppers
	grouped by group.
-------------------------------------------------------------------*/
var topStudents = document.getElementsByTagName('topStudents')[0];
var datafile = topStudents.getAttribute('src');

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

var gsvg = d3.select("topStudents").append("svg")
    .attr("width", gwidth + gmargin.left + gmargin.right)
    .attr("height", gheight + gmargin.top + gmargin.bottom)
  .append("g")
    .attr("transform", "translate(" + gmargin.left + "," + gmargin.top + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = d3.keys(data[0]).filter(function(key) { return key !== "Group"; });

  data.forEach(function(d) {
    d.groups = groupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  gx0.domain(data.map(function(d) { return d.Group; }));
  gx1.domain(groupNames).rangeRoundBands([0, gx0.rangeBand()]);
  gy.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  gsvg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + gheight + ")")
      .call(gxAxis)
    .append("text")
      .attr("transform", "translate(" + gwidth/2 + "," + gmargin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Group");

  gsvg.append("g")
      .attr("class", "y axis")
      .call(gyAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -100)
      .attr("y", -40)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("No. of Students");

  var gstate = gsvg.selectAll(".gstate")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + gx0(d.Group) + ",0)"; });

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