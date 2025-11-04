library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sum is
  
      Generic(
        
      NUM_WIDTH : integer := 8
        
             );
Port (
  
a : in signed(NUM_WIDTH-1 DOWNTO 0);
b : in signed(NUM_WIDTH-1 DOWNTO 0);
c : out signed(NUM_WIDTH DOWNTO 0)

);

end sum;

architecture Behavioral of sum is

       begin
         
      c <= (a(a'HIGH) & a) + (b(b'HIGH) & b);
  
      end Behavioral;   
