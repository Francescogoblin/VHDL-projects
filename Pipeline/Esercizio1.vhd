library IEEE;
use IEEE.std_logic_1164.all;

entity esercizio1 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0);
    input_b : in std_logic_vector ( 31 DOWNTO 0);
    input_c : in std_logic_vector ( 31 DOWNTO 0);
    clk     : in std_logic;

    result : out std_logic_vector ( 31 DOWNTO 0)
  );
end esercizio1;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of esercizio1 is 
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
    end adder;

    signal n1 : std_logic_vector(31 DOWNTO 0);
    signal n2 : std_logic_vector(31 DOWNTO 0);

    begin

    MULTIPLIER_INST : multiplier
      Port map ( 
        input_a <= input_a;
	      input_b	<= input_b;
	      result	<= n1;
      );
      
    ADDER_INST : adder
      Port map ( 
        input_a <= input_c;
	      input_b	<= n1;	
	      result	<= n2
      );

      result <= n2;
      
 end Behavioral;   
