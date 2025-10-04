--In questo progetto creo un half adder che mi servirà poi per l'implementazione di un full adder
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity half_adder is
  Port (
     a : in std_logic; 
     b : in std_logic;
     c : out std_logic
     sum : out std_logic;
   );
end half_adder;

architecture Behavioral of half_adder is

begin
    c <= a and b;
    sum <= a xor b; -- tutt'ora mi rimane il dubbio su come lo xor sia già un'operazione integrata nel sistema: come nasce?

end Behavioral;
