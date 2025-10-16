library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
	Port(
		reset_ff	: in  std_logic;
		clk_ff		: in  std_logic;

		d 	        : in  std_logic;
		q 	        : out std_logic
	);
end ff_d;

architecture Behavioral of ff_d is
	signal q_int : std_logic := 'U';
begin

	q_int	<= 	'0' when reset_ff = '1' else
				d 	when rising_edge(clk_ff) else q_int;

	q <= q_int;
	
end Behavioral;
