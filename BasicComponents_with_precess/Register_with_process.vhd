library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_register_with_process is
  
	Port(
		reset	: in  std_logic;
		clk		: in  std_logic;

		D	    : in  std_logic_vector(7 DOWNTO 0);
		Q 	    : out std_logic_vector(7 DOWNTO 0)
	);
end my_register_with_process;


architecture Behavioral of my_register_with_process is

begin

  process (clk, reset)
      begin
          if reset ='1' then
              Q <= (Others => '0');
          elsif rising_edge(clk) then
              Q <= D;
          end if;
  end process;
  

end of Behavioral ; 
