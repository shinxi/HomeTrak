ids = ["599006", "699006", "799006", "899006", "999006", "509006", "619006", "729006", "839006", "949006"];
statuses = ["Active", "Inactive"];
firstNames = ["John", "Mike", "Tom", "Jessica", "James", "John", "Lida", "Jason", "Angela", "Sean"]
lastNames = ["Briggs", "Criggs", "Driggs", "Eriggs", "Friggs", "Griggs", "Hriggs", "Iriggs", "Jriggs", "Kriggs"]
phones = ["1404643144", "1504643144", "1604643144", "1704643144", "1804643144", "1414643144", "1524643144", "1634643144", "1744643144", "1854643144"]
districts = ["CENTER", "EAST", "NORTH", "SOUTH", "WEST"]
states = ["CA", "LA"]
cities = ["San Diego", "PalaOto"]
zips = ["91129", "92129", "93129", "94129", "95129", "11129", "22129", "33129", "44129", "55129"]

genClients = (count) ->
	clients = []
	for i in [0...count]
		client = 
			client_id: ids[parseInt(Math.random()*10)]
			status: statuses[parseInt(Math.random()*2)]
			first_name: firstNames[parseInt(Math.random()*10)]
			last_name: lastNames[parseInt(Math.random()*10)]
			phone: phones[parseInt(Math.random()*10)]
			district: districts[parseInt(Math.random()*5)]
			state: states[parseInt(Math.random()*2)]
			city: cities[parseInt(Math.random()*2)]
			zip: zips[parseInt(Math.random()*10)]
		clients.push client
	return clients