/*===================================================================
	Piechart showing grades for the entire school
-------------------------------------------------------------------*/
var schoolPerf = document.getElementsByTagName('schoolPerf')[0];
var datafile = schoolPerf.getAttribute('src');

var marginbottom = 60;

var pwidth = 400,
    pheight = 400,
    radius = Math.min(pwidth, pheight) / 2;

var color = d3.scale.ordinal()
			.range(["#2ca02c", "#98df8a", "#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78"]);

var arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(0);

var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.count; });

var piesvg = d3.select("schoolPerf").append("svg")
    .attr("width", pwidth)
    .attr("height", pheight+marginbottom)
  .append("g")
    .attr("transform", "translate(" + pwidth / 2 + "," + pheight / 2 + ")");

d3.csv(datafile, function(error, data) {

  var total = 0;
  data.forEach(function(d) {
    d.count = +d.count;
    total += +d.count;
  });

  var g = piesvg.selectAll(".arc")
      .data(pie(data))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return color(d.data.grade); });

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .style("text-anchor", "middle")
      .text(function(d) { return d.data.grade + ': ' + d.value; });
  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", "1.5em")
      .style("text-anchor", "middle")
      .text(function(d) { return d3.round(d.value*100/total,1) + ' %'; });
  g.append("text")
      .attr("transform", "translate(0," + (pheight+marginbottom)/2 + ")")
      .style("text-anchor", "middle")
      .text("Number of grades: " + total);

});


/*===================================================================
	Grouped barchart showing grades grouped by subject.
-------------------------------------------------------------------*/
var gradesSubject = document.getElementsByTagName('gradesSubject')[0];
var datafile = gradesSubject.getAttribute('src');

var margin = {top: 20, right: 120, bottom: 80, left: 60},
    width = 700 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

var x0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .4);

var x1 = d3.scale.ordinal();

var y = d3.scale.linear()
    .range([height, 0]);

var scolor = d3.scale.ordinal()
			.range(["#2ca02c", "#1f77b4", "#ff7f0e"]);

var xAxis = d3.svg.axis()
    .scale(x0)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")

var svg = d3.select("gradesSubject").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = d3.keys(data[0]).filter(function(key) { return key !== "Subject"; });

  data.forEach(function(d) {
    d.groups = groupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  x0.domain(data.map(function(d) { return d.Subject; }));
  x1.domain(groupNames).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("transform", "translate(" + width/2 + "," + margin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Subject");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -100)
      .attr("y", -40)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("No. of Students");

  var state = svg.selectAll(".state")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + x0(d.Subject) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d.groups; })
    .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d) { return x1(d.name); })
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.value); })
      .style("fill", function(d) { return scolor(d.name); });

  var legend = svg.selectAll(".legend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 6)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", scolor);

  legend.append("text")
      .attr("x", width + 18)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "begin")
      .text(function(d) { return d; });

});


/*===================================================================
	Grouped barchart showing grades grouped by class.
-------------------------------------------------------------------*/
var gradesClass = document.getElementsByTagName('gradesClass')[0];
var datafile = gradesClass.getAttribute('src');

var cmargin = {top: 20, right: 120, bottom: 80, left: 60},
    cwidth = 700 - cmargin.left - cmargin.right,
    cheight = 400 - cmargin.top - cmargin.bottom;

var cx0 = d3.scale.ordinal()
    .rangeRoundBands([0, cwidth], .4);

var cx1 = d3.scale.ordinal();

var cy = d3.scale.linear()
    .range([cheight, 0]);

var ccolor = d3.scale.ordinal()
			.range(["#2ca02c", "#1f77b4", "#ff7f0e"]);

var cxAxis = d3.svg.axis()
    .scale(cx0)
    .orient("bottom");

var cyAxis = d3.svg.axis()
    .scale(cy)
    .orient("left")

var csvg = d3.select("gradesClass").append("svg")
    .attr("width", cwidth + cmargin.left + cmargin.right)
    .attr("height", cheight + cmargin.top + cmargin.bottom)
  .append("g")
    .attr("transform", "translate(" + cmargin.left + "," + cmargin.top + ")");

d3.csv(datafile, function(error, data) {
  var groupNames = d3.keys(data[0]).filter(function(key) { return key !== "Class"; });

  data.forEach(function(d) {
    d.groups = groupNames.map(function(name) { return {name: name, value: +d[name]}; });
  });

  cx0.domain(data.map(function(d) { return d.Class; }));
  cx1.domain(groupNames).rangeRoundBands([0, cx0.rangeBand()]);
  cy.domain([0, d3.max(data, function(d) { return d3.max(d.groups, function(d) { return d.value; }); })]);

  csvg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + cheight + ")")
      .call(cxAxis)
    .append("text")
      .attr("transform", "translate(" + cwidth/2 + "," + cmargin.bottom/2 + ")")
      .style("text-anchor", "middle")
      .text("Class");

  csvg.append("g")
      .attr("class", "y axis")
      .call(cyAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("x", -100)
      .attr("y", -40)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("No. of Students");

  var cstate = csvg.selectAll(".cstate")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + cx0(d.Class) + ",0)"; });

  cstate.selectAll("rect")
      .data(function(d) { return d.groups; })
    .enter().append("rect")
      .attr("width", cx1.rangeBand())
      .attr("x", function(d) { return cx1(d.name); })
      .attr("y", function(d) { return cy(d.value); })
      .attr("height", function(d) { return cheight - cy(d.value); })
      .style("fill", function(d) { return ccolor(d.name); });

  var clegend = csvg.selectAll(".clegend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  clegend.append("rect")
      .attr("x", cwidth - 6)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", ccolor);

  clegend.append("text")
      .attr("x", cwidth + 18)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "begin")
      .text(function(d) { return d; });

});


/*===================================================================
	Grouped barchart showing grades grouped by group.
-------------------------------------------------------------------*/
var gradesGroup = document.getElementsByTagName('gradesGroup')[0];
var datafile = gradesGroup.getAttribute('src');

var gmargin = {top: 20, right: 120, bottom: 80, left: 60},
    gwidth = 700 - gmargin.left - gmargin.right,
    gheight = 400 - gmargin.top - gmargin.bottom;

var gx0 = d3.scale.ordinal()
    .rangeRoundBands([0, gwidth], .4);

var gx1 = d3.scale.ordinal();

var gy = d3.scale.linear()
    .range([gheight, 0]);

var gcolor = d3.scale.ordinal()
			.range(["#2ca02c", "#1f77b4", "#ff7f0e"]);

var gxAxis = d3.svg.axis()
    .scale(gx0)
    .orient("bottom");

var gyAxis = d3.svg.axis()
    .scale(gy)
    .orient("left")

var gsvg = d3.select("gradesGroup").append("svg")
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
      .style("fill", function(d) { return gcolor(d.name); });

  var glegend = gsvg.selectAll(".glegend")
      .data(groupNames.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  glegend.append("rect")
      .attr("x", gwidth - 6)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", gcolor);

  glegend.append("text")
      .attr("x", gwidth + 18)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "begin")
      .text(function(d) { return d; });

});
