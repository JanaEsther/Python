import unittest

def arabske_na_rimske(ar):
    I = 1
    V = 5
    rest = ar - V
    if ar > 5:
        return "V" + arabske_na_rimske(rest) 
    if ar == 3 * 1 :
        return "III"
    if ar ==  2 * 1 :
        return  "II"  
    if ar == 1 *1:
        return "I"
    if ar == 5:
        return "V"


# 1 - I, 2 - II, 3 - III, 4 - IV, 5 - V  IVXLCDM
# Ivan VEDL XENII LESNÍ CESTOU DO MĚSTA.


class TestPaymentProjection(unittest.TestCase):
    
    def test_one(self):
        self.assertEqual(arabske_na_rimske(1), second="I")

# insinsstance - ze to vrací písmeno a ne int
    def test_two(self):
        self.assertEqual(arabske_na_rimske(2), second="II")
    
    def test_three(self):
        self.assertEqual(arabske_na_rimske(3), second="III")

    def test_five(self):
        self.assertEqual(arabske_na_rimske(5), second="V")
        
    def test_over_five(self):
        self.assertEqual(arabske_na_rimske(6), second="VI")
        
    def test_over_five(self):
        self.assertEqual(arabske_na_rimske(7), second="VII")
        
    def test_over_five(self):
        self.assertEqual(arabske_na_rimske(8), second="VIII")