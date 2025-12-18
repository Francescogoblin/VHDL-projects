library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Esercizio4 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0);
    input_b : in std_logic_vector ( 31 DOWNTO 0);
    input_c : in std_logic_vector ( 31 DOWNTO 0);
    clk     : in std_logic;

    result : out std_logic_vector ( 31 DOWNTO 0)
  );
end Esercizio4;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of Esercizio3 is 
  
    component multiplier is
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;
    component adder is
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;
	
    begin

    
    end Behavioral;   
    
