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

