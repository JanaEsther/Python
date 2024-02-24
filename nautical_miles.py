


def convert_to_kilometers(miles, nautical_miles=False):
    if nautical_miles:
        return miles * 1.852
    else:
        return miles * 1.60934
    
    
