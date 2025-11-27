library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterSIPOV2 is
   Port(
         reset    : in std_logic;
         clk      : in std_logic;
         data_in  : in std_logic;
         data_out : out std_logic_vector          --vettore di tipo unconstrained
        );
end ShiftRegisterSIPOV2;

architecture Behavioral of ShiftRegisterSIPO is

  begin

end Behavioral;
