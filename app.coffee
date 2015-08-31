# Fork me on https://github.com/PascalHelbig/McClean
rand = () ->
  parseInt(Math.random()*2) is 1

sleep = (ms) ->
  start = new Date().getTime()
  continue while new Date().getTime() - start < ms

offices = []
for i in [0..5]
  offices.push {
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  }

cleaner =
  officeNr: 0
  office: null
  intention:
    trash: false
    window: false
    floor: false
    desk: false
  see: () ->
    this.office = offices[this.officeNr]
  desire: () ->
    d = []
    for key, value of this.intention
      if this.office[key] != value
        d.push key
    return d
  execute: () ->
    this.see()
    desire = this.desire()
    loop
      break if desire.length is 0
      intention = desire.pop()
      this.clean intention
    this.moveNext()

  clean: (what) ->
    sleep 400
    offices[cleaner.officeNr][what] = false
    console.log this.officeNr + ' - cleaned ' + what
  move: (next) ->
    sleep 200
    console.log this.officeNr + ' - moved to ' + next
    this.officeNr = next
  moveNext: () ->
    if this.officeNr < offices.length - 1
      this.move this.officeNr + 1
    else
      this.move 0
  cleanLevel: () ->
    startOffice = this.officeNr
    loop
      this.execute()
      break if startOffice is this.officeNr
    console.log 'finished'

console.log offices
cleaner.cleanLevel()
console.log offices
