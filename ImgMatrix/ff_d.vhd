library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
	Port(
		reset	: in  std_logic;
		clk		: in  std_logic;

		D	        : in  std_logic;
		Q 	        : out std_logic
	);
end ff_d;

architecture Behavioral of ff_d is
	
	

begin
	  --dobbiamo scrivere un flip flop con reset asincrono attivo alto
	process ( clk , reset )                                                   --la sensitivity list ci dice: il process resta bloccato finchè almeno uno dei due non cambia
	begin
		if reset = '1' then
			Q <= '0';
		elsif rising_edge (clk) then      -- importante l'uso di rising_edge poichè il flip flop è sensibile ai fronti di clock, non al livello
			Q<=D;
		end if;
	end process;
		
	
end Behavioral;
