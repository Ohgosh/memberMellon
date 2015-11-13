paddingLeft = 80
paddingTop = 0
w = 830
h = 255
maxY = null
increment = 1000

data = [
  val: 1100
,
  val: 2200
,
  val: 1300
,
  val: 2200
,
  val: 1300
,
  val: 3300
,
  val: 4100
,
  val: 4100
]

months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul']

createCoordinateRules = (lastMonthIndex)  ->
  x = d3.scale.linear()
    .domain([0, lastMonthIndex])
    .range([paddingLeft, w])

  y = d3.scale.linear()
    .domain([0, maxY])
    .range([paddingTop, h])

  {x: x, y: y}

createSvg = (elementID) ->
  d3.select('#' + elementID).append('svg:svg').attr('width', w).attr('height', h)

createMainGroup = (svg) ->
  svg.append('svg:g').attr('transform', 'translate(0,' + 0 + ')')

createLineRules = (x, y) ->
  lineReal = d3.svg.line()
    .interpolate('linear')
    .x( (d, i) -> x i )
    .y( (d) -> h - y(d.val) )

  {lineReal: lineReal}

drawGrid = (g, x, y, lastMonthIndex) ->
  # draw grid
  # horizontal lines
  yLineIndex = 0
  while yLineIndex < maxY / increment
    g.append('svg:line')
    .attr('x1', x(0))
    .attr('y1', h - y(increment * yLineIndex))
    .attr('x2', x(lastMonthIndex))
    .attr('y2', h - y(increment * yLineIndex))
    .style('stroke', '#d7eafa')
    yLineIndex++

drawChartLabels = (g, x, y) ->
  yLineIndex = 1
  while yLineIndex < maxY / increment
    g.append('text')
    .attr('x', x(0))
    .attr('y', h - y(increment * yLineIndex))
    .text(yLineIndex * increment)
    .attr('class', 'chart-label')
    .attr('width', '60')
    .attr('transform', 'translate(-20, 5)')
    .style('fill', '#353942')
    .style('text-anchor', 'end')

    yLineIndex++

  xLineIndex = 0
  while xLineIndex < months.length
    g.append('text')
    .attr('x', paddingLeft + x xLineIndex)
    .attr('y', h)
    .text(months[xLineIndex])
    .attr('class', 'chart-label')
    .attr('width', '100')
    .attr('transform', 'translate(-25, 25)')
    .style('fill', '#353942')
    .style('text-anchor', 'middle')

    xLineIndex++

drawChartLines = (g, lineReal, data) ->
  g.append('svg:path')
  .style('stroke', '#3795e5')
  .style('stroke-width', 3)
  .style('fill', 'none')
  .attr('d', lineReal(data))

drawChartDividers = (g, x, y, data) ->
  g.selectAll('.chart-divider')
    .data(data.slice(1, -1))
    .enter()
    .append('rect')
    .attr('width', 3)
    .attr('height', 6)
    .style('fill', '#d7eafa')
    .attr('class', 'chart-divider')
    .attr(
      x: (d, index) ->
        (x (index + 1)) - 1
      y: (d, index) ->
        h - 6
    )

drawLineChart = (data, elementID) ->
  lastMonthIndex = data.length - 1
  verticalLinesAmount = 6

  coordinates = createCoordinateRules lastMonthIndex

  svg = createSvg elementID
  g = createMainGroup svg

  lines = createLineRules coordinates.x, coordinates.y

  drawGrid g, coordinates.x, coordinates.y, lastMonthIndex
  drawChartLabels g, coordinates.x, coordinates.y

  drawChartLines g, lines.lineReal, data
  drawChartDividers g, coordinates.x, coordinates.y, data

Template.adminRevenue.onRendered ->
  maxY = ((_.max data, (item) ->
    item.val
  ).val / increment | 0 + 1) * increment

  drawLineChart data, 'admin-revenue-chart'
