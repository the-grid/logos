size = 256

canvas = document.createElement 'canvas'
canvas.width = size
canvas.height = size
context = canvas.getContext '2d'
document.body.appendChild canvas

lineWidth = 6
unit = lineWidth * lineWidth
xStep = [1,0,-1,0]
yStep = [0,1,0,-1]
lastX = size/2
lastY = size/2
turnCount = 8

context.strokeStyle = 'black'
context.lineWidth = lineWidth
context.beginPath()
context.moveTo lastX, lastY

for i in [0..turnCount]
  unitCount = Math.round((i+1)/2)
  dist = unitCount * unit
  x = lastX + dist*xStep[i%4]
  y = lastY + dist*yStep[i%4]
  if i is turnCount
    x += (lineWidth/2-unit)*xStep[i%4]
    y += (lineWidth/2-unit)*yStep[i%4]
  context.lineTo x, y
  lastX = x
  lastY = y
  
context.stroke()
