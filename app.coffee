rand = () ->
  parseInt(Math.random()*2) is 1

offices = [
  {
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },{
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },{
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },{
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },{
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },{
    trash: rand()
    window: rand()
    floor: rand()
    desk: rand()
  },
]

cleaner =
  office: 0
  cleanTrash: () ->
    offices[cleaner.office].trash = false
    console.log this.office + ' - cleaned trash'
  cleanWindow: () ->
    offices[cleaner.office].window = false
    console.log this.office + ' - cleaned window'
  cleanFloor: () ->
    offices[cleaner.office].floor = false
    console.log this.office + ' - cleaned floor'
  cleanDesk: () ->
    offices[cleaner.office].desk = false
    console.log this.office + ' - cleaned desk'
  move: (next) ->
    console.log this.office + ' - moved to ' + next
    this.office = next
  moveNext: () ->
    if this.office < offices.length - 1
      this.move this.office + 1
    else
      this.move 0
  cleanOffice: () ->
    console.log this.office + ' - Start cleaning this office, bitch!'
    if offices[this.office].trash is true
      this.cleanTrash()
    if offices[this.office].window is true
      this.cleanWindow()
    if offices[this.office].floor is true
      this.cleanFloor()
    if offices[this.office].desk is true
      this.cleanDesk()
  cleanLevel: () ->
    startOffice = this.office
    loop
      this.cleanOffice()
      this.moveNext()
      break if startOffice is this.office
    console.log 'finished'


console.log offices
cleaner.cleanLevel()
console.log offices