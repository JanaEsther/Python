class Package:
  def __init__(self, address, weight, state):
    self.address = address
    self.weight = weight
    self.state = state
    
  def get_weight(self):
     return self.package_weight
  def delivery_price(self):
     if self.weight < 10:
        return 129
     elif self.weight < 20:
        return 159
     else:
        return 359

package_1 = Package("Grimmauldovo náměstí 11", 15, "nedoručen")
package_2 = Package("Godrikův důl 47", 3, "nedoručen")
package_3 = Package("Vydrník svatého Drába 13", 0.5, "nedoručen")
package_list = [package_1, package_2, package_3]
total_price = 0
for item in package_list:
    total_price += item.delivery_price()
print(total_price)