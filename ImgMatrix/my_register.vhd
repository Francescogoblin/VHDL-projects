library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity my_register is
  
	Port(
		reset	: in  std_logic;
		clk		: in  std_logic;

		D	          : in  std_logic_vector(7 DOWNTO 0);
		Q 	        : out std_logic_vector(7 DOWNTO 0)
	);
end my_register;


architecture Behavioral of my_register is

begin

  reg_gen : for I in D'RANGE generate
    ff_d_inst : ff_d
      Port Map ( 
        clk   => clk
        reset => reset
        D     => D(I)
        Q     => Q(I)
        );
    end generate
