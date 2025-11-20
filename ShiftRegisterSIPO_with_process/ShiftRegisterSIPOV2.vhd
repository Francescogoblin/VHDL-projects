library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterSIPOV2 is
   Port(
         reset    : in std_logic;
         clk      : in std_logic;
         data_in  : in std_logic;
         data_out : out std_logic_vector
        );
end ShiftRegisterSIPOV2;

architecture Behavioral of ShiftRegisterSIPO is

signal n1 : std_logic;
signal n2 : std_logic_vector;

begin

process (clk, reset)
   begin

      n1 <= data_in;

   for I in 0 to data_out'RANGE loop

         if reset= '1' then
            n2 <= ( Others => '0');
         elsif rising_edge(clk) then
            if I=0 then
               n2(I) <= n1;
               n2(I+1) <= n2(I);
            elsif I/=0 then
               n2(I+1) <= n2(I);
            end if;
         end if;

      data_out <= n2;
            
   end loop;

end process;



end Behavioral;
