#Iniciály

#Napiš funkci, která ze jména člověka vytvoří jeho iniciály, 
#tj. první písmeno jména a první písmeno příjmení. 
#Za první písmeno vlož tečku a mezeru, za poslední písmeno pouze tečku. 
#Například ze jména "Senta Čermáková" vrátí "S. Č." 
#Pokud má člověk více křestních jmen nebo příjmení, 
#vrať první písmeno pro každé z nich.

def initial(name):
    words = name.split()
    initials = [word[0] + '.' for word in words]
    return ' '.join(initials)

#instructor solution:
def initial(name):
	name = name.split()
	output = ""
	for item in name:
	    output = f"{output}{item[0]}. "
	return  output.strip()