library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity half_adder is
  
  Port (
     a   : in std_logic; 
     b   : in  std_logic;
     c   : out std_logic; --riporto
     sum : out std_logic --somma
   );
  
end half_adder;

architecture Behavioral of half_adder is

begin
  
    c <= a and b; --questo è il riporto
    sum <= a xor b; --questa è la somma vera e propria

end Behavioral;
