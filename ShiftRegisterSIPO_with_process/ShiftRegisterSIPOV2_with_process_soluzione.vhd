 , library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterSIPOV2 is
   Port(
         reset    : in std_logic;
         clk      : in std_logic;
         data_in  : in std_logic;
         data_out : out std_logic_vector          --vettore di tipo unconstrained , tipo std_logic_vector ( X DOWNTO 0)
        );
end ShiftRegisterSIPOV2;

architecture Behavioral of ShiftRegisterSIPO is
signal data_out_int : std_logic_vector(data_out'RANGE) := ( Others => '0');      --dobbiamo usare un vettore d'appoggio perchè data_out non può essere riletto
begin
data_out <= data_out_int;
process ( clk, reset) 
   
   begin
      if reset ='1' then
         data_out_int <= ( Others <= '0');   -- attenzione! non posso usare data_out perchè l'ho già usato fuori dal process: non posso farlo sia sincrono che asincrono
      elsif rising_edge(clk) then
         data_out_int ( data_out'HIGH-1 DOWNTO 0) <= data_out_int ( data_out'HIGH DOWNTO 0+1);
         data_out_int ( data_out_int'HIGH) <= data_in;
      end if
     
end process;
end Behavioral;
