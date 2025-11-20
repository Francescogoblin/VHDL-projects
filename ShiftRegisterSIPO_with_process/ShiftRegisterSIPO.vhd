library IEEE;
use IEEE.STD_LOGIC.1164;

entity ShiftRegisterSIPO is
   Port(
         reset    : in std_logic;
         clk      : in std_logic;
         data_in  : in std_logic;
         data_out : in std_logic_vector(3 DOWNTO 0)
        );
end ShiftRegisterSIPO;

architecture Behavioral of ShiftRegisterSIPO is

signal n1 : std_logic;
signal n2 : std_logic_vector;

begin

process (clk, reset)
   begin

      n1 <= data_in;

   for I in range 0 to data_out'RANGE-1 loop

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

      data_out(I) <= n2(I)
            
   end loop;

end process;



end Behavioral;
