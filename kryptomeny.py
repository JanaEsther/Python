#Převod kryptoměn

#Uvažuj tři kryptoměny: CzechitaCoin, Polcoin a PyCoin. Tvým úkolem je napsat funkci, která dostane slovník. 
#Ve slovníku bude klíčem název měny (uvažuj pouze tři uvedené měny) a hodnotou množství měny. 
#Vypočítej celkovou hodnotu majetku převedenou na měnu Polcon, uvažuj tyto kurzy:

# PyCoin = 0.212 Polcoinu
#1 CzechitaCoin = 0.457 Polcoinu*/

def convert_currencies(data):
    total_polcoin = 0
    for coin, amount in data.items():
        if coin == 'PyCoin':
            total_polcoin += amount * 0.212
        elif coin == 'CzechitaCoin':
            total_polcoin += amount * 0.457
        elif coin == 'Polcoin':
            total_polcoin += amount
    return total_polcoin
#Instructor solution:

def convert_currencies(data):
	rates = {"PyCoin": 0.212, "CzechitaCoin": 0.457}
	value = 0
	if "Polcoin" in data:
	    value += data.pop("Polcoin")
	if "PyCoin" in data:
	    value += data.pop("PyCoin") * rates["PyCoin"]
	if "CzechitaCoin" in data:
	    value += data.pop("CzechitaCoin") * rates["CzechitaCoin"]
	return value