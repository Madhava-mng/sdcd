require_relative 'sdcd'
a = Sdcd::new
data = a.write('test.sdcd',"test.com", ["147.2.224:test.test.com", "27.24.24:help.test.com", "venomurous.test.com", "pick.test.com"])
puts data
ddata = a.read('test.sdcd')
puts ddata
